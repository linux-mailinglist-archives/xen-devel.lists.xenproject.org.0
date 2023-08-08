Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42E77399E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579579.907614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK1K-00063B-Jw; Tue, 08 Aug 2023 10:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579579.907614; Tue, 08 Aug 2023 10:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK1K-00061W-HD; Tue, 08 Aug 2023 10:32:58 +0000
Received: by outflank-mailman (input) for mailman id 579579;
 Tue, 08 Aug 2023 10:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTK1I-00061Q-TS
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:32:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efa85691-35d6-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 12:32:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8628.eurprd04.prod.outlook.com (2603:10a6:20b:42b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:32:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 10:32:54 +0000
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
X-Inumbo-ID: efa85691-35d6-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWLtjisE9QzbfTYXaigkyWZvWAPFo7vt+951Py5m7vA9s1niWpVgjHIWGxJlkwl5t6SLhrBos6vtaQocQNayg1cg/WhE0779D1DJrKHWmdNAOTwe2qOHmwgQ0Lq3N7f3cwMhA7Gxut1Ps7r0uUwaeTrtSHf3D0eDgRsdrmu5kGEMkKhoNla1JW2BsYym4bYgSl4k6RTlz8nek39WpJwOfMCblX2eoOgkxxVUSw6vhPqlzoMu6G5CAbiN195CQzZM9SMlim9I3Js0eXNQ707RcHz55VIgI6BSjow5t5eiSdweP6yCrFcuUS2misi/RnCPY0KltfDPxC3UlvuSDOFGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQ7m4npKV+BARwzs3twm21xAb/EAsWBaVN1ShDwcHkk=;
 b=dHHBz47F+ALlJ+HFpqlmwH7GEttjYEf2tHzmZeyL2qHXCok6auGh6Ep5rV4VxXMcd9No13UZj3WVNE882rT+HMesEshWca4KEpO0Z+dEH8NKQkBaQ68ecnJQMIiE93tRfLp1OdWgcPTeVcz+ndEYKuoEo1ODzg1mg6EoQfh+hXjg2PbLwFWldpn/C05pWdj8Pp9J+TcY2jXALeaDJbTLghjgIHqKSAAhi4nLZaUzGvMUeCMmAztsqWAJBNkE5SzimMPllJXwW3IGHeQ0PmpF/emQmVX1nKDun5cEIKFTGZ16HbUrYT7MnRfXg8oqMYYJf3tC8pV4YIku7Uz4YNyqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ7m4npKV+BARwzs3twm21xAb/EAsWBaVN1ShDwcHkk=;
 b=P2M13sITPzHQaY5oeCogIp0O40g1I6eKLms+pqvQ/AxYlD+ow+39rhPQuSPneGY8hs98cuNCjE0DZ3VvnrINE4QZN2r8Cw7ZSmrvqC5oxXZP03W/G3ewOm+Tks6iA2qZE2yjmJ106MMusXE8cr/rIqjSFFe/7n+8+agtqDu00iITtfscxFI2xv9cp5Re5c/QT3hjF82NtnBgdMUwlG4tyl/2PDuJm8igKuhKpUUBxzN2Jm2eyksGJukWpzcUglt/qhxM9Ci1NTkqdk830xmCdA48Gu4MgPSI+oVJZity/Bsnsdf1F97zO+NIvq1ZOAVJqmhz6/h8wEyoqf02g8Owcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
Date: Tue, 8 Aug 2023 12:32:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: 0777078e-942f-4f02-0783-08db97fad2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ubaMNxoinWtD0+L5sMr4cq9s0lfhRGT0+hDoIAMLiBBE8GvYgggpqZmTDU5ZBHgI+UGKL5ejQVjA9Xd89fSUNGFYugumvd6mngZHUKusj19hxKaD2yZHO7yNWCXnLSsw2OzjJn1c3d3hxzSwG2nZZvi1D3RBWRCMyVQFR6YwiYSsS1WNXtmqUN49YcxSV8VnozAwy4Hr+/r8cdHonu6Q3G9UoNssRrVIZCOT1uzry2BbXDgKFGa+gomH7LPDENErMhGiHnX5yDvul8/ViDkZbQmbRXybFzJISPjHbXRl9+WkdZT/CYfu5yk7vA445K5iM5zjfGOq4vU1wUxMdp2KVKspKOphSg3/8BaO9k4cr5HGuAxd8OCWIjcyFnibEJVE9UbCZbondnrOTd6v8QP2AULIpjr0e2bY9qn+JDe6ILB40qzuVGYp/pg25AXvtt7q4BofAiOSwcLUAQ1/MSw6lr7xbedp3oT1GuKCdBQCddwjL7pyexNtEqK7OFj7dY7OTzLsaMU73sMlPgGMHnoeCGRztEI9sPjACndomY/l2mC+Jthsun02SWBAKnC7ZyWF2DZZJUBqGIMdQeAQMeL3AqgWS6pQykmau1++xBRqpCxzS1bwQriM3812G4hHt8TmlU654yheL+ObmIydz8dcGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(186006)(1800799003)(7416002)(8676002)(8936002)(5660300002)(4326008)(6916009)(66899021)(41300700001)(316002)(83380400001)(86362001)(31696002)(2906002)(6486002)(6512007)(6666004)(2616005)(53546011)(6506007)(26005)(36756003)(66476007)(66556008)(66946007)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2Fva1VGL3R4eThlS2xpK0lCajcxMHpCQmFoVGF4enVEV1pNa0JUQ3NoWndV?=
 =?utf-8?B?aWRGMjllWUhtVHhMM2wrNnArQURIR1orYU5DRmxBbkpsUXVsbFNhNUtQSkRu?=
 =?utf-8?B?a1VUbEMrd0pkZEFrc3RxaDZFR0RvT2FiNi9XZS8wTjMzb0krUkN1Vmg3Ui82?=
 =?utf-8?B?TldLY0syUnJZNitHOVU5NnlFZk9oTWpESjcwU0ZLNGhwOEQ4MDlDUm5IZjlC?=
 =?utf-8?B?VXQ1S1p5TEl1K0hPdUw5Q202MTBmYjNWVElxQlFMd2h2Z2E1U0dLZkZlWHUy?=
 =?utf-8?B?amRpNFZocWowc2tJaHNrUGFkY3hQMWxqM0Z4K1Zpd2NoVXFDZ2tvWm94QWxl?=
 =?utf-8?B?MHc4L1ltR0lhYWxRV2dCdUFkRHBpeHRValJSMi9UR1E4clhJTUVESnJFejlj?=
 =?utf-8?B?MFpjT2hpaVdRSXJnT2lSOFVicGN0UEx2OTljbEpsd2pRK2VUeWd5Q1FlTGx1?=
 =?utf-8?B?V3FndExSVzczQWRSN0YwalhxRmZlNkxBR0Z0WW1VQ0c4ejhraFZDMEFBdXVG?=
 =?utf-8?B?QzN3NTl0dU84MTZ1ejA0dmwzZ0lpVlZoaFBoUkZEYkRkL3FscDV4UmhTalVz?=
 =?utf-8?B?OGRJYmpERGVIWGtqeDZFMnpRY2g0NHI3MzdJU08ydnBQbm9zbWk5eis0SCt6?=
 =?utf-8?B?em1lbklKdnN3UVQzM3JrdXdVMkRoZ2dDL2dNTUhNNXRnR1Q4UEM4ZkoyVjVo?=
 =?utf-8?B?NDVIS1BoYjZadnBiMnRlOVU5YnRaMWNpdEtlejl3b0ErSVd1Y1BVUkVaVisr?=
 =?utf-8?B?TE9GaUwzMnNtK2wrMThjemJTQUNrSGNxTWpsWG5HUVM1dkY5WWZncTlpaDVi?=
 =?utf-8?B?WmxiVzRNL3BqSVEzZEh2dVFxSlpxSE1qb1Fya0lUdi9yRjBQS2JFM1JTVEZa?=
 =?utf-8?B?WDlpL0ZHSW5aazlGc3o4OS9WQ1NQT0ZQSjEycU5HU0RveFZ2eDdOWkdnc0dN?=
 =?utf-8?B?MDdjNkNxbElnbzJIL01UZHQ2YkxVc2dRamhxRGJQbm1Ua2w1bUpRL0FiaU9W?=
 =?utf-8?B?bkdpRXJCeGVYbGZ0b3NoR01OUW1OZ0RlVUtvaTNEb29RZy9yR3diaGlUSnd3?=
 =?utf-8?B?NUxKOHpaRU9TVFA5anpWK21TVjN5RTFiS1hmb203RWZkL3Z0RGl0emwwWVkz?=
 =?utf-8?B?WU9lWnYzclJaR2NRRmVwMGZGQUpsVE5pM1BPVmFnb1J6a00zSmJaMi9QQUxu?=
 =?utf-8?B?VU5FY0swZHdsMnkrNDV0akRzOGNhZS9zeE0xSERlTnNqWE43VElPR2Y1NnQ3?=
 =?utf-8?B?WE9XY0NBTkpVV3BwRmxwcUhnNGNxS1d6b0tsY2NGSW1rUy8yV1lMUWlFdjBr?=
 =?utf-8?B?NTlKNnVHQ2VtVTNGV1FqZ01zc1FlKzBqMTcvVXY0d0xzbGw2OXdJYjZqWDJK?=
 =?utf-8?B?UUp4aDRYUmN6ZUJMZWpNUlh4WDgza1J3ZU9MYjJjV3ZmNWpXRDY1d0xGQ2Rl?=
 =?utf-8?B?c3N4dmduTEJROGo2R2M3YnVxWXo1L3k3bi9pWEs2MFNzZENoUGZPbW9xeklt?=
 =?utf-8?B?U2FnNERUdEczMUREdERNVHJWTGh2Z21jcldqdndFWGJ3RnJNaUZuVzBEZkpU?=
 =?utf-8?B?WmM3UUM4elNHSU5zTFpVbzBYakExaGp5TFY2bHNOanJtSEFRcEtrd09uSldp?=
 =?utf-8?B?RDRHRDJlQlE3VjlRMml1NmRGb1ZSU2Y2WVMvZ1VxV3E2NXlITzd4OTFVdC93?=
 =?utf-8?B?OEt6T0FFTlE0WG1SVlJwK0VodFZNQTlrOTRlZmJjdVVQVWh6clpzWlNhWG5F?=
 =?utf-8?B?b2dyWkkyWk1xNGlyWkxRUVZrS3BJSk5hWWx0a2xzekovNXBCKzBPWHVZTjNB?=
 =?utf-8?B?ZXdsV2VYOFpUZ1d0TWY4cU9pSDJIOTN5Tmlvcll1b04ycWJrZ0pUM1RJUlNw?=
 =?utf-8?B?bUV3RDAzdGVqRFI5UW9ENks5TzRpN1hLMGFTd2ZOQTl2ZlZRZTg5T3daTzBH?=
 =?utf-8?B?RFRwdUpLRWlGb3IxVXVnY09wVkVaRUNLQU5Rd1dxNjY3RkVxNXkxb2pmWjJX?=
 =?utf-8?B?SXRQcm1PRWdRZUw4QVFCVlpseTJtdDd0c2hDUHdkNTNWU3JoNDB6bHZ1U0Zq?=
 =?utf-8?B?aXY3bER2UVlXVE9qcStKOEZ0aTZMV0tJWVJMbDcxV1p3djhpWklwLzk0T0FT?=
 =?utf-8?Q?2uWqM/yAmmeEWDlSStLZaSWcY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0777078e-942f-4f02-0783-08db97fad2fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:32:54.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwNyARLtouYthPasnM9chiuXBX6hpUxKi6vElKv0jKGtI91XolHctt2NfUCdkzS3ulsTjLvwJwSBA+Skrj9L+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8628

On 08.08.2023 12:18, Andrew Cooper wrote:
> On 08/08/2023 10:46 am, Jan Beulich wrote:
>> There's no need for every arch to define its own identical copy. If down
>> the road an arch needs to customize it, we can add #ifndef around the
>> common #define.
>>
>> To be on the safe side build-breakage-wise, change a couple of #include
>> <asm/cache.h> to the xen/ equivalent.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Could we find a better place to put this?
> 
> __read_mostly is just a section.  It's relationship to the cache is only
> microarchitectural, and is not the same kind of information as the rest
> of cache.h
> 
> __ro_after_init is only here because __read_mostly is here, but has
> absolutely nothing to do with caches whatsoever.
> 
> If we're cleaning them up, they ought to live elsewhere.

I would be considering init.h (for having most other __section() uses,
and for also needing __read_mostly), but that's not a great place to
put these either. In fact I see less connection there than for cache.h.
So the primary need is a good suggestion (I'm hesitant to suggest to
introduce section.h just for this). In the absence of this, can we
perhaps deal with this in a 2nd step, thus not blocking this patch and
therefore not needing to then also clean up PPC-specific code?

Jan

