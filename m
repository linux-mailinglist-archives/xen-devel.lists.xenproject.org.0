Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F16FA15D
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 09:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531280.826868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvvYx-0005Nh-UI; Mon, 08 May 2023 07:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531280.826868; Mon, 08 May 2023 07:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvvYx-0005M0-RD; Mon, 08 May 2023 07:45:39 +0000
Received: by outflank-mailman (input) for mailman id 531280;
 Mon, 08 May 2023 07:45:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvvYw-0005Lr-6G
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 07:45:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c184ab-ed74-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 09:45:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9403.eurprd04.prod.outlook.com (2603:10a6:10:369::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 07:45:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 07:45:07 +0000
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
X-Inumbo-ID: 51c184ab-ed74-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6Kz6wu6MRyTEIaVm6Ll6lwcA6/xHpS13SDnfxLVA/ejx+LYqM38HmIxCRUozi1sURkpqtRyN0NBWPC14O8fEUDR6dFoBhFt9zuJ/43ddcni+DPNXZmupFfUYmNhVe+60NHZAIoxg0JyV/3ssCq9OlKYEBcOyRgzOQP5Q/67EvypZyusMv20PazcypBv+mDV7jSHOLfkA6NfMR5QMNlcZLhBnklN4M+Nd4e2t89GK/fEALAawyxcJg0TM+QieS6A96m74JIJJ1CHmxOB6jg8tZWCJRLy8TfoRmDgXVyIx++sSh1bV/W0xfHKgtokSi9M4QbZNFq6VmJafJjDpK4VmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rvEpc3Y1x9ckkFXedQ+0A6kTrYUJrxDOiToGFbCa60=;
 b=WxTYRNnM+cEcK9qAwGvXhaHHCuETqI46JBDZPT9IQTUHXP8Rk1ppbBcN+LUipWxInd1JN171qAp28EM7c39LYIdlwIVcW+cZE8Q/ibDfoc2YP+tptYszPZ4/OwemHyrk34U6CffdduzpvVTK0WZW3GS9QkNxDrvZVn4RqSjNc6TGrZnVPNP6U2I0/guqdMAUXJ+z5Oj/zD7XHe5Qq8nm7flo5u4LRB0rpbCaNxlDs62/Mkmr6dMikhNk31pprK0kNKc/gv3AHi9OHc2Ln744d6vshbJ55gITcbSPkclrQYHzT/1qlYi2qr7aI6q0Lygog6xBWEw0An/GbOFv/2XYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rvEpc3Y1x9ckkFXedQ+0A6kTrYUJrxDOiToGFbCa60=;
 b=FKM1oUvXFnw1CuJhrBgok6kQ5f1YXB5yp8WdeyrwVY3i1jXF6PND10KXJET0+nosDSXgJ7sDAxrFrbl+xSJHVLJHYEllTM6i27VuirQm7Se1+SJ+dgzCTQh/Wlh5fInqB+88ncffuGxsJBSwddwwToLeiiQXMwdPFajddSselku6jDdgsg0bXQskiUd9SNBdvW4NeDJZnEseJbNbe++tuGYlao3bB2ZGUzsFLJm8e+gttFCsyyLOYudiMD6gex1vqzdHYC2F2NLmgaYNaqZZXkjVgvPm1AkT/jvGgW5WYZg1wNQ65QnSlAV61l0z2q5DNihwk6aFqlwLIU0B8FcVOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9613df3b-c49f-6034-ff99-7a6ea9286f0f@suse.com>
Date: Mon, 8 May 2023 09:45:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] x86/cpu-policy: Disentangle X86_NR_FEAT and
 FEATURESET_NR_ENTRIES
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230504193924.3305496-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: c4df971d-cd86-4453-3361-08db4f982495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ki74BeomotXVuxrdxTXZl3H0nM2lQvncrr54BwUy8XVHQiBS11ecd7e5QB9zSInsnsBbL9Poow8jww7v6NssB8A3/9bLVM2bGBnZgivq49ZogQEZfAYlcI4w6vJjExDJqxjgsJJDuf1PHM/B0T9bc5vmmXYct8Sd7kJcp3S194y3T0J4ZZgEFaB0GBsYdi4IXGsUAwxn89tr1VYy9Mg7DNGj2bMfR+DBsGylYH/LZG31sNyXu6YLywv2HWBtmEykjqgNkZIod+9b0PNFBqwAWsqwU7umbYJL2ei6EYsIzSi/KFRLX95w6j91Kbwe+fl5BX/ZhlqRgDAdFfYsTUBOUEaJYzdCXFWeM+qLgtjWScI0tXrAouyfKQ2POEqmFt2XVKVrgNw8Hh4nXBhIYqLeRo8b5I3gGsEjr7RkcrL3u9dGztZzbEkaRDa4dhasj38NGWaP4265ipAElRmj0EocRmaH2fOdDOjAOIeN2NAh2B9jt+HLMHtLA07WRzmocMHKhuWfY1IjlECisJZToG3tGjlvIsoSXKbBwAFMGFd0Ny7HynhHjdggNBrZWM1rphd7YpI4GnI1ReS1Vzughe+D0zN67raFvscPmi3+Lqp+DZDiKgKcJoJ609Y95umQ9Y6UaRQJQvxEOb4xmYOD0EMLmxyhEAUNfNH+a2WZEoUpHk6s/Ndx0a89hxd2aJ4QoQd5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(6512007)(6506007)(53546011)(26005)(6486002)(83380400001)(36756003)(2616005)(38100700002)(31696002)(86362001)(186003)(41300700001)(478600001)(2906002)(54906003)(31686004)(5660300002)(66476007)(66556008)(6916009)(4326008)(316002)(8936002)(8676002)(66946007)(66899021)(522954003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEcyODlvN3JwUG1mckE4V0QwalpmR290bWVEcTVuZlMxSU1tZU9DYnYrSXUx?=
 =?utf-8?B?OWJXWmtKWXFySVVRekY0eGFZaEhMTUhjUjNlbUVCd3pjeEYzUStLRW85cVFF?=
 =?utf-8?B?a1lxY0xDVlJWZHcxQyt0ZU9zVU9mZGN1SFZnNzE5aWVhbWxMUDJYWlpDOFoy?=
 =?utf-8?B?K1AxWWw2SU9WOVZJNDJPRUgzMmFEcEhvcUp6dXdpVmhGSVpKSFA5Y1M5bm9U?=
 =?utf-8?B?OXpjN3Y1U0ZQYTFKNERsclhINGhRREFFV28vV2lDOHFHcTZjVjlJb1Vxd2Vt?=
 =?utf-8?B?ZXV0WEhoT2NSZnZQOURtYnJxY3VDK0xLNUVNT3F6L2NpQ2w4dVliVFVmTVJs?=
 =?utf-8?B?MnlWRGdzNU1DOWZjV0Y2bENrMHowMkk0eWdyUlc1OEhFajJoZVpBWnVRL3ZU?=
 =?utf-8?B?MHVodlNtcWoycmxEeTU2R25HVlYwbmxYZUVCWUM4Z0xmM3E3WDVPOGZnUzNU?=
 =?utf-8?B?ZzV3YnFPL2ZhRWVleWNpa1QwdEJwTE03aXVUL2EwOHdyOGtQL3ltOUZleDNT?=
 =?utf-8?B?Z3pMVnNDUWd6Mmc5LzFaenc0VDN3amRiNWVzK0gzclJOU3NwQ0Q3TmdsSnFX?=
 =?utf-8?B?N3o0bHFaY2FTcmVUb25KRjMxckoxWUpnbXUvMFNyZjJEWlVFTVI3UFZRR3po?=
 =?utf-8?B?Sks3aktlZzllbmd2SVhMeFJxaGw3NHJYOUlZT0o4SnlOSGJhZTJsdjFsKzZU?=
 =?utf-8?B?UGtrMW5QM0p1QjFxci9XMFRpMm95WktXUVk3ZGpaZHlvaEp2K29RbERtanNo?=
 =?utf-8?B?Y2lyUUlCZ1JDTnJXQ2RERmJ3TXVkb0drRnlXdERvbGZoUEF2djdDR0s2Y3pW?=
 =?utf-8?B?Ly95Ym84bkN0bTRWQUhMRlJDaGREZ0pleUdXVDh3N2tSYkVoWUQrZUc0NGhn?=
 =?utf-8?B?aGdGV2FYU0w2OWd1RE9rbDgwallEQnViNVZobWJrdDl3OG9rdTJsTE9admc0?=
 =?utf-8?B?T0I5WlF6cHp4YW5ZTk9RbUFEY1ZZQ29qMlBoeFdUY1ROUnRKNHVvWU1WRzBI?=
 =?utf-8?B?Siszbm9PcHArR3lQWGdJT3BKdnFtVXJPaUZSR2dSanhaWXh3OWVIcGt5blNK?=
 =?utf-8?B?QUFDV2V2RVBZbTJSRGFhNlRRY2kxUTBqc1lWV1VKR1ZEQUFVOWI0dE16OTgx?=
 =?utf-8?B?bmdLb3lEd0JVZ043aDNzNHF4YWc2bGs2ZUhJc2Nib2FwS2RtZU53VEVhWFZz?=
 =?utf-8?B?eVJLUmRKaDZmL2xoMkwxOS9mZTdKbFk3OXgvSGRBaDNhdUJSVFBzWDlSdVZJ?=
 =?utf-8?B?cUlRdjZlUVhvZVh1cGxaVE5mcXJxMm5LQWI5OXZvQkpXL2VtaXhQYitnZ29Q?=
 =?utf-8?B?Yk9NNzFaOWNpL2RFdXNEV0c5Zlp0Q1VWcEo5aVlCenRyZ3RZakFhUnduVm9a?=
 =?utf-8?B?VjJ2Z3NjZXhCSjZ1dUNlWkZaTjZ3R2pWZ1IxTGJqc1doU082YTJmTTVNU29p?=
 =?utf-8?B?cWl5TjNMRm1CLzNESTZYc2N1azZwSkZvU1JGd3RqVHVUdis1d0ZWUGxyb2hn?=
 =?utf-8?B?VXJ6TEhlbU5kbEl4bTFhTitYTVZQT2UyVDJDcXYreE42RklobHZYazdxVmE5?=
 =?utf-8?B?RllMcUpEV1lxUlV4YzQ4N0plWVNScitneGpPdDllVVRYekpkWmRXYW40WG5F?=
 =?utf-8?B?ZTMwam5ES1RHclZOOGxIbXNBbTMySjNuMm5TV3Fva2FZeHl4dkhOVFdRSS9a?=
 =?utf-8?B?V1N3L3BRWUpxenFsV3lNMDhpcnQ5aTRMamtUZlM4TUJSU3JUTHhlM3lvVDdR?=
 =?utf-8?B?USttb1dwUGdiQVNZSjBrM2RrUUg5RlYrU0wrL2VKbUJnaDNJWCtXT2p0SU1R?=
 =?utf-8?B?T0hVenlzR0MxZXA3Smh0VnBDNFZjQ1lJUFJGWFlJNnNSU1Ztb0llQkVWSWRJ?=
 =?utf-8?B?UWl6NHZVeW50cVhOdVY3d2RqTENGSUdKdGRuUDljY3FkTi9sTjhQQUQvU2Fa?=
 =?utf-8?B?amprSGp1WVI1QU1HNHhLM2IzazdreFcwTGM3UitnMFZPV24wRDZUYVo3VkhO?=
 =?utf-8?B?SmNOclNqWWlxWCtBK1AzTUFFVFFzRVRtTC91bEhRamJQdC9pTklBZ0NaTkZX?=
 =?utf-8?B?TnQxUTFiZ3JwLzlodXJoVktKamFHeVdOME4xVEMyU3RIL2hQRFZmQS9FbmYz?=
 =?utf-8?Q?M5uO+ThGr3Kopmx8x0jm/QbfA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4df971d-cd86-4453-3361-08db4f982495
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 07:45:07.2080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpC4a1X7/d7AsYtoNRWfAL7DQFkM6gt8Gty0S7yQ95f9eXoZWXvk9z+ltUAkXiq5eki3j2HqV4QSGgN785belw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9403

On 04.05.2023 21:39, Andrew Cooper wrote:
> When adding new words to a featureset, there is a reasonable amount of
> boilerplate and it is preforable to split the addition into multiple patches.
> 
> GCC 12 spotted a real (transient) error which occurs when splitting additions
> like this.  Right now, FEATURESET_NR_ENTRIES is dynamically generated from the
> highest numeric XEN_CPUFEATURE() value, and can be less than what the
> FEATURESET_* constants suggest the length of a featureset bitmap ought to be.
> 
> This causes the policy <-> featureset converters to genuinely access
> out-of-bounds on the featureset array.
> 
> Rework X86_NR_FEAT to be related to FEATURESET_* alone, allowing it
> specifically to grow larger than FEATURESET_NR_ENTRIES.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While, like you, I could live with the previous patch even if I don't
particularly like it, I'm not convinced of the route you take here. Can't
we instead improve build-time checking, so the issue spotted late in the
build by gcc12 can be spotted earlier and/or be connected better to the
underlying reason?

One idea I have would deal with another aspect I don't like about our
present XEN_CPUFEATURE() as well: The *32 that's there in every use of
the macro. How about

XEN_CPUFEATURE(FSRCS,        10, 12) /*A  Fast Short REP CMPSB/SCASB */

as the common use and e.g.

XEN_CPUFEATURE(16)

or (if that ends up easier in gen-cpuid-py and/or the public header)
something like

XEN_CPUFEATURE(, 16, )

as the placeholder required for (at least trailing) unpopulated slots? Of
course the macro used may also be one of a different name, which may even
be necessary to keep the public header reasonably simple; maybe as much
as avoiding use of compiler extensions there. (This would then mean to
leave alone XEN_CPUFEATURE(), and my secondary adjustment would perhaps
become an independent change to make.)

> To preempt what I expect will be the first review question, no FEATURESET_*
> can't become an enumeration, because the constants undergo token concatination
> in the preprocess as part of making DECL_BITFIELD() work.

Just as a remark: I had trouble understanding this. Which was a result of
you referring to token concatenation being the problem (which is fine when
the results are enumerators), when really the issue is with the result of
the concatenation wanting to be expanded to a literal number.

Then again - do CPUID_BITFIELD_<n> really need to be named that way?
Couldn't they equally well be CPUID_BITFIELD_1d, CPUID_BITFIELD_e1c, and
alike, thus removing the need for intermediate macro expansion?

Jan

