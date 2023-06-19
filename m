Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948A735BED
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 18:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551207.860613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHPM-0002ST-4a; Mon, 19 Jun 2023 16:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551207.860613; Mon, 19 Jun 2023 16:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBHPM-0002Pj-16; Mon, 19 Jun 2023 16:07:12 +0000
Received: by outflank-mailman (input) for mailman id 551207;
 Mon, 19 Jun 2023 16:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBHPK-0002Pd-59
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 16:07:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b86fa6-0ebb-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 18:07:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6803.eurprd04.prod.outlook.com (2603:10a6:208:187::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 16:07:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 16:07:03 +0000
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
X-Inumbo-ID: 56b86fa6-0ebb-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSqHAnAiqmyBGaDL59G8j706RtwAXDuO2Z/gTCMbj/SYAc2xmV5qrEY+6ZIEoMXcLmI+focs87v4okJZkLHuC9Z25s+re6bYqhfftE/S3UaJ9RdrvA2JIchDfsqBw2t5maVde/wmdeZGk3rSVDoaj1Ioxwdncrb87XElsLwQUy5mmkc6kqFJ14hOreTBteXhPlJzVxakcajtsPZdx9lF/Lc2RXbsebnmJ830sqc1Su7FOSV2mfjD703w1tRy46NmcDUb10vptNjplw+5L+LoBk8h8Qrsk5fJRIZktqlEWHOGodNI977Za6m0emKLWRHOdYruJ/0UrbEDTbRynOwVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWVPNI276AW5Y9CQnJpNvGGChiPC94mJ6wDIhckKrV0=;
 b=dIf20e3k+vTCcFKJbtDz94y5UkAs2fqgXmA6eHm4iuG6xR0oWSMgk22WEu1gsmwhWw2Qu91p55wKXgcoVL1Tv385f49H7U6vvTpJsJuQZENxvalDIZxPZzg+vU3V7jdwwdDdpTLiBmTvrxaxCaCB8aA+4sl8YTDtdCGzcxLiPuq/Z+8QGh115qhQRE7s2SydG45u5cMzSa7m2mJM/88KFByKzSFYaUDp2CsqeDA5+XIuh19xj2WaL/gdOYWrK6/+ReOP2vXJZKC3iWIgw7dBN+pgxhMq8EJAEKSVPYYgGQ2XV93L4UFsG2IWKHnDAbNPwJCZHJ1wkGIyo+tvrPxn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWVPNI276AW5Y9CQnJpNvGGChiPC94mJ6wDIhckKrV0=;
 b=5tVx7OtKyvGCZOB007b6jFLJJtTREHlIHBAaMM7kH6O+eRYUmTC9F6vZiyabOdq+mrzmYU3DG7bN/caomuAcTJedzd43dWrGZF4sNOVJO7U4R/wJ+6NAsEvJIhV0Z65iRJqWHvNUu945d0NaIyX8UtCR9701iuzVlkb0v2JjA0+8zX6zFZxZKDYzfu9ngaADYu43IKb0HDZ4+zJX1XnD8xWQYYkQuEgtq9e7Ffn3MOUFEbQcnWSVaMJASAE8bsEYPsq9dKDbGaKhzp1B+rT5rhg/0s9tEsLOLsc5B4fyma6UsM0wQVRx5NwcVqEry/8TdYyUokpkvNzM0WkPyMVzIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07901266-4536-bcd5-70a4-5b5675a1ced4@suse.com>
Date: Mon, 19 Jun 2023 18:07:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
 <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: b8491c64-00c2-4d6f-ee45-08db70df38ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l1VLBP9hGp2kGYgdRzzZZHBce4crYvT+IPlMO+7qRAB9wYtzxtiq0AnmB0HavmRis3HZt3cHoO+LL2EKj1kRHfi2f3kp53zG0K6rd/F1jJKOfPyx50/xkxBvCr3y9hSRh4/r1YiBhYlJ+M4m1lkVQu8/tud4WZ0x7aqpC/diaLQ02dgEq8+p2l9uIxfUAL21WfhpL9SH4jWWuowgrd28DEtYPqRymy7nNOUwjgHI0a1jBZWr3Z+SyorzbQKthpSGtEypCGUlwVj3cnYwzlVj5clujYut5XRTvTHMDz5pXKTh535vc618novf3w2h4250Jv24oNp8y7E4dMtITHfs9Dr7ZulAnC5ID+7LeXOmd4SUifTHtAZn2+zmA4XOL5WVIM/cwY5HlAuGiLJZX82aAOH6t5R3ae8nxkJGe0rkUk1O9NDTQECfeJSfKL69EzdP8u07fRplfJ5moLBoTWoTn0NCSvvv1jeH8Eh/WIpI/XbkJGvAgJj0Eid1fU9taOizLde20t69oFjiKXc5xLCa6+NI2m9ag4FBmMeAJTir4mxYHpfKpalsIG0SFmvosuD5hF+kpsMgKtK2cCylQAPJ/hr0atbRIY/a9mxWof6qtxvWjPsVj3JB0828dW/H16Bi9EKbZUN5KM8UctKvQjizAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(66899021)(478600001)(2906002)(6486002)(54906003)(38100700002)(316002)(31696002)(83380400001)(31686004)(5660300002)(41300700001)(66946007)(66476007)(66556008)(6916009)(53546011)(6512007)(36756003)(26005)(86362001)(2616005)(8676002)(8936002)(186003)(6506007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGVjR1JwbFFWai8rcldLblZEcFdWNjJNNStUWTVrTmNDekdUdTVLS2FjVytC?=
 =?utf-8?B?dC9JY2xXZ3prSUNXMjhQUEVPdFFTeWZGazA2QmhIOUFvN3BoUXljVHlGaGV5?=
 =?utf-8?B?TjZzOEo0M2dPRWJyTjZkYlUxUWtLUUxyaXFrT1lEamdZM08zNG9hdGFFUFIz?=
 =?utf-8?B?VVIrSVZ0NVl2blNBUDZsRkxScll5Y2xLdEthdGhGK0F6SVlTYzAxSjFtR20z?=
 =?utf-8?B?Z0RqL3VmUlhwYkZxbk9UU0o1NEp5QUZtRDV5T09TNW9EYW1iQVBITE1zQ1Q0?=
 =?utf-8?B?WngyRTlWbFB5NlRFQTRHeHZUL2JLeGFJL0huc3JqMlh6ZjV2clBxVVpxS1VH?=
 =?utf-8?B?OXNvL21idVlyeHVYTG9DR0hmWGF0bnJYOEQwYnh4Q2ExeW9WWVZpd3FuTSt1?=
 =?utf-8?B?L1NCSmRiZU05cXVhaXN0emtDeTQ2RlpPVkJWNlZMMlBCc0hWL1lML0w3KzE4?=
 =?utf-8?B?QjRCRGtGTWtyTnFLTU1jSFV3VnFEYmZTc0F1ZjB1Wld3UzhsUmcydE1WTzFV?=
 =?utf-8?B?TTVvWlVvcDkrREsva1dtUmZOU1h6OVNyU2o4S2NQWGJDSmw5bUtNNkUyeFB3?=
 =?utf-8?B?d3VLN2RBRlBBa1NGakZIVGtsSUlZNFViTGlPcFIzN0ZscDhXUXkzMjJVYkVI?=
 =?utf-8?B?VzJCNE1EK1U0blNtYVpWUEdXSldPNWVERGxYdnVPUEVhY3V1RlFYWUZhTzgy?=
 =?utf-8?B?blMwclRqQmFkNWt6MHU4WFhERXVDejlPQ0oybUNpeitwODNVQUxvN1VhMU1p?=
 =?utf-8?B?UHptYWVnOTNNQ1dxNVZ0VnhXN2FmWWxEaCsyUnFsOEVVdSt3dmtRUlp3WTQw?=
 =?utf-8?B?RlVPMnBmeUtHVVR1alArcFhGSFd3SEo4Um5kMXNSUTlaNVBoY3FYTGZ2YWMz?=
 =?utf-8?B?QkpoMWhUVGJiNDhTR2I2VXFxYlNUdVcreFU2WUc2aGN1N3ZnWnp1Vlh6alFH?=
 =?utf-8?B?Q2NRTXBkcFU3YUVWNm5kNHRjb2c0SDJ5dXN2aFlyMzJ2dkxhMktNVlU3ei9r?=
 =?utf-8?B?a0dhSVBYZmZkcmFXeTg4VE1xQXV0ZG01S3hWT1RWelJoYWYvWnArZWQ2MHQ5?=
 =?utf-8?B?TkhZK0FxR28wTThuUm5vMmZucFhiWkZPcFVrcXR0ZjFWcWdTVnhVeEx4MW9z?=
 =?utf-8?B?dkdxUFI0R3BZQU1IWVdqcEcyb0d0azl4dWtjQ3dBeW5XQlhhbmVTSlpTWDU2?=
 =?utf-8?B?ZkR0ckh4Y1VkcGUyVDRSVENINU03T09yODU4YlA5U3FWOGJZUzBjQnppT01z?=
 =?utf-8?B?Nm9lTEFkeEFNdk5VNEJ0OVMxNy9BK3FQSnFnNHVHY1Ivc3Z3V043RURwUE11?=
 =?utf-8?B?T2pibmVOK0E5cTZUOUY2em5KNGpwbGppaytRTE4rSWhHakZSMXo5NUkwUkF1?=
 =?utf-8?B?Qm93L0NqSXhzcDVjcjZab1piSWNmRjJhQlU2MC9Ubi9jUDNFdk4rTGNSUk95?=
 =?utf-8?B?dUtOL3AxRW5RL3BISDI5OWFodUpaL3J3YTNKbTFSMUQrYzNZWDZLMCtLVEEx?=
 =?utf-8?B?b0RvWmtWZjNLU0owdDlkSEo2WlMvWG9NTVFVdHVrUjF3V1F2OVBSSHNZTjd6?=
 =?utf-8?B?eGo3NlR1alY5ZmRKRU1TUFZVWFhSY25FRkdxR3dleG52UnNCR1JudGYybERK?=
 =?utf-8?B?V2RqYTRjUkxDTEtnVy9HZVQrWnp4NzhXbDJLRlFZS1d5Y3IyR1k0NDMxcjNZ?=
 =?utf-8?B?WDJpaWtBMTZiR1dKZEd1cm0zcmxpS0NRUHFNU1FtOEtSdm5mSDBnbWJMRUdk?=
 =?utf-8?B?RGRsODFzbGluVGNGUm9DRyswMENQRE5kNGh6SWFNVFNzSWVDVGJ1cldudXR3?=
 =?utf-8?B?SDJaMUEzN2c0cnF3MCtrOFZTREJ3RkhSNCtNNXpjZzRYZHYxTHdkWkszMkZ0?=
 =?utf-8?B?YjJ1RHgyR0ZiVTAzM1ZVMVRiNlR5dG5BeTNaOXRjdjdaSVk3Q1JRMWk0VFpi?=
 =?utf-8?B?M25QM0F4cDNjaEVkS3pNZ0xYa2NLdUp1c1hYcmpBNGtFUk9jbzV6UXFXNWpM?=
 =?utf-8?B?REk4VjJKdGVIUTRWeHdmTmVtRjBOcGU5VDl1dER6YUdlWEpTTXhWTnFZQkZM?=
 =?utf-8?B?TGF4OG9Kc2FwbFJEQmF5U2tHZnQ3aCtldXNkVy9XZXNOZnB1Rml5czhHMGY3?=
 =?utf-8?Q?HqrJLuiSIRStyCFpEu6uCDrbO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8491c64-00c2-4d6f-ee45-08db70df38ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 16:07:03.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhjbQZ4VjGsx3DibuVcjIJNxVmXGsUSVbtThFxWmNRs3p1fQpF6ub1icYAq2VA7JZcWApQyHlt6XeeVFmhHORQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6803

On 19.06.2023 17:49, Shawn Anastasio wrote:
> On 6/16/23 3:24 PM, Andrew Cooper wrote:
>> On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
>>> Add the build system changes required to build for ppc64le (POWER8+).
>>> As of now the resulting image simply boots to an infinite loop.
>>>
>>> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
>>> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build
>>
>> I think the first of these isn't needed, given the config ARCH_DEFCONFIG
>> default.  I'd suggest dropping it.
> 
> It seems like the build system expects an `$(ARCH)_defconfig` present if
> you don't manually specify a defconfig target. I see riscv64 has a
> tiny64_defconfig and a riscv64_defconfig that are idential, probably for
> this same reason. Would you like me to take the same approach of
> duplicating openpower_defconfig to ppc64_defconfig?

It's a symlink for RISC-V iirc, so wants to be that same way for PPC
then (for the time being, again like there).

>>> --- /dev/null
>>> +++ b/xen/arch/ppc/ppc64/head.S
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +.section .text.header, "ax", %progbits
>>> +
>>> +ENTRY(start)
>>> +    /*
>>> +     * Depending on how we were booted, the CPU could be running in either
>>> +     * Little Endian or Big Endian mode. The following trampoline from Linux
>>> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
>>> +     * endianness matches the assumption of the assembler (LE, in our case)
>>> +     * or a branch to code that performs the endian switch in the other case.
>>> +     */
>>> +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>>> +    b . + 44          /* Skip trampoline if endian is good  */
>>> +    .long 0xa600607d  /* mfmsr r11                          */
>>> +    .long 0x01006b69  /* xori r11,r11,1                     */
>>> +    .long 0x00004039  /* li r10,0                           */
>>> +    .long 0x6401417d  /* mtmsrd r10,1                       */
>>> +    .long 0x05009f42  /* bcl 20,31,$+4                      */
>>> +    .long 0xa602487d  /* mflr r10                           */
>>> +    .long 0x14004a39  /* addi r10,r10,20                    */
>>> +    .long 0xa6035a7d  /* mtsrr0 r10                         */
>>> +    .long 0xa6037b7d  /* mtsrr1 r11                         */
>>> +    .long 0x2400004c  /* rfid                               */
>>> +
>>> +    /* Now that the endianness is confirmed, continue */
>>> +1:  b 1b
>>
>> .size start, . - start
>> .type start, %function
>>
>> Lets get the ELF metadata right from the start.
> 
> Good point. Following the example in the Power ELFv2 ABI
> specification [1] for function type annotation, I'll place
> 
> .type start, @function
> 
> in the ENTRY macro. It's not clear what the difference between %function
> and @function are in this context (my toolchain seems to accept both and
> produce the same ELF metadata), but the latter is more idiomatic in
> Power assembly. The same goes for its placement before the entrypoint
> vs. after the last instruction.

% and @ are entirely the same here, except for targets like arm-*,
where @ starts a comment.

>>> --- /dev/null
>>> +++ b/xen/arch/ppc/xen.lds.S
>>> @@ -0,0 +1,172 @@
>>> <snip>
>>> +    DISCARD_SECTIONS
>>> +
>>> +    STABS_DEBUG_SECTIONS
>>> +
>>> +    ELF_DETAILS_SECTIONS
>>> +}
>>
>> In the other architectures, we now assert that sections such as .got are
>> empty, because we've had enough bugs in the past.
>>
>> I'd recommend doing the same from the outset for all the dynamic
>> relocation sections, unless you're expecting to have to support them?
> 
> No plans on supporting dynamic relocation (for now), so I can go ahead
> and add these assertions.

How would you ever use dynamic relocations? You have no loader to
process them for you. (Yes, there can of course be relocation free
head.S code which deals with relocations, but doing such in assembly
is likely not the best idea. Yet as soon as you enter C code you're
at risk of hitting a place requiring such a relocation, perhaps
simply because of a "careless" function call on some infrequently
used code path.)

Jan

