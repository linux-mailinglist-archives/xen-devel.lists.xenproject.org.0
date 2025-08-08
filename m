Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5CB1E699
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 12:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074255.1436915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKYy-000557-EO; Fri, 08 Aug 2025 10:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074255.1436915; Fri, 08 Aug 2025 10:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKYy-000538-Bm; Fri, 08 Aug 2025 10:43:04 +0000
Received: by outflank-mailman (input) for mailman id 1074255;
 Fri, 08 Aug 2025 10:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukKYw-000532-Cy
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:43:02 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73ccafe2-7444-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 12:43:00 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso1413356f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 03:43:00 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e6867193sm126691735e9.6.2025.08.08.03.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 03:42:59 -0700 (PDT)
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
X-Inumbo-ID: 73ccafe2-7444-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754649780; x=1755254580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gtA0WL2tqSrtxY3a/9ST5sU1cXkGfa3ReQ4mP+Og9T4=;
        b=V28Fz2xtYY+4DCL/x2GnKhyQtQ0Qes9Ks0R4h5J8s3hFta8z9fxJZTinOBUb5re7Fh
         zVAtCuQDBxoGZ8EgWESDUZa9ovVuzGS5uVrtkIGIWIClU0CPa5ZnOpJNQ+Sap0jV5oU2
         KuZ57jeaQX7HJfvqxY+HWimIEDz2lK4T+fsag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754649780; x=1755254580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtA0WL2tqSrtxY3a/9ST5sU1cXkGfa3ReQ4mP+Og9T4=;
        b=jnuQVONi35TtUzMVsd/VxS8UfWi54t8sLx/B2IH7nGlKRWe5gNcWHk9s1NcxjbHWEW
         AG+aUXe9gHauyTSq+ncHKNkk7raoKz9x6f+PYRFeRNXx2Oqz0qB4SkQOXE4srU80/PtC
         59Is4esYSp7JHQQ4h96OxLvH4cbFwRnC15rDKYePXxjUf8hhY9IIt/wCEagQr0mQ1v0g
         /sMWD9KmAd2NRRVi5lOj2iaCQAaXsy1C2LRZ5EtHcbpFAPMKjMUybP5uUmFDGEZ7u0Eq
         7W4qgGpVj4tOV1RNE/sNoVIw7/NckAo28KM5NKbg2fwLCU9Bqh3Cx210ZxMcRm1mkHi0
         7G3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVy5Kk0Nkjnhun9ZpXvvuGMFVXp/pL8LJQevclnuT2Q/7ijCcSFqohg42MfqwktzrdbvNxsZLoPs34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRWqS2Fdr8hlsOJkK3lCQJGmr66S/7fwWll3f74NSmU1LgreMD
	C1SaW9EQm2H8pHxSjEQUE1R1OemTkXbuTKjB4JilT4xPtzh/Z8sr+HqlLYo6XQBAkNl5DNlY4AD
	WQ3cocL6TPA==
X-Gm-Gg: ASbGncvbamsZVqfqZcRlu2+NagDX9qYf2qqT2Vaxk3KkbtagAmgTdZ0CAruCZmhU86k
	3ynczWkYY+d1cM1vlaj0JRyVU72ShogDwZSJUTg0Uv3yOdca5Q1Bph0o8OzAPRRUZ+O2fhjJ/nd
	vAbUU8bYfaZqAWzFVjMbgXZuFJzpKfBRb2pFK7cuzRFBtVOV7PrPKzRGg5Vc+Vhh9i859HMxPMW
	z0tlywagfeHDxcwTVzfFWVzKXh/oWRLkeZ7ieI7Do4xCZhZeA04A8PpExSVOtKotrS+UzphyE9T
	3uQH2worCiQTB+NRnBT6ESQAxxrj/fHg6vAsm2da/QBslIqCsWiaWbMrOJOA4hRA3oly2d31BF3
	LM/125De2canzDh9siSENXULcfYQ8bfxRPKhOFR+1FtZJrgGogqXivswkr9JgGbI9IG57
X-Google-Smtp-Source: AGHT+IFRRwK/8TxNv2uYo0WdoO5iMjBn0b1np7stAJMFoaKLsbsOiBHctUQp07tX+6jCsYIQ97w7xA==
X-Received: by 2002:a05:6000:4029:b0:3b7:7d96:e24a with SMTP id ffacd0b85a97d-3b900b7b057mr2153405f8f.35.1754649779582;
        Fri, 08 Aug 2025 03:42:59 -0700 (PDT)
Message-ID: <ff3e404c-979e-42a5-98de-45d1b4288230@citrix.com>
Date: Fri, 8 Aug 2025 11:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250807111657.201849-1-andrew.cooper3@citrix.com>
 <20250807111657.201849-2-andrew.cooper3@citrix.com>
 <ed587862-b239-429b-a478-e2f574312a2a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ed587862-b239-429b-a478-e2f574312a2a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2025 11:09 am, Jan Beulich wrote:
> On 07.08.2025 13:16, Andrew Cooper wrote:
>> In order to support FRED, we're going to have to remove the {ds..gs} fields
>> from struct cpu_user_regs, meaning that it is going to have to become a
>> different type to the structure embedded in vcpu_guest_context_u.
>>
>> In both arch_{get,set}_info_guest(), expand the memcpy()/XLAT_cpu_user_regs()
>> to copy the fields individually.  This will allow us to eventually make them
>> different types.
>>
>> This does cause some minor changes in behaviour for the hypercalls.
>>
>> It is specifically not the case that a toolstack could set_info(); get_info();
>> and get an identical bit pattern back.  Amongst other things, the
>> architectural sticky bits in registers are applied during setting.
>>
>> Previously, XLAT_cpu_user_regs() omitted the _pad fields in the compat case
>> whereas the non-compat case included them owing to the single memcpy().
>>
>> Omit the _pad fields in the non-compat case too; for all but the oldest of
>> CPUs, the segment selectors are zero-extended by hardware when pushed onto the
>> stack, so non-zero values here get lost naturally.  Furthermore, FRED reuses
>> the space above cs and ss for extra state, and a PV guest for now at least
>> must not be able to write the control state.
>>
>> Omit the error_code and entry_vector fields too.  They're already identified
>> as private fields in the public API, and are stale outside of Xen's
>> interrupt/exception/syscall handler.  They're also a very minor information
>> leak of which event caused the last deschedule of a vCPU.
> I think my prior remark towards tools like xenctx wasn't really addressed.
> Then again that particular tool doesn't use the fields now, so apparently
> no-one ever saw a need.

Oh, sorry.  I did specifically look (everywhere in tools, not just
xenctx), and they're not used at all.

Xenalyze uses an error_code, but that's a field name from the EPT/NPT
fault trace record, not from cpu_user_regs.

Finally, the observation about the information leak.  The information
present is often the timer interrupt (end of time-slice), or the event
check IPI (from vcpu_pause()).

gdbsx is the only utility that stands a chance of reliably using
->entry_vector, and even it doesn't because that's not how GDB works.

Overall, I'd say people have been pretty good at following the /*
Private */ note in the public ABI.


>
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1233,7 +1233,24 @@ int arch_set_info_guest(
>>  
>>      if ( !compat )
>>      {
>> -        memcpy(&v->arch.user_regs, &c.nat->user_regs, sizeof(c.nat->user_regs));
>> +        memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));
> Any reason to have this and ...
>
>> +        v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
>> +        v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
>> +        v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
>> +        v->arch.user_regs.rsi               = c.nat->user_regs.rsi;
>> +        v->arch.user_regs.rdi               = c.nat->user_regs.rdi;
>> +        v->arch.user_regs.rbp               = c.nat->user_regs.rbp;
>> +        v->arch.user_regs.rax               = c.nat->user_regs.rax;
>> +        v->arch.user_regs.rip               = c.nat->user_regs.rip;
>> +        v->arch.user_regs.cs                = c.nat->user_regs.cs;
>> +        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
>> +        v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
>> +        v->arch.user_regs.ss                = c.nat->user_regs.ss;
>> +        v->arch.user_regs.es                = c.nat->user_regs.es;
>> +        v->arch.user_regs.ds                = c.nat->user_regs.ds;
>> +        v->arch.user_regs.fs                = c.nat->user_regs.fs;
>> +        v->arch.user_regs.gs                = c.nat->user_regs.gs;
>> +
>>          if ( is_pv_domain(d) )
>>              memcpy(v->arch.pv.trap_ctxt, c.nat->trap_ctxt,
>>                     sizeof(c.nat->trap_ctxt));
>> @@ -1241,7 +1258,24 @@ int arch_set_info_guest(
>>  #ifdef CONFIG_COMPAT
>>      else
>>      {
>> -        XLAT_cpu_user_regs(&v->arch.user_regs, &c.cmp->user_regs);
>> +        memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));
> ... this separate, rather than putting just one ahead of the if()?

Code generation.  If you hoist the memset(), it can't be merged with the
assignments.

Although I see now it's not even attempting the mere (it was in the
past), and I don't care enough to argue, so I'll change it.

> Preferably with that adjustment:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

