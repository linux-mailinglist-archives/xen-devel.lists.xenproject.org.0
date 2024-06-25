Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3891600D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747304.1154676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0dA-0007VR-G1; Tue, 25 Jun 2024 07:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747304.1154676; Tue, 25 Jun 2024 07:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0dA-0007Sv-CV; Tue, 25 Jun 2024 07:30:20 +0000
Received: by outflank-mailman (input) for mailman id 747304;
 Tue, 25 Jun 2024 07:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM0d8-0007SZ-PL
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:30:18 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5543e10-32c4-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:30:17 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec595d0acbso28016581fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 00:30:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706901f821bsm1864129b3a.185.2024.06.25.00.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:30:16 -0700 (PDT)
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
X-Inumbo-ID: c5543e10-32c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719300617; x=1719905417; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK0Y07RFd8lZ/LFtFGqUL2rlLF1Ixqi2wrWAmUHB+z4=;
        b=Ssr4WtSz9dn1z26iCv8agLm9g5B2uUBJVSqmRGzSEjNfbeTxQ5BA/CggjyuInj/6Vw
         u9o9Rhek+/XoBcbuEv/HVISeiTeqkW0cGfPuLzyuwRKKunrGKF9o4biib01c/KnR88WG
         Axx7WLKBLzF6t1XT+MDQ0eTct0PnI0L/KuC6Z4h7BdNXSdhb4Zwt5OBD5XGCZ/+BKGsj
         clcxnjBqOV3jlp7hJWDPFoUTsqc+Uj7oXNZ7YxjNASXH6uM630xu0iW7uO1/AmDRXx/U
         WuwStE9INgZ+LAOmuklHrny9Kwn6nkIN7dY6tNGI3k9zJru/NwV7LmIe2FdTd8Sqc34D
         yasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719300617; x=1719905417;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nK0Y07RFd8lZ/LFtFGqUL2rlLF1Ixqi2wrWAmUHB+z4=;
        b=SYn6q0cjFiq2viNvd18wYxTMaKSAOVxokKHJ5RB9VJN52byy9WwC7frrVWQjwJS0zf
         HxQsR9cXjkHJ/rMyKtZLNJFTx8g+s4sTHlQwopO/WSiurxr9C2PCSQqxdC/WJuxUKF2L
         1oiEWDa8m92+PK55qchPWhNc0SzI1BGTIiNeYRi95RQuk77dEGP1kcNat0/2wTq6ChLA
         iMoDkSdE93mXoh1OMv0Ff6UksEP1FOcO4pO+zO7rJpJaOtgY6NagCIegGL3ndS1icrrZ
         th+lwI/J2PvrIfeVqqP+30N27qyguH63A5RSGA+BjsTB8xEaYnq3S1AHv6gZ7w3L+AtL
         Fmtw==
X-Gm-Message-State: AOJu0YxwCAQym7TXzvpu0AvUnk9XvNnrE3AImNt3xcI3J6Gdrf6YYXmL
	B3zMCfV3WHuCFKWPgVCFP3lMT6i4VqUpN2lnQ8kEEicnWbQlymhcEhYAs7CMiMzZf8obM2YeqJ4
	=
X-Google-Smtp-Source: AGHT+IGM6x0S2hjlpBYQnAepJVKzHIdFRQjWGv84699fMRFYwIC5BjyKgtTGGAqafZVcGnls8Hiljg==
X-Received: by 2002:a2e:9258:0:b0:2ec:4f01:2c0f with SMTP id 38308e7fff4ca-2ec5b31a392mr48371921fa.26.1719300617223;
        Tue, 25 Jun 2024 00:30:17 -0700 (PDT)
Message-ID: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
Date: Tue, 25 Jun 2024 09:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19] gnttab: fix compat query-size handling
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

The odd DEFINE_XEN_GUEST_HANDLE(), inconsistent with all other similar
constructs, should have caught my attention. Turns out it was needed for
the build to succeed merely because the corresponding #ifndef had a
typo. That typo in turn broke compat mode guests, by having query-size
requests of theirs wire into the domain_crash() at the bottom of the
switch().

Fixes: 8c3bb4d8ce3f ("xen/gnttab: Perform compat/native gnttab_query_size check")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Looks like set-version is similarly missing in the set of structures
checked, but I'm pretty sure that we will now want to defer taking care
of that until after 4.20 was branched.

--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -33,7 +33,6 @@ CHECK_gnttab_unmap_and_replace;
 #define xen_gnttab_query_size gnttab_query_size
 CHECK_gnttab_query_size;
 #undef xen_gnttab_query_size
-DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_compat_t);
 
 DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
 DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_compat_t);
@@ -111,7 +110,7 @@ int compat_grant_table_op(
     CASE(copy);
 #endif
 
-#ifndef CHECK_query_size
+#ifndef CHECK_gnttab_query_size
     CASE(query_size);
 #endif
 

