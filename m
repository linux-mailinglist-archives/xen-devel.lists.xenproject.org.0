Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C2D01C9D
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197423.1514958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdm9w-0001em-7N; Thu, 08 Jan 2026 09:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197423.1514958; Thu, 08 Jan 2026 09:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdm9w-0001dL-4c; Thu, 08 Jan 2026 09:18:24 +0000
Received: by outflank-mailman (input) for mailman id 1197423;
 Thu, 08 Jan 2026 09:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdm9u-0001d7-4s
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:18:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f930ea0c-ec72-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 10:18:20 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso18766975e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 01:18:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df96asm15021038f8f.28.2026.01.08.01.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:18:19 -0800 (PST)
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
X-Inumbo-ID: f930ea0c-ec72-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767863899; x=1768468699; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cu1PGF32gmkV7RT1BXwHaG+B74JdS50BdFXB9uA8is8=;
        b=WZuL3oVkmSYRX8ZtxQ0o7dpahz2Rz0X7RvPDvsEp69zn/28PITJqmaqojeXW2k+/XY
         qRFMm1jR5uiNHj0gUVlav5+nyCfyKszMvBreqvDL+MIwH66MvwfgDPtbBrCZ795LTbAF
         MQ6up9ZwlyyXL01RSPk4453MgO/hXhvqhkAj8XeaHZ3AJTrKM14HTadA6WXBGSel+H/d
         5iXxA3zi+9RBTNRRV+0GTS9teNSYxLS+WS2yNjcHS/nJYWNqTYPcksBNKppMDoDwSIj8
         tu/AD/nMYCfTpfsXrtP0xzgq58AtGW/AFZ9qm9NpU3dQhciRgmop5WB+9YPgATjQp9y/
         XuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863899; x=1768468699;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cu1PGF32gmkV7RT1BXwHaG+B74JdS50BdFXB9uA8is8=;
        b=PBIo/lsvpn1zXRnK254xFl+BzeCJLhKtThte+kZFz6i9IJoLhapK0YQcfoXp1Qm2u4
         /UJmOUxS44SYMmBGeX6hk5qA3jJuCKQLxcR4a65ATLO8rpFNfou4ED0VoOd2M/ukqtsr
         1cq6ZMrqmGcpnCjo2XkVYjiVH2cC/JltfDTSQNM6g43PMS18Ef42Xtch/2Z7+6JS4q2e
         SWN/xK8yhHlWJodKIMBwP2DtgxCzpOldd4UfERouaLyBoRuxQdUPY7Ba2I7p4z9jgA70
         vDYGI3e85aXh/Ap/84THSkyCQGO/X/af4sDkUN2jRRNl5tUZnI1lmcRacS77tBuVOfRJ
         RMJg==
X-Gm-Message-State: AOJu0Yz2NLM/MVSxEvIAdJeMQnk3VEPNe5di6u3dR5tA/PVixdoyhksK
	OUoMictKAUfzAWU5CHpUU/a1T4k2reXJ/hh7cM4alMOnFcMpVm/1XuEWOwzMiOuK9y54c/avz5D
	ew3s=
X-Gm-Gg: AY/fxX4MZeM1irbtiXJLUwvlHKzVOyFlkXURDSREi4y0e/ChKVL8CrAPS/HMUF5aI3P
	zBVd+AsBzj69lWraS98nieZZhFavLUac6dn7SuHBv7/aOF7qqrb43FYwDDYnjvysqw0HFiNkBW+
	6dGvWzfZjOoaMjp55jmTBkCfR7ABvqzQzHfDhFbBsZfNUCo0hEnNcJofJZyW9USmSa+wqDmGiZ7
	aTz10I5LZi18xp9JnF8L0DLguG0VvAWilVqGbgegM+YTR10i6S1EKz/1/K69eBvCqBSp/sy7GjU
	J0zGA5FPDUE3O/BhqBtmVKm+98IvXAqGu7d9oWZN5KVVS4z41UsLscl/ziZV0W3R48ghKvJb/BL
	L/mzS8GTYsAI3WtwNaOlxgkTHpIOQhtQtjnBdsI/IUVzZCCO0fyzCvgT4U1ASbGb4cQMxqhI/pC
	bm7GnJXlKvXe3Bv2BXiyzZy7AbN4SuM6RI5Lx01NmwfG0//dZc2WqwcxaUWdPqAIUKKQa2im2u8
	Yc=
X-Google-Smtp-Source: AGHT+IHJD3lCt8ZDY178uKqW+KbDElvciEk0ONRA8CIPi4sr46p+mSspEaKgPwE+/vvdu3s/CG0tiw==
X-Received: by 2002:a5d:5d13:0:b0:431:9f1:e4c8 with SMTP id ffacd0b85a97d-432c377c652mr6645515f8f.17.1767863899454;
        Thu, 08 Jan 2026 01:18:19 -0800 (PST)
Message-ID: <875df90d-1d3a-416b-a958-3d3a31144f85@suse.com>
Date: Thu, 8 Jan 2026 10:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] flask: fix gcov build with gcc14+
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

Gcc's "threading" of conditionals can lead to undue warnings, as reported
in e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116519 (no matter
that the overall situation is different there). While my gcc15 complains
("buf[2] may be used uninitialized in this function") about only two of
the three instances (not about the one in type_read()), adjust all three
to be on the safe side.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While auditing uses of next_entry(), I noticed POLICYDB_VERSION_ROLETRANS
dependent ones in policydb_read(): How come the 4th slot isn't used at all
there (not even checked for being e.g. zero, i.e. holding no useful data)?
Then again other instances can be found where data is read but outright
ignored.

--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -1271,7 +1271,10 @@ static int cf_check role_read(struct pol
     if ( ver >= POLICYDB_VERSION_BOUNDARY )
         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
     else
+    {
         rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
+        buf[2] = cpu_to_le32(0); /* gcc14 onwards */
+    }
 
     if ( rc < 0 )
         goto bad;
@@ -1342,7 +1345,10 @@ static int cf_check type_read(struct pol
     if ( ver >= POLICYDB_VERSION_BOUNDARY )
         rc = next_entry(buf, fp, sizeof(buf[0]) * 4);
     else
+    {
         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
+        buf[3] = cpu_to_le32(0); /* gcc14 onwards */
+    }
 
     if ( rc < 0 )
         goto bad;
@@ -1436,7 +1442,10 @@ static int cf_check user_read(struct pol
     if ( ver >= POLICYDB_VERSION_BOUNDARY )
         rc = next_entry(buf, fp, sizeof(buf[0]) * 3);
     else
+    {
         rc = next_entry(buf, fp, sizeof(buf[0]) * 2);
+        buf[2] = cpu_to_le32(0); /* gcc14 onwards */
+    }
 
     if ( rc < 0 )
         goto bad;

