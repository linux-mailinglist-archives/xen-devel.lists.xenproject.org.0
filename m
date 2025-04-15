Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40028A89EE7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953868.1348269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fvv-0001Yp-JW; Tue, 15 Apr 2025 13:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953868.1348269; Tue, 15 Apr 2025 13:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fvv-0001Xo-GF; Tue, 15 Apr 2025 13:02:35 +0000
Received: by outflank-mailman (input) for mailman id 953868;
 Tue, 15 Apr 2025 13:02:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWT/=XB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4fvt-0001Xg-Ot
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:02:33 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e44393f6-19f9-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 15:02:31 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3183114f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:02:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae964025sm13979384f8f.6.2025.04.15.06.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 06:02:30 -0700 (PDT)
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
X-Inumbo-ID: e44393f6-19f9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744722151; x=1745326951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nk3Saw+DTJoEy8sUyy0vaRs5RLDc/qFrVNMOGXgR59E=;
        b=fDr8fdFpeLlvFo+nznNb1XXmCcU9UmtB+BZY5mZ9Tm1KS9VZpk3RkmridpMkPBeqOM
         vUo8mZviZfdfFXkmczDnzEe/TA4RZgAgeZcRWJ3pTUjnW3zyBLexe5NS0egmYNtW5fTN
         QW4eRYKtPME4TLaFcUMmT0ozLkQdyK2gpNhKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722151; x=1745326951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nk3Saw+DTJoEy8sUyy0vaRs5RLDc/qFrVNMOGXgR59E=;
        b=Zkii8WKoBlwJTUJ7GV9lSWtMDtXuDPjQNAVvj8XNjeLAxab8vRjFj5ZrcmRgl7A70t
         zdlzN0ftiseOd1zwQLcPrP/GgCxF4FN2kPqQJQ3uLmXTy3QA3kl3fgf6ZzE/vzFmqGhq
         uFUVu/yAL1cEAASdAblE8wCCRDGZ3m4WShXIG2b4x13TsqkZtXRKM3o0uRTuoJ+JtYEq
         xSYxs2JmeCpyOqMYbIPU9uDsU55C7urfV4o8HoF0VaNVFOEzXfFmGFtLsCDVwXDiInux
         YQVNdiibE59DwT0MCFgZBQ9sl9CzhK3ZyFIGaw/S5R70OrCijZpabFwkg2u1ZK7Mgb+i
         Ncqg==
X-Forwarded-Encrypted: i=1; AJvYcCVLNL+Z9PtwyDLVFsAUU/V0u+L8Df3lGlS13+SNF0bCYoxoV/meVtbvYt3xTYaUuQBM8DMeORRrxrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyP+ve7uIIh+nWHiKbYNxFKWuqnRnPmST//MNbQCO+0CytQCDP
	xpvvv0IUVKxpLhvVEwjN1Gd5r7jomqc8UdbUuRptRss/sgYmyQk58UoqNkqesgE=
X-Gm-Gg: ASbGncvyVq0e6qjs91KF3qZu4Eagllp6JBlp2k+nc2o6FhDmaPQXGiT3et4pID5ac+c
	zM/8+ZZDxbVpebPbfs9uigePshrOHJ+1iplOBU6fjKnCGDZpbhD3QR0h1a8r1Njww1f4NmC+kDK
	+kDwGvMs8zBwff+kZcmwbZwclOSG8V4y9mYWFNWEqgcqeGLq4BY2/GU8/O6m99rzr+AD4xdzEd/
	xRVQOaP0vo/xx5TdQbsX7I73aujFVbIQHWTepEiIFhq0v8BwoFVZGcDeKzof4mH53O6L4g6kWjY
	CVEU1p9yJrS65PzWCSF/UgpsyW+aYxfJqXRY1hIiZK1U8tyjau1x+XVoZ0O5QLeVz6AI+4dFwBE
	eWHo/WQ==
X-Google-Smtp-Source: AGHT+IGpe1JgM0whpu3fomJsQoMvlrd3kXxVk+o6ARucToocjK5mPVo2Nc/GJcGECapfMAPo7dRGsw==
X-Received: by 2002:a05:6000:420a:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39ea51f5d65mr12690932f8f.22.1744722151108;
        Tue, 15 Apr 2025 06:02:31 -0700 (PDT)
Message-ID: <fa03d268-4175-4315-87af-0203104635c8@citrix.com>
Date: Tue, 15 Apr 2025 14:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Fix UBSAN in hvm_emulate_insn_fetch
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <91bd66eae876b940b09b3b650a21614e42ab0469.1744721279.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <91bd66eae876b940b09b3b650a21614e42ab0469.1744721279.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/04/2025 1:49 pm, Teddy Astie wrote:
> UBSAN complains when trying memcpy with a NULL pointer even if it's going to
> copy zero bytes (which are the only cases where a NULL pointer is used).
> Fix this by only doing the memcpy if the pointer is non-NULL.

Which compiler are you using?  (Just so there's a record.  These reports
are version-sensitive.)

>
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in arch/x86/mm/shadow/hvm.c:168:5
> (XEN) null pointer passed as argument 1, declared with nonnull attribute

Interestingly, this isn't a Xen annotation.  It must be coming from the
builtin.

And what we really want is nonnull_if_nonzero, but I bet that's not
available.

> (XEN) ----[ Xen-4.21-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d0402f789c>] common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
> (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d1v0)
> (XEN) rax: ffff82d040a82eb0   rbx: ffff83021b6e7808   rcx: 000000000000c458
> (XEN) rdx: ffff83021b6e7fd0   rsi: 000000000000000a   rdi: ffff83021b6e7808
> (XEN) rbp: ffff83021b6e77f8   rsp: ffff83021b6e77e8   r8:  00000000ffffffff
> (XEN) r9:  00000000ffffffff   r10: 0000000000000000   r11: 0000000000000000
> (XEN) r12: 000000000000004d   r13: 0000000000000000   r14: ffff82d040a82eb0
> (XEN) r15: 00000000002ffddc   cr0: 0000000080050033   cr4: 00000000001526e0
> (XEN) cr3: 000000021b7f4000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d0402f789c> (common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2):
> (XEN)  89 e5 41 54 53 48 89 fb <0f> 0b 48 8d 3d 1b cf 36 00 e8 b4 94 00 00 48 85
> (XEN) Xen stack trace from rsp=ffff83021b6e77e8:
> (XEN)    ffff82d040a82ea0 000000000000004d ffff83021b6e7820 ffff82d0402f8435
> (XEN)    0000000000000202 ffff83021b6e7d25 0000000000000000 ffff83021b6e7858
> (XEN)    ffff82d040455cb6 00000000002ffddc ffff83021b6e7ef8 ffff83021fbf1010
> (XEN)    0000000000000000 0000000000000000 ffff83021b6e7bd8 ffff82d0405b562b
> (XEN)    ffffffff00200033 ffffffff0020874b 00007cfde4918743 ffff83021b6e7af0
> (XEN)    0000000000000003 000000000000000a 0000000000000000 0000000440661f40
> (XEN)    ffffffff00000000 0000000000000000 00007cfd000000e8 ffff83021b6e79a8
> (XEN)    ffff83021b6e7980 ffff82d040d3fa90 00000000a00000e8 ffff82d0406904a0
> (XEN)    ffff83021b6e7cd8 ffff8302159963f0 ffff83021b6e7998 ffff82d04052f592
> (XEN)    fffffffa0000000a ffff83021b6e7b21 393082d040661f40 0000001000000033
> (XEN)    ffffffff00307b39 ffffffffe491868b ffffffff00200d00 00007cfde491867b
> (XEN)    ffff83021b6e7bb8 0000000000000003 0000000000000001 0000000000000000
> (XEN)    0000000000000000 0000000000000067 ffff8302159963f0 aaaaaaaaaaaaaaaa
> (XEN)    aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa
> (XEN)    aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa ffff83021b7fc008
> (XEN)    00000000000002ff ffff8302159963f0 0000000000000000 ffff830215994000
> (XEN)    0000000715994000 0000000000000000 0000000000000003 0000000000000000
> (XEN)    0000000000000000 8086000000008086 0000000000000000 0000000000000000
> (XEN)    0000000400000002 00000000002ffddc 0000000000000000 8086000000008086
> (XEN)    0000000000000000 0000000000000000 ffffffffffffffff 000000000000001f
> (XEN) Xen call trace:
> (XEN)    [<ffff82d0402f789c>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
> (XEN)    [<ffff82d0402f8435>] F __ubsan_handle_nonnull_arg+0x7c/0xb3
> (XEN)    [<ffff82d040455cb6>] F arch/x86/mm/shadow/hvm.c#hvm_emulate_insn_fetch+0xfb/0x100
> (XEN)    [<ffff82d0405b562b>] F x86_emulate+0x17f6b/0x3b8e3
> (XEN)    [<ffff82d0405dce4f>] F x86_emulate_wrapper+0x87/0x216
> (XEN)    [<ffff82d040489847>] F arch/x86/mm/shadow/guest_4.c#sh_page_fault__guest_4+0x908/0x3b34
> (XEN)    [<ffff82d0403ca3ac>] F vmx_vmexit_handler+0x1691/0x3439
> (XEN)    [<ffff82d040204683>] F vmx_asm_vmexit_handler+0x103/0x220
> (XEN)
> (XEN) ================================================================================

For this, we normally abbreviate it to just the relevant information, so
in this case:

(XEN) UBSAN: Undefined behaviour in arch/x86/mm/shadow/hvm.c:168:5
(XEN) null pointer passed as argument 1, declared with nonnull attribute
(XEN) ----[ Xen-4.21-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d0402f789c>]
common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
...
(XEN) Xen call trace:
(XEN)    [<ffff82d0402f789c>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
(XEN)    [<ffff82d0402f8435>] F __ubsan_handle_nonnull_arg+0x7c/0xb3
(XEN)    [<ffff82d040455cb6>] F
arch/x86/mm/shadow/hvm.c#hvm_emulate_insn_fetch+0xfb/0x100
(XEN)    [<ffff82d0405b562b>] F x86_emulate+0x17f6b/0x3b8e3
(XEN)    [<ffff82d0405dce4f>] F x86_emulate_wrapper+0x87/0x216
(XEN)    [<ffff82d040489847>] F
arch/x86/mm/shadow/guest_4.c#sh_page_fault__guest_4+0x908/0x3b34
(XEN)    [<ffff82d0403ca3ac>] F vmx_vmexit_handler+0x1691/0x3439
(XEN)    [<ffff82d040204683>] F vmx_asm_vmexit_handler+0x103/0x220

which is rather less voluminous.

>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/mm/shadow/hvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
> index 114957a3e1..298dd0f229 100644
> --- a/xen/arch/x86/mm/shadow/hvm.c
> +++ b/xen/arch/x86/mm/shadow/hvm.c
> @@ -165,7 +165,8 @@ hvm_emulate_insn_fetch(unsigned long offset,
>                          hvm_access_insn_fetch, sh_ctxt);
>  
>      /* Hit the cache. Simple memcpy. */
> -    memcpy(p_data, &sh_ctxt->insn_buf[insn_off], bytes);
> +    if ( p_data )
> +        memcpy(p_data, &sh_ctxt->insn_buf[insn_off], bytes);

Do you know precisely which condition is being hit?

~Andrew

