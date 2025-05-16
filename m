Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E6AB9C6E
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 14:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987088.1372542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuOW-0006vk-Bk; Fri, 16 May 2025 12:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987088.1372542; Fri, 16 May 2025 12:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuOW-0006tL-8w; Fri, 16 May 2025 12:42:32 +0000
Received: by outflank-mailman (input) for mailman id 987088;
 Fri, 16 May 2025 12:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFuOV-0006tF-C1
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 12:42:31 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a7ed84e-3253-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 14:42:29 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so15659005e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 05:42:29 -0700 (PDT)
Received: from [10.81.43.161] ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-443000ee99csm18110755e9.31.2025.05.16.05.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 05:42:28 -0700 (PDT)
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
X-Inumbo-ID: 3a7ed84e-3253-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747399349; x=1748004149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VxNrDdHwZDB4e7gQ0bftbwiTKA/WIFIRNRrPLF2lTbc=;
        b=l9WrJ4u2ecxkb50Om083budSsq+cvFWOKWOUIZTQtjUpSPwUY3zNlEwchTBQvwhlLz
         VnZX+G+P9CzZb7e/ZiYeircp3CXVErd3lIswE0xWxx1liHFC2pinsqqvfiHC1Y9Egq0w
         cOtwfM4IPFZG2IvkMGKNQMRdcN3YW4K1cMjmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399349; x=1748004149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxNrDdHwZDB4e7gQ0bftbwiTKA/WIFIRNRrPLF2lTbc=;
        b=G3juXVJOoPc6Yub4IDQVRs481DwfGV+xsOm/LUlVm83PL6TEqlK95bItCYp/yz+1Ym
         sjraBPLam5u3s/y4cpBwPlb39lH3cGUAAY8+X6sCzMyV6vIBIUry4+Axp23XctgvsL4R
         kdu0TfMiuBKhXsf5rCmMUMqGFAsZKMw4UyW+sJ0Ev2w4YEKc6Tq3msorX5PuCzrY0dPQ
         cAub9uO+zwVB/HVi7TFyECdwFTkunhXOMuFIsRRi7PFDgsRdfXq/z324MfN+Mdx6aEW/
         OjLd29a9psEB5Ci2ui63FCEkOEJWqEI2JjuES/UeEyl+Xzk6ICKNGBWZRuUwTgnzUeWv
         eRaA==
X-Forwarded-Encrypted: i=1; AJvYcCVAon2965E75MGb74N4fg2FI1wnroo/ACGUL9oSv8Gug/8Y6C5b7hWYfD8sbbayx7K/N26C8/lZU6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGGLHfJhdpplbwCcYu+5LATa1RAjUha6peKnq4Vhx7e1HOBSmG
	B0Ow/9vT1DH8KCgFYQgNlLF0iIiKhTIt3BsH+V86nwMmSgBb6J5Ww2EbfAwEFhx3YMc=
X-Gm-Gg: ASbGncsLvrRhVwHDU5pkCUz5snwwV9ONUOVkHZIrJLmtW05axjIIvP/ZhW4rK3AlT2D
	lz+D3BSoe3BFvbaHP/rGATB8Y/602apXOLBaAHe5D0hRM/oVdhiaFJao3JOP5S5Q8SOPi8ZQ/VS
	2t7lLCx0CcZN7mT2HErv/fGA5tDfI0IxsPl2rt1cAcnD1qnv3tXN5FIi/pm4WqRkcr2B5HEtIVx
	EH//pJqMvbcIQY1OEObD30JrdLBqYNJgYWvr0X0JbE5hh7a/5n4e2ZtWH7gUnDiUYf8TgLhrPTm
	xYFxQ6iz8Hg+aYVQUi8vvLgwtRH5X/q3ICVEtMDCnam1jW+17C1LP0GOkL3T5UQ0/I/8JsUo
X-Google-Smtp-Source: AGHT+IEeql+bDq0LLvixVb3OHq5FszKypJA8cDZcQQFqGxFLiA5On1Lpbfb6Maqshg6ub0P0I5BpkA==
X-Received: by 2002:a05:600c:5305:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-442fd62733amr32335915e9.11.1747399348912;
        Fri, 16 May 2025 05:42:28 -0700 (PDT)
Message-ID: <7c0a689e-c116-49e2-9caa-f5679f8960eb@citrix.com>
Date: Fri, 16 May 2025 13:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] x86/vmx: replace __vmread() with vmread()
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, nicola.vetrini@bugseng.com,
 consulting@bugseng.com, dmukhin@ford.com
References: <20250513052809.3947164-1-dmukhin@ford.com>
 <20250513052809.3947164-2-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250513052809.3947164-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/05/2025 6:28 am, dmkhn@proton.me wrote:
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index 91b407e6bc..b622ae1e60 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -65,7 +65,7 @@ static void vmx_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>      {
>          unsigned long intr;
>  
> -        __vmread(VM_ENTRY_INTR_INFO, &intr);
> +        intr = vmread(VM_ENTRY_INTR_INFO);
>          TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
>                (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
>      }

As Jan said in v4, lots of these should now change away from being
unsigned long.

For example, this delta alone:

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 203ca83c16e7..c540ea5bd850 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4154,9 +4154,8 @@ static void undo_nmis_unblocked_by_iret(void)
 
 void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 {
-    unsigned long exit_qualification, exit_reason, idtv_info, intr_info
= 0;
-    unsigned long cs_ar_bytes = 0;
-    unsigned int vector = 0;
+    unsigned long exit_qualification;
+    unsigned int exit_reason, idtv_info, intr_info = 0, cs_ar_bytes =
0, vector = 0;
     struct vcpu *v = current;
     struct domain *currd = v->domain;
 
@@ -4830,7 +4829,7 @@ void asmlinkage vmx_vmexit_handler(struct
cpu_user_regs *regs)
     /* fall through */
     default:
     exit_and_crash:
-        gprintk(XENLOG_ERR, "Unexpected vmexit: reason %lu\n",
exit_reason);
+        gprintk(XENLOG_ERR, "Unexpected vmexit: reason %u\n", exit_reason);
 
         if ( vmx_get_cpl() )
             hvm_inject_hw_exception(X86_EXC_UD,

results in:

    add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-331 (-331)
    Function                                     old     new   delta
    vmx_vmexit_handler.cold                      929     839     -90
    vmx_vmexit_handler                          5490    5249    -241

worth of saving in the fastpath.  (Yes, I chose this example carefully
because it's surely the largest win to be had.)

I've just sent out a minor docs patch annotating the sizes of the fields.

This patch wants splitting into at least 3:

 * One for the 64bit and natural fields which are a straight transform
and no type-change away from unsigned long.
 * One for the 16bit fields (there are few enough that this can easily
be a single patch).
 * One or more for the 32bit fields, doing a type change to unsigned int
too.  (Might get quite large.  Hard to judge whether it wants to be one
or more without seeing it.)

~Andrew

