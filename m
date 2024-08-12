Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CB94EDA2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775479.1185686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUih-0006Oi-La; Mon, 12 Aug 2024 13:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775479.1185686; Mon, 12 Aug 2024 13:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUih-0006Mj-Ij; Mon, 12 Aug 2024 13:04:19 +0000
Received: by outflank-mailman (input) for mailman id 775479;
 Mon, 12 Aug 2024 13:04:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0sR=PL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sdUig-0006Md-Oi
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:04:18 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60814b29-58ab-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 15:04:15 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ad02501c3so519208066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:04:15 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb0e0643sm228062366b.47.2024.08.12.06.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 06:04:14 -0700 (PDT)
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
X-Inumbo-ID: 60814b29-58ab-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723467855; x=1724072655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+3HOJlQ0IGpR2wCuV6uV+BTcwB/YqqQtFkrIQUjEqQ=;
        b=pQZ9kvntVgp9BaXA0DU0irno10a5CtF9AlzxZzanEbcSm+/sXxvBczYzrgXyqhBA2k
         TCE02aam/pCsL6REJnVrlKfSKMxJ2nV1Ht8OdbtwAGqY8Rp8CKXyJoLmWPRzyZsBEa+L
         nFu3LBLHhE2ijeUcJ8go+EDWAM9DkrpAawLN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467855; x=1724072655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+3HOJlQ0IGpR2wCuV6uV+BTcwB/YqqQtFkrIQUjEqQ=;
        b=HMGTQ9qf9oTAvRk3yCUUAL02e7CAq8EfbwQ4NCjq8mx8CrPR/UVYwqq1OOk28WYvQ6
         0Snu3RWU5nmiqGvpXm0VnDaqvi/JyTZ5f/HcCvIO+m8KxY72qD6FChbyEk1N5sMaVXsd
         StfKrgsYoGAFZOdfRwC69mDTDVawfLYha3w5/8vVT54phwBoI+A0XqYX+Blop0Sk1Erh
         Y2DYRmvhKfZ0Jq+DWkSPA8tePzWtd3OeNwZt2z0YKvUjWkJAcRcVGa+wGDIVYQXfX3NC
         stVkki3LEI7P1Wef7HfxxMIRpUAxWAr3ilh9xt0gDqvCL1GwozU3ygIYlMY88HfbnHEW
         nPbA==
X-Forwarded-Encrypted: i=1; AJvYcCW966qfC7QLzalV3P+hTM9ZI8Mh61mewEOpgd0V9vWMObLLWldlEuEY3x9Bu39Nal56IeKjQufD+3gGlt7mzXHQJwtaAY2rBkmwFY2Vnng=
X-Gm-Message-State: AOJu0YzyPcjacZlxpq9oaY5HTA5WazeIbehgW+7u8b1HM1+HbgZBgeK9
	Y9PP32bOID2+PRIXzk+9CXA4zHfVp8SmkXd4rVYoMvTII30ad2f8Cy+za5pTprgLy6PjCSTEZib
	C
X-Google-Smtp-Source: AGHT+IHk03lz1T/6miy2aoL4WJ28V9nwqCGCnf7/ib91Ka4pBOw3ifiGQKlRgAJrTRpJ9LjTa5xrxw==
X-Received: by 2002:a17:907:c8a3:b0:a7a:3928:3529 with SMTP id a640c23a62f3a-a80ed1bfe86mr20242066b.13.1723467854716;
        Mon, 12 Aug 2024 06:04:14 -0700 (PDT)
Message-ID: <a7d15429-ce49-43b1-9bbd-7b0129094388@citrix.com>
Date: Mon, 12 Aug 2024 14:04:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: don't call ->read_segment() with x86_seg_none
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <81ae365f-98b4-4bb6-bbb6-c5423dfda038@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/08/2024 2:26 pm, Jan Beulich wrote:
> LAR, LSL, VERR, and VERW emulation involve calling protmode_load_seg()
> with x86_seg_none. The fuzzer's read_segment() hook function has an
> assertion which triggers in this case. Calling the hook function,
> however, makes little sense for those insns, as there's no data to
> retrieve. Instead zero-filling the output structure is what properly
> corresponds to those insns being invoked with a NUL selector.
>
> Fixes: 06a3b8cd7ad2 ("x86emul: support LAR/LSL/VERR/VERW")
> Oss-fuzz: 70918
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> It is pure guesswork that one of those insns did trigger the assertion.

Tamas handed me the repro seeing as I don't have access to the bugs.  It
was VERR/VERW.

> The report from oss-fuzz sadly lacks details on the insn under
> emulation.

I've got a still-pending patch to add `--debug` to the harness to dump
that information.

> I'm further surprised that AFL never found this.

I haven't done any AFL testing since 06a3b8cd7ad2 was added.

This crash is specific to VERW/etc with a NULL selector, which will be a
rare combination to encounter.

>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -839,7 +839,8 @@ protmode_load_seg(
>          case x86_seg_tr:
>              goto raise_exn;
>          }
> -        if ( !_amd_like(cp) || vcpu_has_nscb() || !ops->read_segment ||
> +        if ( seg == x86_seg_none || !_amd_like(cp) || vcpu_has_nscb() ||
> +             !ops->read_segment ||
>               ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
>              memset(sreg, 0, sizeof(*sreg));
>          else

While this fixes the crash, I'm not sure it will behave correctly for
VERR/VERW.

protmode_load_seg() is unconditionally X86EMUL_OKAY for a NULL selector,
and VERW checks for type != 0x8 which an empty attr will pass.

Interestingly, both Intel and AMD state that the NULL selector is
neither readable nor writeable.

Also, looking at the emulator logic, we're missing the DPL vs
CPL/RPL/Conforming checks.

~Andrew

