Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C63CC8428A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 10:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171771.1496795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNp55-0006K5-7s; Tue, 25 Nov 2025 09:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171771.1496795; Tue, 25 Nov 2025 09:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNp55-0006II-5E; Tue, 25 Nov 2025 09:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1171771;
 Tue, 25 Nov 2025 09:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNp53-0006IC-6J
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 09:11:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6afa873-c9de-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 10:11:23 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so50545965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 01:11:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf216ddasm235949485e9.0.2025.11.25.01.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 01:11:22 -0800 (PST)
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
X-Inumbo-ID: b6afa873-c9de-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764061883; x=1764666683; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AT8fC7Cn+UJ2y035oZe6hoj5SA55pGQU8kV45OHDjnk=;
        b=Ln4jKowzmKjs8Eu6tSAdKFWVd6MvQZY4a3+6q5xPL0/EijLAzKmk8+6nPvDDnFaVWV
         5re+z+CexY5haApKYrWmCVQLJ87eGz5z+jjFZqIVDIjFcDjHDaBb6C2+wQjct3ZHhY38
         +CDsRyoYxXHVvd8aWD4huqUf+IJseZ/QcluhSV2xWwDB7iZe+MlMvXZyxz5aRSjlLP8C
         ZbqhImXnwDXXsa7Sb30fnu0/9kz4SBCMwJOF4Z9iiyfAAOPN+dRn08VEc3nnZSRgz9f4
         b1K09JqsenNas3RclXBrTVoHAucxpjklK5h6o7JxXIgd47nWls3XYDLBj94DvyBXs/Aw
         HqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764061883; x=1764666683;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AT8fC7Cn+UJ2y035oZe6hoj5SA55pGQU8kV45OHDjnk=;
        b=vK85IBSzbeAkrM3qtzM/ijEd97ti8pNwYhIqvg3b96pbyHKjOBsvQB+WqOfUoZfWjN
         ERwyJ+5EN/IsUW3Rnd9Tq2F66dyF3rOo36nf52t91hpWyXn1iBZKNXMf4ZKtiyFj+BtO
         9uveiPVgWNrUY/0MyJmGrX4BVqIvMj2qXc8szy4Ml2V7WqS1owX8m35Fae/ePHTcxXh5
         FZbtZT4yss73F4rs1KMbuUKQPq4aIi/MBVYrFRAXgkXSrxGoA3UhUkNf2Syce5ayOMjs
         dp4jGyZpUGN06ES/rmIlwvW2DYMcNRkJsnweoFE0uPcN0Zqtu1OStvhljBVDDsEb/bDY
         1kgQ==
X-Gm-Message-State: AOJu0YywvATqUQrY2Jw+K6fmylsbAnp+3uHjzy4hRWt72xndswgrg+i6
	BMLSV0a1W5AtZ5Hpd1sOvLXu8HvX4AwfO5ddaVkQVm140WVuIrDB60TwX/ZFH9x1cNw0S5pHBtL
	+RlU=
X-Gm-Gg: ASbGncuYtZ9SCPj92HbDFeq/zs/jfaVwSEiNq8Ext1ckY99X9wrdpTJo6DW/tF/LSmf
	7K65f4g/a7C3zhcpDEflKv9329oi/cS5PpQnfQWteZKalxgQNKjOhaBQ2dVH/MNiAOCHFMGbhTt
	oIuYwgowfFq8SZ80o48vbbFc03HENHJ57sv2Jn2aSvM4OOB+vflX+MWDU/JUnf89eRLVCxYzoIL
	VCBf3PAOhGHCQGjINNEFRT+yH0ZsdN+cYmi3rvgNSRvF/bxjQiE38+Jw6kD9weGDAbykwHb2aHl
	jx82fscbAciuu4qWF1PCm6vrdvD6OYzPoJmHAu4sKwIDJXFc5sjFnMhGRVhYbj7wb1MssFudIzT
	Zp2YWIW9rXRdg34vWwN2mFoEBbd/XESm+Y9TIOcpYy4GHFbDxzs4mWuJaTBJq+smT52owJ6OaDU
	cG+y3sWRuoZ2AioQP/3KFZI5/FXJhg2DYQ8Y51kcbOhedtApgEuhjRHXBinC3GHpglSoQBlEFzO
	R4=
X-Google-Smtp-Source: AGHT+IG7UoxmO7bjt3s2tVmNWeDqtsRhLgGaamb4ezhfUNhs/cGFNAH0xqdKa+k0LhnSx/SfUyOI/Q==
X-Received: by 2002:a05:600c:c490:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-477c11325c2mr159253185e9.31.1764061882737;
        Tue, 25 Nov 2025 01:11:22 -0800 (PST)
Message-ID: <1533aaa3-5065-4214-a920-191a8b174314@suse.com>
Date: Tue, 25 Nov 2025 10:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl/json: don't expose internal functions
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

Ideally internal function declarations wouldn't live in a non-private
header. If already they need to, they should be hidden as much as
possible. That is (a) their declarations shouldn't be exposed and (b) the
symbols shouldn't appear in the shared library's dynamic symbol table.
Gate the declarations upon _hidden actually being defined (rather than
providing an empty fallback), and apply _hidden also to the libyail
variants.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Some lines end up being too long, but I don't know what libxl's approach
would be to avoid this. Plus the libjson-c counterparts have similar line
length issues.

--- a/tools/include/libxl_json.h
+++ b/tools/include/libxl_json.h
@@ -28,10 +28,9 @@
 #endif
 #endif
 
+#ifdef _hidden /* Don't expose internal function decls. */
+
 #ifdef HAVE_LIBJSONC
-#ifndef _hidden
-#define _hidden
-#endif
 _hidden int libxl__uint64_gen_jso(json_object **jso_r, uint64_t val);
 _hidden int libxl_defbool_gen_jso(json_object **jso_r, libxl_defbool *p);
 _hidden int libxl_uuid_gen_jso(json_object **jso_r, libxl_uuid *p);
@@ -44,20 +43,24 @@ _hidden int libxl_hwcap_gen_jso(json_obj
 _hidden int libxl_ms_vm_genid_gen_jso(json_object **jso_r, libxl_ms_vm_genid *p);
 #endif
 #if defined(HAVE_LIBYAJL)
-yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val);
-yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, libxl_defbool *p);
-yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, libxl_uuid *p);
-yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *p);
-yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, libxl_bitmap *p);
-yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                                 libxl_cpuid_policy_list *p);
-yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_list *p);
-yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
-                                              libxl_key_value_list *p);
-yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, libxl_hwcap *p);
-yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p);
+_hidden yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val);
+_hidden yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, libxl_defbool *p);
+_hidden yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, libxl_uuid *p);
+_hidden yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *p);
+_hidden yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, libxl_bitmap *p);
+_hidden yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
+                                                         libxl_cpuid_policy_list *p);
+_hidden yajl_gen_status libxl_string_list_gen_json(yajl_gen hand,
+                                                   libxl_string_list *p);
+_hidden yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
+                                                      libxl_key_value_list *p);
+_hidden yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, libxl_hwcap *p);
+_hidden yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand,
+                                                   libxl_ms_vm_genid *p);
 #endif
 
+#endif /* _hidden */
+
 #include <_libxl_types_json.h>
 
 /* YAJL version check */

