Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DC69E0B6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 13:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498864.769794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUS2X-0004a7-P9; Tue, 21 Feb 2023 12:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498864.769794; Tue, 21 Feb 2023 12:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUS2X-0004YQ-Lf; Tue, 21 Feb 2023 12:46:37 +0000
Received: by outflank-mailman (input) for mailman id 498864;
 Tue, 21 Feb 2023 12:46:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUS2W-0004YK-Iz
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 12:46:36 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c63cd1f8-b1e5-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 13:46:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7715.eurprd04.prod.outlook.com (2603:10a6:20b:285::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 12:46:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 12:46:33 +0000
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
X-Inumbo-ID: c63cd1f8-b1e5-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHcDCIoRgVftrhhl0CQKAAjE56AxNyl4JYrhSlrrj6pAf6GLzqBiDoGiIPsERge0JLPOt8oJfYT5cbwXOgPqGLZbhXT11SRaGVfZ6zEBo5QEsi/O17wf6gptsY0NSoSXHLuw9BNSv3mI/Hh0VMBMcwbMHDfAfu8yNxVxgisK+AndIXZNVqBmMP+1Pm5Az0lzYn+fNDDh2qtYVnrHzpKyVw0fY4KHFsBYuWZW4rG4MVC/uJZ8N3gOlLgjTOGvaBVSJsrh7nWFP6r1iEwrMITtRWSaxXUQzfj6QOM6obPspKONkl9Aja6hmMo76Gwb1aMAb/nLPK786MMn1LkFtIg7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M+MUZZf4ZJbbGM6PtWH2pybkV7nJpW6muEe6UWfYYw=;
 b=VzM44QEy8jFdRcfJ32dAvejUzVad70BaklDj+1ewa2PI8A9B7vXvKv7PlvQA/Nik6uIS2Vg/ESUbl30e/CZ/3y7UwVwa8S4o2a4N72/dEUAHzUy4JaqXeeHGonJyVNr9+xnaQIWAnNLJJLhMYhP+joEJ25VILcFjFPj3K2414as/MATe2ZbKe2ERrU0pZATgmlJVoavZiHgQ7z4t2NRKg46vKCCoeetz+wo/J1Hoqhxg5ft3DELHwkId95/LnrFQjg/EnQWYzluq6MrPwtag1jdlcYHjEav+q098oeVu6OKkbK+dzoGbTfaduKZ78ntynVDEzlZwkrPw90H0+K4WhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M+MUZZf4ZJbbGM6PtWH2pybkV7nJpW6muEe6UWfYYw=;
 b=UrSW5+FekkUEL19jslUHE7Hy1MShpdbM02BxkvpcuBVKIa3ywjE8a2Hs5ggGyh8m0dZPrLpt5JB/8M3kP7TRRTOoqJhDo6HksFKmYkMPrAqLsiGUNjuNF8uwLLOsdV6SLTOy1byCF/Jga0Omk1LG8nJbkbVuhDY2Nb+o2Vp+yiocvyj1gGAaNklpTpoN/mIC1I8WAeXIqVr44QYrNBzJceyS+ACjXdBFYh4ydY5m86lX01SXv0G+aaX8Jtx0MhmDO9d+QcaBDnUYWrZQ+fWXUgsevEuagR4D1lcAqRsfaf3dG9OewPp5PbeRf+nb+6SDLTjubxDexiX06s2r1LwSBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8792cac-3d32-d74a-9f54-b479c58166cd@suse.com>
Date: Tue, 21 Feb 2023 13:46:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen: Work around Clang-IAS macro expansion bug
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230217001914.762929-1-andrew.cooper3@citrix.com>
 <20230217122203.790737-1-andrew.cooper3@citrix.com>
 <04891259-ffde-a6ff-32a1-e3a84a7278ca@suse.com>
 <e2fdff6c-d21d-d3f1-3e46-36f7a88e5507@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e2fdff6c-d21d-d3f1-3e46-36f7a88e5507@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a257ed-8e9a-4a59-507e-08db1409a929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bgFDfDMAeJ9gdN/ElSgok52nSpEPl5O2CGGY5AjA077hwRD0WoVPo+v/h1v7vaAsqRN62kHWYhvYFRCaE4+BjNe4BCgp1B5SUwuUZnwvbfa3asvxDXFFWfDp8R+IxYHyFpG1nFDS+emUUQfxtghPDjf/bBLAGR4FIfGxkGsPGeqSf3IEFm3dHv1I3noHDFN4UtM+I6x+SYRil/TQ6AbrIGcRMgQBPWFvURAMDrC3eIrJ0ynGUWQ4aKwxdjy5RYlV0K58rL4tMszGUaMPJ8bOYfmpcYgHebBtIur8rhkJ0zQI5qLUuMtHZklajlP9UrUpBnBMrcMHQkI89iPKYvVmPWbpmviD13+A/rpW87PEuDB75VuK51sIJIYzWbk8udhXfwm5x/XYNzoVTGSUh6CeU+o2Gt2SKwmbpVQJBfQcfMU8lVjcQltg4+xD1kmeSEOZqNMNkxI5J3JSajL5bidhGUXOPXtIyFr7wGCsdi6Tmjeepl6HVFIf9DNMvFDiyAEl2suZbCY3Kz0cgB2LXEywRrCS5NqH3LOKA0h6NgMsajD0MoZkUtKuHscZeUa2ksw3PhQbOlBKsvCKfbi6eqYjbFn5NkVMe6p7Q5ygcakwHhKvKnMlYNY0hBLyTxi038ZO+CQOlzpdtGz7o0Znr3snzlzTlxbWbqXasPEdLhcVZUp4RAyfEJjMiVREiM/1gP1fkognFCQp2S1dy8vuomSxXSpYNgySBdm+VapMUgg5w/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(5660300002)(54906003)(316002)(4326008)(26005)(66476007)(8676002)(6916009)(8936002)(186003)(66556008)(66946007)(41300700001)(86362001)(36756003)(6506007)(6512007)(31696002)(53546011)(38100700002)(2906002)(2616005)(83380400001)(31686004)(6486002)(966005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Snd4VmQ0M3ZVVVZOazlueDZodGF5bnhVVERiNG5Zd2s2TEdYZ3ltMmR6bjNa?=
 =?utf-8?B?TVQvTDlRU3EzVFV2Q3RpbGpEWUxaZjAzQUZ1c2VVNGpWYVVtR2NzR242di9a?=
 =?utf-8?B?UWFHMGg1VGJUK1FUTi9sVDJzVVpxa2YyM2tXY2hpSkpwcHdHWFdYbVNQcWtC?=
 =?utf-8?B?NEcvYXJyOExSRHBQSGpLSlFhaFFFVnpxSU5xWWhUYmJQUS80cTNaakoxaVlW?=
 =?utf-8?B?a0swSmlDZHBUOWdTVnhESElNNHg5emdqc1BJY0ZyVnNhaXJpbGtvV0dqMUI1?=
 =?utf-8?B?OWhPRVpNcmFuVWNwZVJoc3FhME5iSGwzSjgzNkpCSnVVTVJnY1h3SDA5eWZt?=
 =?utf-8?B?Y25iZkpqZmQ3TEVmK3U3ZmgzZTBvQUhzN3FrdGVlZzZFZnpUSWRINHFDQzdk?=
 =?utf-8?B?YkQySUNDZFZIN0lGeTZkeWpXd1pKQ3ZoMWxNb3Rqb2l2SStvdFdNL0RRSkZi?=
 =?utf-8?B?cS9jTVdRdmRRbkV1cEFQOHZ2WkpxZW5LcTdiMzBqTmlLaU5pVVhqTWVuTlYw?=
 =?utf-8?B?bnhKR0NyNVQzUnVxYU9DQW4yQk9abHE2UjlzZlFQZDg1WEtBR3dqVkM2T2hM?=
 =?utf-8?B?TER0cjhPYTkrdDVLZG9hTHhwdnpxZGg3WUVhb2o0QkZuc1NkcHJRUVVObVlw?=
 =?utf-8?B?b0hBZGJjSlY5c1p5bGNCU0JGNGFVT0VJMlRROTNXbDdWUWNzNjNab2E3UWhB?=
 =?utf-8?B?YTYrVVpibDZJVHh2YmZySUhWb2NXVjBZOXdyeE1tKzZBMEFXVnc1ZzZOaENx?=
 =?utf-8?B?QlNpY1VzRHo4eWZLTGFzOUtTZ0JYYjlYSVYzOUd1QVRlamRhd3dWQ0VGa1l1?=
 =?utf-8?B?OVRtWnBYcjFXemg3ZmY0eWRZQmFJR016b2FOVjExL2Rzd1dOSmFjaDZhalh3?=
 =?utf-8?B?akNLL1paTHhwOGp6bW8wdklKeG16RzlLRjVPZ3ZFazNzNnBOOGZxR0lIdDhE?=
 =?utf-8?B?RjJtMENldERrZzdSOWVsemZwWmZmcjFVeVhmOXpMOEFrRy9wTXgwdElwK3gy?=
 =?utf-8?B?ZTdxbGpTeStnajYvQ0VOTnZKU2xFb3k0NTRqT1ZFWDc2bFpWR1F3enpjelBZ?=
 =?utf-8?B?ckNVQzdFSDNBVm9CUlEvTm9Id2xnMFdVelgwUG9LcUVSVHEzTjN3OFg1QkZm?=
 =?utf-8?B?RFZxVWJ4cU9JS2tUcHJqRUdPcnloRExvNGJkVVQ2MGJtQ0JUMXpvcmVQdFhw?=
 =?utf-8?B?c1VuN1YrSjFhbVErSzZvZnU3cTFNaUVYbllERWNIZy9HQWRPbkFLZ2ZIeVdm?=
 =?utf-8?B?VkQ2RmEwOHBXc3l2cmJMZmhoa1V2dFp6SjVnakw0NE92dElDeElFb3hxRTZU?=
 =?utf-8?B?d0lYRHZPdVRMUGp0Wm9xdmI1UE8wNlBsM0JFbzVsRHU3SkROMHBJVlEvZWZP?=
 =?utf-8?B?MmtHN3NGY1ZiVDN5WnA4SUNBTm1tcVUwc2orRWI1aktKY3IzNzUvOTJ1clE5?=
 =?utf-8?B?Z2JPRGtzN0pjMyt2cnVjRU0zazJ4RTh3OWVva2k1Q0JUT2ZMem9GSzQ1VmtP?=
 =?utf-8?B?bmJIZ3FmYlhDV2Jhd1o5VEcvMTFaVmEyR3N0TUJiZm5WMmw1amF3cGloUklO?=
 =?utf-8?B?WjNXSDVkVXkwZTNTcklZN0NZbTVmb0RHamhkZ2FNRlBndGJLYjFhVlJEY0xI?=
 =?utf-8?B?WFAzODJEY3Nzd1cwOERPUVR6NU0wWUZQcWFmejBYMmJnU3pRMDFWdnh0RS9H?=
 =?utf-8?B?YUF5cER0Tkh0WFdwaDJCNy9PMFYvRmlidThBZW1wN01LODFyVHdPRmlqNXBB?=
 =?utf-8?B?c0ZrM3o0ekZ4VDlPMWt3MGxjWStLbG42MER1RU1jM1FwUnZwMjlMZWRTeTZW?=
 =?utf-8?B?SURiMDVQbmxyVU1LU2hkcG9PTERyMFhaMm05aVlmOFF1Y1JPSVBZS1dLMXJp?=
 =?utf-8?B?WVI4WE1ZNVNMNGExNHQrVjhmdDdSUEE3dU1Ma05QNW9yQ2ZQWHovb1IyWFBB?=
 =?utf-8?B?akZXdkZDVHFCU2FlcSt3RTVmd21QMWpXQTVHWHZHdW9KSENHdEJEd0M0bmJ5?=
 =?utf-8?B?Zk9rWjd4MUs2NzBabXkrRWxaVTFqdExFVHhyYVRySnBSMGlJVHdVdFliUU45?=
 =?utf-8?B?dlV1RmpXSlZqTGM0QWozTlFFV0w5N3p2bTVXREdYMG9hL3FoUzBodVU4YzZo?=
 =?utf-8?Q?5lNWSL9MmwDhXnP0JIFMhyW2p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a257ed-8e9a-4a59-507e-08db1409a929
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 12:46:32.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7h1FL8wamwtCXtoiI6QZNdHP76ciYgIVUqNKaeOmqwORLKW9aSPgrnIiRHNqWzeSlTwzS2oZai5ZL3m54+JXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7715

On 21.02.2023 13:26, Andrew Cooper wrote:
> On 21/02/2023 10:31 am, Jan Beulich wrote:
>> On 17.02.2023 13:22, Andrew Cooper wrote:
>>> https://github.com/llvm/llvm-project/issues/60792
>>>
>>> It turns out that Clang-IAS does not expand \@ uniquely in a translaition
>>> unit, and the XSA-426 change tickles this bug:
>>>
>>>   <instantiation>:4:1: error: invalid symbol redefinition
>>>   .L1_fill_rsb_loop:
>>>   ^
>>>   make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1
>>>
>>> Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mux %= in
>>> too, which Clang does seem to expand properly.
>>>
>>> Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>>
>>> v1 (vs RFC):
>>>  * Rename \foo to \x, reorder WRT \@ to avoid needing \() too.
> 
> Sadly, this is not quite correct.  There needs to be a non-numeric
> character separating \@ and \x or the concatenation of the two can end
> up non-unique.

How that if \@ is always 1?

>  So I think we need the \().

Or put one at the start of the label and the other at the end?

>>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>>> @@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
>>>      wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
>>>  
>>>      /* (ab)use alternative_input() to specify clobbers. */
>>> -    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
>>> +    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_BUG_IBPB_NO_RET,
>>>                        : "rax", "rcx");
>>>  }
>>>  
>>> @@ -172,7 +172,7 @@ static always_inline void spec_ctrl_enter_idle(struct cpu_info *info)
>>>       *
>>>       * (ab)use alternative_input() to specify clobbers.
>>>       */
>>> -    alternative_input("", "DO_OVERWRITE_RSB", X86_FEATURE_SC_RSB_IDLE,
>>> +    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_FEATURE_SC_RSB_IDLE,
>>>                        : "rax", "rcx");
>>>  }
>> Since inside the macro you retain the uses of \@, I'd find it desirable
>> to keep gcc-generated code tidy by omitting the extra argument there.
> 
> As I said in the RFC, I tried to have x=\@ but gas really didn't like that.
> 
> But given the concatenation observation, we also cannot simply replace
> \@ with %= (given the option, which I couldn't figure out), because they
> can overlap.
> 
>> This could be done by introducing another C macro along the lines of:
>>
>> #ifdef __clang__
>> #define CLANG_UNIQUE(name) " " #name "=%="
>> #else
>> #define CLANG_UNIQUE(name)
>> #endif
>>
>> Besides the less confusing label names this would also have the benefit
>> of providing a link at the use sites to what the issue is that is being
>> worked around. Plus, once (if ever) fixed in Clang, we could then adjust
>> the condition to just the affected versions.
> 
> It's only Clang IAS, but there's no suitable define to figure this out.

"this" being what? The case of Clang but with / without integrated as?
Since we have to turn that off, we could as well add a -D option along
with the -no-integrated-as one.

> And while I appreciate the effort to be more descriptive, this name is
> literally longer than the thing it wraps and ...
> 
>>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>> @@ -117,11 +117,15 @@
>>>  .L\@_done:
>>>  .endm
>>>  
>>> -.macro DO_OVERWRITE_RSB tmp=rax
>>> +.macro DO_OVERWRITE_RSB tmp=rax x=
>> The "=" in "x=" isn't needed, is it? It looks a little confusing to me,
>> raising the question "Why is this there?"
> 
> Because I started out with u=\@
> 
>>>  /*
>>>   * Requires nothing
>>>   * Clobbers \tmp (%rax by default), %rcx
>>>   *
>>> + * x= is an optional parameter to work around
>>> + * https://github.com/llvm/llvm-project/issues/60792 where Clang-IAS doesn't
>>> + * expand \@ uniquely, and is intended for muxing %= in too.
>> With the above suggestion I'd see this comment move to next to that
>> helper macro, with a link to there left here.
> 
> ... there's no getting rid of this comment, at least in some form.  The
> parameter is odd, and needs explaining.

Of course, hence my "with a link to there left here".

> Passing %= unconditionally doesn't matter for GCC/Binuitls, and in this
> case, attempts to "declutter" the niche usecase of inspecting the
> assembled file comes with a substantial complexity at the C level.  
> It's really not worth the extra complexity.

I wouldn't call that one simple macro "complexity". I'm in particular
not advocating for (conditionally) removing the extra macro parameter.

Jan

