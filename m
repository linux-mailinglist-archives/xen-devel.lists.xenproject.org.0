Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06270A023D6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 12:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865672.1276931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkuR-00018C-ET; Mon, 06 Jan 2025 11:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865672.1276931; Mon, 06 Jan 2025 11:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkuR-000165-Ba; Mon, 06 Jan 2025 11:04:35 +0000
Received: by outflank-mailman (input) for mailman id 865672;
 Mon, 06 Jan 2025 11:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUkuQ-00015z-3H
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 11:04:34 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0200e545-cc1e-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 12:04:32 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso149304655e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 03:04:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366128a353sm565190235e9.42.2025.01.06.03.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 03:04:31 -0800 (PST)
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
X-Inumbo-ID: 0200e545-cc1e-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736161472; x=1736766272; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttEH5lhxbSnavTd+NJ0m9e8hXilbr/zh/1Y9/lrJRLE=;
        b=JXRoCtLzG+ejD4H/QDwRj7D8M8Scl1k0PHln2YspLgpaFCZLk3j3PCzfXXut89fppz
         JIBEKrjBL3o6a1c232Kq+A+gmbxgY4DHzp2iwwu9VqoZZmwRRYTsQEZewv8Wse2aBZ15
         OineTLw6pahDjWY7Z7vO1KsIfJd/m5NfPvNxHIK2nguTJAYo1/gX7fp3Xsdrhgv68Vpo
         M0b2lU51dxWX/i70CC9wsheU3y5/3LwG675eEC5J2+rITLjpFZCD6zSDBE+ZNSdFguqE
         kbdwq7KH5RFiCUZBPhKOFycuPPC8l4duNDqDL27rlue6acD5vVZ6K5d5fkm3H4Jx1EPV
         JNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161472; x=1736766272;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttEH5lhxbSnavTd+NJ0m9e8hXilbr/zh/1Y9/lrJRLE=;
        b=aF2+wL9QfMNS0Iwk/i4pDcd2IqzEO6ohp7xl64SukeMvurW6sPwFBLdlFFsKXzNocR
         mKb/NAvWZFotoAJ8CqAzf0OXB+/pPbf7s31CWA4frQ8OggyDWkWayF9GSFegoEyLzNOe
         Mu0UnzHc4C8DoesoUAhMOotkBul2rZGFGyIpQMS9KDP+Jjnu0RszYx8CLsmjRbSqdS4w
         4n4/8EI+cpQ9bb0gHHmbbj1p9yZCoEA3PDr6dMr56plM0lvMjCLsPahTapgdHjDF+tzQ
         wE4xrOLXUjQtLYxYnWYyS5PovA7Q7I872v9/5rchXrtJtqCPJFjMNeD2yctqdTtyP8pC
         jImQ==
X-Gm-Message-State: AOJu0YzbrNeOqam+aDilwX6P8uwal5SC2rA+D4aITaZbL33lurlXkkcQ
	ZhwXQQTA042Obm0Y0RujsmVcjkhz9c9L5W7xA/Qyqm36dwZ6ndBPusi5VcWh64zniECuBp391yo
	=
X-Gm-Gg: ASbGncsXzxVSo5xrw0USedowY54peQj1JgQCrRMDUXWJ4X1dbVezCItNtq8H3zJfzG8
	DJH/snyaYZ4umzcD3qf199iJVbeNC+N9VFqUQsYBO/waBME4ucNy9G3CrWtTSYdvx8zwi//shhf
	/vNRUEHWvmrP1XM/A/nIWwhx54p0cld0EdLbNpzbD7sS6ghjb2qaNBPZudLE0weLon9aX/o9IzY
	wfVA8vbO9uDMahsomHaU/XoertHa8Zv4hWqpQ/vI6iF4kbpQXE222q74EGMqzWqXJwQlIT7Ql+f
	rtQgQv7qC5v5K3nTkrfLPojlsWJcY+1ZVWE1Zr2hFg==
X-Google-Smtp-Source: AGHT+IH2JHZ3VccqwpKA7vKY0BuIwOKL3LyE2qJtdhrSvQo9/1tv5QlUV0vMDuQ8Pc0AQsShVDE1mQ==
X-Received: by 2002:a05:600c:1388:b0:434:f871:1bbc with SMTP id 5b1f17b1804b1-43668643aaamr615866015e9.10.1736161472230;
        Mon, 06 Jan 2025 03:04:32 -0800 (PST)
Message-ID: <bf8cc342-52aa-44ee-8bce-ce2be6406904@suse.com>
Date: Mon, 6 Jan 2025 12:04:39 +0100
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
Subject: [PATCH for-4.20] public/version: soften wording for deprecated
 sub-ops
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

These interfaces were - afaict - originally introduced this way on the
firm assumption that the used array sizes would be good virtually
forever.  While this assumption turned out to not be true for at least
some of them, this still doesn't really render them "broken": They still
fit their original purpose, and they are still usable for a fair subset
of environments.  Re-word the comments accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Despite having looked at the series back when it was posted / discussed,
I'm (now) somewhat puzzled that XENVER_compile_info didn't gain a non-
truncating replacement sub-op. The commit's description doesn't say
anything in this regard; it rather gives the impression that all sub-ops
with limitations would gain unrestricted counterparts.

--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -22,7 +22,8 @@
 /*
  * arg == xen_extraversion_t.
  *
- * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
+ * This API/ABI is deprecated, for its size limitation.  Use
+ * XENVER_extraversion2 where possible.
  */
 #define XENVER_extraversion 1
 typedef char xen_extraversion_t[16];
@@ -31,7 +32,8 @@ typedef char xen_extraversion_t[16];
 /*
  * arg == xen_compile_info_t.
  *
- * This API/ABI is broken and truncates data.
+ * This API/ABI is deprecated, for its size limitations.  It may in particular
+ * silently truncate data.
  */
 #define XENVER_compile_info 2
 struct xen_compile_info {
@@ -45,7 +47,8 @@ typedef struct xen_compile_info xen_comp
 /*
  * arg == xen_capabilities_info_t.
  *
- * This API/ABI is broken.  Use XENVER_capabilities2 where possible.
+ * This API/ABI is deprecated, for its size limitation.  Use
+ * XENVER_capabilities2 where possible.
  */
 #define XENVER_capabilities 3
 typedef char xen_capabilities_info_t[1024];
@@ -54,7 +57,8 @@ typedef char xen_capabilities_info_t[102
 /*
  * arg == xen_changeset_info_t.
  *
- * This API/ABI is broken.  Use XENVER_changeset2 where possible.
+ * This API/ABI is deprecated, for its size limitation.  Use
+ * XENVER_changeset2 where possible.
  */
 #define XENVER_changeset 4
 typedef char xen_changeset_info_t[64];
@@ -116,7 +120,8 @@ typedef struct xen_feature_info xen_feat
 /*
  * arg == xen_commandline_t.
  *
- * This API/ABI is broken.  Use XENVER_commandline2 where possible.
+ * This API/ABI is deprecated, for its size limitation.  Use
+ * XENVER_commandline2 where possible.
  */
 #define XENVER_commandline 9
 typedef char xen_commandline_t[1024];

