Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881B588754
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 08:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379570.613116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7oy-0001jB-RK; Wed, 03 Aug 2022 06:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379570.613116; Wed, 03 Aug 2022 06:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ7oy-0001gt-NN; Wed, 03 Aug 2022 06:25:32 +0000
Received: by outflank-mailman (input) for mailman id 379570;
 Wed, 03 Aug 2022 06:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PneM=YH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJ7ow-0001gn-Hn
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 06:25:31 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fa65666-12f5-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 08:25:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5707.eurprd04.prod.outlook.com (2603:10a6:10:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 06:25:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 06:25:19 +0000
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
X-Inumbo-ID: 0fa65666-12f5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQaJ5Ku5EtQh80cxkjzPJIe68NR71K6k5zw2r9oi0VCvWnbrnD937dEVpAD2zK3DrK9AYpNmT8FqRp9DG1Uh79WsX6YpdKKgoIBBrYhFZn2S0W4RPLJ60vaUuPkSv5z/tYGUsvLUiymt1Pt3Vn8gK7JtnVdw5uLENcBAwQ9fq/bdoMzwm5P34EoiOQ8wPP3Pa/SBx+fypnGleHngL+nh+DpZgbQrGCEMy2NgmULQXcHnX+G5F294Vd2Tc+Gjq0uwAOTJ9aKhYOtF88yt0xbnwLS6AH+B4DHSDTCV7XEQyIvWA3oz2ZZ48ogJF/+KdsoZmXLKkmgt9goGPjSIY4BhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhMcpK3QpM/F7wvDHFKKqiVOwX/I72JYXVomQ4gp4Is=;
 b=YNef2yuzxNF4CaJx6Vc8/Dd5cbybI8Kdn0o24efiT7gtXEpXsI0cF8aYLVh3T0fIfpsRnE8dB1dfRHlK8wXO3CxywldUzoxXhIbgl+puNhUXjF1zrT6L9kxyKcuVSFkUg3ZweC+H9AExQRI6Rm0bGBX0vZu7mg3DsZKKO6/6/iHbCY73rUmsjyPi5uvuyaj150QZmjlD23wAqBp73uc6EGS9wz+62rA/zWe08H6nrYkSKINGDAdiKsnbLR+I+LH8KMuvJHMRrFoHk7KcIkOK+FN30uYNdB2VxFoK3LzjB9o+weNsiBPEDCroGlIqVJUiEb5dpKmsh+gT1opoi0qc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhMcpK3QpM/F7wvDHFKKqiVOwX/I72JYXVomQ4gp4Is=;
 b=HHXtTULKy1Wsd+SwWnLpTzNqOHz/PBmOeeXt1LL4hEyGz+GdXBY0OnoUjOj2n6ORPW3zNsTPl0YKGOvmXwKlGpqJe0uW1lWGTZD6J/S77lVpBIWy5FEVodL/AXMWmHWbz++mAYaOjQMefSpEoGRRsgExevp889L8KwktdgC0jDBrPB7nk/AJ3d7iZKjdDPWtqVj7Wm5Qjf/YKxf6USY2vhh0IFMnkUUzB7LNa+myij12jpPkuAiW67tEb/spIyy9BN6Ku7mYX66er/dtKh1ceRFqQKyxx2SHBzJBLcesfmFp8TxSaGD75JnMz8GIvSRNJbq6ArhwFHF3aW3j+i1JOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc1058ef-ca8e-12d5-1ff5-9fc824cf260a@suse.com>
Date: Wed, 3 Aug 2022 08:25:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Content-Language: en-US
To: Bruno <brunoce@kolabnow.com>
Cc: xen-devel@lists.xenproject.org
References: <87c86770-9244-dbad-23ba-d449b2c3ccb7@suse.com>
 <B8D2151F-D58B-4443-8171-48623AB77595@kolabnow.com>
 <eaa074c2-350e-c526-b825-c2d45ff0fc48@suse.com>
 <24ec8c9e1dffd6073677fec8d2fb038a@kolabnow.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24ec8c9e1dffd6073677fec8d2fb038a@kolabnow.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0056.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0128a831-bce3-475e-ba03-08da7518efc8
X-MS-TrafficTypeDiagnostic: DB8PR04MB5707:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i6fFoIUVLesV15bTnLigVLFUrarLKL5KxNQ+HOVYM9FTfbns/poUZvo3VbKDhuHxuDYhj+M3wiWtJyX/21DVOSSVo2PdPStiOibp4Cop2vzRWGT8ltFUehiopdL3Ngw8YyNps937shzdBN66cyP5XR/i8j4/1d7c/nX6L5IkrXB11LSDVrvRMAHYDr2EWdvjI3gXNnjk0XYPsO3WtwLHAtCGmANgerlFtkOqCjkUnckjQ5t9kxLkQQFitmKgm0NCM65YTYR20XfAdDOaexJJJKFBzzlRnBgR3hMYJlzz1DVw9wfrwyAzowpV4GrWmEwmQKZ9H42WYYucoj/0TEuEW5p1TQtJxH2QkwbuoYUYw+fP9EHEKCFG+K6aT6rl+qtm/uczu7iqOY8sUVsWd8R1mX+xZl9UFZg9Emsm6Pste8d3xtnNw6LLiqqq1jgaIhuxJjdJW8pN4uJkRiQeohr/XwE/I3IM0d/nhYisfdzJWQVuahmb3vx66olvDFEbgxVpIx9mtUPYt2dKTaFsDimcg2anmGVVCK1T6QayAJJmPKF0+h3YGtVXDXDgB0v5ZSIHoU9dFXptFI5xpJgVK/i4PTUpjeNuZHkFbrYmOVN4HuQxWfC9kjtg8SNjvfML5Rvj7rX6wafvd2L5o67+J83CtD+b1agF5P/FZAePriCTwPAOVI+6TJ5KswtNb9NMwx0UbhVJXr/de1QXF23V+G0wTvl/FQEviEnygSIQivSQW4U2+wVoJdwqA+duZzvfy+iXrrMpp8vQC4rMtdWAkMG3rzqsKCrmuQ1O2EPDwZE6pFTzQa33Gp4jMC3jg40Nsr3WF4rAuP6ay3QOUIl+K+CsZu4naL2n8m216eTEd6ltfy4AP9FxSIsaAWw7yI9BpeRl/LEXrOs/ZS1UAsY4M9D4+xiM5pKJVM4CDNxPfyretJ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(39860400002)(376002)(136003)(2616005)(2906002)(26005)(316002)(41300700001)(86362001)(31696002)(6512007)(38100700002)(6916009)(83380400001)(66574015)(36756003)(30864003)(4326008)(6486002)(8676002)(966005)(66556008)(66946007)(53546011)(186003)(66476007)(6506007)(478600001)(31686004)(5660300002)(8936002)(2004002)(43740500002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEtLTTQ2M0JrL0xTcW0xWU4vZlRta3laWmszYkxYTXVOWVVEaGNkVHBwblJO?=
 =?utf-8?B?cTNmZ3dpWElVRi92Z21ZOXJ5VXdrNGYzMGlpWHFaSld4YWpPcDZmNlF6ZVRx?=
 =?utf-8?B?YTBqQ1Fna2xwNVo1anU5Y25nU3NWMEF5V0VERWI0ZG9CQzJvNmVwNFFkcXo0?=
 =?utf-8?B?clFGaE1ZU1hkRG1OYVdEVWpMdlBSTVZLM3VyTmV5bHh1WnpoZHFuNEhYQ0hz?=
 =?utf-8?B?M3Jkd0hyaUdOcmZtREh6eGJLU0NIM1IzcVdpTThkdTAzV0VmVE1qUXpiV0Fr?=
 =?utf-8?B?Z0ltdFVYUW02K3BiT2VSNlZ4VHJpMTBrVWJvM09zZGUwVnhZOFRLUzlZbjhk?=
 =?utf-8?B?Wi83WFVsOE1XZUNidjlyMnE2MTBsbG1wY2xYOEdZWHNPSkJlMDNtYktPQ0Er?=
 =?utf-8?B?cGlUOEl3cktoTkJObjRNRGlLZmhEeVRhMFJjMFZFcjcrQjV2RysrMTBVWEhi?=
 =?utf-8?B?YnRYVXRzNDAyUEFWZXhmZ2tZOGZrazNCQmxFaEdmUWxYN005aUFaRmJBWnNh?=
 =?utf-8?B?M25MQjJjRU1PM0owM3NtSysvTk1ONXcxYUVYUTEvUEYvdE40eFM3THpvTkRV?=
 =?utf-8?B?WE1zOFlnRmhKL09tMmdnYUJlSnhxSkMwVHRvdkVUemlPNDc3bmxwbFpvYThw?=
 =?utf-8?B?YUN2b2JuaUVsWHNWOEdHZmNmMUY0VlFjRlVGZ01TeWQ4ajVZMklDT3RlbHBS?=
 =?utf-8?B?Sk9YcjdmUVNCM0k4SGJGejNuTlpaV1BTN0tHb2lPRzJzVXdYcWFmSllUQ041?=
 =?utf-8?B?aEJpaFhUaG5nT0hHTm1kOHBodlBURThXblhoT042blJJMGxVb0RoblVSRkdQ?=
 =?utf-8?B?NTlQSk0xUGtJWnE1Wks5blpSVHpKTWRKd2F6ZG4vUU1UZHhnZGpMZGF6YnJG?=
 =?utf-8?B?VGh5dFEvbnA1RFRORk1ZeldQc0JjQWlLMUFLenBCQ3o0NGRZTTFEMmJMOUdh?=
 =?utf-8?B?UXI0MzRWdms2d09kV3o4a1k4a1dtYVpsaFcxQisrc1Z0azhVRWM2MHVWUjZ2?=
 =?utf-8?B?c011NU55Q2ltcXVyK1NDUElvMmxUcXBlUzFaZFRUMk9vdkorK2tMOXdwSnUv?=
 =?utf-8?B?WTF2UlhpUUZCSCs1a0Y1dTNQcWFPUWw3U080NEtFNUtSN3k4clVtQnI0dDBU?=
 =?utf-8?B?dmxyOEovWUdPaWZzRFlKaXNTRXk5SzdIaFpQUm8rMEpQOTRoU1h5S25iQURO?=
 =?utf-8?B?bnQ2N2tqbU9WL1BFejV5WDdxa2djWkZJeVVHQlpCWTgrVERVU1BJOE52VjdL?=
 =?utf-8?B?RjhtMVh6NmdZMjVxNzFHYm9vME14cmNaUktMVDVRdTNja2RSdW84N0M2T2p3?=
 =?utf-8?B?TEFPbEdzYStuZE1COEVIVm9qRzRnNU9XWlZSdm1WeWlibzBsMWRpN2o4TWpm?=
 =?utf-8?B?T1c1ZVJWZVZhdWVMRFBrdU9JWFUzejJiSDNoeTVROHZRaE1FSXBGZFRlTG5U?=
 =?utf-8?B?ZDRPSWl3c0hQbUZUUnRoMkU2SjRRSE1LdG9KKzlzSVkrbkIyOGtiUWNYeWdM?=
 =?utf-8?B?bi9PcXM0c1A1SmM0ckw0T05FbUlmaGlQUGszTUJyaCsrazkwSU44dGJJQU1S?=
 =?utf-8?B?T1ZYZTRjT1lZOGhsUUdUUTJkSDBMSjFhYlcyK0loYThJaXBieVNyL0k5dUN1?=
 =?utf-8?B?ZE5URFZBWDhZNWJsZFdEYXQ5N0w0R1E3djRBRmQzaXM2dXBkUlJ5TFZSb3VS?=
 =?utf-8?B?NDdRdmpVSzlyczdLTGFETmRldGhhTy9qSkZkWGx4N0xucjU0TndrUWYwTU5o?=
 =?utf-8?B?ZEY1RzQ5OGpvRVlKRGVZTkhSclVhNXJ1MWpZSFpqTEF6YjJOK2piK2xVaDZJ?=
 =?utf-8?B?Q05ObUt2QXF6Y05mL25ybEVJa05QN3pDTDQxeFAyQnBIS2RSTUVlKzBYV1dy?=
 =?utf-8?B?Z0sybUxMYy9HeU45OHprdXpBZGRORlNleDFYdlJHSGNGYWNWc0xHMWtmWm5j?=
 =?utf-8?B?OE9yMS9GSENNQmxOWDdzRmhqMVNCVjVySU93dXlaYWpab05URXd3TVgrT00y?=
 =?utf-8?B?dURUa1grOUdOMnpLMWVTTXR3SXdPOEg1cEpwZ1QxL042Nm82azY0ZHI2SjY1?=
 =?utf-8?B?TkJpOGthT2hCRW8zQk1BTkhWTUVGMHVqY0lBQ2w1aVNXdGZNMStIemJiZWVG?=
 =?utf-8?Q?T4HRqV8XYQBfv0P9xX2F9rADY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0128a831-bce3-475e-ba03-08da7518efc8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 06:25:19.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUGqVSA0yM20cbbkcYpIaBWmKN23CJ/ID4b+gFxXZQizjvr2/SvOuG5BcOjkRiu70yD2B4gtqtmpuzJSOz8scw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5707

On 02.08.2022 18:07, Bruno wrote:
> On initramfs:
> 
> - xl will give me not found - I cannot do xl info or xl dmesg

As expected - you'd have to handcraft xl and ints libraries into the
image.

> - I cannot mount any disk, therefore, exporting logs from there has been 
> photographing and using OCR then reviewing and correcting - but I guess 
> the main difference is ACIP, as I cannot access the disks

Oh, I see. I was kind of expecting (hoping) you might be able to
export the logs via, say, a USB key.

> I have now booted on kernel 18 to get the kernel boot log for you (the 
> one on Xen-user is kernel 10).

At the first glance - similar ACPI errors, and a similar issue with
loading sound firmware. Using two different kernels won't really
lend itself for direct comparison, though. At the moment I don't see
a good way forward here as long as not even proper logs can be
obtained: It may be necessary to add debugging code, the output of
which would also need collecting. But maybe someone else sees a
viable route to help you ...

Jan

> # journalctl -k -b
> 
> Aug 02 16:57:40 xd kernel: microcode: microcode updated early to 
> revision 0xa4, date = 2022-02-01
> Aug 02 16:57:40 xd kernel: Linux version 5.18.0-2-amd64 
> (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-3) 11.3.0, GNU 
> ld (GNU Binutils for Debian) 2.38.50.20220615) #1 SMP PREEMPT_DYNAMIC 
> Debian 5.18.5-1 (2022-06-16)
> Aug 02 16:57:40 xd kernel: Command line: 
> BOOT_IMAGE=/vmlinuz-5.18.0-2-amd64 root=UUID=0123abc ro quiet loglevel=3
> Aug 02 16:57:40 xd kernel: x86/split lock detection: #AC: crashing the 
> kernel on kernel split_locks and warning on user-space split_locks
> Aug 02 16:57:40 xd kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 
> floating point registers'
> Aug 02 16:57:40 xd kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE 
> registers'
> Aug 02 16:57:40 xd kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX 
> registers'
> Aug 02 16:57:40 xd kernel: x86/fpu: Supporting XSAVE feature 0x020: 
> 'AVX-512 opmask'
> Aug 02 16:57:40 xd kernel: x86/fpu: Supporting XSAVE feature 0x040: 
> 'AVX-512 Hi256'
> Aug 02 16:57:40 xd kernel: x86/fpu: Supporting XSAVE feature 0x080: 
> 'AVX-512 ZMM_Hi256'
> Aug 02 16:57:40 xd kernel: x86/fpu: Supporting XSAVE feature 0x200: 
> 'Protection Keys User registers'
> Aug 02 16:57:40 xd kernel: x86/fpu: xstate_offset[2]: 576, 
> xstate_sizes[2]: 256
> Aug 02 16:57:40 xd kernel: x86/fpu: xstate_offset[5]: 832, 
> xstate_sizes[5]: 64
> Aug 02 16:57:40 xd kernel: x86/fpu: xstate_offset[6]: 896, 
> xstate_sizes[6]: 512
> Aug 02 16:57:40 xd kernel: x86/fpu: xstate_offset[7]: 1408, 
> xstate_sizes[7]: 1024
> Aug 02 16:57:40 xd kernel: x86/fpu: xstate_offset[9]: 2432, 
> xstate_sizes[9]: 8
> Aug 02 16:57:40 xd kernel: x86/fpu: Enabled xstate features 0x2e7, 
> context size is 2440 bytes, using 'compacted' format.
> Aug 02 16:57:40 xd kernel: signal: max sigframe size: 3632
> Aug 02 16:57:40 xd kernel: BIOS-provided physical RAM map:
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000000000000-0x000000000009efff] usable
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x000000000009f000-0x00000000000fffff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000000100000-0x0000000040198fff] usable
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000040199000-0x0000000040a98fff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000040a99000-0x00000000428aefff] usable
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x00000000428af000-0x0000000042c7efff] type 20
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000042c7f000-0x00000000446fefff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x00000000446ff000-0x0000000044f2efff] ACPI NVS
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000044f2f000-0x0000000044ffefff] ACPI data
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000044fff000-0x0000000044ffffff] usable
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000045000000-0x0000000048ffffff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000049e00000-0x000000004f7fffff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x00000000c0000000-0x00000000cfffffff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x00000000fe010000-0x00000000fe010fff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x00000000fed20000-0x00000000fed7ffff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x00000000ff500000-0x00000000ffffffff] reserved
> Aug 02 16:57:40 xd kernel: BIOS-e820: [mem 
> 0x0000000100000000-0x00000004b07fffff] usable
> Aug 02 16:57:40 xd kernel: NX (Execute Disable) protection: active
> Aug 02 16:57:40 xd kernel: efi: EFI v2.70 by INSYDE Corp.
> Aug 02 16:57:40 xd kernel: efi: ACPI=0x44ffe000 ACPI 2.0=0x44ffe014 
> TPMFinalLog=0x44ec5000 SMBIOS=0x42e5e000 SMBIOS 3.0=0x42e5c000 
> ESRT=0x3c78ea98 MOKvar=0x3c70c000
> Aug 02 16:57:40 xd kernel: secureboot: Secure boot could not be 
> determined (mode 0)
> Aug 02 16:57:40 xd kernel: SMBIOS 3.3.0 present.
> Aug 02 16:57:40 xd kernel: DMI: Acer Aspire A517-52G/Jasmine_TL, BIOS 
> V1.26 03/14/2022
> Aug 02 16:57:40 xd kernel: tsc: Detected 2400.000 MHz processor
> Aug 02 16:57:40 xd kernel: tsc: Detected 2419.200 MHz TSC
> Aug 02 16:57:40 xd kernel: e820: update [mem 0x00000000-0x00000fff] 
> usable ==> reserved
> Aug 02 16:57:40 xd kernel: e820: remove [mem 0x000a0000-0x000fffff] 
> usable
> Aug 02 16:57:40 xd kernel: last_pfn = 0x4b0800 max_arch_pfn = 
> 0x400000000
> Aug 02 16:57:40 xd kernel: x86/PAT: Configuration [0-7]: WB WC UC- UC WB 
> WP UC- WT
> Aug 02 16:57:40 xd kernel: last_pfn = 0x45000 max_arch_pfn = 0x400000000
> Aug 02 16:57:40 xd kernel: esrt: Reserving ESRT space from 
> 0x000000003c78ea98 to 0x000000003c78ead0.
> Aug 02 16:57:40 xd kernel: e820: update [mem 0x3c78e000-0x3c78efff] 
> usable ==> reserved
> Aug 02 16:57:40 xd kernel: e820: update [mem 0x3c70c000-0x3c70efff] 
> usable ==> reserved
> Aug 02 16:57:40 xd kernel: Using GB pages for direct mapping
> Aug 02 16:57:40 xd kernel: RAMDISK: [mem 0x2ff63000-0x33fa8fff]
> Aug 02 16:57:40 xd kernel: ACPI: Early table checksum verification 
> disabled
> Aug 02 16:57:40 xd kernel: ACPI: RSDP 0x0000000044FFE014 000024 (v02 
> ACRSYS)
> Aug 02 16:57:40 xd kernel: ACPI: XSDT 0x0000000044FDB188 00011C (v01 
> ACRSYS ACRPRDCT 00000002 01000013)
> Aug 02 16:57:40 xd kernel: ACPI: FACP 0x0000000044FDE000 000114 (v06 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: DSDT 0x0000000044F81000 059948 (v02 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: FACS 0x0000000044EA2000 000040
> Aug 02 16:57:40 xd kernel: ACPI: UEFI 0x0000000044F2E000 000236 (v01 
> ACRSYS ACRPRDCT 00000001 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FFA000 00255C (v02 
> ACRSYS ACRPRDCT 00003000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FF9000 000105 (v02 
> ACRSYS ACRPRDCT 00003000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FF6000 002137 (v02 
> ACRSYS ACRPRDCT 00003000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FF2000 003300 (v02 
> ACRSYS ACRPRDCT 00003000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FF1000 00077B (v02 
> ACRSYS ACRPRDCT 00001000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: TPM2 0x0000000044FF0000 00004C (v04 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: MSDM 0x0000000044FEF000 000055 (v03 
> ACRSYS ACRPRDCT 00000001 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FEE000 000D02 (v02 
> ACRSYS ACRPRDCT 00000000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: NHLT 0x0000000044FEC000 001B54 (v00 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: LPIT 0x0000000044FEB000 0000CC (v01 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: WSMT 0x0000000044FEA000 000028 (v01 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FE9000 000B70 (v02 
> ACRSYS ACRPRDCT 00001000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FE8000 00012A (v02 
> ACRSYS ACRPRDCT 00000000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: DBGP 0x0000000044FE7000 000034 (v01 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: DBG2 0x0000000044FE6000 000054 (v00 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044FDF000 006BA9 (v01 
> ACRSYS ACRPRDCT 00001000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: HPET 0x0000000044FDD000 000038 (v01 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: APIC 0x0000000044FDC000 00012C (v04 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: MCFG 0x0000000044FFD000 00003C (v01 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044F80000 000C78 (v02 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044F7D000 0020D6 (v01 
> ACRSYS ACRPRDCT 00001000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: UEFI 0x0000000044E5B000 00063A (v01 
> ACRSYS ACRPRDCT 00000000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: UEFI 0x0000000044E5A000 00005C (v01 
> ACRSYS ACRPRDCT 00000000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044F7C000 000985 (v02 
> ACRSYS ACRPRDCT 00001000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044F7B000 0000F8 (v01 
> ACRSYS ACRPRDCT 00001000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0x0000000044F7A000 000835 (v02 
> ACRSYS ACRPRDCT 00003000 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: FPDT 0x0000000044F79000 000044 (v01 
> ACRSYS ACRPRDCT 00000002 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: PTDT 0x0000000044F77000 000CFE (v00 
> ACRSYS ACRPRDCT 00000005 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: BGRT 0x0000000044F78000 000038 (v01 
> ACRSYS ACRPRDCT 00000001 1025 00040000)
> Aug 02 16:57:40 xd kernel: ACPI: Reserving FACP table memory at [mem 
> 0x44fde000-0x44fde113]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving DSDT table memory at [mem 
> 0x44f81000-0x44fda947]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving FACS table memory at [mem 
> 0x44ea2000-0x44ea203f]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving UEFI table memory at [mem 
> 0x44f2e000-0x44f2e235]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44ffa000-0x44ffc55b]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44ff9000-0x44ff9104]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44ff6000-0x44ff8136]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44ff2000-0x44ff52ff]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44ff1000-0x44ff177a]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving TPM2 table memory at [mem 
> 0x44ff0000-0x44ff004b]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving MSDM table memory at [mem 
> 0x44fef000-0x44fef054]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44fee000-0x44feed01]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving NHLT table memory at [mem 
> 0x44fec000-0x44fedb53]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving LPIT table memory at [mem 
> 0x44feb000-0x44feb0cb]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving WSMT table memory at [mem 
> 0x44fea000-0x44fea027]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44fe9000-0x44fe9b6f]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44fe8000-0x44fe8129]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving DBGP table memory at [mem 
> 0x44fe7000-0x44fe7033]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving DBG2 table memory at [mem 
> 0x44fe6000-0x44fe6053]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44fdf000-0x44fe5ba8]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving HPET table memory at [mem 
> 0x44fdd000-0x44fdd037]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving APIC table memory at [mem 
> 0x44fdc000-0x44fdc12b]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving MCFG table memory at [mem 
> 0x44ffd000-0x44ffd03b]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44f80000-0x44f80c77]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44f7d000-0x44f7f0d5]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving UEFI table memory at [mem 
> 0x44e5b000-0x44e5b639]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving UEFI table memory at [mem 
> 0x44e5a000-0x44e5a05b]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44f7c000-0x44f7c984]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44f7b000-0x44f7b0f7]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving SSDT table memory at [mem 
> 0x44f7a000-0x44f7a834]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving FPDT table memory at [mem 
> 0x44f79000-0x44f79043]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving PTDT table memory at [mem 
> 0x44f77000-0x44f77cfd]
> Aug 02 16:57:40 xd kernel: ACPI: Reserving BGRT table memory at [mem 
> 0x44f78000-0x44f78037]
> Aug 02 16:57:40 xd kernel: No NUMA configuration found
> Aug 02 16:57:40 xd kernel: Faking a node at [mem 
> 0x0000000000000000-0x00000004b07fffff]
> Aug 02 16:57:40 xd kernel: NODE_DATA(0) allocated [mem 
> 0x4b07d5000-0x4b07fffff]
> Aug 02 16:57:40 xd kernel: Zone ranges:
> Aug 02 16:57:40 xd kernel: DMA [mem 
> 0x0000000000001000-0x0000000000ffffff]
> Aug 02 16:57:40 xd kernel: DMA32 [mem 
> 0x0000000001000000-0x00000000ffffffff]
> Aug 02 16:57:40 xd kernel: Normal [mem 
> 0x0000000100000000-0x00000004b07fffff]
> Aug 02 16:57:40 xd kernel: Device empty
> Aug 02 16:57:40 xd kernel: Movable zone start for each node
> Aug 02 16:57:40 xd kernel: Early memory node ranges
> Aug 02 16:57:40 xd kernel: node 0: [mem 
> 0x0000000000001000-0x000000000009efff]
> Aug 02 16:57:40 xd kernel: node 0: [mem 
> 0x0000000000100000-0x0000000040198fff]
> Aug 02 16:57:40 xd kernel: node 0: [mem 
> 0x0000000040a99000-0x00000000428aefff]
> Aug 02 16:57:40 xd kernel: node 0: [mem 
> 0x0000000044fff000-0x0000000044ffffff]
> Aug 02 16:57:40 xd kernel: node 0: [mem 
> 0x0000000100000000-0x00000004b07fffff]
> Aug 02 16:57:40 xd kernel: Initmem setup node 0 [mem 
> 0x0000000000001000-0x00000004b07fffff]
> Aug 02 16:57:40 xd kernel: On node 0, zone DMA: 1 pages in unavailable 
> ranges
> Aug 02 16:57:40 xd kernel: On node 0, zone DMA: 97 pages in unavailable 
> ranges
> Aug 02 16:57:40 xd kernel: On node 0, zone DMA32: 2304 pages in 
> unavailable ranges
> Aug 02 16:57:40 xd kernel: On node 0, zone DMA32: 10064 pages in 
> unavailable ranges
> Aug 02 16:57:40 xd kernel: On node 0, zone Normal: 12288 pages in 
> unavailable ranges
> Aug 02 16:57:40 xd kernel: On node 0, zone Normal: 30720 pages in 
> unavailable ranges
> Aug 02 16:57:40 xd kernel: Reserving Intel graphics memory at [mem 
> 0x4b800000-0x4f7fffff]
> Aug 02 16:57:40 xd kernel: ACPI: PM-Timer IO Port: 0x1808
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: ACPI: LAPIC_NMI (acpi_id[0x10] high edge 
> lint[0x1])
> Aug 02 16:57:40 xd kernel: IOAPIC[0]: apic_id 2, version 32, address 
> 0xfec00000, GSI 0-119
> Aug 02 16:57:40 xd kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 
> 2 dfl dfl)
> Aug 02 16:57:40 xd kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 
> 9 high level)
> Aug 02 16:57:40 xd kernel: ACPI: Using ACPI (MADT) for SMP configuration 
> information
> Aug 02 16:57:40 xd kernel: ACPI: HPET id: 0x8086a201 base: 0xfed00000
> Aug 02 16:57:40 xd kernel: e820: update [mem 0x3c78f000-0x3c882fff] 
> usable ==> reserved
> Aug 02 16:57:40 xd kernel: TSC deadline timer available
> Aug 02 16:57:40 xd kernel: smpboot: Allowing 8 CPUs, 0 hotplug CPUs
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x00000000-0x00000fff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x0009f000-0x000fffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x3c70c000-0x3c70efff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x3c78e000-0x3c882fff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x40199000-0x40a98fff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x428af000-0x42c7efff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x42c7f000-0x446fefff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x446ff000-0x44f2efff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x44f2f000-0x44ffefff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x45000000-0x48ffffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x49000000-0x49dfffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x49e00000-0x4f7fffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0x4f800000-0xbfffffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0xc0000000-0xcfffffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0xd0000000-0xfe00ffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0xfe010000-0xfe010fff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0xfe011000-0xfed1ffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0xfed20000-0xfed7ffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0xfed80000-0xff4fffff]
> Aug 02 16:57:40 xd kernel: PM: hibernation: Registered nosave memory: 
> [mem 0xff500000-0xffffffff]
> Aug 02 16:57:40 xd kernel: [mem 0x4f800000-0xbfffffff] available for PCI 
> devices
> Aug 02 16:57:40 xd kernel: Booting paravirtualized kernel on bare 
> hardware
> Aug 02 16:57:40 xd kernel: clocksource: refined-jiffies: mask: 
> 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
> Aug 02 16:57:40 xd kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 
> nr_cpu_ids:8 nr_node_ids:1
> Aug 02 16:57:40 xd kernel: percpu: Embedded 61 pages/cpu s212992 r8192 
> d28672 u262144
> Aug 02 16:57:40 xd kernel: pcpu-alloc: s212992 r8192 d28672 u262144 
> alloc=1*2097152
> Aug 02 16:57:40 xd kernel: pcpu-alloc: [0] 0 1 2 3 4 5 6 7
> Aug 02 16:57:40 xd kernel: Fallback order for Node 0: 0
> Aug 02 16:57:40 xd kernel: Built 1 zonelists, mobility grouping on. 
> Total pages: 4074001
> Aug 02 16:57:40 xd kernel: Policy zone: Normal
> Aug 02 16:57:40 xd kernel: Kernel command line: 
> BOOT_IMAGE=/vmlinuz-5.18.0-2-amd64 root=UUID=0123abcd ro quiet 
> loglevel=3
> Aug 02 16:57:40 xd kernel: Unknown kernel command line parameters 
> "BOOT_IMAGE=/vmlinuz-5.18.0-2-amd64", will be passed to user space.
> Aug 02 16:57:40 xd kernel: Dentry cache hash table entries: 2097152 
> (order: 12, 16777216 bytes, linear)
> Aug 02 16:57:40 xd kernel: Inode-cache hash table entries: 1048576 
> (order: 11, 8388608 bytes, linear)
> Aug 02 16:57:40 xd kernel: mem auto-init: stack:off, heap alloc:on, heap 
> free:off
> Aug 02 16:57:40 xd kernel: Memory: 999928K/16555320K available (12294K 
> kernel code, 2773K rwdata, 8568K rodata, 2500K init, 5156K bss, 540176K 
> reserved, 0K cma-reserved)
> Aug 02 16:57:40 xd kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, 
> CPUs=8, Nodes=1
> Aug 02 16:57:40 xd kernel: ftrace: allocating 38641 entries in 151 pages
> Aug 02 16:57:40 xd kernel: ftrace: allocated 151 pages with 5 groups
> Aug 02 16:57:40 xd kernel: Dynamic Preempt: voluntary
> Aug 02 16:57:40 xd kernel: rcu: Preemptible hierarchical RCU 
> implementation.
> Aug 02 16:57:40 xd kernel: rcu: RCU restricting CPUs from NR_CPUS=8192 
> to nr_cpu_ids=8.
> Aug 02 16:57:40 xd kernel: Trampoline variant of Tasks RCU enabled.
> Aug 02 16:57:40 xd kernel: Rude variant of Tasks RCU enabled.
> Aug 02 16:57:40 xd kernel: Tracing variant of Tasks RCU enabled.
> Aug 02 16:57:40 xd kernel: rcu: RCU calculated value of 
> scheduler-enlistment delay is 25 jiffies.
> Aug 02 16:57:40 xd kernel: rcu: Adjusting geometry for 
> rcu_fanout_leaf=16, nr_cpu_ids=8
> Aug 02 16:57:40 xd kernel: NR_IRQS: 524544, nr_irqs: 2048, preallocated 
> irqs: 16
> Aug 02 16:57:40 xd kernel: random: crng init done
> Aug 02 16:57:40 xd kernel: Console: colour dummy device 80x25
> Aug 02 16:57:40 xd kernel: printk: console [tty0] enabled
> Aug 02 16:57:40 xd kernel: ACPI: Core revision 20211217
> Aug 02 16:57:40 xd kernel: hpet: HPET dysfunctional in PC10. Force 
> disabled.
> Aug 02 16:57:40 xd kernel: APIC: Switch to symmetric I/O mode setup
> Aug 02 16:57:40 xd kernel: x2apic: IRQ remapping doesn't support X2APIC 
> mode
> Aug 02 16:57:40 xd kernel: clocksource: tsc-early: mask: 
> 0xffffffffffffffff max_cycles: 0x22df1149949, max_idle_ns: 440795312789 
> ns
> Aug 02 16:57:40 xd kernel: Calibrating delay loop (skipped), value 
> calculated using timer frequency.. 4838.40 BogoMIPS (lpj=9676800)
> Aug 02 16:57:40 xd kernel: pid_max: default: 32768 minimum: 301
> Aug 02 16:57:40 xd kernel: LSM: Security Framework initializing
> Aug 02 16:57:40 xd kernel: Yama: disabled by default; enable with sysctl 
> kernel.yama.*
> Aug 02 16:57:40 xd kernel: AppArmor: AppArmor initialized
> Aug 02 16:57:40 xd kernel: TOMOYO Linux initialized
> Aug 02 16:57:40 xd kernel: Mount-cache hash table entries: 32768 (order: 
> 6, 262144 bytes, linear)
> Aug 02 16:57:40 xd kernel: Mountpoint-cache hash table entries: 32768 
> (order: 6, 262144 bytes, linear)
> Aug 02 16:57:40 xd kernel: CPU0: Thermal monitoring enabled (TM1)
> Aug 02 16:57:40 xd kernel: x86/cpu: User Mode Instruction Prevention 
> (UMIP) activated
> Aug 02 16:57:40 xd kernel: process: using mwait in idle threads
> Aug 02 16:57:40 xd kernel: Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> Aug 02 16:57:40 xd kernel: Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 
> 1GB 0
> Aug 02 16:57:40 xd kernel: Spectre V1 : Mitigation: usercopy/swapgs 
> barriers and __user pointer sanitization
> Aug 02 16:57:40 xd kernel: Spectre V2 : Mitigation: Enhanced IBRS
> Aug 02 16:57:40 xd kernel: Spectre V2 : Spectre v2 / SpectreRSB 
> mitigation: Filling RSB on context switch
> Aug 02 16:57:40 xd kernel: Spectre V2 : mitigation: Enabling conditional 
> Indirect Branch Prediction Barrier
> Aug 02 16:57:40 xd kernel: Speculative Store Bypass: Mitigation: 
> Speculative Store Bypass disabled via prctl
> Aug 02 16:57:40 xd kernel: Freeing SMP alternatives memory: 32K
> Aug 02 16:57:40 xd kernel: smpboot: Estimated ratio of average max 
> frequency by base frequency (times 1024): 1621
> Aug 02 16:57:40 xd kernel: smpboot: CPU0: 11th Gen Intel(R) Core(TM) 
> i5-1135G7 @ 2.40GHz (family: 0x6, model: 0x8c, stepping: 0x1)
> Aug 02 16:57:40 xd kernel: cblist_init_generic: Setting adjustable 
> number of callback queues.
> Aug 02 16:57:40 xd kernel: cblist_init_generic: Setting shift to 3 and 
> lim to 1.
> Aug 02 16:57:40 xd kernel: cblist_init_generic: Setting shift to 3 and 
> lim to 1.
> Aug 02 16:57:40 xd kernel: cblist_init_generic: Setting shift to 3 and 
> lim to 1.
> Aug 02 16:57:40 xd kernel: Performance Events: PEBS fmt4+-baseline, 
> AnyThread deprecated, Icelake events, 32-deep LBR, full-width counters, 
> Intel PMU driver.
> Aug 02 16:57:40 xd kernel: ... version: 5
> Aug 02 16:57:40 xd kernel: ... bit width: 48
> Aug 02 16:57:40 xd kernel: ... generic registers: 8
> Aug 02 16:57:40 xd kernel: ... value mask: 0000ffffffffffff
> Aug 02 16:57:40 xd kernel: ... max period: 00007fffffffffff
> Aug 02 16:57:40 xd kernel: ... fixed-purpose events: 4
> Aug 02 16:57:40 xd kernel: ... event mask: 0001000f000000ff
> Aug 02 16:57:40 xd kernel: rcu: Hierarchical SRCU implementation.
> Aug 02 16:57:40 xd kernel: NMI watchdog: Enabled. Permanently consumes 
> one hw-PMU counter.
> Aug 02 16:57:40 xd kernel: smp: Bringing up secondary CPUs ...
> Aug 02 16:57:40 xd kernel: x86: Booting SMP configuration:
> Aug 02 16:57:40 xd kernel: .... node #0, CPUs: #1 #2 #3 #4 #5 #6 #7
> Aug 02 16:57:40 xd kernel: smp: Brought up 1 node, 8 CPUs
> Aug 02 16:57:40 xd kernel: smpboot: Max logical packages: 1
> Aug 02 16:57:40 xd kernel: smpboot: Total of 8 processors activated 
> (38707.20 BogoMIPS)
> Aug 02 16:57:40 xd kernel: node 0 deferred pages initialised in 20ms
> Aug 02 16:57:40 xd kernel: devtmpfs: initialized
> Aug 02 16:57:40 xd kernel: x86/mm: Memory block size: 128MB
> Aug 02 16:57:40 xd kernel: ACPI: PM: Registering ACPI NVS region [mem 
> 0x446ff000-0x44f2efff] (8585216 bytes)
> Aug 02 16:57:40 xd kernel: clocksource: jiffies: mask: 0xffffffff 
> max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> Aug 02 16:57:40 xd kernel: futex hash table entries: 2048 (order: 5, 
> 131072 bytes, linear)
> Aug 02 16:57:40 xd kernel: pinctrl core: initialized pinctrl subsystem
> Aug 02 16:57:40 xd kernel: NET: Registered PF_NETLINK/PF_ROUTE protocol 
> family
> Aug 02 16:57:40 xd kernel: DMA: preallocated 2048 KiB GFP_KERNEL pool 
> for atomic allocations
> Aug 02 16:57:40 xd kernel: DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA 
> pool for atomic allocations
> Aug 02 16:57:40 xd kernel: DMA: preallocated 2048 KiB 
> GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> Aug 02 16:57:40 xd kernel: audit: initializing netlink subsys (disabled)
> Aug 02 16:57:40 xd kernel: audit: type=2000 audit(1659455859.032:1): 
> state=initialized audit_enabled=0 res=1
> Aug 02 16:57:40 xd kernel: thermal_sys: Registered thermal governor 
> 'fair_share'
> Aug 02 16:57:40 xd kernel: thermal_sys: Registered thermal governor 
> 'bang_bang'
> Aug 02 16:57:40 xd kernel: thermal_sys: Registered thermal governor 
> 'step_wise'
> Aug 02 16:57:40 xd kernel: thermal_sys: Registered thermal governor 
> 'user_space'
> Aug 02 16:57:40 xd kernel: thermal_sys: Registered thermal governor 
> 'power_allocator'
> Aug 02 16:57:40 xd kernel: cpuidle: using governor ladder
> Aug 02 16:57:40 xd kernel: cpuidle: using governor menu
> Aug 02 16:57:40 xd kernel: acpiphp: ACPI Hot Plug PCI Controller Driver 
> version: 0.5
> Aug 02 16:57:40 xd kernel: PCI: MMCONFIG for domain 0000 [bus 00-ff] at 
> [mem 0xc0000000-0xcfffffff] (base 0xc0000000)
> Aug 02 16:57:40 xd kernel: PCI: MMCONFIG at [mem 0xc0000000-0xcfffffff] 
> reserved in E820
> Aug 02 16:57:40 xd kernel: PCI: Using configuration type 1 for base 
> access
> Aug 02 16:57:40 xd kernel: ENERGY_PERF_BIAS: Set to 'normal', was 
> 'performance'
> Aug 02 16:57:40 xd kernel: kprobes: kprobe jump-optimization is enabled. 
> All kprobes are optimized if possible.
> Aug 02 16:57:40 xd kernel: HugeTLB registered 1.00 GiB page size, 
> pre-allocated 0 pages
> Aug 02 16:57:40 xd kernel: HugeTLB registered 2.00 MiB page size, 
> pre-allocated 0 pages
> Aug 02 16:57:40 xd kernel: ACPI: Added _OSI(Module Device)
> Aug 02 16:57:40 xd kernel: ACPI: Added _OSI(Processor Device)
> Aug 02 16:57:40 xd kernel: ACPI: Added _OSI(3.0 _SCP Extensions)
> Aug 02 16:57:40 xd kernel: ACPI: Added _OSI(Processor Aggregator Device)
> Aug 02 16:57:40 xd kernel: ACPI: Added _OSI(Linux-Dell-Video)
> Aug 02 16:57:40 xd kernel: ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> Aug 02 16:57:40 xd kernel: ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS01._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS01._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS02._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS02._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS03._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS03._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS04._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS04._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS05._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS05._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS06._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS06._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS07._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS07._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS08._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS08._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS09._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS09._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS10._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.HS10._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS01._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS01._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS02._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS02._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS03._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS03._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS04._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS04._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS05._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS05._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS06._UPC], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI BIOS Error (bug): Failure creating named 
> object [\_SB.PC00.XHCI.RHUB.SS06._PLD], AE_ALREADY_EXISTS 
> (20211217/dswload2-326)
> Aug 02 16:57:40 xd kernel: ACPI Error: AE_ALREADY_EXISTS, During name 
> lookup/catalog (20211217/psobject-220)
> Aug 02 16:57:40 xd kernel: ACPI: Skipping parse of AML opcode: 
> OpcodeName unavailable (0x0014)
> Aug 02 16:57:40 xd kernel: ACPI: 15 ACPI AML tables successfully 
> acquired and loaded
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B5080BCB600 0001C6 (v02 
> PmRef Cpu0Psd 00003000 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: \_SB_.PR00: _OSC native thermal LVT 
> Acked
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B5081016C00 000386 (v02 
> PmRef Cpu0Cst 00003001 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B508101C800 0005C3 (v02 
> PmRef Cpu0Ist 00003000 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B5081013400 00028B (v02 
> PmRef Cpu0Hwp 00003000 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B508100D000 0008E7 (v02 
> PmRef ApIst 00003000 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B508101B000 00048A (v02 
> PmRef ApHwp 00003000 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B508101A800 0004D4 (v02 
> PmRef ApPsd 00003000 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: Dynamic OEM Table Load:
> Aug 02 16:57:40 xd kernel: ACPI: SSDT 0xFFFF8B5081019800 00048A (v02 
> PmRef ApCst 00003000 INTL 20160422)
> Aug 02 16:57:40 xd kernel: ACPI: EC: EC started
> Aug 02 16:57:40 xd kernel: ACPI: EC: interrupt blocked
> Aug 02 16:57:40 xd kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> Aug 02 16:57:40 xd kernel: ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC used 
> to handle transactions
> Aug 02 16:57:40 xd kernel: ACPI: Interpreter enabled
> Aug 02 16:57:40 xd kernel: ACPI: PM: (supports S0 S3 S4 S5)
> Aug 02 16:57:40 xd kernel: ACPI: Using IOAPIC for interrupt routing
> Aug 02 16:57:40 xd kernel: PCI: Using host bridge windows from ACPI; if 
> necessary, use "pci=nocrs" and report a bug
> Aug 02 16:57:40 xd kernel: ACPI: Enabled 7 GPEs in block 00 to 7F
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [PCRP]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [V0PR]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [V1PR]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [V2PR]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [WRST]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [V0PR]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [V1PR]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [V2PR]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [V3PR]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [FN00]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [FN01]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [FN02]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [FN03]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [FN04]
> Aug 02 16:57:40 xd kernel: ACPI: PM: Power Resource [PIN]
> Aug 02 16:57:40 xd kernel: ACPI: PCI Root Bridge [PC00] (domain 0000 
> [bus 00-e0])
> Aug 02 16:57:40 xd kernel: acpi PNP0A08:00: _OSC: OS supports 
> [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
> Aug 02 16:57:40 xd kernel: acpi PNP0A08:00: _OSC: OS now controls 
> [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
> Aug 02 16:57:40 xd kernel: PCI host bridge to bus 0000:00
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: root bus resource [io 
> 0x0000-0x0cf7 window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: root bus resource [io 
> 0x0d00-0xffff window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: root bus resource [mem 
> 0x000a0000-0x000bffff window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: root bus resource [mem 
> 0x4f800000-0xbfffffff window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: root bus resource [mem 
> 0x4000000000-0x7fffffffff window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: root bus resource [bus 
> 00-e0]
> Aug 02 16:57:40 xd kernel: pci 0000:00:00.0: [8086:9a14] type 00 class 
> 0x060000
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: [8086:9a49] type 00 class 
> 0x030000
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: reg 0x10: [mem 
> 0x6014000000-0x6014ffffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: reg 0x18: [mem 
> 0x4000000000-0x400fffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: reg 0x20: [io 
> 0x5000-0x503f]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: BAR 2: assigned to efifb
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: DMAR: Skip IOMMU disabling 
> for graphics
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: Video device with shadowed 
> ROM at [mem 0x000c0000-0x000dffff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: reg 0x344: [mem 
> 0x00000000-0x00ffffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: VF(n) BAR0 space: [mem 
> 0x00000000-0x06ffffff 64bit] (contains BAR0 for 7 VFs)
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: reg 0x34c: [mem 
> 0x00000000-0x1fffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: VF(n) BAR2 space: [mem 
> 0x00000000-0xdfffffff 64bit pref] (contains BAR2 for 7 VFs)
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: [8086:9a09] type 01 class 
> 0x060400
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: PME# supported from D0 
> D3hot D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: PTM enabled (root), 4ns 
> granularity
> Aug 02 16:57:40 xd kernel: pci 0000:00:08.0: [8086:9a11] type 00 class 
> 0x088000
> Aug 02 16:57:40 xd kernel: pci 0000:00:08.0: reg 0x10: [mem 
> 0x601540f000-0x601540ffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:0e.0: [8086:9a0b] type 00 class 
> 0x010400
> Aug 02 16:57:40 xd kernel: pci 0000:00:0e.0: reg 0x10: [mem 
> 0x6012000000-0x6013ffffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:0e.0: reg 0x18: [mem 
> 0x50000000-0x51ffffff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:0e.0: reg 0x20: [mem 
> 0x6015300000-0x60153fffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:14.0: [8086:a0ed] type 00 class 
> 0x0c0330
> Aug 02 16:57:40 xd kernel: pci 0000:00:14.0: reg 0x10: [mem 
> 0x53180000-0x5318ffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:14.0: PME# supported from D3hot 
> D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:00:14.2: [8086:a0ef] type 00 class 
> 0x050000
> Aug 02 16:57:40 xd kernel: pci 0000:00:14.2: reg 0x10: [mem 
> 0x6015404000-0x6015407fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:14.2: reg 0x18: [mem 
> 0x601540e000-0x601540efff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:15.0: [8086:a0e8] type 00 class 
> 0x0c8000
> Aug 02 16:57:40 xd kernel: pci 0000:00:15.0: reg 0x10: [mem 
> 0x00000000-0x00000fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:15.3: [8086:a0eb] type 00 class 
> 0x0c8000
> Aug 02 16:57:40 xd kernel: pci 0000:00:15.3: reg 0x10: [mem 
> 0x00000000-0x00000fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:16.0: [8086:a0e0] type 00 class 
> 0x078000
> Aug 02 16:57:40 xd kernel: pci 0000:00:16.0: reg 0x10: [mem 
> 0x601540b000-0x601540bfff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:16.0: PME# supported from D3hot
> Aug 02 16:57:40 xd kernel: pci 0000:00:17.0: [8086:09ab] type 00 class 
> 0x088000
> Aug 02 16:57:40 xd kernel: pci 0000:00:19.0: [8086:a0c5] type 00 class 
> 0x0c8000
> Aug 02 16:57:40 xd kernel: pci 0000:00:19.0: reg 0x10: [mem 
> 0x00000000-0x00000fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:19.1: [8086:a0c6] type 00 class 
> 0x0c8000
> Aug 02 16:57:40 xd kernel: pci 0000:00:19.1: reg 0x10: [mem 
> 0x00000000-0x00000fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: [8086:a0b0] type 01 class 
> 0x060400
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: PME# supported from D0 
> D3hot D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: PTM enabled (root), 4ns 
> granularity
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.1: [8086:a0b1] type 01 class 
> 0x060400
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.1: PME# supported from D0 
> D3hot D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.1: PTM enabled (root), 4ns 
> granularity
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.0: [8086:a082] type 00 class 
> 0x060100
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.3: [8086:a0c8] type 00 class 
> 0x040100
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.3: reg 0x10: [mem 
> 0x6015400000-0x6015403fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.3: reg 0x20: [mem 
> 0x6015200000-0x60152fffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.3: PME# supported from D3hot 
> D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.4: [8086:a0a3] type 00 class 
> 0x0c0500
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.4: reg 0x10: [mem 
> 0x6015408000-0x60154080ff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.4: reg 0x20: [io 
> 0xefa0-0xefbf]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.5: [8086:a0a4] type 00 class 
> 0x0c8000
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.5: reg 0x10: [mem 
> 0xfe010000-0xfe010fff]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: [10de:1f97] type 00 class 
> 0x030200
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: reg 0x10: [mem 
> 0x52000000-0x52ffffff]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: reg 0x14: [mem 
> 0x6000000000-0x600fffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: reg 0x1c: [mem 
> 0x6010000000-0x6011ffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: reg 0x24: [io 
> 0x4000-0x407f]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: reg 0x30: [mem 
> 0xfff80000-0xffffffff pref]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: PME# supported from D0 
> D3hot D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: 63.012 Gb/s available PCIe 
> bandwidth, limited by 16.0 GT/s PCIe x4 link at 0000:00:06.0 (capable of 
> 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: PCI bridge to [bus 01]
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: bridge window [io 
> 0x4000-0x4fff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: bridge window [mem 
> 0x52000000-0x52ffffff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: bridge window [mem 
> 0x6000000000-0x6011ffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:02:00.0: [10ec:8168] type 00 class 
> 0x020000
> Aug 02 16:57:40 xd kernel: pci 0000:02:00.0: reg 0x10: [io 
> 0x3000-0x30ff]
> Aug 02 16:57:40 xd kernel: pci 0000:02:00.0: reg 0x18: [mem 
> 0x53004000-0x53004fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:02:00.0: reg 0x20: [mem 
> 0x53000000-0x53003fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:02:00.0: supports D1 D2
> Aug 02 16:57:40 xd kernel: pci 0000:02:00.0: PME# supported from D0 D1 
> D2 D3hot D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: PCI bridge to [bus 02]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: bridge window [io 
> 0x3000-0x3fff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: bridge window [mem 
> 0x53000000-0x530fffff]
> Aug 02 16:57:40 xd kernel: pci 0000:03:00.0: [14c3:7961] type 00 class 
> 0x028000
> Aug 02 16:57:40 xd kernel: pci 0000:03:00.0: reg 0x10: [mem 
> 0x6015000000-0x60150fffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:03:00.0: reg 0x18: [mem 
> 0x6015100000-0x6015103fff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:03:00.0: reg 0x20: [mem 
> 0x6015104000-0x6015104fff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:03:00.0: supports D1 D2
> Aug 02 16:57:40 xd kernel: pci 0000:03:00.0: PME# supported from D0 D1 
> D2 D3hot D3cold
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.1: PCI bridge to [bus 03]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.1: bridge window [mem 
> 0x6015000000-0x60151fffff 64bit pref]
> Aug 02 16:57:40 xd kernel: ACPI: EC: interrupt unblocked
> Aug 02 16:57:40 xd kernel: ACPI: EC: event unblocked
> Aug 02 16:57:40 xd kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> Aug 02 16:57:40 xd kernel: ACPI: EC: GPE=0x6e
> Aug 02 16:57:40 xd kernel: ACPI: \_SB_.PC00.LPCB.EC0_: Boot DSDT EC 
> initialization complete
> Aug 02 16:57:40 xd kernel: ACPI: \_SB_.PC00.LPCB.EC0_: EC: Used to 
> handle transactions and events
> Aug 02 16:57:40 xd kernel: iommu: Default domain type: Translated
> Aug 02 16:57:40 xd kernel: iommu: DMA domain TLB invalidation policy: 
> lazy mode
> Aug 02 16:57:40 xd kernel: EDAC MC: Ver: 3.0.0
> Aug 02 16:57:40 xd kernel: Registered efivars operations
> Aug 02 16:57:40 xd kernel: NetLabel: Initializing
> Aug 02 16:57:40 xd kernel: NetLabel: domain hash size = 128
> Aug 02 16:57:40 xd kernel: NetLabel: protocols = UNLABELED CIPSOv4 
> CALIPSO
> Aug 02 16:57:40 xd kernel: NetLabel: unlabeled traffic allowed by 
> default
> Aug 02 16:57:40 xd kernel: PCI: Using ACPI for IRQ routing
> Aug 02 16:57:40 xd kernel: PCI: pci_cache_line_size set to 64 bytes
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.5: can't claim BAR 0 [mem 
> 0xfe010000-0xfe010fff]: no compatible bridge window
> Aug 02 16:57:40 xd kernel: e820: reserve RAM buffer [mem 
> 0x0009f000-0x0009ffff]
> Aug 02 16:57:40 xd kernel: e820: reserve RAM buffer [mem 
> 0x3c70c000-0x3fffffff]
> Aug 02 16:57:40 xd kernel: e820: reserve RAM buffer [mem 
> 0x3c78e000-0x3fffffff]
> Aug 02 16:57:40 xd kernel: e820: reserve RAM buffer [mem 
> 0x40199000-0x43ffffff]
> Aug 02 16:57:40 xd kernel: e820: reserve RAM buffer [mem 
> 0x428af000-0x43ffffff]
> Aug 02 16:57:40 xd kernel: e820: reserve RAM buffer [mem 
> 0x45000000-0x47ffffff]
> Aug 02 16:57:40 xd kernel: e820: reserve RAM buffer [mem 
> 0x4b0800000-0x4b3ffffff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: vgaarb: setting as boot VGA 
> device
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: vgaarb: bridge control 
> possible
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: vgaarb: VGA device added: 
> decodes=io+mem,owns=io+mem,locks=none
> Aug 02 16:57:40 xd kernel: vgaarb: loaded
> Aug 02 16:57:40 xd kernel: clocksource: Switched to clocksource 
> tsc-early
> Aug 02 16:57:40 xd kernel: VFS: Disk quotas dquot_6.6.0
> Aug 02 16:57:40 xd kernel: VFS: Dquot-cache hash table entries: 512 
> (order 0, 4096 bytes)
> Aug 02 16:57:40 xd kernel: AppArmor: AppArmor Filesystem Enabled
> Aug 02 16:57:40 xd kernel: pnp: PnP ACPI init
> Aug 02 16:57:40 xd kernel: system 00:00: [io 0x0680-0x069f] has been 
> reserved
> Aug 02 16:57:40 xd kernel: system 00:00: [io 0x164e-0x164f] has been 
> reserved
> Aug 02 16:57:40 xd kernel: system 00:00: [io 0xfd60-0xfd63] has been 
> reserved
> Aug 02 16:57:40 xd kernel: system 00:02: [io 0x1854-0x1857] has been 
> reserved
> Aug 02 16:57:40 xd kernel: pnp 00:04: disabling [mem 
> 0xc0000000-0xcfffffff] because it overlaps 0000:00:02.0 BAR 9 [mem 
> 0x00000000-0xdfffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: system 00:04: [mem 0xfedc0000-0xfedc7fff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:04: [mem 0xfeda0000-0xfeda0fff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:04: [mem 0xfeda1000-0xfeda1fff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:04: [mem 0xfed20000-0xfed7ffff] 
> could not be reserved
> Aug 02 16:57:40 xd kernel: system 00:04: [mem 0xfed90000-0xfed93fff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:04: [mem 0xfed45000-0xfed8ffff] 
> could not be reserved
> Aug 02 16:57:40 xd kernel: system 00:04: [mem 0xfee00000-0xfeefffff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [io 0x1800-0x18fe] could not be 
> reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfe000000-0xfe01ffff] 
> could not be reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfe04c000-0xfe04ffff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfe050000-0xfe0affff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfe0d0000-0xfe0fffff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfe200000-0xfe7fffff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xff000000-0xffffffff] 
> could not be reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfd000000-0xfd68ffff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfd6b0000-0xfd6cffff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:05: [mem 0xfd6f0000-0xfdffffff] has 
> been reserved
> Aug 02 16:57:40 xd kernel: system 00:06: [io 0x2000-0x20fe] has been 
> reserved
> Aug 02 16:57:40 xd kernel: pnp: PnP ACPI: found 8 devices
> Aug 02 16:57:40 xd kernel: clocksource: acpi_pm: mask: 0xffffff 
> max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> Aug 02 16:57:40 xd kernel: NET: Registered PF_INET protocol family
> Aug 02 16:57:40 xd kernel: IP idents hash table entries: 262144 (order: 
> 9, 2097152 bytes, linear)
> Aug 02 16:57:40 xd kernel: tcp_listen_portaddr_hash hash table entries: 
> 8192 (order: 5, 131072 bytes, linear)
> Aug 02 16:57:40 xd kernel: Table-perturb hash table entries: 65536 
> (order: 6, 262144 bytes, linear)
> Aug 02 16:57:40 xd kernel: TCP established hash table entries: 131072 
> (order: 8, 1048576 bytes, linear)
> Aug 02 16:57:40 xd kernel: TCP bind hash table entries: 65536 (order: 8, 
> 1048576 bytes, linear)
> Aug 02 16:57:40 xd kernel: TCP: Hash tables configured (established 
> 131072 bind 65536)
> Aug 02 16:57:40 xd kernel: MPTCP token hash table entries: 16384 (order: 
> 6, 393216 bytes, linear)
> Aug 02 16:57:40 xd kernel: UDP hash table entries: 8192 (order: 6, 
> 262144 bytes, linear)
> Aug 02 16:57:40 xd kernel: UDP-Lite hash table entries: 8192 (order: 6, 
> 262144 bytes, linear)
> Aug 02 16:57:40 xd kernel: NET: Registered PF_UNIX/PF_LOCAL protocol 
> family
> Aug 02 16:57:40 xd kernel: NET: Registered PF_XDP protocol family
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: can't claim BAR 6 [mem 
> 0xfff80000-0xffffffff pref]: no compatible bridge window
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: max bus depth: 1 
> pci_try_num: 2
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: BAR 9: assigned [mem 
> 0x4020000000-0x40ffffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:00:02.0: BAR 7: assigned [mem 
> 0x4010000000-0x4016ffffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:15.0: BAR 0: assigned [mem 
> 0x4017000000-0x4017000fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:15.3: BAR 0: assigned [mem 
> 0x4017001000-0x4017001fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:19.0: BAR 0: assigned [mem 
> 0x4017002000-0x4017002fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:19.1: BAR 0: assigned [mem 
> 0x4017003000-0x4017003fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1f.5: BAR 0: assigned [mem 
> 0x4f800000-0x4f800fff]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: BAR 6: no space for [mem 
> size 0x00080000 pref]
> Aug 02 16:57:40 xd kernel: pci 0000:01:00.0: BAR 6: failed to assign 
> [mem size 0x00080000 pref]
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: PCI bridge to [bus 01]
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: bridge window [io 
> 0x4000-0x4fff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: bridge window [mem 
> 0x52000000-0x52ffffff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:06.0: bridge window [mem 
> 0x6000000000-0x6011ffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: PCI bridge to [bus 02]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: bridge window [io 
> 0x3000-0x3fff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.0: bridge window [mem 
> 0x53000000-0x530fffff]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.1: PCI bridge to [bus 03]
> Aug 02 16:57:40 xd kernel: pci 0000:00:1d.1: bridge window [mem 
> 0x6015000000-0x60151fffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: resource 4 [io 0x0000-0x0cf7 
> window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: resource 5 [io 0x0d00-0xffff 
> window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: resource 6 [mem 
> 0x000a0000-0x000bffff window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: resource 7 [mem 
> 0x4f800000-0xbfffffff window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:00: resource 8 [mem 
> 0x4000000000-0x7fffffffff window]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:01: resource 0 [io 
> 0x4000-0x4fff]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:01: resource 1 [mem 
> 0x52000000-0x52ffffff]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:01: resource 2 [mem 
> 0x6000000000-0x6011ffffff 64bit pref]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:02: resource 0 [io 
> 0x3000-0x3fff]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:02: resource 1 [mem 
> 0x53000000-0x530fffff]
> Aug 02 16:57:40 xd kernel: pci_bus 0000:03: resource 2 [mem 
> 0x6015000000-0x60151fffff 64bit pref]
> Aug 02 16:57:40 xd kernel: PCI: CLS 64 bytes, default 64
> Aug 02 16:57:40 xd kernel: PCI-DMA: Using software bounce buffering for 
> IO (SWIOTLB)
> Aug 02 16:57:40 xd kernel: software IO TLB: mapped [mem 
> 0x0000000037e6c000-0x000000003be6c000] (64MB)
> Aug 02 16:57:40 xd kernel: clocksource: tsc: mask: 0xffffffffffffffff 
> max_cycles: 0x22df1149949, max_idle_ns: 440795312789 ns
> Aug 02 16:57:40 xd kernel: clocksource: Switched to clocksource tsc
> Aug 02 16:57:40 xd kernel: Trying to unpack rootfs image as initramfs...
> Aug 02 16:57:40 xd kernel: Initialise system trusted keyrings
> Aug 02 16:57:40 xd kernel: Key type blacklist registered
> Aug 02 16:57:40 xd kernel: workingset: timestamp_bits=36 max_order=22 
> bucket_order=0
> Aug 02 16:57:40 xd kernel: zbud: loaded
> Aug 02 16:57:40 xd kernel: integrity: Platform Keyring initialized
> Aug 02 16:57:40 xd kernel: Key type asymmetric registered
> Aug 02 16:57:40 xd kernel: Asymmetric key parser 'x509' registered
> Aug 02 16:57:40 xd kernel: Freeing initrd memory: 65816K
> Aug 02 16:57:40 xd kernel: alg: self-tests for CTR-KDF (hmac(sha256)) 
> passed
> Aug 02 16:57:40 xd kernel: Block layer SCSI generic (bsg) driver version 
> 0.4 loaded (major 250)
> Aug 02 16:57:40 xd kernel: io scheduler mq-deadline registered
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:06.0: PME: Signaling with 
> IRQ 120
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:06.0: AER: enabled with IRQ 
> 120
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:06.0: DPC: enabled with IRQ 
> 120
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:06.0: DPC: error containment 
> capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, 
> DL_ActiveErr+
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.0: PME: Signaling with 
> IRQ 121
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.0: AER: enabled with IRQ 
> 121
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.0: DPC: enabled with IRQ 
> 121
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.0: DPC: error containment 
> capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, 
> DL_ActiveErr+
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.1: PME: Signaling with 
> IRQ 122
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.1: AER: enabled with IRQ 
> 122
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.1: DPC: enabled with IRQ 
> 122
> Aug 02 16:57:40 xd kernel: pcieport 0000:00:1d.1: DPC: error containment 
> capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, 
> DL_ActiveErr+
> Aug 02 16:57:40 xd kernel: shpchp: Standard Hot Plug PCI Controller 
> Driver version: 0.4
> Aug 02 16:57:40 xd kernel: Monitor-Mwait will be used to enter C-1 state
> Aug 02 16:57:40 xd kernel: Monitor-Mwait will be used to enter C-2 state
> Aug 02 16:57:40 xd kernel: Monitor-Mwait will be used to enter C-3 state
> Aug 02 16:57:40 xd kernel: ACPI: \_SB_.PR00: Found 3 idle states
> Aug 02 16:57:40 xd kernel: smpboot: Estimated ratio of average max 
> frequency by base frequency (times 1024): 1621
> Aug 02 16:57:40 xd kernel: thermal LNXTHERM:00: registered as 
> thermal_zone0
> Aug 02 16:57:40 xd kernel: ACPI: thermal: Thermal Zone [TZ00] (28 C)
> Aug 02 16:57:40 xd kernel: Serial: 8250/16550 driver, 4 ports, IRQ 
> sharing enabled
> Aug 02 16:57:40 xd kernel: hpet_acpi_add: no address or irqs in _CRS
> Aug 02 16:57:40 xd kernel: Linux agpgart interface v0.103
> Aug 02 16:57:40 xd kernel: AMD-Vi: AMD IOMMUv2 functionality not 
> available on this system - This is not a bug.
> Aug 02 16:57:40 xd kernel: i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 
> 0x60,0x64 irq 1
> Aug 02 16:57:40 xd kernel: i8042: PNP: PS/2 appears to have AUX port 
> disabled, if this is incorrect please boot with i8042.nopnp
> Aug 02 16:57:40 xd kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
> Aug 02 16:57:40 xd kernel: mousedev: PS/2 mouse device common for all 
> mice
> Aug 02 16:57:40 xd kernel: rtc_cmos 00:01: RTC can wake from S4
> Aug 02 16:57:40 xd kernel: rtc_cmos 00:01: registered as rtc0
> Aug 02 16:57:40 xd kernel: rtc_cmos 00:01: setting system clock to 
> 2022-08-02T15:57:39 UTC (1659455859)
> Aug 02 16:57:40 xd kernel: rtc_cmos 00:01: alarms up to one month, y3k, 
> 242 bytes nvram
> Aug 02 16:57:40 xd kernel: intel_pstate: Intel P-state driver 
> initializing
> Aug 02 16:57:40 xd kernel: intel_pstate: HWP enabled
> Aug 02 16:57:40 xd kernel: ledtrig-cpu: registered to indicate activity 
> on CPUs
> Aug 02 16:57:40 xd kernel: efifb: probing for efifb
> Aug 02 16:57:40 xd kernel: efifb: framebuffer at 0x4000000000, using 
> 8128k, total 8128k
> Aug 02 16:57:40 xd kernel: efifb: mode is 1920x1080x32, linelength=7680, 
> pages=1
> Aug 02 16:57:40 xd kernel: efifb: scrolling: redraw
> Aug 02 16:57:40 xd kernel: efifb: Truecolor: size=8:8:8:8, 
> shift=24:16:8:0
> Aug 02 16:57:40 xd kernel: Console: switching to colour frame buffer 
> device 240x67
> Aug 02 16:57:40 xd kernel: fb0: EFI VGA frame buffer device
> Aug 02 16:57:40 xd kernel: NET: Registered PF_INET6 protocol family
> Aug 02 16:57:40 xd kernel: input: AT Translated Set 2 keyboard as 
> /devices/platform/i8042/serio0/input/input0
> Aug 02 16:57:40 xd kernel: Segment Routing with IPv6
> Aug 02 16:57:40 xd kernel: In-situ OAM (IOAM) with IPv6
> Aug 02 16:57:40 xd kernel: mip6: Mobile IPv6
> Aug 02 16:57:40 xd kernel: NET: Registered PF_PACKET protocol family
> Aug 02 16:57:40 xd kernel: mpls_gso: MPLS GSO support
> Aug 02 16:57:40 xd kernel: microcode: sig=0x806c1, pf=0x80, 
> revision=0xa4
> Aug 02 16:57:40 xd kernel: microcode: Microcode Update Driver: v2.2.
> Aug 02 16:57:40 xd kernel: resctrl: L2 allocation detected
> Aug 02 16:57:40 xd kernel: IPI shorthand broadcast: enabled
> Aug 02 16:57:40 xd kernel: sched_clock: Marking stable (533987875, 
> 6323244)->(552960861, -12649742)
> Aug 02 16:57:40 xd kernel: registered taskstats version 1
> Aug 02 16:57:40 xd kernel: Loading compiled-in X.509 certificates
> Aug 02 16:57:40 xd kernel: Loaded X.509 cert 'Debian Secure Boot CA: 
> 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
> Aug 02 16:57:40 xd kernel: Loaded X.509 cert 'Debian Secure Boot Signer 
> 2021 - linux: 4b6ef5abca669825178e052c84667ccbc0531f8c'
> Aug 02 16:57:40 xd kernel: zswap: loaded using pool lzo/zbud
> Aug 02 16:57:40 xd kernel: Key type ._fscrypt registered
> Aug 02 16:57:40 xd kernel: Key type .fscrypt registered
> Aug 02 16:57:40 xd kernel: Key type fscrypt-provisioning registered
> Aug 02 16:57:40 xd kernel: Key type encrypted registered
> Aug 02 16:57:40 xd kernel: AppArmor: AppArmor sha1 policy hashing 
> enabled
> Aug 02 16:57:40 xd kernel: ima: Allocated hash algorithm: sha256
> Aug 02 16:57:40 xd kernel: ima: No architecture policies found
> Aug 02 16:57:40 xd kernel: evm: Initialising EVM extended attributes:
> Aug 02 16:57:40 xd kernel: evm: security.selinux
> Aug 02 16:57:40 xd kernel: evm: security.SMACK64 (disabled)
> Aug 02 16:57:40 xd kernel: evm: security.SMACK64EXEC (disabled)
> Aug 02 16:57:40 xd kernel: evm: security.SMACK64TRANSMUTE (disabled)
> Aug 02 16:57:40 xd kernel: evm: security.SMACK64MMAP (disabled)
> Aug 02 16:57:40 xd kernel: evm: security.apparmor
> Aug 02 16:57:40 xd kernel: evm: security.ima
> Aug 02 16:57:40 xd kernel: evm: security.capability
> Aug 02 16:57:40 xd kernel: evm: HMAC attrs: 0x1
> Aug 02 16:57:40 xd kernel: Freeing unused decrypted memory: 2036K
> Aug 02 16:57:40 xd kernel: Freeing unused kernel image (initmem) memory: 
> 2500K
> Aug 02 16:57:40 xd kernel: Write protecting the kernel read-only data: 
> 24576k
> Aug 02 16:57:40 xd kernel: Freeing unused kernel image (text/rodata gap) 
> memory: 2040K
> Aug 02 16:57:40 xd kernel: Freeing unused kernel image (rodata/data gap) 
> memory: 1672K
> Aug 02 16:57:40 xd kernel: x86/mm: Checked W+X mappings: passed, no W+X 
> pages found.
> Aug 02 16:57:40 xd kernel: Run /init as init process
> Aug 02 16:57:40 xd kernel: with arguments:
> Aug 02 16:57:40 xd kernel: /init
> Aug 02 16:57:40 xd kernel: with environment:
> Aug 02 16:57:40 xd kernel: HOME=/
> Aug 02 16:57:40 xd kernel: TERM=linux
> Aug 02 16:57:40 xd kernel: BOOT_IMAGE=/vmlinuz-5.18.0-2-amd64
> Aug 02 16:57:40 xd kernel: wmi_bus wmi_bus-PNP0C14:02: WQ data block 
> query control method not found
> Aug 02 16:57:40 xd kernel: wmi_bus wmi_bus-PNP0C14:02: WQ data block 
> query control method not found
> Aug 02 16:57:40 xd kernel: wmi_bus wmi_bus-PNP0C14:02: WQ data block 
> query control method not found
> Aug 02 16:57:40 xd kernel: wmi_bus wmi_bus-PNP0C14:02: WQ data block 
> query control method not found
> Aug 02 16:57:40 xd kernel: acpi PNP0C14:03: duplicate WMI GUID 
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
> Aug 02 16:57:40 xd kernel: acpi PNP0C14:04: duplicate WMI GUID 
> 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
> Aug 02 16:57:40 xd kernel: input: Lid Switch as 
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:21/PNP0C0D:00/input/input1
> Aug 02 16:57:40 xd kernel: ACPI: button: Lid Switch [LID0]
> Aug 02 16:57:40 xd kernel: input: Sleep Button as 
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input2
> Aug 02 16:57:40 xd kernel: ACPI: button: Sleep Button [SLPB]
> Aug 02 16:57:40 xd kernel: input: Power Button as 
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
> Aug 02 16:57:40 xd kernel: ACPI: button: Power Button [PWRB]
> Aug 02 16:57:40 xd kernel: ACPI: battery: Slot [BAT1] (battery present)
> Aug 02 16:57:40 xd kernel: vmd 0000:00:0e.0: PCI host bridge to bus 
> 10000:e0
> Aug 02 16:57:40 xd kernel: pci_bus 10000:e0: root bus resource [bus 
> e0-ff]
> Aug 02 16:57:40 xd kernel: pci_bus 10000:e0: root bus resource [mem 
> 0x50000000-0x51ffffff]
> Aug 02 16:57:40 xd kernel: pci_bus 10000:e0: root bus resource [mem 
> 0x6015302000-0x60153fffff 64bit]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: [8086:a0d3] type 00 class 
> 0x010601
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: reg 0x10: [mem 
> 0x00000000-0x00001fff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: reg 0x14: [mem 
> 0x00000000-0x000000ff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: reg 0x18: [io 
> 0x0000-0x0007]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: reg 0x1c: [io 
> 0x0000-0x0003]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: reg 0x20: [io 
> 0x0000-0x001f]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: reg 0x24: [mem 
> 0x50000000-0x500007ff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: PME# supported from D3hot
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.0: [8086:09ab] type 00 class 
> 0x088000
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: [8086:a0bc] type 01 class 
> 0x060400
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: PME# supported from D0 
> D3hot D3cold
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: PTM enabled (root), 4ns 
> granularity
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: Primary bus is hard wired 
> to 0
> Aug 02 16:57:40 xd kernel: pci 10000:e1:00.0: [2646:500c] type 00 class 
> 0x010802
> Aug 02 16:57:40 xd kernel: pci 10000:e1:00.0: reg 0x10: [mem 
> 0x50100000-0x50103fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: PCI bridge to [bus e1]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: bridge window [io 
> 0x0000-0x0fff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: bridge window [mem 
> 0x50100000-0x501fffff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: Primary bus is hard wired 
> to 0
> Aug 02 16:57:40 xd kernel: hid: raw HID events driver (C) Jiri Kosina
> Aug 02 16:57:40 xd kernel: r8168: loading out-of-tree module taints 
> kernel.
> Aug 02 16:57:40 xd kernel: r8168: module verification failed: signature 
> and/or required key missing - tainting kernel
> Aug 02 16:57:40 xd kernel: r8168 Gigabit Ethernet driver 8.050.03-NAPI 
> loaded
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: BAR 14: assigned [mem 
> 0x50000000-0x500fffff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 0: assigned [mem 
> 0x50100000-0x50101fff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: BAR 13: no space for [io 
> size 0x1000]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: BAR 13: failed to assign 
> [io size 0x1000]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 5: assigned [mem 
> 0x50102000-0x501027ff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 1: assigned [mem 
> 0x50102800-0x501028ff]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 4: no space for [io 
> size 0x0020]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 4: failed to assign 
> [io size 0x0020]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 2: no space for [io 
> size 0x0008]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 2: failed to assign 
> [io size 0x0008]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 3: no space for [io 
> size 0x0004]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:17.0: BAR 3: failed to assign 
> [io size 0x0004]
> Aug 02 16:57:40 xd kernel: pci 10000:e1:00.0: BAR 0: assigned [mem 
> 0x50000000-0x50003fff 64bit]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: PCI bridge to [bus e1]
> Aug 02 16:57:40 xd kernel: pci 10000:e0:1c.4: bridge window [mem 
> 0x50000000-0x500fffff]
> Aug 02 16:57:40 xd kernel: pcieport 10000:e0:1c.4: can't derive routing 
> for PCI INT A
> Aug 02 16:57:40 xd kernel: pcieport 10000:e0:1c.4: PCI INT A: no GSI
> Aug 02 16:57:40 xd kernel: pcieport 10000:e0:1c.4: PME: Signaling with 
> IRQ 143
> Aug 02 16:57:40 xd kernel: pcieport 10000:e0:1c.4: AER: enabled with IRQ 
> 143
> Aug 02 16:57:40 xd kernel: i801_smbus 0000:00:1f.4: SPD Write Disable is 
> set
> Aug 02 16:57:40 xd kernel: i801_smbus 0000:00:1f.4: SMBus using PCI 
> interrupt
> Aug 02 16:57:40 xd kernel: pcieport 10000:e0:1c.4: DPC: enabled with IRQ 
> 143
> Aug 02 16:57:40 xd kernel: pcieport 10000:e0:1c.4: DPC: error 
> containment capabilities: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP 
> PIO Log 4, DL_ActiveErr+
> Aug 02 16:57:40 xd kernel: vmd 0000:00:0e.0: Bound to PCI domain 10000
> Aug 02 16:57:40 xd kernel: i2c i2c-0: 2/2 memory slots populated (from 
> DMI)
> Aug 02 16:57:40 xd kernel: i2c i2c-0: Successfully instantiated SPD at 
> 0x50
> Aug 02 16:57:40 xd kernel: ACPI: bus type USB registered
> Aug 02 16:57:40 xd kernel: usbcore: registered new interface driver 
> usbfs
> Aug 02 16:57:40 xd kernel: usbcore: registered new interface driver hub
> Aug 02 16:57:40 xd kernel: usbcore: registered new device driver usb
> Aug 02 16:57:40 xd kernel: ACPI: bus type drm_connector registered
> Aug 02 16:57:40 xd kernel: r8168: This product is covered by one or more 
> of the following patents: US6,570,884, US6,115,776, and US6,327,625.
> Aug 02 16:57:40 xd kernel: r8168 Copyright (C) 2022 Realtek NIC software 
> team <nicfae@realtek.com>
> This program comes with ABSOLUTELY NO WARRANTY; for details, please see 
> <http://www.gnu.org/licenses/>.
> This is free software, and you are welcome to redistribute it under 
> certain conditions; see <http://www.gnu.org/licenses/>.
> Aug 02 16:57:40 xd kernel: intel-lpss 0000:00:15.0: enabling device 
> (0004 -> 0006)
> Aug 02 16:57:40 xd kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
> Aug 02 16:57:40 xd kernel: xhci_hcd 0000:00:14.0: new USB bus 
> registered, assigned bus number 1
> Aug 02 16:57:40 xd kernel: r8168 0000:02:00.0 enp2s0: renamed from eth0
> Aug 02 16:57:40 xd kernel: idma64 idma64.0: Found Intel integrated DMA 
> 64-bit
> Aug 02 16:57:40 xd kernel: xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 
> hci version 0x120 quirks 0x0000000000009810
> Aug 02 16:57:40 xd kernel: xhci_hcd 0000:00:14.0: xHCI Host Controller
> Aug 02 16:57:40 xd kernel: xhci_hcd 0000:00:14.0: new USB bus 
> registered, assigned bus number 2
> Aug 02 16:57:40 xd kernel: xhci_hcd 0000:00:14.0: Host supports USB 3.1 
> Enhanced SuperSpeed
> Aug 02 16:57:40 xd kernel: usb usb1: New USB device found, 
> idVendor=1d6b, idProduct=0002, bcdDevice= 5.18
> Aug 02 16:57:40 xd kernel: usb usb1: New USB device strings: Mfr=3, 
> Product=2, SerialNumber=1
> Aug 02 16:57:40 xd kernel: usb usb1: Product: xHCI Host Controller
> Aug 02 16:57:40 xd kernel: usb usb1: Manufacturer: Linux 5.18.0-2-amd64 
> xhci-hcd
> Aug 02 16:57:40 xd kernel: usb usb1: SerialNumber: 0000:00:14.0
> Aug 02 16:57:40 xd kernel: hub 1-0:1.0: USB hub found
> Aug 02 16:57:40 xd kernel: hub 1-0:1.0: 12 ports detected
> Aug 02 16:57:40 xd kernel: SCSI subsystem initialized
> Aug 02 16:57:40 xd kernel: usb usb2: New USB device found, 
> idVendor=1d6b, idProduct=0003, bcdDevice= 5.18
> Aug 02 16:57:40 xd kernel: usb usb2: New USB device strings: Mfr=3, 
> Product=2, SerialNumber=1
> Aug 02 16:57:40 xd kernel: usb usb2: Product: xHCI Host Controller
> Aug 02 16:57:40 xd kernel: usb usb2: Manufacturer: Linux 5.18.0-2-amd64 
> xhci-hcd
> Aug 02 16:57:40 xd kernel: usb usb2: SerialNumber: 0000:00:14.0
> Aug 02 16:57:40 xd kernel: hub 2-0:1.0: USB hub found
> Aug 02 16:57:40 xd kernel: hub 2-0:1.0: 4 ports detected
> Aug 02 16:57:40 xd kernel: nvme nvme0: pci function 10000:e1:00.0
> Aug 02 16:57:40 xd kernel: pcieport 10000:e0:1c.4: can't derive routing 
> for PCI INT A
> Aug 02 16:57:40 xd kernel: nvme 10000:e1:00.0: PCI INT A: no GSI
> Aug 02 16:57:40 xd kernel: nvme nvme0: missing or invalid SUBNQN field.
> Aug 02 16:57:40 xd kernel: nvme nvme0: Shutdown timeout set to 10 
> seconds
> Aug 02 16:57:40 xd kernel: libata version 3.00 loaded.
> Aug 02 16:57:40 xd kernel: nvme nvme0: 8/0/0 default/read/poll queues
> Aug 02 16:57:40 xd kernel: nvme0n1: p1 p2 p3 p4 p5
> Aug 02 16:57:40 xd kernel: ahci 10000:e0:17.0: version 3.0
> Aug 02 16:57:40 xd kernel: ahci 10000:e0:17.0: can't derive routing for 
> PCI INT A
> Aug 02 16:57:40 xd kernel: ahci 10000:e0:17.0: PCI INT A: no GSI
> Aug 02 16:57:40 xd kernel: ahci 10000:e0:17.0: AHCI 0001.0301 32 slots 2 
> ports 6 Gbps 0x3 impl SATA mode
> Aug 02 16:57:40 xd kernel: ahci 10000:e0:17.0: flags: 64bit ncq sntf pm 
> clo only pio slum part deso sadm sds
> Aug 02 16:57:40 xd kernel: scsi host0: ahci
> Aug 02 16:57:40 xd kernel: scsi host1: ahci
> Aug 02 16:57:40 xd kernel: ata1: SATA max UDMA/133 abar m2048@0x50102000 
> port 0x50102100 irq 154
> Aug 02 16:57:40 xd kernel: ata2: SATA max UDMA/133 abar m2048@0x50102000 
> port 0x50102180 irq 154
> Aug 02 16:57:40 xd kernel: intel-lpss 0000:00:15.3: enabling device 
> (0004 -> 0006)
> Aug 02 16:57:40 xd kernel: idma64 idma64.1: Found Intel integrated DMA 
> 64-bit
> Aug 02 16:57:40 xd kernel: intel-lpss 0000:00:19.0: enabling device 
> (0004 -> 0006)
> Aug 02 16:57:40 xd kernel: idma64 idma64.2: Found Intel integrated DMA 
> 64-bit
> Aug 02 16:57:40 xd kernel: intel-lpss 0000:00:19.1: enabling device 
> (0004 -> 0006)
> Aug 02 16:57:40 xd kernel: idma64 idma64.3: Found Intel integrated DMA 
> 64-bit
> Aug 02 16:57:40 xd kernel: usb 1-7: new full-speed USB device number 2 
> using xhci_hcd
> Aug 02 16:57:40 xd kernel: ata1: SATA link down (SStatus 0 SControl 300)
> Aug 02 16:57:40 xd kernel: ata2: SATA link down (SStatus 0 SControl 300)
> Aug 02 16:57:40 xd kernel: input: ELAN0515:01 04F3:3142 Mouse as 
> /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-2/i2c-ELAN0515:01/0018:04F3:3142.0001/input/input4
> Aug 02 16:57:40 xd kernel: input: ELAN0515:01 04F3:3142 Touchpad as 
> /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-2/i2c-ELAN0515:01/0018:04F3:3142.0001/input/input6
> Aug 02 16:57:40 xd kernel: hid-generic 0018:04F3:3142.0001: 
> input,hidraw0: I2C HID v1.00 Mouse [ELAN0515:01 04F3:3142] on 
> i2c-ELAN0515:01
> Aug 02 16:57:40 xd kernel: usb 1-7: New USB device found, idVendor=04f3, 
> idProduct=0c4f, bcdDevice= 1.61
> Aug 02 16:57:40 xd kernel: usb 1-7: New USB device strings: Mfr=1, 
> Product=2, SerialNumber=0
> Aug 02 16:57:40 xd kernel: usb 1-7: Product: ELAN:Fingerprint
> Aug 02 16:57:40 xd kernel: usb 1-7: Manufacturer: ELAN
> Aug 02 16:57:40 xd kernel: checking generic (4000000000 7f0000) vs hw 
> (6014000000 1000000)
> Aug 02 16:57:40 xd kernel: checking generic (4000000000 7f0000) vs hw 
> (4000000000 10000000)
> Aug 02 16:57:40 xd kernel: fb0: switching to i915 from EFI VGA
> Aug 02 16:57:40 xd kernel: Console: switching to colour dummy device 
> 80x25
> Aug 02 16:57:40 xd kernel: i915 0000:00:02.0: vgaarb: deactivate vga 
> console
> Aug 02 16:57:40 xd kernel: i915 0000:00:02.0: vgaarb: changed VGA 
> decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
> Aug 02 16:57:40 xd kernel: i915 0000:00:02.0: firmware: direct-loading 
> firmware i915/tgl_dmc_ver2_12.bin
> Aug 02 16:57:40 xd kernel: i915 0000:00:02.0: [drm] Finished loading DMC 
> firmware i915/tgl_dmc_ver2_12.bin (v2.12)
> Aug 02 16:57:40 xd kernel: [drm] Initialized i915 1.6.0 20201103 for 
> 0000:00:02.0 on minor 0
> Aug 02 16:57:40 xd kernel: ACPI: video: [Firmware Bug]: ACPI(PEGP) 
> defines _DOD but not _DOS
> Aug 02 16:57:40 xd kernel: ACPI: video: Video Device [PEGP] (multi-head: 
> yes rom: no post: no)
> Aug 02 16:57:40 xd kernel: input: Video Bus as 
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/input/input7
> Aug 02 16:57:40 xd kernel: ACPI: video: Video Device [GFX0] (multi-head: 
> yes rom: no post: no)
> Aug 02 16:57:40 xd kernel: input: Video Bus as 
> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input8
> Aug 02 16:57:40 xd kernel: fbcon: i915drmfb (fb0) is primary device
> Aug 02 16:57:40 xd kernel: Console: switching to colour frame buffer 
> device 240x67
> Aug 02 16:57:40 xd kernel: i915 0000:00:02.0: [drm] fb0: i915drmfb frame 
> buffer device
> Aug 02 16:57:40 xd kernel: usb 1-8: new high-speed USB device number 3 
> using xhci_hcd
> Aug 02 16:57:40 xd kernel: PM: Image not found (code -22)
> Aug 02 16:57:40 xd kernel: usb 1-8: New USB device found, idVendor=0408, 
> idProduct=a061, bcdDevice= 0.04
> Aug 02 16:57:40 xd kernel: usb 1-8: New USB device strings: Mfr=1, 
> Product=2, SerialNumber=0
> Aug 02 16:57:40 xd kernel: usb 1-8: Product: HD User Facing
> Aug 02 16:57:40 xd kernel: usb 1-8: Manufacturer: SunplusIT Inc
> Aug 02 16:57:40 xd kernel: EXT4-fs (nvme0n1p3): mounting ext3 file 
> system using the ext4 subsystem
> Aug 02 16:57:40 xd kernel: EXT4-fs (nvme0n1p3): mounted filesystem with 
> ordered data mode. Quota mode: none.
> Aug 02 16:57:40 xd kernel: Not activating Mandatory Access Control as 
> /sbin/tomoyo-init does not exist.
> Aug 02 16:57:40 xd kernel: usb 1-10: new high-speed USB device number 4 
> using xhci_hcd
> Aug 02 16:57:40 xd systemd[1]: Inserted module 'autofs4'
> Aug 02 16:57:40 xd kernel: usb 1-10: New USB device found, 
> idVendor=04ca, idProduct=3802, bcdDevice= 1.00
> Aug 02 16:57:40 xd kernel: usb 1-10: New USB device strings: Mfr=5, 
> Product=6, SerialNumber=7
> Aug 02 16:57:40 xd kernel: usb 1-10: Product: Wireless_Device
> Aug 02 16:57:40 xd kernel: usb 1-10: Manufacturer: MediaTek Inc.
> Aug 02 16:57:40 xd kernel: usb 1-10: SerialNumber: 000000000
> Aug 02 16:57:40 xd systemd[1]: systemd 251.2-7 running in system mode 
> (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS 
> +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD 
> +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +TPM2 
> +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT 
> default-hierarchy=unified)
> Aug 02 16:57:40 xd systemd[1]: Detected architecture x86-64.
> Aug 02 16:57:40 xd systemd[1]: Hostname set to <xd>.
> Aug 02 16:57:40 xd systemd[1]: Queued start job for default target 
> Graphical Interface.
> Aug 02 16:57:40 xd systemd[1]: Created slice Slice /system/getty.
> Aug 02 16:57:40 xd systemd[1]: Created slice Slice /system/modprobe.
> Aug 02 16:57:40 xd systemd[1]: Created slice Slice /system/systemd-fsck.
> Aug 02 16:57:40 xd systemd[1]: Created slice User and Session Slice.
> Aug 02 16:57:40 xd systemd[1]: Started Forward Password Requests to Wall 
> Directory Watch.
> Aug 02 16:57:40 xd systemd[1]: Set up automount Arbitrary Executable 
> File Formats File System Automount Point.
> Aug 02 16:57:40 xd systemd[1]: Reached target Local Integrity Protected 
> Volumes.
> Aug 02 16:57:40 xd systemd[1]: Reached target User and Group Name 
> Lookups.
> Aug 02 16:57:40 xd systemd[1]: Reached target Remote File Systems.
> Aug 02 16:57:40 xd systemd[1]: Reached target Slice Units.
> Aug 02 16:57:40 xd systemd[1]: Reached target Local Verity Protected 
> Volumes.
> Aug 02 16:57:40 xd systemd[1]: Listening on Device-mapper event daemon 
> FIFOs.
> Aug 02 16:57:40 xd systemd[1]: Listening on LVM2 poll daemon socket.
> Aug 02 16:57:40 xd systemd[1]: Listening on Syslog Socket.
> Aug 02 16:57:40 xd systemd[1]: Listening on fsck to fsckd communication 
> Socket.
> Aug 02 16:57:40 xd systemd[1]: Listening on initctl Compatibility Named 
> Pipe.
> Aug 02 16:57:40 xd systemd[1]: Listening on Journal Audit Socket.
> Aug 02 16:57:40 xd systemd[1]: Listening on Journal Socket (/dev/log).
> Aug 02 16:57:40 xd systemd[1]: Listening on Journal Socket.
> Aug 02 16:57:40 xd systemd[1]: Listening on udev Control Socket.
> Aug 02 16:57:40 xd systemd[1]: Listening on udev Kernel Socket.
> Aug 02 16:57:40 xd systemd[1]: Mounting Huge Pages File System...
> Aug 02 16:57:40 xd systemd[1]: Mounting POSIX Message Queue File 
> System...
> Aug 02 16:57:40 xd systemd[1]: Mounting Kernel Debug File System...
> Aug 02 16:57:40 xd systemd[1]: Mounting Kernel Trace File System...
> Aug 02 16:57:40 xd systemd[1]: Finished Availability of block devices.
> Aug 02 16:57:40 xd systemd[1]: Starting Set the console keyboard 
> layout...
> Aug 02 16:57:40 xd systemd[1]: Starting Create List of Static Device 
> Nodes...
> Aug 02 16:57:40 xd systemd[1]: Starting Monitoring of LVM2 mirrors, 
> snapshots etc. using dmeventd or progress polling...
> Aug 02 16:57:40 xd systemd[1]: Starting Load Kernel Module configfs...
> Aug 02 16:57:40 xd systemd[1]: Starting Load Kernel Module drm...
> Aug 02 16:57:40 xd systemd[1]: Starting Load Kernel Module fuse...
> Aug 02 16:57:40 xd systemd[1]: File System Check on Root Device was 
> skipped because of a failed condition check 
> (ConditionPathExists=!/run/initramfs/fsck-root).
> Aug 02 16:57:40 xd systemd[1]: Starting Journal Service...
> Aug 02 16:57:40 xd systemd[1]: Starting Load Kernel Modules...
> Aug 02 16:57:40 xd systemd[1]: Starting Remount Root and Kernel File 
> Systems...
> Aug 02 16:57:40 xd systemd[1]: Repartition Root Disk was skipped because 
> all trigger condition checks failed.
> Aug 02 16:57:40 xd systemd[1]: Starting Coldplug All udev Devices...
> Aug 02 16:57:40 xd systemd[1]: Finished Create List of Static Device 
> Nodes.
> Aug 02 16:57:40 xd systemd[1]: modprobe@drm.service: Deactivated 
> successfully.
> Aug 02 16:57:40 xd systemd[1]: Finished Load Kernel Module drm.
> Aug 02 16:57:40 xd systemd[1]: Mounted Huge Pages File System.
> Aug 02 16:57:40 xd systemd[1]: Mounted POSIX Message Queue File System.
> Aug 02 16:57:40 xd systemd[1]: Mounted Kernel Debug File System.
> Aug 02 16:57:40 xd systemd[1]: Mounted Kernel Trace File System.
> Aug 02 16:57:40 xd systemd[1]: modprobe@configfs.service: Deactivated 
> successfully.
> Aug 02 16:57:40 xd systemd[1]: Finished Load Kernel Module configfs.
> Aug 02 16:57:40 xd systemd[1]: Mounting Kernel Configuration File 
> System...
> Aug 02 16:57:40 xd kernel: EXT4-fs (nvme0n1p3): re-mounted. Quota mode: 
> none.
> Aug 02 16:57:40 xd kernel: fuse: init (API version 7.36)
> Aug 02 16:57:40 xd systemd[1]: Finished Remount Root and Kernel File 
> Systems.
> Aug 02 16:57:40 xd systemd[1]: Mounted Kernel Configuration File System.
> Aug 02 16:57:40 xd systemd[1]: modprobe@fuse.service: Deactivated 
> successfully.
> Aug 02 16:57:40 xd systemd[1]: Finished Load Kernel Module fuse.
> Aug 02 16:57:40 xd systemd[1]: Mounting FUSE Control File System...
> Aug 02 16:57:40 xd systemd[1]: Platform Persistent Storage Archival was 
> skipped because of a failed condition check 
> (ConditionDirectoryNotEmpty=/sys/fs/pstore).
> Aug 02 16:57:40 xd systemd[1]: Starting Load/Save Random Seed...
> Aug 02 16:57:40 xd systemd[1]: Starting Create System Users...
> Aug 02 16:57:40 xd systemd[1]: Mounted FUSE Control File System.
> Aug 02 16:57:40 xd kernel: lp: driver loaded but no devices found
> Aug 02 16:57:40 xd kernel: ppdev: user-space parallel port driver
> Aug 02 16:57:40 xd systemd[1]: Finished Load/Save Random Seed.
> Aug 02 16:57:40 xd systemd[1]: First Boot Complete was skipped because 
> of a failed condition check (ConditionFirstBoot=yes).
> Aug 02 16:57:40 xd systemd[1]: Started Journal Service.
> Aug 02 16:57:41 xd systemd-journald[304]: Received client request to 
> flush runtime journal.
> Aug 02 16:57:41 xd kernel: nvidia: module license 'NVIDIA' taints 
> kernel.
> Aug 02 16:57:41 xd kernel: Disabling lock debugging due to kernel taint
> Aug 02 16:57:41 xd kernel: nvidia-nvlink: Nvlink Core is being 
> initialized, major device number 242
> Aug 02 16:57:41 xd kernel:
> Aug 02 16:57:41 xd kernel: nvidia 0000:01:00.0: enabling device (0006 -> 
> 0007)
> Aug 02 16:57:41 xd kernel: input: Acer Wireless Radio Control as 
> /devices/LNXSYSTM:00/10251229:00/input/input9
> Aug 02 16:57:41 xd kernel: NVRM: loading NVIDIA UNIX x86_64 Kernel 
> Module 470.129.06 Thu May 12 22:52:02 UTC 2022
> Aug 02 16:57:41 xd kernel: intel_pmc_core INT33A1:00: initialized
> Aug 02 16:57:41 xd kernel: input: Intel HID events as 
> /devices/platform/INTC1051:00/input/input10
> Aug 02 16:57:41 xd kernel: intel-hid INTC1051:00: platform supports 5 
> button array
> Aug 02 16:57:41 xd kernel: input: Intel HID 5 button array as 
> /devices/platform/INTC1051:00/input/input11
> Aug 02 16:57:41 xd kernel: ACPI: AC: AC Adapter [ACAD] (on-line)
> Aug 02 16:57:41 xd kernel: nvidia-modeset: Loading NVIDIA Kernel Mode 
> Setting Driver for UNIX platforms 470.129.06 Thu May 12 22:42:45 UTC 
> 2022
> Aug 02 16:57:41 xd kernel: Adding 31182844k swap on /dev/nvme0n1p4. 
> Priority:-2 extents:1 across:31182844k SSFS
> Aug 02 16:57:41 xd kernel: mc: Linux media interface: v0.10
> Aug 02 16:57:41 xd kernel: [drm] [nvidia-drm] [GPU ID 0x00000100] 
> Loading driver
> Aug 02 16:57:41 xd kernel: [drm] Initialized nvidia-drm 0.0.0 20160202 
> for 0000:01:00.0 on minor 1
> Aug 02 16:57:41 xd kernel: mei_me 0000:00:16.0: enabling device (0000 -> 
> 0002)
> Aug 02 16:57:41 xd kernel: videodev: Linux video capture interface: 
> v2.00
> Aug 02 16:57:41 xd kernel: usb 1-8: Found UVC 1.00 device HD User Facing 
> (0408:a061)
> Aug 02 16:57:41 xd kernel: input: HD User Facing: HD User Facing as 
> /devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/input/input12
> Aug 02 16:57:41 xd kernel: usbcore: registered new interface driver 
> uvcvideo
> Aug 02 16:57:41 xd kernel: ee1004 0-0050: 512 byte EE1004-compliant SPD 
> EEPROM, read-only
> Aug 02 16:57:41 xd kernel: iTCO_vendor_support: vendor-support=0
> Aug 02 16:57:41 xd kernel: iTCO_wdt iTCO_wdt: Found a Intel PCH TCO 
> device (Version=6, TCOBASE=0x0400)
> Aug 02 16:57:41 xd kernel: iTCO_wdt iTCO_wdt: initialized. heartbeat=30 
> sec (nowayout=0)
> Aug 02 16:57:41 xd kernel: acer_wmi: Acer Laptop ACPI-WMI Extras
> Aug 02 16:57:41 xd kernel: acer_wmi: Function bitmap for Communication 
> Button: 0x801
> Aug 02 16:57:41 xd kernel: input: Acer WMI hotkeys as 
> /devices/virtual/input/input13
> Aug 02 16:57:41 xd kernel: alg: No test for fips(ansi_cprng) 
> (fips_ansi_cprng)
> Aug 02 16:57:41 xd kernel: input: ELAN0515:01 04F3:3142 Mouse as 
> /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-2/i2c-ELAN0515:01/0018:04F3:3142.0001/input/input14
> Aug 02 16:57:41 xd kernel: input: ELAN0515:01 04F3:3142 Touchpad as 
> /devices/pci0000:00/0000:00:15.3/i2c_designware.1/i2c-2/i2c-ELAN0515:01/0018:04F3:3142.0001/input/input16
> Aug 02 16:57:41 xd kernel: hid-multitouch 0018:04F3:3142.0001: 
> input,hidraw0: I2C HID v1.00 Mouse [ELAN0515:01 04F3:3142] on 
> i2c-ELAN0515:01
> Aug 02 16:57:41 xd kernel: input: PC Speaker as 
> /devices/platform/pcspkr/input/input17
> Aug 02 16:57:41 xd kernel: resource sanity check: requesting [mem 
> 0xfedc0000-0xfedcdfff], which spans more than pnp 00:04 [mem 
> 0xfedc0000-0xfedc7fff]
> Aug 02 16:57:41 xd kernel: caller __uncore_imc_init_box+0xc1/0x100 
> [intel_uncore] mapping multiple BARs
> Aug 02 16:57:41 xd kernel: pstore: Using crash dump compression: deflate
> Aug 02 16:57:41 xd kernel: pstore: Registered efi as persistent store 
> backend
> Aug 02 16:57:41 xd kernel: cfg80211: Loading compiled-in X.509 
> certificates for regulatory database
> Aug 02 16:57:41 xd kernel: cfg80211: Loaded X.509 cert 'benh@debian.org: 
> 577e021cb980e0e820821ba7b54b4961b8b4fadf'
> Aug 02 16:57:41 xd kernel: cfg80211: Loaded X.509 cert 
> 'romain.perier@gmail.com: 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
> Aug 02 16:57:41 xd kernel: cfg80211: Loaded X.509 cert 'sforshee: 
> 00b28ddf47aef9cea7'
> Aug 02 16:57:41 xd kernel: platform regulatory.0: firmware: 
> direct-loading firmware regulatory.db
> Aug 02 16:57:41 xd kernel: platform regulatory.0: firmware: 
> direct-loading firmware regulatory.db.p7s
> Aug 02 16:57:41 xd kernel: snd_hda_intel 0000:00:1f.3: DSP detected with 
> PCI class/subclass/prog-if info 0x040100
> Aug 02 16:57:41 xd kernel: snd_hda_intel 0000:00:1f.3: Digital mics 
> found on Skylake+ platform, using SOF driver
> Aug 02 16:57:41 xd kernel: cryptd: max_cpu_qlen set to 1000
> Aug 02 16:57:41 xd kernel: AVX2 version of gcm_enc/dec engaged.
> Aug 02 16:57:41 xd kernel: AES CTR mode by8 optimization enabled
> Aug 02 16:57:41 xd kernel: Bluetooth: Core ver 2.22
> Aug 02 16:57:41 xd kernel: NET: Registered PF_BLUETOOTH protocol family
> Aug 02 16:57:41 xd kernel: Bluetooth: HCI device and connection manager 
> initialized
> Aug 02 16:57:41 xd kernel: Bluetooth: HCI socket layer initialized
> Aug 02 16:57:41 xd kernel: Bluetooth: L2CAP socket layer initialized
> Aug 02 16:57:41 xd kernel: Bluetooth: SCO socket layer initialized
> Aug 02 16:57:41 xd kernel: mt7921e 0000:03:00.0: enabling device (0000 
> -> 0002)
> Aug 02 16:57:41 xd kernel: usbcore: registered new interface driver 
> btusb
> Aug 02 16:57:41 xd kernel: bluetooth hci0: firmware: direct-loading 
> firmware mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> Aug 02 16:57:41 xd kernel: mt7921e 0000:03:00.0: ASIC revision: 79610010
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: DSP 
> detected with PCI class/subclass/prog-if info 0x040100
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: Digital 
> mics found on Skylake+ platform, using SOF driver
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: 
> enabling device (0000 -> 0002)
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: DSP 
> detected with PCI class/subclass/prog-if 0x040100
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: bound 
> 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
> Aug 02 16:57:41 xd kernel: mt7921e 0000:03:00.0: firmware: 
> direct-loading firmware mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
> Aug 02 16:57:41 xd kernel: mt7921e 0000:03:00.0: HW/SW Version: 
> 0x8a108a10, Build Time: 20210612122717a
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: use msi 
> interrupt mode
> Aug 02 16:57:41 xd kernel: mt7921e 0000:03:00.0: firmware: 
> direct-loading firmware mediatek/WIFI_RAM_CODE_MT7961_1.bin
> Aug 02 16:57:41 xd kernel: mt7921e 0000:03:00.0: WM Firmware Version: 
> ____010000, Build Time: 20210612122753
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: hda 
> codecs found, mask 5
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: using 
> HDA machine driver skl_hda_dsp_generic now
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: DMICs 
> detected in NHLT tables: 2
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: 
> firmware: failed to load intel/sof/sof-tgl.ri (-2)
> Aug 02 16:57:41 xd kernel: firmware_class: See 
> https://wiki.debian.org/Firmware for information about missing firmware
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: Direct 
> firmware load for intel/sof/sof-tgl.ri failed with error -2
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: error: 
> sof firmware file is missing, you might need to
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: 
> download it from https://github.com/thesofproject/sof-bin/
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: error: 
> failed to load DSP firmware -2
> Aug 02 16:57:41 xd kernel: sof-audio-pci-intel-tgl 0000:00:1f.3: error: 
> sof_probe_work failed err: -2
> Aug 02 16:57:41 xd kernel: mei_hdcp 
> 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 
> (ops i915_hdcp_component_ops [i915])
> Aug 02 16:57:41 xd kernel: EXT4-fs (nvme0n1p2): mounting ext2 file 
> system using the ext4 subsystem
> Aug 02 16:57:41 xd kernel: EXT4-fs (nvme0n1p2): mounted filesystem 
> without journal. Quota mode: none.
> Aug 02 16:57:41 xd kernel: ext2 filesystem being mounted at /boot 
> supports timestamps until 2038 (0x7fffffff)
> Aug 02 16:57:41 xd kernel: intel_rapl_msr: PL4 support detected.
> Aug 02 16:57:41 xd kernel: intel_rapl_common: Found RAPL domain package
> Aug 02 16:57:41 xd kernel: intel_rapl_common: Found RAPL domain core
> Aug 02 16:57:41 xd kernel: intel_rapl_common: Found RAPL domain uncore
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.940:2): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="libreoffice-senddoc" pid=615 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.940:3): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="libreoffice-xpdfimport" pid=617 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.940:4): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="libreoffice-oosplash" pid=614 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.944:5): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="nvidia_modprobe" pid=611 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.944:6): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="nvidia_modprobe//kmod" pid=611 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.944:7): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="/usr/bin/man" pid=613 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.944:8): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="man_filter" pid=613 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.944:9): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="man_groff" pid=613 comm="apparmor_parser"
> Aug 02 16:57:41 xd kernel: audit: type=1400 audit(1659455861.944:10): 
> apparmor="STATUS" operation="profile_load" profile="unconfined" 
> name="lsb_release" pid=610 comm="apparmor_parser"
> Aug 02 16:57:42 xd kernel: ACPI Warning: \_SB.PC00.PEG0.PEGP._DSM: 
> Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] 
> (20211217/nsarguments-61)
> Aug 02 16:57:42 xd kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> Aug 02 16:57:42 xd kernel: Bluetooth: BNEP filters: protocol multicast
> Aug 02 16:57:42 xd kernel: Bluetooth: BNEP socket layer initialized
> Aug 02 16:57:42 xd kernel: enp2s0: 0xffff9d4c400f9000, 
> 08:8f:c3:4f:86:c5, IRQ 142
> Aug 02 16:57:42 xd kernel: NET: Registered PF_QIPCRTR protocol family
> Aug 02 16:57:42 xd kernel: mt7921e 0000:03:00.0 wlp3s0: renamed from 
> wlan0
> Aug 02 16:57:44 xd kernel: Bluetooth: hci0: Device setup in 2593900 
> usecs
> Aug 02 16:57:44 xd kernel: NET: Registered PF_ALG protocol family
> Aug 02 16:57:44 xd kernel: Bluetooth: RFCOMM TTY layer initialized
> Aug 02 16:57:44 xd kernel: Bluetooth: RFCOMM socket layer initialized
> Aug 02 16:57:44 xd kernel: Bluetooth: RFCOMM ver 1.11
> Aug 02 16:57:44 xd kernel: rfkill: input handler disabled
> Aug 02 16:57:49 xd kernel: kauditd_printk_skb: 12 callbacks suppressed
> Aug 02 16:57:49 xd kernel: audit: type=1400 audit(1659455869.340:23): 
> apparmor="DENIED" operation="capable" profile="/usr/sbin/cups-browsed" 
> pid=1199 comm="cups-browsed" capability=23 capname="sys_nice"
> Aug 02 16:58:02 xd kernel: rfkill: input handler enabled
> Aug 02 16:58:04 xd kernel: rfkill: input handler disabled
> 
> On 2022-08-02 16:53, Jan Beulich wrote:
> 
>> On 02.08.2022 17:40, Bruno wrote:
>>
>>> I'm talking about booting on the host Xen ("Linux with Xen") - goes to 
>>> an initramfs prompt.
>>>
>>> I don't know how to get to this hypervisor log. Maybe not the case as 
>>> I am attempting the boot on the host linux with Xen. There is no 
>>> /var/log - only cache and lock
>>
>> Generally the hypervisor log is obtained via "xl dmesg" (likely not an
>> option for you when you end up on an initramfs prompt) or a serial
>> cable. How do you obtain the kernel log (there was one posted on
>> xen-users)?
>>
>>> I can list the hard drive partitions under /dev (nvme0n1p1-5), but I 
>>> cannot mount them. I cannot access a thumb drive either /dev/block, 
>>> when mounted has two strange symlinks to ../sda1 (8:0 and 1:8). This 
>>> is a bit frustrating because it does not allow me to export dmesg or 
>>> other info.
>>>
>>> Im not receiving the error messages on screen before initramfs, they 
>>> are hidden, but I do get this message:
>>>
>>> Gave up waiting for suspend/resume device
>>> Gave up waiting for root file system device.  Common problems:
>>> Boot args (cat /proc/cmdline) - Check rootdelay= (did the system wait 
>>> long enough?)
>>> Missing modules (cat /proc/modules; ls /dev)
>>> ALERT! UUID=0123abc does not exist. Dropping to a shell!
>>>
>>> On the dmesg, I got the ACPI errors:
>>>
>>> ACPI BIOS Error
>>> (bug): Failure creating named ob
>>> I_SB.PCOO.XHCI.RHUB.HS05._UPC], AE ALREADY _EXISTS 
>>> (Z0211217/dsuloadZ-326)
>>> ACPI Error: AE_ALREADY EXISTS, During name
>>> slookun/catalog
>>> -9451181 ACPI: Skipping parse of AML opcode: OpcodeNane unavailable
>>> (20211217/psobject-z20)
>>> (0x0014)
>>>
>>> Repeated several times
>>>
>>> ACPI: Skipping parse of AML opcode: DpcodeNane unavailable (0x0014)
>>
>> Right - I've seen those. These were why I did ask for a pair of kernel 
>> logs
>> (with and without Xen), to put them side by side and see which of the 
>> errors
>> are common (and hence likely of no interest to resolve your issue).
>>
>>> Latter on the dmesg I got repeated errors like this:
>>>
>>> RIP: 0033:0x7 969a2e2äc9
>>> RSP: 002b:00007ffaff421a28 FLAGS: 00000246 RIG RAX: 0000000000000139
>>> RAX: Efffffffffffffda RBX: 00005582Bb061d10 RCX: 00007 969aZeZäc9
>>> 244.4412241 RDX:000000000RSI: 000071969a49bfOd RDI: 00000000000000
>>> RB: 0000000000020000 ROB: 0000000000000000 R09: 000055828b04c290
>>> R10: 000000000000000c R11: 0000000000000246 R12: 00007f969a49bf(R)d
>>> R13: 000000GBOOOOOOOO R14: 000055B28b060aZO R15: 00005582Bb06110
>>>
>>> (/TASK>
>>> INFO: task systemd-udevd: 190 blocked for more than 120 seconds.
>>
>> Besides some of the characters looking scrambled, I can spot nothing 
>> like
>> this in
>> https://lists.xenproject.org/archives/html/xen-users/2022-07/msg00057.html
>>
>> Anyway, my request stands: Please post the three named logs here.
>>
>> Jan


