Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7734BB0454A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 18:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042989.1413109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLuL-0004Lu-G2; Mon, 14 Jul 2025 16:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042989.1413109; Mon, 14 Jul 2025 16:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubLuL-0004JN-DO; Mon, 14 Jul 2025 16:20:01 +0000
Received: by outflank-mailman (input) for mailman id 1042989;
 Mon, 14 Jul 2025 16:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rdIu=Z3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ubLuK-0004JH-06
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 16:20:00 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6072d032-60ce-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 18:19:54 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-455e6fb8057so32106335e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 09:19:54 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456009ec9c8sm84059605e9.39.2025.07.14.09.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 09:19:53 -0700 (PDT)
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
X-Inumbo-ID: 6072d032-60ce-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752509994; x=1753114794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/lx04w2TZzJuDMRDuyLitUwAtArtpxLoz0pQGxXgxt4=;
        b=EUAM6XdT4fyVzy29E2rxcH6lLAU+eiWCRyXjsjd1Gqf9+auxtTG04YboLhjoj9NQui
         jDlRUvADEV2Qr4qXVKq0HGnUTnzAKhVKXBpCXOQWBUbciDKR1grDt6cNvSBchKo5EvV6
         jkHzASnqiLxk/vDctvfw2rCuGRQoSnoyG2Wqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509994; x=1753114794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lx04w2TZzJuDMRDuyLitUwAtArtpxLoz0pQGxXgxt4=;
        b=XLwxLqncr/uCSRZK78xlYS5FOmgOsZqG9jeRp6UcTIjwAgDmd25u426LlFYlQdVM0J
         Rufv0bJnlH1Z8DKn0ePeFS/olUsScy6a05LhhQrB+FGIlOtq99p+EAN4dhP5Kn0RfsYR
         pNqZm/XnAXgXTt1y10gJdB8EoKPcL8W7sub1tVS0PR6pNYtoio22wjQn6YBESvHYFW5X
         DT2e3QphCLzOBpyPMz8fZfu8xOGI6e9L5oVO0QpqnWzX4j2/S8ABw5k/0TbbMwF1s+st
         hI1OVqJHDptwVSwBcWQ4VeZHTh6VkvwW92JPg4QQnAGR4ewZkqfYPISpc0ujKcIgfYW5
         Astw==
X-Forwarded-Encrypted: i=1; AJvYcCXAquYwJHYP62nfVpu/B9g4IE97eeeZgTL3D9KE06p6m9IfD5ObPfMQO+KS4FRzZNnH635PLA6r4UU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy66TKuewW4IE2FGO9R2D+AwSBiXyczqcxSTIPNkQ5x+xKUo8z1
	wJG7aEol5bOih6sP5x4JH4LEa54FicAdV9tfPB9PNwFkG/O0T5erIZoVkQxxpUrdTL0zBRIh0tj
	yX6B29pc8Kg==
X-Gm-Gg: ASbGncv48TcXHbDEDwp9r2jzb+2vRQjAVqjaHkAo8LeahUBlZRRAZEZ2I0Ag9zy2oaE
	oFAvUwgHpD6d2hWLKfLStEGIBjTbTIJZhleciY7FiMeJV2f+z+CXzOjZYfGtX8qoVo+1Wfe9dGK
	RZyRrV4UZ2HkgmePVHmEv+oEMMj9O9/DG5UKOmEwJfhu9j5s99XpEIklmW4B54M2j5ok6pobWz1
	uDoxEKo/L8lYCRsYzpqLfbNgz4Oyo4AgXDyyJuJxIks80HBDBdK1GwNhwWp00twcSOWg6u7lkQ0
	JdtqNNvzHMPy0v9drAwl/TWZ9EaM6dywIudFU5kI2h1//1yQA8r0ujTxQ2VFUd+Ttdt5d5H18u2
	aFgOzuTpSYnatsGJtHobPGDGiMh61dEJkEiCeNl1Y3SwjevMkIcNzKY36ojYozvLpUoSj
X-Google-Smtp-Source: AGHT+IHEe7qkoLgyyDfdeALnM7nhbHID/aErm4dgFGHK5/E71UwR2LViQc4n3CEyjxiTvRRta6qENQ==
X-Received: by 2002:a05:600c:6092:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-4560e39eed0mr73768195e9.14.1752509994128;
        Mon, 14 Jul 2025 09:19:54 -0700 (PDT)
Message-ID: <2924fcc9-367b-4c05-a6bb-30c5b610107f@citrix.com>
Date: Mon, 14 Jul 2025 17:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86emul: adjust BSF/BSR/LZCNT/TZCNT behavior as to
 EFLAGS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8c4df1bc-4fdc-4e96-ae67-ea23870d2725@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8c4df1bc-4fdc-4e96-ae67-ea23870d2725@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/07/2025 5:02 pm, Jan Beulich wrote:
> SDM revision 087 points out that apparently as of quite some time ago on
> Intel hardware BSF and BSR may alter all arithmetic flags, not just ZF.
> Because of the inconsistency (and because documentation doesn't look to

It's probably worth saying errata explicitly.  There are a whole bunch
of Intel CPUs where the behaviour doesn't match CPUID.

> be quite right about PF), best we can do is simply take the flag values
> from what the processor produces, just like we do for various other
> arithmetic insns. (Note also that AMD and Intel have always been
> disagreeing on arithmetic flags other than ZF.) To be both safe (against
> further anomalies) and consistent, extend this to {L,T}ZCNT as well.
> (Emulating the two insns correctly even when underlying hardware doesn't
> support it was perhaps nice, but yielded guest-observable
> inconsistencies.)
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is one of the more messy parts of x86, and that's saying something.

> ---
> v2: Use emulate_2op_SrcV_srcmem() also for {L,T}ZCNT.
>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -5270,62 +5270,26 @@ x86_emulate(
>          break;
>  
>      case X86EMUL_OPC(0x0f, 0xbc): /* bsf or tzcnt */
> -    {
> -        bool zf;
> -
> -        asm ( "bsf %2,%0" ASM_FLAG_OUT(, "; setz %1")
> -              : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
> -              : "rm" (src.val) );
> -        _regs.eflags &= ~X86_EFLAGS_ZF;
> -        if ( (vex.pfx == vex_f3) && vcpu_has_bmi1() )
> -        {
> -            _regs.eflags &= ~X86_EFLAGS_CF;
> -            if ( zf )
> -            {
> -                _regs.eflags |= X86_EFLAGS_CF;
> -                dst.val = op_bytes * 8;
> -            }
> -            else if ( !dst.val )
> -                _regs.eflags |= X86_EFLAGS_ZF;
> -        }
> -        else if ( zf )
> +        if ( vex.pfx == vex_f3 )
> +            emulate_2op_SrcV_srcmem("rep; bsf", src, dst, _regs.eflags);

Do we need the ; ?

We surely don't on 4.21, but I presume there are bugs in older
binutils?  (All Clangs back to 3.5 seem happy)

~Andrew

