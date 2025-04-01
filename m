Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9CA784D2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934915.1336467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzkNx-0007qB-J3; Tue, 01 Apr 2025 22:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934915.1336467; Tue, 01 Apr 2025 22:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzkNx-0007oK-GA; Tue, 01 Apr 2025 22:47:09 +0000
Received: by outflank-mailman (input) for mailman id 934915;
 Tue, 01 Apr 2025 22:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzkNw-0007o8-G6
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:47:08 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3caf3e3c-0f4b-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 00:47:06 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso42455335e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 15:47:06 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5fd138esm2384155e9.13.2025.04.01.15.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 15:47:05 -0700 (PDT)
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
X-Inumbo-ID: 3caf3e3c-0f4b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743547626; x=1744152426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o9pOy7Tik2ts3ocAOTXNdrNb9fTEfKJgg2ghqirIlg8=;
        b=NwOHXT98FHRZb8fA5e6rsmqFj+aUK9bRnvtMiS6HBwmsAs53GzAyW8VKini7d+ppPV
         qOoIq35ykOiOseFwDU17Eq2Avv+bAU72wQtkRHoAvhw1/59ZMWszj6x7yNH8NEmwHC/O
         X3wugD3oU+rBE48GndMNIZgEpH4TW7YvbzDuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547626; x=1744152426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9pOy7Tik2ts3ocAOTXNdrNb9fTEfKJgg2ghqirIlg8=;
        b=waqX+bOkvsZRyVZ3LRICZ/sHhGVlqsADgy+neSQq0hzT3ReViogewXjomYJrThdzhl
         2EBdSM4fwP3rk2QRGyXpye3EYXF5zQMd/FAOhhXBrUefByEyPagMr6jbK6s8B6wOmnZ4
         mfvUhOx+HnQ5quWJNKfjuW3eVYKkQMiHLxwEqxCfRhYXCmQoeDvXgR52f9Ca4RUN/K7j
         CeX0L0SSoP5DXhMsFqqVIqPjW+MgZOu0z3MvD+ZzbTnTdmo54+fYt6q8xCG04KfVJ1rw
         smyHjqndbA5MDSguP1J0XeuL+cIJ4KqJULkjWn5B649bQxmvzHsn8kNzJ9EDrpbcfp1a
         JmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBnJGQ1IQlio7xO3UeH43yRRmRPfwo3s5JNQZenvF4uQE1ZTpNRuRLwjsWLJkKzEixX7i5muiP0xI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYtNgc6OyOBWefjqr8kETv3BWVp9++bDP/BkwhWypntTWiC7vA
	GOliYCCEIxIDIHxzeldFSwJpcLmaXrAl24Fjv/LpGqLSeA0LpgQiLyh/0oJ2c9k=
X-Gm-Gg: ASbGnct9MGSp56APlPEfzE6k2QhH7Z4CAq3btuRbGDj8TS0VAztyoo6B/GzAftSHtJn
	bL49uLsICCkbg0xqb+vH/w/DeAdIdByHqi6uk0AYOFErMbyxjUX3Ghl0Pr7xt0hSMnbVPwvCTyS
	KQd/Red5Pk3gZ38L6aW5Jt45yDaGqDstHeQ83G+SFaXdUjKZUPgBf5Ckf0R8bAxXkFY0mkZZMLv
	jqnc9wynIayj+n1bfx1IB0qnLBO8q1zl4whhRCVhbSCjOp7CsZIcnp0Bd0ebnHHveZMUg2FKbj4
	4EFy87ol7l26eIfZBCtqkXWgrU7oYhAb18CfAZZAkjuM867HCpZb34jWbt16kg15CivCYoqThHw
	83hTTKtw3uA==
X-Google-Smtp-Source: AGHT+IFNvFzxv8bvqMERbE2Vz+7mkEecVUYXpfWUX+3/VMEy4CnWPpH35ymphzLllSC4uxyRl/kprA==
X-Received: by 2002:a05:600c:4fd4:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43db6248e50mr137487095e9.18.1743547625935;
        Tue, 01 Apr 2025 15:47:05 -0700 (PDT)
Message-ID: <cf19dd5c-1c87-49e0-a8fc-52b098d12b9f@citrix.com>
Date: Tue, 1 Apr 2025 23:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] x86/vmx: remove *_OPCODE
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250401222105.79309-1-dmukhin@ford.com>
 <20250401222105.79309-5-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250401222105.79309-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/04/2025 11:21 pm, dmkhn@proton.me wrote:
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> index 10c0619108..1d63e49288 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -507,15 +487,17 @@ static inline int __vmxon(u64 addr)
>      int rc;
>  
>      asm volatile ( 
> -        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
> -        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
> +        "1: vmxon (%[addr])\n"
> +        "   setna %b[rc]\n"
> +        "   neg %[rc]\n"          /* CF==1 or ZF==1 --> rc = -1 */
>          "2:\n"
>          ".section .fixup,\"ax\"\n"
> -        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
> +        "3: mov $-2, %[rc]\n"
> +        "   jmp 2b\n"             /* #UD   or #GP   --> rc = -2 */
>          ".previous\n"
>          _ASM_EXTABLE(1b, 3b)
> -        : "=q" (rc)
> -        : "0" (0), "a" (&addr)
> +        : [rc] "=q" (rc)
> +        : "0" (0), [addr] "r" (&addr)
>          : "memory");
>  
>      return rc;

A variant of this patch (improvements to __vmxon() helper, or whatever)
probably wants pulling out and doing earlier.

For the function parameter, u64 addr wants to become paddr_t addr.

Use "int rc = 0;" and [rc] "+q" (rc).  That takes away the "0" (0) that
is otherwise unconnected.

Next, "vmxon %[addr]" and [addr] "m" (addr).   The VMXON instruction
strictly takes an m64 operand, and it doesn't need bouncing through
another register.

Finally, __vmx{on,off}() have single callers only in vmcs.c, and really
shouldn't be in vmx.h which is included ~everywhere.  You can move them
into vmcs.c (probably after parse_ept_param_runtime()) to limit their scope.

~Andrew

