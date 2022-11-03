Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DA617872
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 09:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436151.690227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqVIL-0007rr-3K; Thu, 03 Nov 2022 08:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436151.690227; Thu, 03 Nov 2022 08:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqVIL-0007oP-0c; Thu, 03 Nov 2022 08:09:49 +0000
Received: by outflank-mailman (input) for mailman id 436151;
 Thu, 03 Nov 2022 08:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqVIJ-0007oJ-E9
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 08:09:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0639bfd-5b4e-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 09:09:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8220.eurprd04.prod.outlook.com (2603:10a6:10:242::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:09:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 08:09:43 +0000
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
X-Inumbo-ID: e0639bfd-5b4e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSkZX6phjw3y0cfMsUcoIEZi6zt57DMKYPqMp6LJOeC1zTiwrJBaGOgveMKm/8kgwcIkP3sC+H7u89TtcID4M0X/cmNNWBBl5jvIQiyqzYDbfNz/UdggcN0TF80YqBbGdoVQ9SuyeU+gC5NErV5yMm2XPmw9xHv6XVOcxkw1SOXgQGKXTxYrpVJMkokzAm8mjdbkz1vw19tcTD6bMXC09kVc5MPVwlrR8M0TtAmoG8omrjgllPOM2DezfsKQ9u316o5Je8gXVZ8x8e+OIGo4iyIfiNMiZRR0J3fU7vlJy9kAwbjb4t70xvHbINuH1PnPFrM2cLvJ2iTDZXrkUDBUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiYtT3YjCmRsXNtJCT7zFffOR6d2OnrN/dQgPKbsIkk=;
 b=HYRVNUGuAD0V+rvDeQMM5dW4Jd6CpDYlEsL7ucpmfCvrLfJsTZU6frgHYelOlh3BIJxbwoQ8wMhh+jPGmM/huqz9/xAS0JOBoQkNMMhFrfdSghfnSfRYDpSQIVK+YrpvMkHr+fHh3pA//OZyYkEokR1bj0sex+E0s9XY8aVrpZjp7Bk5wSs655YZXtPvJbYdQnIJ8OzMwZIKrNsTjXPqN9DPr5tA/Y/1EJHZQsZbYVurysE4vq4QkStcqwGeWKenrQ4F8Q2tG+reVbqEJqwIYT3SjgV1Jvx0uFEBepMpXrJjKxOWv5kSv1/4G59FPvkUL3aQbonqiLC5wXaFGZlKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiYtT3YjCmRsXNtJCT7zFffOR6d2OnrN/dQgPKbsIkk=;
 b=2BbqHAkkRQKIOUlLUjm8QujDLF8fUzpav9Ao8bRj6AnOit81bwIQ/VBI2Mle2Q/hVGmWGMnXGEY62HsOeBdbOBdQvaRvK/RPW316+AFfgCFszdrWlZ2NY2zLEcGWY7pdUGguPcuRpRfythlcYhxtqDVQ1J/q8GwbdcYWpHXhHkVybZyqv5aRAWFy6tDazc2wJ0KlBaLJr79B8v24bSeexuxVdNQ0F/hEMpWX1sTG3AkWkqtU0kLde8Pv+nvPmP6yCkT3HtCGKZityWka9/7ERuLjCSyvFly4UNG8FppjfNiuC/ECd8I/YjqqpYZZG2rw7FfVtJOIJ69SJOH1WOzxQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20869a2c-224e-698a-b927-96d6ad752b9a@suse.com>
Date: Thu, 3 Nov 2022 09:09:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU context
 switch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221028114913.88921-3-roger.pau@citrix.com>
 <20221029131258.95811-1-roger.pau@citrix.com>
 <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
 <Y2KrF+0ns174JC7S@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2KrF+0ns174JC7S@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: 532ad07e-76bf-4b83-3942-08dabd72c375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X0/xizwWvS5ZkRoIoVtDHouekdgOJLV6TYS10GQ6H7hyT9XAvDSZ+xMjFZQCsBQ+hduNxOZkSLKf0pCOC0XyN79/io3mqDBMqSz51AdGey7/l+oz9ZOEMOesANOumg9V9NpUDGMmveOeLtC51OO0n+ucZwQLRzr5cC2DxlhnPmzHDZEwKZ9NvKPzkzxac49SFPOZsJsXi3jXfnK3sf7kR13ykpeuMEv5N89lrU6AlOPi9X/P3UTZWOiTeJjplXJ5MdNUqtgrNZ9XbN51DFiuWeDo8RmBcqc8WKQ8YV3srvTYbzwNmkYB7J4B8fkng02o46MUyReYFBuCWB6k6EstHR1DDXFIwgWvvrdIVZ+FXMySM612XHtlYvfQep0vfS5VE8wKjtMqFMPyS7tIYAshj8HUUQORdSR7LXQn9joVFJG4SS4jkEQyyGxFZ3W38RaNiuukPDSNxiQktSZovtUwMROAyrkm9C8UH2O/AeQy1A9iT1np45S/U3uUm+FNDY1u4Di+GbAqf1lg3ZOkvjXx0VlIo8zClfxxS4sVQo9guUwWwo2WIbi5gN1b4ephQIlX/uhKrVy+6z65SUGBsIGhl1nKrYplsuhPmMFUvydm3SLcWDn2p552lin4GzJwBQ75HBJ8XR9zL+h4VPCMoQbDFfpOTtUxAsgZDKdQvX7boSSXLKVhpepcgagq7zhJ5rUB2tMtpIbdkdGxWZWmM2rr1s3aJBO7CCjWVRwudxBJ9EQCdbuhTUc+L/TkfDQBrkeQZSXen7il8RLS7kmz48PQ0MDous7MHqjd9Y+jXsjFXAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(36756003)(86362001)(31696002)(31686004)(38100700002)(2616005)(186003)(6506007)(26005)(53546011)(478600001)(6486002)(41300700001)(6916009)(316002)(66476007)(4326008)(8676002)(66556008)(54906003)(6512007)(8936002)(5660300002)(2906002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VENuZitZR2RVU0FXQkd5L1ZrNFAxeU5ta3hQZm1DSTdJeUdab1Z5UzJteEk2?=
 =?utf-8?B?VStyRGJaZUZySHdiZ0x4SVNKT1d0YWxNMFJxbHVYT0FwOGNtUnEzcHpwYXRK?=
 =?utf-8?B?WTBtaTN4cVZSSkZOcWYydEsxb0JlZXFaSVp3aVJ4OXZVOEZpT2huZmN2angr?=
 =?utf-8?B?VEVSZEVrR3BRZjRzRnY0TUhkKzc2UXVSVllXSGE1b1l1K1FQTWFsa2dIdVpG?=
 =?utf-8?B?b2UzWmhLeGprUnZEaGs1cFdlV1NFNCtmSzF2TEhUMmY4dGtiYTRKb2JUNlVR?=
 =?utf-8?B?WDV5T0JwOGVIdGNLMHJtUzRCSUtPZnhLQS82SkZMU2g2YzIwYjBoTSs4eG44?=
 =?utf-8?B?YlRGUVJxSTdhcFJZV2VVVytGRjdOUkgxRWlFdVg3TEhnVnJrT2RFTGlZYzdC?=
 =?utf-8?B?b1RBSElnR1k2Lzd1dnFtT1Qrc2VNR01vQUtIQjdqTnJTQTlydFRPVE5YZGNC?=
 =?utf-8?B?TnZvYzdNV0czOENCQTZzZG4wQVIrYm1yZDR2U1lFc2w4L29UNllxU3lxSFM4?=
 =?utf-8?B?LzVkQUs0dUFqYXdlUEtrdHZ6ZzFZVUk2OXdqdzBYN2Y4M1ppL2FtU3NhT2dC?=
 =?utf-8?B?eGhlYU50WnpzS1BUTldxU0VSMGJqM0M1eGN3eVJUMkVKSUZqcFhPdjhwUm9K?=
 =?utf-8?B?THhsdzZEeWhGUEllTlRBOFQyRlhUUTJvTzEzZzhKeVdFMjJjVTVqUVVUSExN?=
 =?utf-8?B?RHUzRTZpMjBPTHF5cTNvOHZyZlFCWU5DVmpmaVorMHEzOHFZUC8ybEZ0bm1h?=
 =?utf-8?B?QVJ1YjlNRlhKMnVjcXJENHNHSjdyRVZ6R1lMdkkxY3RJbGNoQjhxR3AzUUl3?=
 =?utf-8?B?TC9hNm1hSjRrK1FqV1JQYVl6WFJ1dDQ4R0taa0QvSXo1UGZtYWhEN0QzZ281?=
 =?utf-8?B?NUQ5Zk9LOXBHWktLVHgxOENOZEtXdXp6K3U0NWtVU3ZBZlpJbnZ5Ly9LOTFJ?=
 =?utf-8?B?Q3A4bzhBWGs5eWxlS2Y1cnlxQW52NFdHaVp4ZXk1MFMxcHZBajNLZVBIcjR6?=
 =?utf-8?B?Y0hSOW5jMVJXRUJYOENFRXEyeDlxMjh5NzhrRExiZkdNYUVFQWd2YlEvWmpF?=
 =?utf-8?B?NVNGaHlmOTY1eGROY2RUT0pmQmQweXRzZlo0bzM5MzlLaDRyOENCdDhrcE0w?=
 =?utf-8?B?MTZxVlVuM01JRlFjaHRiWkoyQk12UkRRSWlUS2pvWjZmZE9GdEdKV0tCRUtF?=
 =?utf-8?B?UTE2VXhkWmlKM2Znb2VpRjlVUUM0Q3hBbENqc2NBdFd3TUs2RnA4K1NmU1Rn?=
 =?utf-8?B?cm1hSHltUGdQUTdxZVBZdHFQTkxxMmJVN3VXNWM0akVFYms2RzYrc0QzdFAx?=
 =?utf-8?B?dmFPZVB0bTVyVStVeGJ5YnV5dHhFTEFYei93cmlDZEE3TFJxWm5ZNFRHRHZj?=
 =?utf-8?B?TFBFaGtiRzZrZmVsMk0wSmk5a2xoMGwxQkh5M3pEakFiZkkzTkxlbVFCUFZ0?=
 =?utf-8?B?bVJhRW1EazIxcUQrVEtrQ3pWWVhjakM4NEJLMjF3a0JVWitPTUZvMmtGb0RD?=
 =?utf-8?B?WExuaVJjQXFUOWFmQ2ZmM3U1RFQvSmtQSVhndkUxblBOcU02MnlEWFh2d2Yw?=
 =?utf-8?B?R1VrV2RrUkZOcGZOck9paEh4RFJaY0hmRFhWK1JPUm1xZnIzYm51TGhWNWFY?=
 =?utf-8?B?Wk5JQW9vR2hyczc1Nk5xa1RXbDBEbElEYjIvK3l1Nm9YaXVFL1VFSkpkRnZq?=
 =?utf-8?B?djViWm1qeHF3WUIyai9kWm1mOGJqK0V0VXpwTGRJc3dLblF1ZlN0d3FONWhu?=
 =?utf-8?B?SHBEZDhxYytRVTBvb0R1S0FBZVVaRm4vYWZJY1RSVlM0Y3FlTDUyUXlFRkpi?=
 =?utf-8?B?c05BZWRjdDFRcGdsU2VjNzRXWnVhWHRTMmphaWVBVDFwakxHRW9mWFpBMlJp?=
 =?utf-8?B?VTl3Tjd3NTlDaHlZYUlXODVIaC9pNEdlVFhQeFJWL003OWIxOUtKWE9EUEor?=
 =?utf-8?B?aWUreDFFWlZQM253N0N1a2ZKRzY0blMwTlMzb3RVcC93RnhMdFFyYlRmcmw4?=
 =?utf-8?B?NDBJSnBjd1hCVEgvdXNpUlgwc3BmOUFrRjR6ZUttbmhvZGRoaVRxcFlrNXNl?=
 =?utf-8?B?bTJBN0dWbE9iSWRuRUtkNGdzdHpKeHEyRStIbDk1UUZmR2MwTmRuWmlJeW9E?=
 =?utf-8?Q?//2QiWIFsLuaHy/K+0zkrGcaK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532ad07e-76bf-4b83-3942-08dabd72c375
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 08:09:43.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlo/KxqJEbRadD7Go3wnzFraswlPOc3NGhuxv7XpHxN3wuct2gNox34+b0YE4D03qwJbdqMJrh+P3k0nOdl1UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8220

On 02.11.2022 18:38, Roger Pau Monné wrote:
> On Wed, Nov 02, 2022 at 12:49:17PM +0100, Jan Beulich wrote:
>> On 29.10.2022 15:12, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>>>  
>>>      /* Resume use of ISTs now that the host TR is reinstated. */
>>>      enable_each_ist(idt_tables[cpu]);
>>> +
>>> +    /*
>>> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
>>> +     * is already cleared by svm_vmexit_spec_ctrl.
>>> +     */
>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>> +    {
>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>> +        amd_set_ssbd(false);
>>> +    }
>>>  }
>>
>> Aren't you potentially turning off SSBD here just to ...
>>
>>> @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>>>  
>>>      if ( cpu_has_msr_tsc_aux )
>>>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>>> +
>>> +    /* Load SSBD if set by the guest. */
>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>> +    {
>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>> +        amd_set_ssbd(true);
>>> +    }
>>>  }
>>
>> ... turn it on here again? IOW wouldn't switching better be isolated to
>> just svm_ctxt_switch_to(), doing nothing if already in the intended mode?
> 
> What if we switch from a HVM vCPU into a PV one?  AFAICT then
> svm_ctxt_switch_to() won't get called and we would be running the PV
> guest with the previous HVM domain SSBD selection.

Would that be a problem? Or in other words: What is the intended behavior
for PV? PV domains can control SSBD via SPEC_CTRL (only), so all we need
to guarantee is that we respect their choice there.

>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -697,7 +697,15 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>>                  msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
>>>          }
>>>          else
>>> +        {
>>>              msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
>>> +            if ( v == curr )
>>> +                /*
>>> +                 * Propagate the value to hardware, as it won't be context
>>> +                 * switched on vmentry.
>>> +                 */
>>
>> I have to admit that I find "on vmentry" in the comment misleading: Reading
>> it I first thought you're still alluding to the old model. Plus I also find
>> the combination of "context switched" and "on vmentry" problematic, as we
>> generally mean something else when we say "context switch".
> 
> I had a hard time wording this, because of the Xen/guest vs vCPU
> context switches.
> 
> What about:
> 
> "Propagate the value to hardware, as it won't we set on guest resume
> path."

Sounds better, thanks (with s/we/be/).

>>> +                goto set_reg;
>>
>> It's not clear why you want to use hvm_set_reg() in the first place - the
>> comment says "propagate to hardware", which would mean wrmsrl() in the
>> usual case. Here it would mean a direct call to amd_set_ssbd() imo. That
>> would then also be in line with all other "v == curr" conditionals, none
>> of which apply to any "goto set_reg". ..._set_reg(), aiui, is meant only
>> for use in cases where vCPU state needs updating such that proper state
>> would be loaded later (e.g. during VM entry).
> 
> I thought it was better to hide those vendor specific calls in the
> already existing vendor hooks (set_reg).  I don't mind calling
> amd_set_ssbd() directly here if that's preferred, it seemed kind of a
> layering violation when we have vendor specific hooks in place.

Well, Andrew of course should correct me if I'm wrong, but my understanding
of the get/set-reg interface is as described. On which grounds I don't see
any layering violation here - doing the call right here is merely a more
involved flavor of wrmsrl().

Jan

