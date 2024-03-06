Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A5687380D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 14:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689333.1074174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhrZs-0006uR-KR; Wed, 06 Mar 2024 13:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689333.1074174; Wed, 06 Mar 2024 13:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhrZs-0006su-Hc; Wed, 06 Mar 2024 13:45:00 +0000
Received: by outflank-mailman (input) for mailman id 689333;
 Wed, 06 Mar 2024 13:44:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhrZr-0006so-3k
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 13:44:59 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7fa7d10-dbbf-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 14:44:56 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so8434230a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 05:44:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z42-20020a509e2d000000b005669d904871sm7287020ede.49.2024.03.06.05.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 05:44:56 -0800 (PST)
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
X-Inumbo-ID: b7fa7d10-dbbf-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709732696; x=1710337496; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTTS79cJ01BN+KslCMfXg18XV1FMJ23RKExX5h1sW5g=;
        b=AXK2RjIkvw2OeOogSSIq6tfnAR9inGkpurs4zYO5PjASI7T90Q8/sW2xW1l8sPukgq
         0wvFfmYeq3vHYOaZeGMUSJS7xf3qVf5a+7t1KES6iOFWp2J2+RJUyOYSBfcxOmjUQuRJ
         anAnMDMctNqabwtFRAj8u+ZawsYhK/9I0f0FhUIX++SiHrhyP/3DiEbLZ57FiYTuTogi
         ZIUGgh7s0FADqcCHN/7B+jdPHFhKMaRinppH2scshOzAjyDkaYkuOg2v+7kj+mOnJvN6
         GY1lJc12Dp9R/9bmF0UaxvSi45qZah23ncGdIPuiRMYt/oHqoKTPG1X+eWyeYpnSX8rs
         69xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709732696; x=1710337496;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTTS79cJ01BN+KslCMfXg18XV1FMJ23RKExX5h1sW5g=;
        b=kQSuxXA5nRWJv4faMvVD0QrAKve1wH7rPu+Hr7yXZxElILk1seGbaGDHsQMC25x2Ie
         SvUsa2NxbDRbTaFOdiMmUK5PW/rsvDUrplDlHhD08RoSbpsMAIOVbXIDgxNSroOv+DH8
         SwQvg8S21MNIxoZ97B421Z4YisrGjfKFGJpNk+S1oOWL/mIQZ3k30q6TqQ+8H/NYMEJA
         ciGNE7J+E7iPLq46BX6/QKvpyu/p6xKW/ztXRhk9osmhq4gc+9ZsEHV5QbzKaGmvM+GG
         QRYz7x2EcFS+/n6WtXLUNSJdRUh086sw/dZym/AwZf8ny4A7c8qdn2H2jh4SewgH1iJd
         4Jpw==
X-Gm-Message-State: AOJu0Yzh8/SVdrOzNDzYo9VwnZE5Vre8dA2PnS7GOZ9QREuRBBd1CRNi
	p4QwJ9eiEJwUQpzG4QBmeHb7fc0eZm8BtC4phhbPFVWIjB2qRY7RYiKLcsgQKHXeSB7bEqwwYos
	=
X-Google-Smtp-Source: AGHT+IEQxSdjMAMzec/52TfDdoDu9tqo4chsAUQ2GTT7Oyqqct74SzPGy7Urfh8vu+i31mx2FrFBEQ==
X-Received: by 2002:a50:c8cb:0:b0:566:a235:9355 with SMTP id k11-20020a50c8cb000000b00566a2359355mr11142264edh.33.1709732696236;
        Wed, 06 Mar 2024 05:44:56 -0800 (PST)
Message-ID: <36cf1c15-faa5-4e25-8fdd-9c52076f4ca2@suse.com>
Date: Wed, 6 Mar 2024 14:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/entry: don't clear DF when raising #UD for lack of
 syscall handler
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While doing so is intentional when invoking the actual callback, to
mimic a hard-coded SYCALL_MASK / FMASK MSR, the same should not be done
when no handler is available and hence #UD is raised.

Fixes: ca6fcf4321b3 ("x86/pv: Inject #UD for missing SYSCALL callbacks")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -38,6 +38,14 @@ FUNC_LOCAL(switch_to_kernel)
         setc  %cl
         leal  (,%rcx,TBF_INTERRUPT),%ecx
 
+        /*
+         * The PV ABI hardcodes the (guest-inaccessible and virtual)
+         * SYSCALL_MASK MSR such that DF (and nothing else) would be cleared.
+         * Note that the equivalent of IF (VGCF_syscall_disables_events) is
+         * dealt with separately above.
+         */
+        mov   $~X86_EFLAGS_DF, %esi
+
         test  %rax, %rax
 UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
         mov   VCPU_trap_ctxt(%rbx), %rdi
@@ -47,12 +55,13 @@ UNLIKELY_START(z, syscall_no_callback) /
         testb $4, X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_flags(%rdi)
         setnz %cl
         lea   TBF_EXCEPTION(, %rcx, TBF_INTERRUPT), %ecx
+        or    $~0, %esi                 # don't clear DF
 UNLIKELY_END(syscall_no_callback)
 
         movq  %rax,TRAPBOUNCE_eip(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         call  create_bounce_frame
-        andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)
+        and   %esi, UREGS_eflags(%rsp)
 /* %rbx: struct vcpu */
 test_all_events:
         ASSERT_NOT_IN_ATOMIC

