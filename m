Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED03C93BF87
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 11:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764901.1175465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWvDc-0007qx-IK; Thu, 25 Jul 2024 09:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764901.1175465; Thu, 25 Jul 2024 09:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWvDc-0007pL-Fe; Thu, 25 Jul 2024 09:57:04 +0000
Received: by outflank-mailman (input) for mailman id 764901;
 Thu, 25 Jul 2024 09:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWvDa-0007pF-Tj
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 09:57:02 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d308334-4a6c-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 11:57:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso35906366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 02:57:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad903f1sm54617466b.152.2024.07.25.02.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 02:57:00 -0700 (PDT)
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
X-Inumbo-ID: 3d308334-4a6c-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721901421; x=1722506221; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Voik6myG6U2fsby5AJZEMgOr4NbzqfMzJUWbvCxCJJU=;
        b=AbPRWUrhZllaztGnqEqjfMZXOQezghNFClUuORuxczbfNAP3qASiC7JVUa039WJkNv
         kDWFmTBYQTy4Qv/6CjActzSKrn43tlfjMU45lTs3kPZvNyVKmzQTn8ptgP4L6BUj2/nW
         5TBshxJUeAdq69zAFh+N489d5BShuTILfAVZ3+p7154/5Xn2PgZFRB7r1+JPSFQ3ejYa
         2/u6TuOcpz41+IagnGDyKYIvusvZq3WIXMjbSAPmdtQng3gUnS4Wgf6faEhWqBqRd6ks
         6keBHuGpTuUn3DXzE3qrOnZSsMdJJcfYM+zdJl3ajM4Z8H8mghGbk7YvyAsQ6tiOABaj
         8yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721901421; x=1722506221;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Voik6myG6U2fsby5AJZEMgOr4NbzqfMzJUWbvCxCJJU=;
        b=DOe1GeQemfa1vz2gm5YUhbER2XqkcUqsJab1OFOVeNjsqXkiBXg/OVNvOZlmzunzJa
         m0L2c91agWXgyH25jiGVN2Ahq9Sq8eKfH3VgSwcfuSifp8UpbQZM/MBkrkRyh4TgIgyi
         RTeUQkQIPCmxA1IrOXqWCqEltEOz/kVdMSyXWCYQ7wWzugfPQliCrzhI5WIdu0AxWxuZ
         8nzmTZff4QJiq3U77zyJ41Ni8jvj4MySDqDewdjohXMp7tjnSD0VdTjRzVw4Rh0xVmhA
         g9xna2gSIrqOMSeFsyU3btkjiz6HLLviN2aTxuCSNOalVMbzzK4hhlNE5XJo34jlIlVc
         NqmA==
X-Gm-Message-State: AOJu0YxAiQH9LB84wpzUlNdJ/BzL2GjLAa6VGeLEg44YQcgxYBu1QlJ7
	ZkRuH2rdt1JJPdgbjFfHVleBGadDFylJcInbOyEdqns6m8Yehm0n+cHlvq3eQNQtR/nGC8ky5fA
	=
X-Google-Smtp-Source: AGHT+IG+W2YA5eb7XNkNUSgP0Hgv+JtsrKpr8VIXK4WblVKGUZ+F/jr66nv6OUe8bp48wO9+e3ncWw==
X-Received: by 2002:a17:907:98b:b0:a77:cbe5:413f with SMTP id a640c23a62f3a-a7acb3d6a15mr98139266b.4.1721901421161;
        Thu, 25 Jul 2024 02:57:01 -0700 (PDT)
Message-ID: <bd43ad1f-9cc4-42a4-8461-c8e3990b6910@suse.com>
Date: Thu, 25 Jul 2024 11:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] gnttab: complete compat [gs]et-version logic
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

While the CHECK_* macro invocations exist for these, the just-in-case
CASE() invocations were missing for them.

Fixes: a98dc13703e0 ("Introduce a grant_entry_v2 structure")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternatively, as I'm under the impression Andrew would prefer it, we
could decide to drop all of these fallback #ifndef blocks.

--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -118,10 +118,18 @@ int (compat_grant_table_op)(
     CASE(dump_table);
 #endif
 
+#ifndef CHECK_gnttab_set_version
+    CASE(set_version);
+#endif
+
 #ifndef CHECK_gnttab_get_status_frames
     CASE(get_status_frames);
 #endif
 
+#ifndef CHECK_gnttab_get_version
+    CASE(get_version);
+#endif
+
 #ifndef CHECK_gnttab_swap_grant_ref
     CASE(swap_grant_ref);
 #endif

