Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DBE7D89ED
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 23:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623981.972369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7Sa-0002FI-7X; Thu, 26 Oct 2023 21:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623981.972369; Thu, 26 Oct 2023 21:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7Sa-0002Ba-4G; Thu, 26 Oct 2023 21:00:08 +0000
Received: by outflank-mailman (input) for mailman id 623981;
 Thu, 26 Oct 2023 20:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziZY=GI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qw77Z-0005RC-N8
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 20:38:25 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b41a08c-743f-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 22:38:23 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso2036613a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 13:38:23 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v13-20020a170906564d00b009c74c56d71dsm134407ejr.13.2023.10.26.13.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 13:38:22 -0700 (PDT)
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
X-Inumbo-ID: 9b41a08c-743f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698352703; x=1698957503; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ihhsFU/nSUnwRSa3U0IzPBYmhjw/fViWtSip0TV6cI=;
        b=igp3wdOWdoGeULgHmxFGhdhNAlgv/DBPLT7NiexO+gcqggFNsrXb0KgxhcYWe0ukxT
         msyMRXtd846RzbSbkCHhPAkPyFxVRjfAqaurHXxAVkIsHHCzymSuu0x9jAAF9KXqYNOD
         iWeXj7deI0c9giuGnni/qaW1k0gY5vC3MajAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698352703; x=1698957503;
        h=in-reply-to:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ihhsFU/nSUnwRSa3U0IzPBYmhjw/fViWtSip0TV6cI=;
        b=GLnbxIPic7L41g50sgfKln+VPRVn61FiX0UrkkHuf02vV+d0i5LzA//9WRryZlw7Jw
         cJowxikGmF7wM9DFP5U7wMpnfYey6q65BdV2ZJQn6vW85XF0Drmgw+bjUC7EFPIqUFo0
         fifq+6nC1/j30K4j3HIPsbw54/12uZYZEIyQc3fmKhMpruyZ7ucueNZUqu83Xs3vvk2a
         y/QrCg5TmYgERzZj6UX3h8p4EN0uN3bVLZT/eoGQ/Psyg3p7azm7yTg8Ui+7OxucGeos
         0y7bc/GJGEAufVtVx38iPQ4FS7AMO6vm7allcAH7Vqnr3EH1vj4GMZCBTb1uIIsxvbsp
         xATw==
X-Gm-Message-State: AOJu0YwMZind+XlnI8fpNJZATeZzxaHqMiA+hvZ0bP6V4gTzujQx8Syp
	q8nV5QwGyb7lD1oXR6woyjPEeA==
X-Google-Smtp-Source: AGHT+IHPwP35BrQuWWbkjpb9lg6ZaJFkrfypOowO3wMiIHWO/swPhpkZKuAbeujVi6T+OCAZSMT0Ww==
X-Received: by 2002:a17:907:86aa:b0:9c3:c2e1:a38e with SMTP id qa42-20020a17090786aa00b009c3c2e1a38emr531570ejc.15.1698352702475;
        Thu, 26 Oct 2023 13:38:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper@cloud.com>
X-Google-Original-From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: multipart/alternative;
 boundary="------------9r0cd0WBMc4YK0pWl5Gv8CCB"
Message-ID: <977389d6-43e1-4731-a748-7d8f86de0a74@citrix.com>
Date: Thu, 26 Oct 2023 21:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/22] x86/AMD: add IRPerf support
Content-Language: en-GB
To: Edwin Torok <edwin.torok@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <6cd765e98fa4888b9e94215f3572a94e95fe2a4b.1698261255.git.edwin.torok@cloud.com>
 <20d0e946-f156-4472-a253-7517e831f44d@citrix.com>
 <A9ACEDF9-0A4B-45D2-90A2-92D9EEB89A9B@cloud.com>
In-Reply-To: <A9ACEDF9-0A4B-45D2-90A2-92D9EEB89A9B@cloud.com>

This is a multi-part message in MIME format.
--------------9r0cd0WBMc4YK0pWl5Gv8CCB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/10/2023 5:39 pm, Edwin Torok wrote:
>> On 25 Oct 2023, at 21:59, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>>
>> On 25/10/2023 8:29 pm, Edwin Török wrote:
>>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>>> index 483b5e4f70..b3cd851d9d 100644
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -584,6 +584,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>>         }
>>>         break;
>>>
>>> +    case MSR_K8_HWCR:
>>> +        if ( !(cp->x86_vendor & X86_VENDOR_AMD) ||
>>> +             (val & ~K8_HWCR_IRPERF_EN) ||
>>> +             wrmsr_safe(msr, val) != 0 )
>>> +            goto gp_fault;
>>> +        break;
>>> +
>>>     case MSR_AMD64_DE_CFG:
>>>         /*
>>>          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
>>> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
>>> index 5faca0bf7a..40f74cd5e8 100644
>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -241,7 +241,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */
>>>
>>> /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
>>> XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
>>> -XEN_CPUFEATURE(IRPERF,        8*32+ 1) /* Instruction Retired Performance Counter */
>>> +XEN_CPUFEATURE(IRPERF,        8*32+ 1) /*A! Instruction Retired Performance Counter */
>>> XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
>>> XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
>>> XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
>> Last things first.  You can advertise this bit to guests, but I'm
>> looking at the AMD manuals and woefully little information on what this
>> is an how it works.
>>
>> It does have an architectural enumeration, but there isn't even a a
>> description of what HWCR.IPERF_EN does.
>>
>> The HWCR documentation says "enables Core::X86::Msr::IRPerfCount", but
>> the IRPERF MSR says no such think,
>> noting only that EFRO_LOCK makes the
>> MSR non-writeable (which in turn means we can't always offer it to
>> guests anyway.  See below).
>> At a guess, the HWCR bit activates the counter, but nothing states
>> this.
>
> My version (https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf) says:
> "This is a dedicated counter that is always counting instructions retired. It exists at MSR address C000_00E9. It is enabled by setting a 1 to HWCR[30] and its support is indicated by CPUID Fn8000_0008_EBX[1]."
>
> Although digging a bit more there are some erratas around deep C states on some chips and the HWCR register itself is not global but per CCD (which is neatly buried in the _ccd[7:0]_.... smallprint at the top:
> https://github.com/cyring/CoreFreq/issues/206#issuecomment-722713147

HWCR is per-thread, and that's what both screenshots there say.  Ryzen's
don't typically have CCDs, which is why CCD is missing from the scope
description.

Consider the implications of making bit 30 work if the MSR was CCD-wide,
seeing as the counting really does need to be done in at the core level.

Or for that matter bit 35 (the CPUID-faulting enable bit).
>>   At a guess, it's a free-running, reset-able counter, but again
>> nothing states this.  The manual just says "is a dedicated counter" and
>> doesn't even state whether it is (or is not) tied into the other core
>> fixed counters and whether it is integrated with PMI or not.
> There is also a LWP 'Instructions Retired' described in 13.4.2.2, which is user-mode only and per-core, but I assume that is completely different from this MSR
> and part of the features that got dropped in newer cores.

LWP doesn't exist any more, even in older processors.

It was the feature sacrificed to make enough microcode space to retrofit
IBPB in microcode for speculation protections.

~Andrew
--------------9r0cd0WBMc4YK0pWl5Gv8CCB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 26/10/2023 5:39 pm, Edwin Torok
      wrote:<span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
      cite="mid:A9ACEDF9-0A4B-45D2-90A2-92D9EEB89A9B@cloud.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 25 Oct 2023, at 21:59, Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:Andrew.Cooper3@citrix.com">&lt;Andrew.Cooper3@citrix.com&gt;</a> wrote:

On 25/10/2023 8:29 pm, Edwin Török wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 483b5e4f70..b3cd851d9d 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -584,6 +584,13 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
        }
        break;

+    case MSR_K8_HWCR:
+        if ( !(cp-&gt;x86_vendor &amp; X86_VENDOR_AMD) ||
+             (val &amp; ~K8_HWCR_IRPERF_EN) ||
+             wrmsr_safe(msr, val) != 0 )
+            goto gp_fault;
+        break;
+
    case MSR_AMD64_DE_CFG:
        /*
         * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 5faca0bf7a..40f74cd5e8 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -241,7 +241,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /*   APERF/MPERF Read Only interface */

/* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
-XEN_CPUFEATURE(IRPERF,        8*32+ 1) /* Instruction Retired Performance Counter */
+XEN_CPUFEATURE(IRPERF,        8*32+ 1) /*A! Instruction Retired Performance Counter */
XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Last things first.  You can advertise this bit to guests, but I'm
looking at the AMD manuals and woefully little information on what this
is an how it works.

It does have an architectural enumeration, but there isn't even a a
description of what HWCR.IPERF_EN does.

The HWCR documentation says "enables Core::X86::Msr::IRPerfCount", but
the IRPERF MSR says no such think,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">noting only that EFRO_LOCK makes the
MSR non-writeable (which in turn means we can't always offer it to
guests anyway.  See below).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">At a guess, the HWCR bit activates the counter, but nothing states
this.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

My version (<a class="moz-txt-link-freetext" href="https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf">https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf</a>) says:
"This is a dedicated counter that is always counting instructions retired. It exists at MSR address C000_00E9. It is enabled by setting a 1 to HWCR[30] and its support is indicated by CPUID Fn8000_0008_EBX[1]."

Although digging a bit more there are some erratas around deep C states on some chips and the HWCR register itself is not global but per CCD (which is neatly buried in the _ccd[7:0]_.... smallprint at the top:
<a class="moz-txt-link-freetext" href="https://github.com/cyring/CoreFreq/issues/206#issuecomment-722713147">https://github.com/cyring/CoreFreq/issues/206#issuecomment-722713147</a></pre>
    </blockquote>
    <br>
    HWCR is per-thread, and that's what both screenshots there say. 
    Ryzen's don't typically have CCDs, which is why CCD is missing from
    the scope description.<br>
    <br>
    Consider the implications of making bit 30 work if the MSR was
    CCD-wide, seeing as the counting really does need to be done in at
    the core level.<br>
    <br>
    Or for that matter bit 35 (the CPUID-faulting enable bit).<br>
    <span style="white-space: pre-wrap">

</span>
    <blockquote type="cite"
      cite="mid:A9ACEDF9-0A4B-45D2-90A2-92D9EEB89A9B@cloud.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  At a guess, it's a free-running, reset-able counter, but again
nothing states this.  The manual just says "is a dedicated counter" and
doesn't even state whether it is (or is not) tied into the other core
fixed counters and whether it is integrated with PMI or not.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There is also a LWP 'Instructions Retired' described in 13.4.2.2, which is user-mode only and per-core, but I assume that is completely different from this MSR
and part of the features that got dropped in newer cores.</pre>
    </blockquote>
    <br>
    LWP doesn't exist any more, even in older processors.<br>
    <br>
    It was the feature sacrificed to make enough microcode space to
    retrofit IBPB in microcode for speculation protections.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------9r0cd0WBMc4YK0pWl5Gv8CCB--

