Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C08AE99D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710695.1110082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHCr-0002M9-FR; Tue, 23 Apr 2024 14:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710695.1110082; Tue, 23 Apr 2024 14:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHCr-0002Jx-C9; Tue, 23 Apr 2024 14:33:13 +0000
Received: by outflank-mailman (input) for mailman id 710695;
 Tue, 23 Apr 2024 14:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHCp-0002IN-Oe
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:33:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68a7f8bc-017e-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 16:33:10 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41a442c9dcbso18490745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:33:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fl18-20020a05600c0b9200b0041ae0048b5dsm481577wmb.45.2024.04.23.07.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 07:33:10 -0700 (PDT)
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
X-Inumbo-ID: 68a7f8bc-017e-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713882790; x=1714487590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BFXNdq6YoYaequ8GhZeipZXfz1Szm9kVsf7MfcSDAGw=;
        b=B7VEUe+lMhdfjrmQzYoo5MbIZQSpGeCVkwG7ZzFU4j5+Xr014wVccC1AxJIau+B66n
         KtTGmE51cSQbFGXUTdZ2I8XMiGiRIqzulvynLvh6DLVpo8boa7EzIyB1mq4xSMDzKaAf
         bymhaok4XLkIKe/m/1sXTGtRoIBidAA3Rx6fObkzmGYtNgHZeXbo8tSeEjiGX/5K5cf+
         rMgAXyikv66LfrF7cFRCFbcH/hfjZjSQ4o3QqR8Gd0YTO+/mNXmtSSEUKA3J8a2gRJAi
         g5a+CElhUf6cKImwIeRzGVYjeXm0PkTzK0tWvlMOkChCBuzjn+mI/kBK1ipLxNZHg67S
         NWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882790; x=1714487590;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFXNdq6YoYaequ8GhZeipZXfz1Szm9kVsf7MfcSDAGw=;
        b=SkvCAjXHkn4deoDrMJCyk1KTNy33yS4PUN0o4V8QdW9bAtlSi5rgIHZaKs6NhzSZPa
         sNgYfIFP4OposW2jf3sSnVrDdUuMUICh1WBBfNuR7BG6XYHPyntjWkkFMmmdSA+6UELM
         pWaATMlNu0tr1VX7ybcWhBACpgFo5rdaDzCglH1a/Mo+XolKlMCpVhcvWqnG8MpfbBKR
         rZoQrowqhtStS4lTWJTed9MMmdEcZWL9FXqT+bqd6vBneHhta+yjbsv0k4Hommvo4DqZ
         O9HXa9zrjLXb/roT2syMjT8m4TrWmuudtjvDQkFBxPTNRxEs8UkTH9E1DdU6xX7ygMhA
         fkEQ==
X-Gm-Message-State: AOJu0YxWbSAL7gb5EX8rGfQ7jytmjNUvBRy8ObcA/f24NXeJBgN47zTU
	YxcWbmxupyvOOZ2NyCNN0gUqH9d5Y4C2Qzp1i2fYcu3Qe/pC8+k+JeEVlAW6rEcwVsVMb8QP/AQ
	=
X-Google-Smtp-Source: AGHT+IH4QlFNBVmeCCGL/PoVHIfnC99naWmpwVMbrulsdRX9vlXd2W1Zm1HJYRSMV8b8NdXmyofDrQ==
X-Received: by 2002:a05:600c:348e:b0:41a:b961:9495 with SMTP id a14-20020a05600c348e00b0041ab9619495mr1366338wmq.25.1713882790229;
        Tue, 23 Apr 2024 07:33:10 -0700 (PDT)
Message-ID: <fea51839-4405-4330-8493-c544b9edf035@suse.com>
Date: Tue, 23 Apr 2024 16:33:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] x86/shadow: correct shadow_vcpu_init()'s comment
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
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
In-Reply-To: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As of the commit referenced below the update_paging_modes() hook is per-
domain and hence also set (already) during domain construction.

Fixes: d0816a9085b5 ("x86/paging: move update_paging_modes() hook")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -99,11 +99,12 @@ int shadow_domain_init(struct domain *d)
     return 0;
 }
 
-/* Setup the shadow-specfic parts of a vcpu struct. Note: The most important
- * job is to initialize the update_paging_modes() function pointer, which is
- * used to initialized the rest of resources. Therefore, it really does not
- * matter to have v->arch.paging.mode pointing to any mode, as long as it can
- * be compiled.
+/*
+ * Setup the shadow-specific parts of a vcpu struct. Note: The
+ * update_paging_modes() function pointer, which is used to initialize other
+ * resources, was already set during domain creation. Therefore it really does
+ * not matter to have v->arch.paging.mode pointing to any (legitimate) mode,
+ * as long as it can be compiled.
  */
 void shadow_vcpu_init(struct vcpu *v)
 {


