Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87B9149C9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 14:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746542.1153625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLimZ-00079O-8O; Mon, 24 Jun 2024 12:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746542.1153625; Mon, 24 Jun 2024 12:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLimZ-00076j-5l; Mon, 24 Jun 2024 12:26:51 +0000
Received: by outflank-mailman (input) for mailman id 746542;
 Mon, 24 Jun 2024 12:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLimY-00076d-7d
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 12:26:50 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06a58c1d-3225-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 14:26:48 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so2450019f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 05:26:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3d43f6sm61430295ad.182.2024.06.24.05.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 05:26:47 -0700 (PDT)
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
X-Inumbo-ID: 06a58c1d-3225-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719232007; x=1719836807; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BISiRXI8VY0evOcJTWm+6GCK6MEtQaD4JyxX2gs5bvE=;
        b=f9yyvnmBApXk9V3Ik3L6CzjXlLm3P+CVNfHslE65/qUkmbPAX7ofbuEUM2QoBtve7Y
         mNdW7jcB+mO+BBb1svFy5OoY3LCT3zSmuoP6AJ4spsX4OuObn7onAMCcojloqhNCFOJC
         ZIsWZ32FyzqRzDqZA0LMuC+00wkj9yTR/pfF5glGOtkVo2kNX8VGAeCRvYc4ZQ8PpN1z
         Wj38cYUftXY+FdAyJMLw0QYWsnonDOXP2JbvTz6oYaOudltFdX+iSn6rddy7akYuFGXg
         dH+dduTTi8zZLqM9+xKoiyh21zvWv+ys+/2oGOBB8gXyc2fW/UhUEo1xFrGb2veghbQG
         Uz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232007; x=1719836807;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BISiRXI8VY0evOcJTWm+6GCK6MEtQaD4JyxX2gs5bvE=;
        b=kAq6m7RYs9FT8xFUGnWwLN09WCFSb7rLZIKmAVY+UoQj4G4JEFBIayiSvpr0DHyyxo
         17oSG/YehPBv11deJoT6dHSb8r2WXP4nM6xHbxmOY63Tpp2CmrkTmxdkG0yHdCJZIaLz
         G8FGC3++Sidf46Bfkn1TvyXHEQOvn8cdhkk4eEOr+ivnhb/EHMLVHQYs08OdQV/uVnJl
         A7/M63+M0ATVcx4dhH547atF96XNJC5N/lg1ZR4124pcl0iT+Fc4QqfmcfTMM2mAZGdG
         lNj0fqfFkMYnroLvU/474rdbC87EBvgCsxG5WCsJAcqb2lY9P69/1kQgWeaAKW08ydMU
         JFRw==
X-Gm-Message-State: AOJu0Yzty2tstTBUg4ze15c1MY2OMPeqr/lAPVf0HP+scQt7j+YAvCtd
	KgkLsTt9iJ817qPxj3i7Rc5BxoosxVzcmbFyoIkSTlDdzKpn7fVbAIla3vjD21ZFcYiMezP7BRQ
	=
X-Google-Smtp-Source: AGHT+IH4WPXDI4F+/OfjqRt/A2Ptuyfl1bT8g7viyJLsj3hJChWil4/ltAT2K+MmRrV/fK1LaY9UAQ==
X-Received: by 2002:adf:f512:0:b0:366:deae:bfac with SMTP id ffacd0b85a97d-366e3269282mr4065130f8f.12.1719232007417;
        Mon, 24 Jun 2024 05:26:47 -0700 (PDT)
Message-ID: <6fc55df2-5d92-4f3f-8eb3-69bd89bfea4e@suse.com>
Date: Mon, 24 Jun 2024 14:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19] xen: re-add type checking to
 {,__}copy_from_guest_offset()
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

When re-working them to avoid UB on guest address calculations, I failed
to add explicit type checks in exchange for the implicit ones that until
then had happened in assignments that were there anyway.

Fixes: 43d5c5d5f70b ("xen: avoid UB in guest handle arithmetic")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -86,6 +86,7 @@
 #define copy_from_guest_offset(ptr, hnd, off, nr) ({    \
     unsigned long s_ = (unsigned long)(hnd).p;          \
     typeof(*(ptr)) *_d = (ptr);                         \
+    (void)((hnd).p == _d);                              \
     raw_copy_from_guest(_d,                             \
                         (const void *)(s_ + (off) * sizeof(*_d)), \
                         (nr) * sizeof(*_d));            \
@@ -140,6 +141,7 @@
 #define __copy_from_guest_offset(ptr, hnd, off, nr) ({          \
     unsigned long s_ = (unsigned long)(hnd).p;                  \
     typeof(*(ptr)) *_d = (ptr);                                 \
+    (void)((hnd).p == _d);                                      \
     __raw_copy_from_guest(_d,                                   \
                           (const void *)(s_ + (off) * sizeof(*_d)), \
                           (nr) * sizeof(*_d));                  \

