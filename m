Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51BDAEDB77
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 13:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029061.1402793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWCuJ-0000st-24; Mon, 30 Jun 2025 11:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029061.1402793; Mon, 30 Jun 2025 11:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWCuI-0000qV-V7; Mon, 30 Jun 2025 11:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1029061;
 Mon, 30 Jun 2025 11:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWCuH-0000qP-Ez
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 11:42:41 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 531c11b8-55a7-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 13:42:39 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso1216770f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 04:42:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-318c14e224csm9146641a91.32.2025.06.30.04.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 04:42:38 -0700 (PDT)
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
X-Inumbo-ID: 531c11b8-55a7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751283758; x=1751888558; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eVulYssM1kQlc6S6ZkCc8s3/n4KwIjd96GCkHhSpLc=;
        b=cR0u/w+JYT9MAIHnQobcNIurfP42eJZGORm6I9N+m7iepJgQjLwag+zU63DSY52Chz
         WFqjVsR/tTH/6fBUjKZK1k94jP4w9/T2nPzP6HT8p1K2CF5Y5P+X7XSshsWgOQMkGaAQ
         W7VWXjtOvNfFUoU6z6RsKKRfDRsDU3AoKiAnuZBnuzokfu9KURhdE4ew6U9k2to/GZL1
         7rgIgAJELYkCErqrO07erYcufqMR/8ZX34gkFnIylKi13KShGynkeiRIMnVX4H2oPPVz
         QYJl/wtNHGITy+wfZHWjBsSO1ocMINaqHNh88OWfk72xEY/bzH53DJ/fiPYOlDvODLYT
         R8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751283759; x=1751888559;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/eVulYssM1kQlc6S6ZkCc8s3/n4KwIjd96GCkHhSpLc=;
        b=PjfHaTNZDCLEwtilgxm+mBepwo51dcgzetbycsXA8Akk29MvJw6glCgPn3pbBRxPBG
         Gn2ubiRiiZSW9mGQ02honv1f3WPGIjXP4nA4fhwpkPrnN55LKroyRx0g/oSZEM0iHYdg
         b5JHaxZwgEK6itnwpz3Fye0kZOFEiKVpeesJ66PetblevaJEWvg5AhNVWGaqNa5N6P2m
         9eDKPDU8QYhQhlQnKRxZPykvcBWc8oduITZN25HTMOJSV/hJ6r/t9rpSdelbBWJgdiU7
         G3dZ3r8Ah//VEAqFfSbkYRZ7IkN8D4PSJ1yl3pOKB9QqNzYlvEw6hURnX15B406vour+
         eo3Q==
X-Gm-Message-State: AOJu0YxHUCx85ocuuJGuqd56tSndyhoV/enghtIplAgY3tqt/LX7FpUR
	yjnM1Uw3qrzEA4s04il/WjRrxkwHJ+ArwuoN66BfJf0GIRPBJY/t931BU30UtEBH9EkXyqkPXtX
	zEPg=
X-Gm-Gg: ASbGnctykxmTSKde8MEY4WiA8PQOJym24ZOqPR8k0JZ3BpaQEoLUOh/eO1pYoW1cnuq
	7KwjXeTuNDSew//zRpcAhHxzvFsU1jSh5Orbwrs8tBtf1vC6/+Bh91fv6La0fi7PslWX5xkMYnu
	Gp6YP54Z5XBzNN7a7DeNsd21VgTKiTcraOhhHQMvmsqmLla/Lbx5Kz591rTcA87fxXXac0a4QaP
	0SSxGV9Im4AED7tRTdReEnPJrt0kRkjt7/ZA1IWtLFM4n1TpC6L/ep00lQPaLl8WHX8ibDWJhZe
	kHhGAXePG7hk7vh6Wumv9gi8w7SXMEurVZij85tnoo2W/j7VUDDHNq0mPFAF3Mge4CVCe6/rtzi
	DNkYYQRdxDb9tTzRrX5X8HnXpoJUUbM0llzPnoFpKjPwzHmM=
X-Google-Smtp-Source: AGHT+IHIY/GdcoG34snCr+E2mCNV++T094l+hnLEk6ccN0U7ZVqt122MCCdAMMfs/zMDNRS1rpQ4Gg==
X-Received: by 2002:a05:6000:710:b0:3aa:c9a8:a387 with SMTP id ffacd0b85a97d-3aac9a8a39cmr7320674f8f.0.1751283758561;
        Mon, 30 Jun 2025 04:42:38 -0700 (PDT)
Message-ID: <7fa05d3f-2f85-4a42-9549-b68a486e30ea@suse.com>
Date: Mon, 30 Jun 2025 13:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/SMP: guard socket_cpumask[] access in cpu_smpboot_free()
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

Before CPU identification has run (and it may not have run at all e.g.
when AP bringup failed altogether), cpu_data[].phys_proc_id (which is
what cpu_to_socket() resolves to) can't really be used. The use of
cpu_to_socket()'s result as an array index cpu_smpboot_free() therefore
needs guarding, as the function will also be invoked upon AP bringup
failure, in which case CPU identification may not have run.

Without "x86/CPU: re-work populating of cpu_data[]" [1] the issue is
less pronounced: The field starts out as zero, then has the BSP value
(likely again zero) copied into it, and it is properly invalidated only
in cpu_smpboot_free(). Still it is clearly wrong to use the BSP's socket
number here.

Making the guard work with and without the above patch applied turns out
interesting: Prior to that patch, the sole invalidation done is that in
cpu_smpboot_free(). Upon a later bringup attempt, the fields invalidated
are overwritten by the BSP values again, though. Hence compare APIC IDs,
as they cannot validly be the same once CPU identification has run.

[1] https://lists.xen.org/archives/html/xen-devel/2024-02/msg00727.html

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sadly there was no feedback at all yet for the referenced patch.

--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -958,7 +958,13 @@ static void cpu_smpboot_free(unsigned in
     unsigned int socket = cpu_to_socket(cpu);
     struct cpuinfo_x86 *c = cpu_data;
 
-    if ( cpumask_empty(socket_cpumask[socket]) )
+    /*
+     * We may come here without the CPU having run through CPU identification.
+     * In that case the socket number cannot be relied upon, but the respective
+     * socket_cpumask[] slot also wouldn't have been set.
+     */
+    if ( c[cpu].apicid != boot_cpu_data.apicid &&
+         cpumask_empty(socket_cpumask[socket]) )
     {
         xfree(socket_cpumask[socket]);
         socket_cpumask[socket] = NULL;

