Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21819C656D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 00:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834997.1250824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB0aO-0007gF-Bn; Tue, 12 Nov 2024 23:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834997.1250824; Tue, 12 Nov 2024 23:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB0aO-0007dO-7P; Tue, 12 Nov 2024 23:46:16 +0000
Received: by outflank-mailman (input) for mailman id 834997;
 Tue, 12 Nov 2024 23:46:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tB0aM-0007dD-PO
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 23:46:14 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a7756da-a150-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 00:46:09 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so59690595e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 15:46:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f80afsm3303475e9.10.2024.11.12.15.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 15:46:08 -0800 (PST)
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
X-Inumbo-ID: 4a7756da-a150-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRhNzc1NmRhLWExNTAtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDU1MTY5LjM0MzQzOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731455168; x=1732059968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9vEL4FdqPkq5A8Q5DVD1tTlmAXK1QOAh8DBAZiZx87I=;
        b=JIU2ZhzqFypFR/DhV471MK72VTkd+mUFulY7w4TVEnmYLdBUj1tzFO1eK7DLvkDj4F
         CuvXEfmk5EGcOCMxPPN9LkJ8TVgB/ukO8L1BPU7qSh4x74yH9CwiQYxUHQEqyYlw20A4
         5MDwx6tWvCg2g+mle93rmA2UXRrGCAiGfS/3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731455168; x=1732059968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vEL4FdqPkq5A8Q5DVD1tTlmAXK1QOAh8DBAZiZx87I=;
        b=vsWzfnKMAOFPqdZ4n4TOeH1pQz7ncHPkipXZZ32HJo+9m5nXGQcam2JBUvaTQYHSlG
         pOORFeS4LTNZxKxo6au43dliRfTrbxtZ5I5JTfU8GT2PW6DX0apffegSXLbJDgTFE46/
         NWQCTKShc0UQ9doNFHxwOWp0Biakd7lM/jDyD5Mo8qfIdpSb6XAJUakpL3ddIMnvCkLu
         mgpOHOxtPDtLsjUla90DWLhDLD9TJPreaLX7lsZTxHNJO4oUj80U1ykm/mjTh1x/qG6d
         UEv1kWK5oXK7WB/ggPKCZAnh+p9FUAzcMzirhSijG/m3rtL5e77j1OVfDfH5dWNm+NCT
         VXrg==
X-Forwarded-Encrypted: i=1; AJvYcCUql8Jy2giD2Y9nZf2n58zZ6186g77oHW4Ul2d1U3ygtsnfSMJwSbpWdxjM3Qc7m1uKc5hJbHI/2xg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXs1lp4O3rBtxQ7jt26lMxViy6EEQmVt4HaQz7/Id7mvIyXjcR
	wEztGFxStZRqDauUU44su9lOvFThNvcV3RhfGmVcqyMDwKSR4LxLMwwX6ZGY5Dg=
X-Google-Smtp-Source: AGHT+IEv9tVfP1eFFj5CthtQSJlG3335oizZne61jG44N/Nsi6G8jNQkWTERtLjaQLlOnRUYpJLuUQ==
X-Received: by 2002:a05:600c:510c:b0:426:647b:1bfc with SMTP id 5b1f17b1804b1-432b751cb7cmr161240865e9.30.1731455168629;
        Tue, 12 Nov 2024 15:46:08 -0800 (PST)
Message-ID: <af2715ab-987c-4e90-a3a0-c136f2e8d8d7@citrix.com>
Date: Tue, 12 Nov 2024 23:46:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86emul: correct EFLAGS testing for BMI1/BMI2
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
 <04602af0-9a03-4d43-beb3-28b76e2cad33@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <04602af0-9a03-4d43-beb3-28b76e2cad33@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/11/2024 2:59 pm, Jan Beulich wrote:
> Apparently I blindly copied the constants from the BEXTR case, where SF
> indeed wants leaving out. For BLSI, BLSMSK, BLSR, and BZHI SF is
> defined, and hence wants checking. This is noticable in particular for
> BLSR, where with the input we use SF will be set in the result (and
> hence is being switched to be clear on input).
>
> Convert to using named constants we have available, while omitting DF,
> TF, as well as the MBZ bits 3 and 5 from the masking values in the
> checks of the produced output. For BZHI also set SF on input, expecting
> it to transition to clear.
>
> Fixes: 771daacd197a ("x86emul: support BMI1 insns")
> Fixes: 8e20924de13d ("x86emul: support BMI2 insns")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

That's horribly subtle, but I think I've been staring at the manuals
long enough.

However, there's a related bug elsewhere.  I recently learnt that the
rotate instructions are different between vendors.  AMD leaves CF/OF
well defined, others preserved, while Intel has CF well defined, and
others undefined (seemingly zero in practice, but clearly there's a very
old processor which wasn't).

We test RCL and happen to fall into a common subset between vendors.  At
least the emulator itself dispatches to real instructions, so guests
ought to see the behaviour correct for the CPU.

>
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -1969,10 +1969,13 @@ int main(int argc, char **argv)
>  
>          *res        = 0xfedcba98;
>          regs.edx    = (unsigned long)res;
> -        regs.eflags = 0xac2;
> +        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_SF | \
> +                      X86_EFLAGS_ZF;
>          rc = x86_emulate(&ctxt, &emulops);
>          if ( (rc != X86EMUL_OKAY) || regs.ecx != 8 || *res != 0xfedcba98 ||
> -             (regs.eflags & 0xf6b) != 0x203 || !check_eip(blsi) )
> +             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
> +              (EFLAGS_ALWAYS_SET | X86_EFLAGS_CF) ||

As an observation, this is really wanting for an EFL_SYM() helper like
the others I have in XTF  (I haven't needed one for flags specifically).

The verbosity definitely interferes with the clarity.

~Andrew

