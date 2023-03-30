Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C36D0AB0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 18:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516791.801478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuom-0000DF-Rr; Thu, 30 Mar 2023 16:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516791.801478; Thu, 30 Mar 2023 16:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuom-0000Au-Oh; Thu, 30 Mar 2023 16:08:04 +0000
Received: by outflank-mailman (input) for mailman id 516791;
 Thu, 30 Mar 2023 16:08:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phuol-0000Ao-6l
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 16:08:03 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b0126b9-cf15-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 18:08:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8447.eurprd04.prod.outlook.com (2603:10a6:10:2be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 16:07:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 16:07:58 +0000
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
X-Inumbo-ID: 0b0126b9-cf15-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bzi7QfqwjbvfZiMLqUgKy1wh4XRUq9e9D0s0cqDoCWSYPzOU065oepttEgtqsm4DWAWfKjbEepI1k8BKSBDqQLzwFahGPLwlhcxW5S4ulkBien1Q2jx3aqz5sPyEXgnnGgPm3awR2iX1nlrYDVl1Q5sKxz40aaC9JlqcWRpWg17UolMs46j+fuo8G4NtAKbfL+nvCPrRNvSxyQWP+zhGJLSCWSuXscsXhExSOvRHGJIySfCJtD8l6SY/Y7XAcf/36SA9hGaP3YjvAJcaS48zm4Z7yIQ2i/yWkNyCfp97rgRmbzj0dJpkHTrH6kuNgor43BkJg+jhG3Qtikz55fBX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHPfIzER4JtM89tv8E0PaasF82WxqEoWR8fdYkGYY3w=;
 b=KGkeR3CjGZ39+DbT4GCR0es8sOiV2l+Oq3DWyYSXDUpZHSDca9i580HJjUD1eq5NlaQU+LRBVZyxTekSjQ1VHFQ/cPncrFiV781T3l3YlS6+qP/NMlm8nIxmOcYWAJvVVTAxSj0GXGobpdLqlghVD7Aiactz77ZpagUpltgWE3Gyp1UlWVDH4KuNXrF9HLLqJVL8IDEqXJSZ+Cvh3Iqyf/8smn2IbqIr06qJZ2WI9/Z02gFwqIo0Iv30OF2cVLH2eV//el/rkmt8U9Ff4Wzlld7JspV8RX/eNAUg7OR5pAL463pr9cgRYKJ4eNqS8isR3EdQH1MTRl5paW8Ujf7jow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHPfIzER4JtM89tv8E0PaasF82WxqEoWR8fdYkGYY3w=;
 b=VzpsJWZF23fnYEXi28+iqpzoTt02ZY9NQae++NDRXzZArJ8osx2IK7ox2ZqkhrNCu1ROVbVEQFRDxDSA58QAifw7OIsvFgnIh+ZCpUMoME2P1RTxZZjVAMrQRO1l+qGpTdbVvsAv21PrM1/zYUKNbKN2wZc+lK2ZxF7In0wZctDsoC5o6wIC2nDtipt34/ULw//KhyTsvsvbJpkDWMhtEBtLMSPJYlRAmjBEAyfASV+UOqdeHKHUa7vmRQdZpoQiBuwghraHxZDjOeV7iE6d/zFyG9p/40g03dpEhFSELvNMoVxPyRBzRSsjnqP/nlh2UsWy6H3TrFSVQF+CLGisAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50fe2ff9-9633-1cbb-4afb-b577778d3edd@suse.com>
Date: Thu, 30 Mar 2023 18:07:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] efi: only set a console mode if the current one is
 invalid
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-3-roger.pau@citrix.com>
 <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
 <ZCWuYjP7L4obvXt9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCWuYjP7L4obvXt9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 5722d9e2-aad5-42b3-5c7a-08db3138ede2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jdoznDq4SDIRca2db7dXdqB6enh2gvZQ8ZxhycmgwpEX2W1Hj2DiqA6UZT0rOkvRy4k1c7imqlMBLjOS+0euYlVwaTlQyaenGvQdPbXoJ3qKyVc4Frx5c3Bqt5uqnC0j0WzsO8waLSi1icO/8KOno70V549t+GmLecduqlzw0IBXYDTogxbAclzBQWUrpkUYvi90GiH9qe06S7ZwTmFS+iPCDGugM/nX9ksQD7dzVCFZp7EPoLOIaUWiUpvRGpCluRFeBTgK/3nUrWR1Op+RibFUjsAcQ/l8c3sXUszbgRvMO0uyaqZLVEM4NKaX6F21ysCctnR2uk7Q3KINsjSkEBCMWn2l/JZOplpgX2A8rEwSrwrfGupHxn6/GtGmcJ/J5eP/0ae6cT7IKG3khWywFBbJSzp1Vj7PolGNmMQaV4ITNgJ7Isp4dH+DaQ+4dfpBGhf17EUM4Y+x9wfhSMFICwFAKSdq4LTrGay/qvKgavTTQXvew5MbkPUwSCTRKDxzQGYlnOZuyK+dbvjJGoO8vxt+CsaNxsHoqMHVqLcud8avFV/z8okrBkrYxCTZaCV6cJFHjnFQeBDX1lfuYP5mC4D+OAfr1U+T3tcDVWbHFvV0ddjNsvou2s7DL71BplKsBG70ZPrWUbbGxB0ZxKa9IQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(36756003)(31696002)(86362001)(2906002)(31686004)(6486002)(2616005)(186003)(8676002)(6512007)(26005)(53546011)(6506007)(478600001)(4326008)(66476007)(66946007)(66556008)(8936002)(6916009)(41300700001)(38100700002)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDU0TkRVNTVQeTdxMk9TTk9kMmZscktJeXNNc1FuNXVxRGtBam9IY1RxOGdL?=
 =?utf-8?B?WUtmTGVEZnhiOGs3c3Yvd3lnU2ozaTEyV0dMN1d2d25oTS9JVjhwMFVNSWxW?=
 =?utf-8?B?VW80VGE2RmFSQkhnWTlWUkIzZlRweEFLM2ROaVBhbnVhTEtiVm13aW1OU1VI?=
 =?utf-8?B?dHB1NTh3ODRTMlpBTjRKS0ZzM3BwbGtMMzZFQ2Y5WmRQR3RoNlRNb2F1SExq?=
 =?utf-8?B?NGwwbElkUDhFdkRZdzZNdnFvR2FpY2JUTlpZYmtiVlF3NFZYZWd5WkF5d1l5?=
 =?utf-8?B?MzFhb0UwcWQyd3ozL0c5UWI3MW5tQVhSVExibFgvNzU2aTg1WjFjUDg2ZlVN?=
 =?utf-8?B?QVNmS2o5L1gxTmVtMzYrQmtvdE5ZOGV5MkFTWkJoRUQrWTEwajhMRkZoZHpr?=
 =?utf-8?B?Szh4YmRqM1BXbW5wVnEyS0lUajAycU44dTJMUjk2cXd4bWdSRWFtN0FneC9F?=
 =?utf-8?B?VVF2Wm5Vd2prZ25nbVAxOWE5SVUvSktaRnNQaEFaN01TR2lPVlQ2ZjVWcElQ?=
 =?utf-8?B?QkpzY2g3all1OG0wSzBtb1JqZlhicjN6a2IvbDg0RTV2clFWRjhLamU2Y2Jq?=
 =?utf-8?B?aXhqbXhZZGE3eHNuVnk4QjFYSi9FZkFpM01oM1pWaDlnWFlkSFJZQVBSQmVr?=
 =?utf-8?B?algwclo4UnpwT29mcStJbUk5MTRLT0NWY29XeUgrOFFPb2gvb0Uwa1dWRSs1?=
 =?utf-8?B?VW4xNlp1Vk9jZ1RIL0MrSDh3T0d5U2QraE9TeE1obzVOVDAvZG1sdE9FZVdx?=
 =?utf-8?B?ZWd0T1htM1J6U3FFc29yY1FocG1mVW1iOWRkUzNWaWhMTGt4YTJEN2wvTWRT?=
 =?utf-8?B?Mnp3NEpDWTJKcUNDRXV1NjcyMjhkM0lOeWVpcjIxS05uWVlLRFVMWDR1citS?=
 =?utf-8?B?RUZoVWtoODNMNUYzRWc1RUVCRHVNTktQWDlOa1BjOVZ6Tk44VlQ0OWZpdFVR?=
 =?utf-8?B?SGpvQjZDWFhVc3JWd1A3NStwRXB4ZVZqWEtudVZvaS9RNU50STVoaWlDZVZF?=
 =?utf-8?B?UWRPQlhEcmYrVUdweDVnOW13aExYaWE0SVNQQUlGZ0QvT0Y5bW9GUFBTbjNR?=
 =?utf-8?B?d0svbCtBNEdDL0h2QS8yRTFxdzk2cVRPWE5JdXZ3ZlpwMXdRS3NhZE1oWHhZ?=
 =?utf-8?B?VzdSSno0aUp6ZFJMbXFIU3h0VEFCZ0ZURHk3Z2ZpSVRMMm4xSDk0RTk2TDVQ?=
 =?utf-8?B?aUFtQUE2WnJLTGFtemdLRlA3NzBKaXFzOTJBckNBTjlybG53Z1BZN2pFMFU4?=
 =?utf-8?B?eHE0UUtldU4yU0ljbnN4TU5Pb2JWcDN1MmI5aXhoMUdGaDMwSm03YnFjaXha?=
 =?utf-8?B?MzZTRndOVTVLbHZiVnVDcG0rVzRqV1FZMjZKK3Y1cUROc3lSWHp0eTh3RTg1?=
 =?utf-8?B?eS9VU2preU51ekhLTFJ1TGZwMWxLYW4xQkU0QXBicVphSEZRc05tVWJobHRN?=
 =?utf-8?B?aytoeUFZODZqaVNSTk51UjFqOTh3V1JWZy9sN0lYQ1BFL0dBTFArMTllMXdu?=
 =?utf-8?B?Tm80eTMrbGNjRXVwaWwrUHh1em5ra0t3MlV5eDlLejVFNzNBTUl5SDhCR1o4?=
 =?utf-8?B?YWdaOWNoelFUOHJJMTZ4TjdQc2hlcE5xNUVHeER1SVRBd3Nia0Vnb3Vzallt?=
 =?utf-8?B?WEJDZnNraCs3bDZuSVB6ZnNBdVVSQ0QwUGJxZTQ1RWN2TFNpOFJYbm92M3d5?=
 =?utf-8?B?NUtWbTdRd0hpdzkwVHNja1FONDFIbWp2a1BWNW9oak5CdzIycS95bHI5QTZI?=
 =?utf-8?B?akwwU3ZsZ243blhiVlpzVnNod09Ic1lzR3R0eTIvdmhaSWtQWXZSRnpNem1W?=
 =?utf-8?B?QXlYMFBiNjNseHg4cVZVS0NoMXU5cnhpY0JlUmxmb2hPOXU5U0hrdjlFcm9h?=
 =?utf-8?B?WWJPUlU2MHpzTlZRYUplTWRVeW5XdUc1a2VhNG9SbkJJQzZ0UmgyeUVoRDJL?=
 =?utf-8?B?bUxzTFNNbEh5RHFhRGxPMUM4RmJMTlNZQ1dYdCs5Sk9BNkhQdStwQUV5WmZ4?=
 =?utf-8?B?STZYUHdTZG9EQVpMaVM2aG1ORmpUMHFYUXkzMmk0b0twV3FQREdGRXQyVlhC?=
 =?utf-8?B?UzdKODcyTjdESm5OWXJDTGY2QUtiQlFNZTVaY3AvMUNrckZ2SmZnZ2dYS1pP?=
 =?utf-8?Q?sw2R4eh8yOIfjnbaFCZ+FPada?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5722d9e2-aad5-42b3-5c7a-08db3138ede2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 16:07:58.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f725gCr3rUTxoD2dxNgrnGndjuT+pBUQAwa/N96Fj+UoYXBQMg5pEwzhaORy6uEw4Aml2MAMbo17Z6Cs71aqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8447

On 30.03.2023 17:44, Roger Pau Monné wrote:
> On Mon, Dec 05, 2022 at 03:19:13PM +0100, Jan Beulich wrote:
>> On 23.11.2022 16:45, Roger Pau Monne wrote:
>>> Do not unconditionally set a mode in efi_console_set_mode(), do so
>>> only if the currently set mode is not valid.
>>
>> You don't say why you want to do so. Furthermore ...
>>
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -799,6 +799,11 @@ static void __init efi_console_set_mode(void)
>>>      UINTN cols, rows, size;
>>>      unsigned int best, i;
>>>  
>>> +    /* Only set a mode if the current one is not valid. */
>>> +    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode, &cols, &rows) ==
>>> +         EFI_SUCCESS )
>>> +        return;
>>
>> ... it might be okay if you put such a check in efi_multiboot2(), but
>> the call here from efi_start() is specifically guarded by a check of
>> whether "-basevideo" was passed to xen.efi. This _may_ not be as
>> relevant anymore today, but it certainly was 20 years ago (recall
>> that we've inherited this code from a much older project of ours) -
>> at that time EFI usually started in 80x25 text mode. And I think that
>> even today when you end up launching xen.efi from the EFI shell,
>> you'd be stuck with 80x25 text mode on at least some implementations.
> 
> Won't you use console=vga vga=gfx-...
> 
> To switch to a best mode?

I don't think "vga=gfx-..." is presently consumed in any way xen.efi.
Doing so would require a similar hack of peeking at the (ordinary)
command line options as in legacy booting, except that in xen.efi we
read that command line from a file, which iirc is done only after
fiddling with the video mode.

>> Overall, looking at (for now) just the titles of subsequent patches,
>> I'm not convinced the change here is needed at all. Or if anything it
>> may want to go at the end, taking action only when "vga=current" was
>> specified.
> 
> I guess I'm slightly confused by the usage of both GOP and StdOut, I
> would assume if we have a gop, and can correctly initialize it there's
> no need to fiddle with StdOut also?

Setting the GOP mode is done last before exiting boot services; this
may be a graphics mode which doesn't support a text output protocol.

Jan

