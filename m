Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0036DA341CE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887655.1297120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia7M-0005H2-Ii; Thu, 13 Feb 2025 14:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887655.1297120; Thu, 13 Feb 2025 14:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia7M-0005FQ-G2; Thu, 13 Feb 2025 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 887655;
 Thu, 13 Feb 2025 14:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tia7L-0005FK-Kx
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:23:03 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07f7693c-ea16-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 15:23:01 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5ded6c31344so436042a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:23:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532595dfsm142951266b.70.2025.02.13.06.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:23:00 -0800 (PST)
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
X-Inumbo-ID: 07f7693c-ea16-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739456581; x=1740061381; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcDxMGbB9VUl17o5QH79Yv6fKWb64oukxKQf1o7bHiI=;
        b=V1XcHg2ah1tS/RZ1OuTvYzFMuet1W8pQCu/0U2QfefZwjZm/fI3J3c+VPTpP9Wa2z4
         DWuCk4SpSj6J6cf5jntp2JU9xDc6pw/AIUG92oYAgEMR9Krc2XQXXrIc5PCQ4a7EunVq
         FlcG73hGYWmICUiLcgPqS00EkNHeJaItxP3SX8VgS1buuOqQI4x5R4li0TjoHD/Olu8d
         R4TLtx5o25GT3hymLwCVy6TVE1PA23jIgCIETTOrRJeNBzcAQIqXbCt71Rp8PrbSmpNv
         QW1cVtX8TTkbxeDi8Z2f+Qt94rZ5cKeuE2PiNWxw9nlnvy8W/UKJdbEv3BDaZfgx1dQE
         eHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456581; x=1740061381;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcDxMGbB9VUl17o5QH79Yv6fKWb64oukxKQf1o7bHiI=;
        b=qX840hWFs+Co/zSPx1MjDt4gY270RlqTUTQPbHpceEhC8Zj6Gh9IdXPvDD+bipnJOE
         O4Lc8s4p3rRe9z244IxarLdFYVPT8JfhAqFu/nsxRGp9lqhXr6seZrjUMzpw9Ba6D+2i
         dG1HRL9J5SqDsrk47fAAXL19VkcvsKSW+9otWEKmUUJO6n9MZO03MpgGnbZRmwhiFv8e
         JVKjoYQCWtXNLAPsTQb3qw/7QDwAqnkNpRs8lgrDda00bsZOd+YeVj7iVweITrREiDVL
         CG6Gr9yWpUa3sJNFtNe+blqA3Y2FbfgTSOaW9pP/+uEAeJ+nIZ3xUmwYh5WJob/33v6t
         1wMw==
X-Gm-Message-State: AOJu0Yyy9pZyx/ibGJveU4qK7vpeDu9f4YWv1OoGzchozgpoD9IjAc3J
	jsCQ04J6vYbKZBPqtDifAOWl11UhP2MMG3Q/DfZl3hvSfgiwnP212FgDE/P2Lcxl+Ga6dz8W5P0
	=
X-Gm-Gg: ASbGnctcZgHeXXCnSwUZzsSb0hxzoMJiSaboj7BvLhEwp5q5XoWF/kcqsZRBB+SNqhz
	FoWNcUp26RMBfqfd8cy8v1216+3zCqtYa4xC63X2unCdVQqVkj/iHHYU6PcT+q8OENVlaHzG1Nb
	NwG53x8zLvRe1hvA8VPx2AIGEMhvQk3Srp1h7QSODxgD8iWJReWUHhpOG4LK78JWcMkTQcEkx2P
	tH6REMxfzm0mTzd7lMgavx2BU0O9oxBHHo7MFNjUGSuKahwipmsBcNG83bPephy3IoZnrAfW8PP
	8BoDVpOqVmSsQaHskO6qYX/3z4TITav2h/tv02CjTWOEyMDB5WebHnPMxCs68gmIB11tJAJOVvA
	K
X-Google-Smtp-Source: AGHT+IEhL8QBlnf9QgAU5YQh1uW4k5mu5+kb+xogD4tfvSoYVTR6r2xfvQfkHtP91Pp6JfMp2secxg==
X-Received: by 2002:a05:6402:538b:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5dec9e99952mr8192595a12.24.1739456581072;
        Thu, 13 Feb 2025 06:23:01 -0800 (PST)
Message-ID: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
Date: Thu, 13 Feb 2025 15:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] radix-tree: don't left-shift negative values
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

Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
left shifting negative values is UB. Use an unsigned intermediate type,
reducing the impact to implementation defined behavior (for the
unsigned->signed conversion).

Also please Misra C:2012 rule 7.3 by dropping the lower case numeric 'l'
tag.

No difference in generated code, at least on x86.

Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions) radix_tree_int_to_ptr()")
Reported-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Bugseng: Why was the 7.3 violation not spotted by Eclair? According to
         tagging.ecl the codebase is clean for this rule, aiui.

--- a/xen/include/xen/radix-tree.h
+++ b/xen/include/xen/radix-tree.h
@@ -172,7 +172,7 @@ static inline void radix_tree_replace_sl
  */
 static inline void *radix_tree_int_to_ptr(int val)
 {
-    long _ptr = ((long)val << 2) | 0x2l;
+    long _ptr = ((unsigned long)val << 2) | 2;
     ASSERT((_ptr >> 2) == val);
     return (void *)_ptr;
 }

