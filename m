Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87389D9DED
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 20:17:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843997.1259554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG12o-0003EX-6O; Tue, 26 Nov 2024 19:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843997.1259554; Tue, 26 Nov 2024 19:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG12o-0003Cl-3Z; Tue, 26 Nov 2024 19:16:18 +0000
Received: by outflank-mailman (input) for mailman id 843997;
 Tue, 26 Nov 2024 19:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdLj=SV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tG12m-0003Cf-NL
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 19:16:16 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4dffe08-ac2a-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 20:16:12 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ff550d37a6so66462081fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 11:16:10 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2f5f4dsm623690766b.75.2024.11.26.11.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 11:16:08 -0800 (PST)
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
X-Inumbo-ID: e4dffe08-ac2a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmEiLCJoZWxvIjoibWFpbC1sajEteDIyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU0ZGZmZTA4LWFjMmEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjQ4NTcyLjEzNDEwNCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732648569; x=1733253369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=th2Dxgt6XLNKQTpifGdPLzm0rzBd+Cd/NWYoZj2UBsc=;
        b=hnUSKGaJGiYInYGX4yU2rZ9WJoq0Bt4KSwrdwuDBIC7aLLMq6SStqor/lxaXkm4lwf
         UuKT8EtcXbfZOiwwlMEcvGN8qUR5wZwiBLCEJ+lK8ZUxiCy9IRH7qVDKENu3OU0ot1wF
         vOUR8C70sXOAItRSALi45GtybA6WDjVAmYQls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732648569; x=1733253369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th2Dxgt6XLNKQTpifGdPLzm0rzBd+Cd/NWYoZj2UBsc=;
        b=V0IpT1YC8B+Lm3MhRRFjlNIxaEJQIzzflMqzpKbd/Lr6KWbrv43JrZmO88aVvI16vN
         /eyhcMl0r0+1u3GAibLrKrIBAuiNkqQG5Cq8J68MrMLJaeCiNeRGenqBJF9DOv3sq4Z1
         Q4VIMsq/0nVqh5wMdgHhD5jyS8IzlMmORfdkNRnMFQ433s+0S1PirF6rsfPhCt9xevJ5
         iU1ovnwpqauhp1sdNygUai+a/GjKFoCHOGjdiWYAtOvYbuCpMAhSolEXS/n0AaxkEbru
         ofUe7s63ELPZ/rvxl0u/Y1M1x6WUC21zJKwhdT4+Qj5IFEG5SmyMNTnx4u8ATaJ/FN1M
         B5Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWSJllK1+Ahio/bGtf43HkI+w4LY/Siz8Y/2iqZ7V+RBUWVZULsAS3bEjEP8s6JPrMbM6qp+k7YqNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwM8z2ctVM08UGhe59yiKf49xKnDVVOQzIKMhQYqPtneViUJpg4
	53nziBTjyYrMv4TcmNAAku42C71KUXzXBE9nRAPM6pY6Ya03fzLB+kfvlp8C8JE=
X-Gm-Gg: ASbGncuB/4OoV9j0Fz/fahv+FgV+1+iKoCHdyJr6XwYYe6LXfcxbow+2SVcBeD0UC4X
	sHT1/k4QsbAbzzgLxqoS/AMPACzUkQWxFF8HVUAWrgBEPTlw547AYFavBwRo5PPY+18Q0dieTua
	6uIoHSIMV6KhL4mbC5XsvDAyM8Djc/yP6vkrdu80qUYthkpfERPBQ/buIE0u03CNiIpZdoxCqkB
	N0BeAqnIJpsqPw9U2DflG7ZLMghZ6A0YDLGy3UoY+FemJb0WajbIYfAHQfdEuk=
X-Google-Smtp-Source: AGHT+IHyhoVbIOjtgSzj7WbtlUIpmDWBXi4QjdkiqSZWSJ7CtToxt7XyPQ+WECYmgXLd7alWW8Z/Ag==
X-Received: by 2002:a05:6512:b03:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-53df00ff809mr125874e87.42.1732648569395;
        Tue, 26 Nov 2024 11:16:09 -0800 (PST)
Message-ID: <2cb12ee6-3acd-4667-9882-4d36466a7da8@citrix.com>
Date: Tue, 26 Nov 2024 19:16:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] x86: re-work memcpy()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <c2aa4307-230b-4287-b9e4-6d7d84dba490@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c2aa4307-230b-4287-b9e4-6d7d84dba490@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2024 2:28 pm, Jan Beulich wrote:
> Move the function to its own assembly file. Having it in C just for the
> entire body to be an asm() isn't really helpful. Then have two flavors:
> A "basic" version using qword steps for the bulk of the operation, and an
> ERMS version for modern hardware, to be substituted in via alternatives
> patching.
>
> Alternatives patching, however, requires an extra precaution: It uses
> memcpy() itself, and hence the function may patch itself. Luckily the
> patched-in code only replaces the prolog of the original function. Make
> sure this remains this way.
>
> Additionally alternatives patching, while supposedly safe via enforcing
> a control flow change when modifying already prefetched code, may not
> really be. Afaict a request is pending to drop the first of the two
> options in the SDM's "Handling Self- and Cross-Modifying Code" section.
> Insert a serializing instruction there.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> We may want to consider branching over the REP MOVSQ as well, if the
> number of qwords turns out to be zero.
> We may also want to consider using non-REP MOVS{L,W,B} for the tail.

My feedback for patch 2 is largely applicable here too.

>
> TBD: We may further need a workaround similar to Linux'es 8ca97812c3c8
>      ("x86/mce: Work around an erratum on fast string copy
>      instructions").

Ah, so you found that erratum.  I'd say there's lower hanging fruit to
go after in the MCE logic before we get to this.

> ---
> v3: Re-base.
>
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_INDIRECT_THUNK) += indirect
>  obj-$(CONFIG_PV) += ioport_emulate.o
>  obj-y += irq.o
>  obj-$(CONFIG_KEXEC) += machine_kexec.o
> +obj-y += memcpy.o
>  obj-y += memset.o
>  obj-y += mm.o x86_64/mm.o
>  obj-$(CONFIG_HVM) += monitor.o
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -153,12 +153,14 @@ void init_or_livepatch add_nops(void *in
>   * executing.
>   *
>   * "noinline" to cause control flow change and thus invalidate I$ and
> - * cause refetch after modification.
> + * cause refetch after modification.  While the SDM continues to suggest this
> + * is sufficient, it may not be - issue a serializing insn afterwards as well.

Did you find a problem in practice, or is this just in case?

I suspect if you are seeing problems, then it's non-atomicity of the
stores into memcpy() rather than serialisation.

>   */
>  static void init_or_livepatch noinline
>  text_poke(void *addr, const void *opcode, size_t len)
>  {
>      memcpy(addr, opcode, len);
> +    cpuid_eax(0);

This whole function is buggy in a couple of ways, starting with the
comments.

The comment about noinline and control flow changes is only really
relevant to 32bit processors; we inherited that comment from Linux, and
they're not applicable to Xen.

AMD64 (both the APM, and SDM) guarantee that Self Modifying Code will be
dealt with on your behalf, with no serialisation needed.

Cross-modifying code needs far more severe serialisation than given
here.  We get away with it because alternative_{instructions,branches}()
are pre-SMP, and apply_alternatives() is on livepatches prior to them
becoming live.


I happen to know there's an AMD CPU which has an erratum regarding Self
Modifying Code and genuinely does need a serialising instruction, but I
don't know which exact CPU it is.

If we're going to put a serialising instruction, it should be a write to
CR2.  We don't care about 486 compatibility, and it's faster than CPUID
and much much faster if virtualised because it's unlikely to be
intercepted even under shadow paging.

But, it would be nice not to put serialisation in the general case to
begin with, especially not into the livepatching case.

~Andrew

