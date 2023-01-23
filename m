Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6567811C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:14:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483112.749057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzSd-0003qy-Lp; Mon, 23 Jan 2023 16:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483112.749057; Mon, 23 Jan 2023 16:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJzSd-0003om-J2; Mon, 23 Jan 2023 16:14:19 +0000
Received: by outflank-mailman (input) for mailman id 483112;
 Mon, 23 Jan 2023 16:14:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJzSb-0003oe-Mi
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:14:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb901ec1-9b38-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 17:14:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7511.eurprd04.prod.outlook.com (2603:10a6:20b:23f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:14:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:14:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: fb901ec1-9b38-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVGl0n4SGDbF+G3kvovPgaWobC6Wnf1zq4yRFn3JaNRocakIu4gSyxP2tq2br2ymM+lmZV7Oil4Pxh6VtDickLt5GUZNaerNfqqyY6Non6PJ/AiJIetA0nVunHC18V1WJvbULXlFwGCR1nl2bHmX5zDyMA1WpdeZyq95QObhFGc7OKqpFnp/8LHw5mSsgKxhlh0gS2usKzVBS/xaEW/8XfdMNbgpQHyvHqtDi9IwMFiBnaqqxmyvKsPAjgSfNkv9239WGRHSK23P7YFTVIUn7osucMBoZMiKsFN3BVAQVcbTcsVwY7Zob847ww9IxewhJOWaEILEU7w//hkRo+xZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLhiWSO1/sbXhCBK6AdHYeMWiQDCkuoYjDwExbfLF0A=;
 b=mM3kBQmxFbDHCWIRie1tN+H87xX8OydWFZVu7/LHyumLhDTMEqF6ELdCZG7WbqNWZ7UC7dXjVP67/7ayKGpPMwf2LDeHxTkjQ/3KXgQAKxgfoP1xoL7jokhK7dteTvHTm+ydi9iQKsxfkBGaMCW6s842E9oEr0vCSUFteqpAg4v987nM49FDYMtcHQyVt3KSP13VGKyRkE+Cl1ZaOC5YJQqK8Ez4mB45dP4oJpe+XvHerhpoy5s8txpAP2sLRjKm/dZpReokBEHg4Xx3OiQ8AZ/jz6eBxd5hB8qPzodZSadtiPuO5laxE2B32ybj0nNvPtHlpcCP5EytBLFaB+UyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLhiWSO1/sbXhCBK6AdHYeMWiQDCkuoYjDwExbfLF0A=;
 b=4Gxx+QMbxWRyevMcxpljdihoABEtJBJQ3QmtpnVZOwipQFlxetBOpBnwg35+HbzFVlCmVJvgLeVq9cC5E2MkBVPV6Vw4V62436iDyv+Jrg1Qtgj+LPrytI5Moc5Y9RSpnCRH4Yi/p8NwEs0Hs1l4fL7U/srplGF2uvblFvpX1qMzpmE0+CXEjETCILHeG6KyxQ7BtepkOh6o4dhw3/Uplz16CFFZDk3NP1Ma8lELnPzrT+r1Rv5XS/Pf+IUSrvsd36yq/vQvApfagiOyp09pJzKV1FOoBk2X/+HrW9mc7Xb0F/ywBIuRWM8FcmgDPyetkt3Vm4GS+GDCprp5n7Gx+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11198de8-fcda-5e19-0ab8-25056dc47341@suse.com>
Date: Mon, 23 Jan 2023 17:14:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/9] x86/shadow: replace sh_reset_l3_up_pointers()
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com>
 <CA+zSX=ZVK_7xpgraJyC3__uORqXo8F9Atj9gCF+oO7OyfRrtYg@mail.gmail.com>
 <c8ca4781-13ac-add6-1ae0-558f8d0da052@suse.com>
 <CA+zSX=b2o_sbC+CwLUm2F5QnSKaGBSayUPgsLheLWHob8jUnrg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=b2o_sbC+CwLUm2F5QnSKaGBSayUPgsLheLWHob8jUnrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c99d569-13ff-4f03-bedc-08dafd5cde95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nP7fWncDb52gk9AxkucLCF0Epm3VwZJFFAJFGajf4PpnFit/58iAxT3TT38Ub3B/dnTgaWfvQJBE17vwwz24h/OjcaEab8WPBvXGAd0T++5+bfRgkm+4AgOiE2vM/7PAjHeOKUzHtZBZUl4SWOwzfRFuhKtt2rD0sEUV4Col7AdFzQ2ek3AR2jLyGEEPvzzvFWC7NhDHPJYpoYPY1aBSn7EybwXd7LIcCG6kyOzzsopMICoOQsAz8tmfkdgRBw9UDa3FmLhx1cylYsHMNDqR7B/9nT5YSWelYpo8/6uxcg68mPiuMlBr3gOfOS3fpQkXrETHFr49D34md9tPJ2HLK7MfBB5wDqa9DM2yOrkrXxdbmg2uOsO1MaSxYGjFvvyqsUp/UlJjxNSmOEGSVndRVuC3ke1BD/Ix7RaZOk9gKrpsvCrHH97wPomWf0l1bukaiPPy5NDvoGOGH7RXZg4WYoNsQw6F3D403nWINzUVw/Kn+yW2OMxNeVw4cunajuEGgiQueejsZkinRdlPMEC+9lhR/VqXTQvi9fWrAs1HIAXuT3MN4PmXS9y36ODahh5UFo72jOwSm0P9VWi0SSfJxFjVq4/KmO4SXi7StqYjw6hun33cPiUxGYRQspj9VFWBGJ4TLVNUyCeanwi06ALnvI6pmZyLhPVbhEOf034Rk8CxsUCI1iNwPbIYbUIoMQk6/AC6yHF/3y+LWuSGFhEJ/qcpwC5EttybfJvmGNQwuDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199015)(36756003)(86362001)(41300700001)(5660300002)(38100700002)(2906002)(8936002)(4326008)(31696002)(478600001)(6486002)(66476007)(31686004)(186003)(6512007)(8676002)(6916009)(53546011)(26005)(6506007)(66946007)(54906003)(316002)(66556008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGg3dDhCS1Z4K095VUFWeEhWWmdJenFDbDBQdDNHWGZCZUpCRHZ1TDZabGZ6?=
 =?utf-8?B?eTJvaUo3U3dscnJ6NjhIODJxVzl4S3A5NzZjTjFMTDRxWEkwQW14YmpjMmIy?=
 =?utf-8?B?M0wxUU9POUphVG1oYmRmMUN2M3JTbUM2Z0tqOG5DbFljdE9TeHdoZFQ1aWNH?=
 =?utf-8?B?QXMzVE13clcwOHUwejlBWEgxRG5yMVZkTThmRU5WN0dFYzZWRHVvUGYwcWpP?=
 =?utf-8?B?MVVSNHJuWWVzbXhwVmRtMUdncGVjMWppTHZRUVVXbVRpcFdHM21Id3Iwcjky?=
 =?utf-8?B?eDB0cEdHRGdjRENnS3RaN3hXSFF6bnZMZE01REZKbUZpV29xUHNYMitEaWRX?=
 =?utf-8?B?bmpYc1RMK2Fhb29qZ2VINmVlNTRoV3B5NFVEMXRTOERXcTBrUnA3Rk5XT2Y2?=
 =?utf-8?B?UmdBM0c4NGJBSVFML3FPSG1IcEhjcmNncDVjQ2gzNHdPcWoyRmt2WU5XbEMr?=
 =?utf-8?B?QzN2MlkrTHBCTCtiUkplUCtkTjNqRlZaN0Z3dUNEeFUrUU1rRzYzTmdnbGl1?=
 =?utf-8?B?bnRMa0VwRm53b05qdmxpMHBWZmZnT1o3Y0VuNk5xbEREQ2hwY1hReXM3Z3Rq?=
 =?utf-8?B?OUFueUVxQWpTeStCVkRYVHpLMnZ3NjJMdzhBZmwzcUsvRzhmUzUraG1jYjQ1?=
 =?utf-8?B?RXRNYVBCbGk5VTRlMnBWdFNnbHV6NzVubW1SUUtPbFEwczY4c1o4K1ZmTStv?=
 =?utf-8?B?Rm5qZnZWY21sQmhDenVXSG5mZTA4ekZJTzJTWWVnMzFCeXBWaGpXejVNS0tB?=
 =?utf-8?B?bm5KVFhPamNRWDNmSHZwNWIwNXB0bG0yV2ZCYkhhQlE3a3RVN0pBQVBmMnlh?=
 =?utf-8?B?SGVhMjVRVFA5aTFncnZHUmNSL0Z0blpQRjd1MHJqNmVDVGZYVU1kYTZ5OWFx?=
 =?utf-8?B?VTFVdnZTendqSzJlTUpOa0dKYndqbTFWcnBKdWs1WERFNlFBZWozcHYyK2d0?=
 =?utf-8?B?Si9XUGVZREJERjM4WE5hWDRTcHQwVmF6TWwvUllISmVqWXh0a0MxOHprYU94?=
 =?utf-8?B?VTUxS1Bmb0RzS2FVdjVGS3N5bklBVE5OV1kvaE5ON3NxbnBFNjhOTU1UMDJj?=
 =?utf-8?B?ZE16b3hwd1dWZktBeEQ1bzhaOC9TS29BbVpPa1E3a1RIYnM0OXdFNWo4SXho?=
 =?utf-8?B?M2JWNENMb1BiZW5OSmlrc3RxSGsyQWY0S0hybHkxeGFBNmhhRnV0bjBuVHow?=
 =?utf-8?B?dU53RjhFMVpKeDBONmxuV0xFejN0aFF1ekg0RE9QQUUxY2xvQWM4L3EvOUQ2?=
 =?utf-8?B?ZGlWamlLajZ3V1cya3hERTB6ZTdmc3VISVhJdVpRU3pNSmJMUDlpaHRUNlNm?=
 =?utf-8?B?NStzSFZjclQwV0s5RWtQcURCcFFMaGdITGNZY1psbFd2WW9HYnZXbVBvY2t6?=
 =?utf-8?B?NWFXR2NQdWtZdGx3NTF6c3k1R3lSSGNRT0dtdFNzTW9OZXROWWdaTXFid3o4?=
 =?utf-8?B?b1RXMERhUVFzQXJCWUl3Q1hFTHk3VUZJeGxnQm56UHdkc1JMUEJzQUZhR05X?=
 =?utf-8?B?YTFlUkU2QmNlT3hyZjFKenNSbWRpMFpkSHd6ZkhXSGg0dkJoS2phSVlZSHRN?=
 =?utf-8?B?T1BuZytqV2xGMzV2eERvRHdVK0lPdXJWNlF6WGlhaHZrYVl0VGJZNnJVT0Nm?=
 =?utf-8?B?TFZIblo3QVlXWjhCUXFVOGN3MkZjTGI4NExkN0VtaDU0Sm5KYllQVEpCUDhU?=
 =?utf-8?B?SXZTVXNkUDlPUWRNM05lMUtqZDRISlc3V2F2RzJYM3NvYXBVeFNMQ0RNUVJC?=
 =?utf-8?B?WUMvWXlsNHFkY0tMc1NMNzdZQlg2L1QvejkrSDlFQlRlQUYwTnF6M3BDbldO?=
 =?utf-8?B?cmpXL2FSVGJST3l5YkNLZGt1b1JXemh1M0tSN01wSmI0NkY4dlV5M25RSG5z?=
 =?utf-8?B?SnoxWHFOdGVOSFZWNGZPamVaYnZEdjFvaEh5RVdva0NDayt1N0xQSnVzaC9k?=
 =?utf-8?B?Um9JenhONFpRT3JTM1g5dVN6b29lK0h2U1JqajRSMC8yaXF0b1NuOHBVWjRj?=
 =?utf-8?B?SVJheWd0aUZVb0Y1ekxoR2MzUkdHR0xHNEsrOG1rUVhLQXg3TDZwMERTUmI0?=
 =?utf-8?B?M1BaSmJ0eDJIT1FVYjJhY2Y4TnkwZ0J6L1c3TGZqVnoxVGJEWG1DdlJXSHo1?=
 =?utf-8?Q?Jze9CixUGqsEFb36MoSC8j+yc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c99d569-13ff-4f03-bedc-08dafd5cde95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:14:14.1083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +feA2W/8zwSrBtYkk5TJnfvUJzz9kjDMJPB+P91sLzwoeV0FTcssy02DeS2KnjyNojYmUY7/g5Te6gOsff6QcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7511

On 23.01.2023 16:20, George Dunlap wrote:
> Re the original question: I've stared at the code for a bit now, and I
> can't see anything obviously wrong or dangerous about it.
> 
> But it does make me ask, why do we need the "unpinning_l3" pseudo-argument
> at all?  Is there any reason not to unconditionally zero out sp->up when we
> find a head_type of SH_type_l3_64_shadow?  As far as I can tell, sp->list
> doesn't require any special state.  Why do we make the effort to leave it
> alone when we're not unpinning all l3s?

This was an attempt to retain original behavior as much as possible, but I'm
afraid that, ...

> In fact, is there a way to unpin an l3 shadow *other* than when we're
> unpinning all l3's?

... since the answer here is of course "yes", ...

>  If so, then this patch, as written, is broken -- the
> original code clears the up-pointer for *all* L3_64 shadows, regardless of
> whether they're on the pinned list; the new patch will only clear the ones
> on the pinned list.  But unconditionally clearing sp->up could actually fix
> that.

... you're right, and I failed (went too far) with that attempt. Plus it'll
naturally resolve the parameter-vs-state aspect.

Jan

