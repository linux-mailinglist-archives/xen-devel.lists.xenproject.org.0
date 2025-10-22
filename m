Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C3BFB5F8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147860.1480005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVxL-0007RD-DZ; Wed, 22 Oct 2025 10:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147860.1480005; Wed, 22 Oct 2025 10:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVxL-0007Q8-9a; Wed, 22 Oct 2025 10:20:35 +0000
Received: by outflank-mailman (input) for mailman id 1147860;
 Wed, 22 Oct 2025 10:20:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBVxK-0007Q2-M9
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:20:34 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbd857e9-af30-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 12:20:29 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47114a40161so24750865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 03:20:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427c3ecsm37393835e9.2.2025.10.22.03.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 03:20:28 -0700 (PDT)
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
X-Inumbo-ID: bbd857e9-af30-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761128429; x=1761733229; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmyU8a+oTryiBDhC1ea6lP/mMWMNCgBlacgVOl1qEEE=;
        b=V4pRpHoRJbBDX/7AlTqAFBwkMMelH8nXOaZnSqpws3TF7/0CaXZWClPQEgdQroL0B0
         9f8UHAT6b/X6DKmAqAQiZ2OnaS7irm5j7iveWMFwKutbbjhatGil2nhWa9q56wr7MkZD
         ZGxXMRFFDaqO8F5zZgvmHJTgqb4B0AipGmgZJrmF1izYXHlFh0wwiVUCMbQWxF8heYXm
         RsCt5bXvOOCjUJqRYr9DTdbRkCWDRii5bHPu4xEdhwIK4Y1anZcsWLoJYf82DqK2A8v3
         oUTAih9vH8M1h+Unnl5M9gQQAy/R/KmdQp/T08AYm51t47Y1PBJQ+l1Y0AznwoS56Ga+
         wwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128429; x=1761733229;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmyU8a+oTryiBDhC1ea6lP/mMWMNCgBlacgVOl1qEEE=;
        b=Bs7IXDsL0+rwJhpn5VpiTyyB94tsW8a/3fLzLNfJmYpkgzh2k3xWETOiGK03KP+K66
         w/TpU/CycE64ylgNy64MBdenEilGVngyLf2qem8do5ol6Xv2nx5M0ghTNK3BnbKah9Ox
         lAMa3PRdbeSQULnI5SKHttLB8dQFLyHgrFsy/X4Ckp4gaK9bl75yuZMQLQvRtV5zYLhR
         wh0v0FjUhbR5oL2CS2fJ4kX8YedLW897Kux98eVobXF8ln/uajZhdQRqz+At4i+Ng8ro
         r7OXptntiHhElm8kwS2KoVQpj/euvMbe2MwPrSFq3yGf6APOWYPKrCnpVR1SbGE2H4F+
         n+Jg==
X-Gm-Message-State: AOJu0Yx6oZrojXSwqEsLzGZSDOLiezfAHcx0N63UBkl0gcmlJYusBFZl
	x97ox3IqaDvd8IjtcTrxpyKWm5AHpAGiC4hGpW0QPgRHm4MsNeslb8S5LymEugw4cQTqfDxQxT4
	/uVQ=
X-Gm-Gg: ASbGncuxZQ3k9Kl+2lLUig4tFtrLMrV0baP2u6JciKUgx4kn5dtzhHjJdXPSpSC9Sfd
	W2yZkj/KIZsMGWHdMzNGC1bv0kq0P7zV9Ea922/my7441WndLbCJrpH2VY7Y8BKpkPtPPM2YBJh
	tZ8PWcRSbhDZ+/Mrs2kwjRHdamFWz0B4aj9ye9V0CvkPxE7OsuGhzxfjgcg8w++Ry583CDd5/VV
	qXKbk8YG8ickyUO4eUM9AOIJubeNF938gChaGbYAJyFtGwTDgN2d/ZqV6wEOLqczoLIKhevqhF5
	jCODm8o9Gx6/sFcxE/lNEJg+7S9cH4u0FMPxqH825hOACsPe4WBuRJiSuhxbUbKX2rLXiH/RPHV
	jgzd9F9uniVO37WrlggUPTmVHNL/9U3UVmnxK7OSZtODWgOH0H75uYv6bePSXDF3WbdNlcHp45z
	9PGc4XfeialZpjwiqzAO/CLiYBtz6gBdTaxE7jecVa1/PWdaTxX1l0696ne0xoTOGfTuwfWuk=
X-Google-Smtp-Source: AGHT+IEDzStAWCaB/qWacxM9VmvAQo8aZ/fpTED/0LaOsYlXfnvYUYT9Jqdh6IueUfnGPFA4q5UsqA==
X-Received: by 2002:a05:600c:4e8e:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-4711786c702mr177782865e9.2.1761128428933;
        Wed, 22 Oct 2025 03:20:28 -0700 (PDT)
Message-ID: <1fd73d73-ba59-4826-8940-4c557db5775c@suse.com>
Date: Wed, 22 Oct 2025 12:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: correct PG_log_dirty definition again
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

The earlier change wasn't correct as far as shim-exclusive mode goes:
Shadow mode is still to be enabled permitted there, yet the generic
paging-log-dirty (and more generally domctl) part of the code still is
unwanted (and cannot be used anyway, as domctl_lock_acquire() isn't
available).

Fixes: 2ae8a68df21e ("x86/mm: correct PG_log_dirty definition")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While a backwards move, properly untangling this will need to be left for
later, I expect.

--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,7 +55,7 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#ifdef CONFIG_PAGING
+#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 /* Enable log dirty mode */
 #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 #else
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,7 +197,7 @@ dm_op(domid_t domid, unsigned int nr_buf
 #ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
@@ -298,7 +298,7 @@ dm_op                              compa
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
+#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont                 do       do       do       do       -
 #endif
 

