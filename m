Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68360A9866B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 11:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964322.1355153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7WjC-0006yc-SV; Wed, 23 Apr 2025 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964322.1355153; Wed, 23 Apr 2025 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7WjC-0006wU-Po; Wed, 23 Apr 2025 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 964322;
 Wed, 23 Apr 2025 09:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7WjB-0006wM-3b
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 09:49:13 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34fb1a49-2028-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 11:49:11 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so70203385e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 02:49:11 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2d4fesm19785955e9.20.2025.04.23.02.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 02:49:09 -0700 (PDT)
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
X-Inumbo-ID: 34fb1a49-2028-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745401750; x=1746006550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E9z8WYu2YkEl92gvtQRHs8SL0SIMlXuE5V2XXUc3aGY=;
        b=gbUqnWmbpzideMHvzeGnD/OQwXxiWzGRnJ5iJ5EfWyraaLXsFKwRbgRTE3or5iP2Q2
         /Rh/XAXzmeL6RVqAjmOMrchVx/d47BAfB1xsAFxvpXQ0c8F3jGhB7CXulT9DX08MdsbN
         iMVSkHXj6QTNoSaaG8JyxEALONaKEQJPuJzEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401750; x=1746006550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9z8WYu2YkEl92gvtQRHs8SL0SIMlXuE5V2XXUc3aGY=;
        b=pFaw+zB5aW9ytQCv9dRzU5z9oa6VSCGTR/c6Ef2XCFpUMq/z2ZVj4XFiR6qhHOi98X
         elcTUSH2AO80PnCBGOfsUlb57NYYi4mP2gUR+F/ra6f8mdSjTPQFZpl+1M5PCIJnhd/z
         2l2DWob1ZMUGGy5dmIHwBUPSiJdQcvu18d2v6V5nZGTBf+LlfyCCnLFmWOdtrbDSnFGm
         nqyeJHyJWkgZXpQBx3KyGyr7qVJ5701j/MiBjEMmupSStSzXvjU82Z+gOr8nmVeMB+OS
         d1vZLHRZifhdgFeNg/U65JNgp/fNTb0wdqf4LdvhFAigd3EtVQouCHpKijBhxPd9ILN5
         G8sg==
X-Forwarded-Encrypted: i=1; AJvYcCXk42zXAA4ZFHTgPDzbLVoYZHJVNgG3J2uESkiHqiJqBx9zJOUmAO0evogOR6bSsQOCOECBFQ5euU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYjPKXbQqEx1msXkr4AeZ8JNZJl499OF6TLSB3GMA7ki3m0ZvN
	tsUBMXYJbPAttk3MWo/eT1VNoOabsp7gKPCMbvyB9400jb6E/wQX5vRN31U3uK60J7zDslIEMDG
	lCww=
X-Gm-Gg: ASbGnct9OQ2qDHXZDl5dwxSdfRFxLfX27OyX7M6W541/IHkqrn+phZ/nGSDFTrR6vVP
	ZIZyiA1PYwCcM22exoJnwUAvKnG8T9ILnFW2gagumvS3pi1/gIy1h69HCPwm3RXYKpTgzxgo08d
	ZV0aKiY1LmtVBT9fX/2c76b2clCxKv4Db8HFzUlT+kiykCnFn/Yta/ic8q3LmTw/ohGe7JRSamM
	iN53qwfaBSrknWNOWFkqdqYvGSsfXUbeXlY0Ys38Qiuqonm9akfd+MakS05Vb/+3lVuatpmUOBu
	r1fzjRvbYrvvzy7nomZR3CsZp0SojcBKUYct9al7v9VfvGo81wwBpfJJH6NE5BDj
X-Google-Smtp-Source: AGHT+IGSPZf3mOyb57Fn1BMD8eApxx8FxU5TP+Ec1V6GitQiQZ3z+hDwcd1FUi68oa2nzzxBrYCmMA==
X-Received: by 2002:a05:600c:5491:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-4406abfa9d3mr141199175e9.22.1745401750182;
        Wed, 23 Apr 2025 02:49:10 -0700 (PDT)
Message-ID: <fc49cdec-69aa-4ae0-8d8e-cf6d6ba8fb74@citrix.com>
Date: Wed, 23 Apr 2025 10:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: adjust BSF/BSR behavior as to EFLAGS
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <df3f3203-d660-4b7d-b771-871d16a8ec43@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <df3f3203-d660-4b7d-b771-871d16a8ec43@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2025 7:13 am, Jan Beulich wrote:
> SDM revision 087 points out that apparently as of quite some time ago on
> Intel hardware BSF and BSR may alter all arithmetic flags, not just ZF.
> Because of the inconsistency (and because documentation doesn't look to
> be quite right about PF), best we can do is simply take the flag values
> from what the processor produces, just like we do for various other
> arithmetic insns. (Note also that AMD and Intel have always been
> disagreeing on arithmetic flags other than ZF.)

The new footnote Intel have added about "older processors" does match
AMD, saying "unmodified".

I think it's clear now that Intel and AMD behaviour was the same
originally, except AMD wrote "unmodified" and Intel wrote "undefined",
and Intel used this flexibility to alter the behaviour.

>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Since I happened to look at it, I wonder whether for e.g. SHLD/SHRD we
> wouldn't be better off using _emulate_2op_SrcV_nobyte() as well; we
> already do so in x86_emul_rmw(), after all.

Probably a good move.

>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -5268,16 +5268,14 @@ x86_emulate(
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
>          if ( (vex.pfx == vex_f3) && vcpu_has_bmi1() )
>          {
> -            _regs.eflags &= ~X86_EFLAGS_CF;
> +            bool zf;
> +
> +            asm ( "bsf %2,%0" ASM_FLAG_OUT(, "; setz %1")
> +                  : "=r" (dst.val), ASM_FLAG_OUT("=@ccz", "=qm") (zf)
> +                  : "rm" (src.val) );
> +            _regs.eflags &= ~(X86_EFLAGS_ZF | X86_EFLAGS_CF);
>              if ( zf )
>              {
>                  _regs.eflags |= X86_EFLAGS_CF;
> @@ -5286,25 +5284,23 @@ x86_emulate(
>              else if ( !dst.val )
>                  _regs.eflags |= X86_EFLAGS_ZF;
>          }
> -        else if ( zf )
> +        else
>          {
> -            _regs.eflags |= X86_EFLAGS_ZF;
> -            dst.type = OP_NONE;
> +            emulate_2op_SrcV_srcmem("bsf", src, dst, _regs.eflags);
> +            if ( _regs.eflags & X86_EFLAGS_ZF )
> +                dst.type = OP_NONE;

On Intel, BSF/BSR writes back the destination register.  Notably, it
gets 0 extended per normal rules, which is why you have to be extra
careful when using the trick of preloading it with -1; the result must
be interpreted as (int) even over a 64bit operation.

This needs an amd_like() qualification to override dst.type.  This
aspect genuinely is different between them.  Alternatively, we might be
able to set the operand size always to 64 and write back the entire
register as the processor gave to us, but I'm not sure if that will have
effects elsewhere.

Finally, I'm wary leaving TZCNT/LZCNT using the old logic.  Despite the
absence of an update in 087, I find it unlikely that they behave
differently WRT flags (specifically, I severely doubt they've got
differing circuitry).

I'd suggest giving them the same fully-emulated treatment as BSF/BSR.

~Andrew

