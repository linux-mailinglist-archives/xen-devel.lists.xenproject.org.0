Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F43AD5243
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011479.1389926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIur-0001u9-Fe; Wed, 11 Jun 2025 10:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011479.1389926; Wed, 11 Jun 2025 10:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIur-0001sf-Ce; Wed, 11 Jun 2025 10:42:45 +0000
Received: by outflank-mailman (input) for mailman id 1011479;
 Wed, 11 Jun 2025 10:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIuq-0001Tn-1B
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:42:44 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6eeef8-46b0-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 12:42:42 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so527423f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:42:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313b210f636sm1010151a91.31.2025.06.11.03.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:42:41 -0700 (PDT)
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
X-Inumbo-ID: cd6eeef8-46b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749638562; x=1750243362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8h5N+uMQNA34CSUfT3J3XGOdG1Xu2E+WLId5R3xUSrE=;
        b=SAt8/9T7WpM6b8t730icL5ARxyEEZGKmNBdS950oBdCehr//qofBwXgQWf7lSBuvUg
         8UbiVUFvjZbMoH7sMnB8CswXqJCtIgpUpZ0roEaBaGUmt+ss5+dzCJ0wJmzRqaUdpoZs
         Bd6NIoOa7UfOBpixvesDDaxOpPNbTVFdLQXc/sohyLnAPx8Zd2/eP6Gt294P6tiFxw4e
         /trrXxOgpRXHC7ByBQ6I/37SIyEUrothXqcyvFOCMGsEyV/EdjELXgnY7cFzr0BmF836
         3clhuXcrq/08dR+VfxKksBBvD6OclufjBrJ2qLaD5pvlLEA5ZXr1i+lfueKEvL+p8doc
         V5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638562; x=1750243362;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8h5N+uMQNA34CSUfT3J3XGOdG1Xu2E+WLId5R3xUSrE=;
        b=ubWI9jTd9y2QQxeO181CFNIiHcLNJkVYR8bt5E2KlWS/TPd5ms7tvgK6U9SmDmcpFH
         0AP8M/GG+uk9IMQeY3WT57AaUBhCnH2uucUUhOKATtn6eVDONWWcsN6UD1cpyVlogaDq
         Sf39Jbvw2oIhdVb7E4+psJ9uu1wegyWGPjNm4XsENBIClAv6K9kkLyU1FqwdBA6xBAjG
         CZ8Yj6AGDTHXcKrqwyDIbbBtVs6C9t7Qi9PogBRpl0W0580XWmJK2pjqb1huJy6TARsZ
         Sjy8Hbjpg6UlhTo2pKFuaviYmCWU6mlj7lr4NTJHGRdIB7LLjY8HU2R/smclPBYTvRW0
         pbZQ==
X-Gm-Message-State: AOJu0YyxDOOdsIM8Kw/+Y/yrtos8l3SlyYhGUwxFerzyd3b8cGc+fM35
	7dRHy+tlBBnTNg8XOm5ziQgPZEFJ7IIGT4KfY632CwG4WLh1Zfrxz61dchDy1k0XEOfT604Vkei
	wA28=
X-Gm-Gg: ASbGncuRuLYkReelsqLZ7kgaHbF/S++ne3nG7KzIQMWDyjPoR4b+55BjSlYgBa6gR2k
	1omeP0WCoe7CL6SLChvS53CKOfvi4gWH9qxk0QDF0G/pCX3kGZhMtF+guNzULPbkpxj2jm+ww7m
	sORC0lBehd5ZQ5nM+jjHMwrdSj3hLz1G/f9nKamoPdFZ8/iGmMuf8gmdU9GHW8fIEQvh/64sD5A
	dyIRZ0uM/oMD6Mrp5+YeNydJEhItB9fBwPIynxQFYjgi5pfuG/S/I6DY9zRFAwQ+M4rXe6uvDvO
	OcrET+SPXjb1z7fBzQhT/8DN7DBG8QaDknGAKfrdaO3VhKI1R7AVcJGly2dmZTmDCh4IiaKTY7T
	9w/myqwy/7ldzlot9mHPK1thL5QkWRuO1K0MkIOn/yt5ANzI=
X-Google-Smtp-Source: AGHT+IFNJUhQrOhtP8Em2EWVzkl6m4xvFXh4hl334eIuUaUPpf5BVg+fXZQXRLlf1FF1tmx79sf+HA==
X-Received: by 2002:a05:6000:1acc:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3a5581e1bddmr2370178f8f.12.1749638561833;
        Wed, 11 Jun 2025 03:42:41 -0700 (PDT)
Message-ID: <9384234e-3a07-4ae1-b632-fe007beb4c4f@suse.com>
Date: Wed, 11 Jun 2025 12:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/6] vVMX: adjust reg_read() for 32-bit guests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using the full 64-bit register values is wrong in this case; especially
soon after a mode switch from long mode to 32-bit one upper halves of
registers may continue to be non-zero.

Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the affected VMX insns are invalid to use from compatibility
mode, and hence the more expensive vmx_guest_x86_mode() doesn't need
using here. (VMCALL and VMFUNC, which are permitted in compatibility
mode, aren't taking this path. In fact both aren't dealt with at all
[explicitly] in vvmx.c.)

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -360,7 +360,12 @@ enum vmx_insn_errno set_vvmcs_real_safe(
 static unsigned long reg_read(struct cpu_user_regs *regs,
                               unsigned int index)
 {
-    return *decode_gpr(regs, index);
+    unsigned long val = *decode_gpr(regs, index);
+
+    if ( !hvm_long_mode_active(current) )
+        val = (uint32_t)val;
+
+    return val;
 }
 
 static void reg_write(struct cpu_user_regs *regs,


