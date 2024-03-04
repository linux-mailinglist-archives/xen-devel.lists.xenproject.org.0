Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52586FD87
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 10:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688235.1072214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4bq-00053p-N2; Mon, 04 Mar 2024 09:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688235.1072214; Mon, 04 Mar 2024 09:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4bq-00052L-K0; Mon, 04 Mar 2024 09:27:46 +0000
Received: by outflank-mailman (input) for mailman id 688235;
 Mon, 04 Mar 2024 09:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh4bp-00052F-ND
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 09:27:45 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74ea1c0c-da09-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 10:27:44 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so748424866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 01:27:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ty24-20020a170907c71800b00a42eb84c7c2sm4614928ejc.142.2024.03.04.01.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 01:27:43 -0800 (PST)
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
X-Inumbo-ID: 74ea1c0c-da09-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709544464; x=1710149264; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9d6dkSNgHqXCPZ0f9CEpi9l3GKkSecj76fgrhfhUdqs=;
        b=dbCN7b2K8vMEpp/4hB6TB4IGTooh8b+xeuNS24qyd/ZTgMLLoqTHziiPBf4mVZSJ09
         yz7prK9zva45VFiIuEysGa08GzBkvfDo8o0zKXJt0pYZmFvIIhQyt8biQm+DwtSvYLtF
         RN7p5VG+Mams0yhWCFqBYS7EMauXbQu2vD61j0dMqw6fH+Ns4erQQnaunXfqm7l9X4+J
         8ecA/fwAM3xxj4QA+O4kQKqRAiL5N3WX7vB0MbyS8N6gLF8FyynBgmtFXMxhd8rE2cck
         n2PTMjUdP/ymy8HZ0vBpAwj4MxUvyT+Nb80Uad0k9NHQcbSCXYebjiIqXx3kf+hfqs3Y
         JsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544464; x=1710149264;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9d6dkSNgHqXCPZ0f9CEpi9l3GKkSecj76fgrhfhUdqs=;
        b=lWGDH2ObWECb+BINo57rh2FOeWX4Od0gzRH7cN9xi8w92OXCKj9yGd9YnWMaopA+Xw
         lpQIPjqMgFPgJYDOcRuq6QbvpnYuDl8RKOXCyqrmOS1NQM3m8vngQr8q4gj4saVzeAv6
         IXvJ8dQCnp/KLkiIiCPv1WbPXI2KbAB167qM5zmDjGvuBCggB/ZJrDDff27tXK9oCcn4
         9M2EcM2iJ43xi2n61JaZa22JvXk87Ghn4acjOOtqm8eoqbBx8xGdsxxKRA+6MPSyBDgt
         iGjVpb5aY4urUotDujTXV5JHG0i7Xjetu2YlFJ10dOulH8xNahFDrFvEQYwqlk1CseVS
         09Ig==
X-Gm-Message-State: AOJu0YwNdCYcja7+mgzjMSTmF3KHpmymjFdqR9LdU3v8F/8x0uc4eQHX
	kcr19FI3cqBRxfUu4FTOA0T/wI5hHg9PGjiX1+GcbylCckXJ7kAWdgASL5sFZbFgjqSSZOuGRb0
	=
X-Google-Smtp-Source: AGHT+IEzfpawoAp3uAPLdCNBoMkSqkzjl6xbjWhog9MhQRqkvxZ4C2Z08Tx/GVBx7/cxRXJrRK8mQA==
X-Received: by 2002:a17:906:3606:b0:a45:6d18:a80d with SMTP id q6-20020a170906360600b00a456d18a80dmr636686ejb.62.1709544464103;
        Mon, 04 Mar 2024 01:27:44 -0800 (PST)
Message-ID: <ff10dd86-6894-434f-b2cc-9407a83a3487@suse.com>
Date: Mon, 4 Mar 2024 10:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: drop AMD SVM and Intel VT-x sections
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

We'd like to thank the VT-x maintainers for their past contributions,
while at the same time we'd like to reflect reality as it has been for
quite some time. Have VT-x maintainership (and for symmetry also AMD
SVM's) fall back to general x86.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -220,13 +220,6 @@ M:	Andrew Cooper <andrew.cooper3@citrix.
 S:	Maintained
 F:	xen/drivers/passthrough/amd/
 
-AMD SVM
-M:	Jan Beulich <jbeulich@suse.com>
-M:	Andrew Cooper <andrew.cooper3@citrix.com>
-S:	Supported
-F:	xen/arch/x86/hvm/svm/
-F:	xen/arch/x86/cpu/vpmu_amd.c
-
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
 S:	Maintained
@@ -357,15 +350,6 @@ M:	Kevin Tian <kevin.tian@intel.com>
 S:	Supported
 F:	xen/drivers/passthrough/vtd/
 
-INTEL(R) VT FOR X86 (VT-X)
-M:	Jun Nakajima <jun.nakajima@intel.com>
-M:	Kevin Tian <kevin.tian@intel.com>
-S:	Supported
-F:	xen/arch/x86/cpu/vpmu_intel.c
-F:	xen/arch/x86/hvm/vmx/
-F:	xen/arch/x86/include/asm/hvm/vmx/
-F:	xen/arch/x86/mm/p2m-ept.c
-
 IOMMU VENDOR INDEPENDENT CODE
 M:	Jan Beulich <jbeulich@suse.com>
 M:	Paul Durrant <paul@xen.org>

