Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1408EAD54BA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011638.1390091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPK1P-0002ta-Kv; Wed, 11 Jun 2025 11:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011638.1390091; Wed, 11 Jun 2025 11:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPK1P-0002qw-Ha; Wed, 11 Jun 2025 11:53:35 +0000
Received: by outflank-mailman (input) for mailman id 1011638;
 Wed, 11 Jun 2025 11:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPK1O-0002qq-1G
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:53:34 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2bb4c12-46ba-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 13:53:32 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so4342309f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 04:53:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603077f2csm85859935ad.36.2025.06.11.04.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 04:53:31 -0700 (PDT)
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
X-Inumbo-ID: b2bb4c12-46ba-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749642812; x=1750247612; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUpqnTcS/vMxQB2/qWUtThm4ZhOearteKd0B8fpwgvk=;
        b=Zn/eiV9zZTkq8qWXAZySK1edi1O62r6sySHbW3FPbEZxwHBTb79UXVuoS3z3CP1/qy
         wl8zd9a8oKThaP2Phn324jO2CCahww0Or9slmYPDEMz8uFBfrusQJ/4DcNBEhFwx+aMX
         AOoK+ogD2xKyJjMaD6faNJwkHmRsZJ6pNeKTE0zIF1JnxW65D4nrvWFotkAd6bSNfAjR
         Doc/Bkl0vMS3TR0vMYL+zYxreULo8/7kOOrGf/+NaLNh9RU3P5k+uNOpDL7TekUlxibx
         0t9Dkp/Ghm9HYkptE1e9zd9qfdyT6XrNJuoLuLOPyPGg4imYxpz8OGrICbGOO+UZdS+U
         q60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749642812; x=1750247612;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUpqnTcS/vMxQB2/qWUtThm4ZhOearteKd0B8fpwgvk=;
        b=lL2mA+hl6Z8mI577A1Af8Y4d+i1m+p2fDCiBYqk/d0A0wY136WS9YCc6xEEG1FuXSu
         oAf3XbPUwjTefxwAdLeVuZQHkL3pA/b3BwgQcbBoUpmFPpU5sL7tOURG3TyvkjXJVNit
         0voKFVWzfbB838PZMo9kb+nxw0PtAPcmEIQdpi1M/9ap4qXOOn1sRmCRBcAP/PF+bl3l
         Odhu2iq+Pgzq3PnM2iwZUieIp/Z4HntdtedyTNmMEDNrQVqibH5LShqhLtIrHQxA0ogm
         OOmAAyvAi79S26HIoh9Je6QUOM0QfA5dAIG52AqQNC+ea+6K+5GEe607jEFGO0rOEXfm
         /yeA==
X-Gm-Message-State: AOJu0Yz67HVTPtAFu7DeJkqfuFRvHA7gtx6tU7IimpfbVNh2g4eEw7zD
	lBAAI/0HGReY//m8MFcMU8XkPRpplGfbpIgO5c/sYP4cQHYSZp++8wsJTnQCSachS2NJ2syeH1A
	+Tb8=
X-Gm-Gg: ASbGncvNrmUatyOBnl8M6fqw1c9EBZW1hy9ZvD/nYT4pdbKTkpteXqcW5n/XKVxwgWs
	W1YpevGgacx7m6z3mU8H0TSJP9gBbNB8v7Ti5ohw/QfkdVmTXtAEQ6DqD2qY0A/SGf/oztImWi9
	5rBb3g02Ind4Hw4pieGwihdEXhfkOXykMIGZAeUT9AbGsyK9To5yrV0vxn1VNkxHXODn3TJKDND
	hjP83mABA4POsUkVIoOZrA0M8o+42ldz03pYZ1jJ/T9KnfdTWXgAhvbi5MYueN1O7Oa2l7mjF60
	cUffKezpzAfOy+B9Lif6XvIKR0GR8WPDcjT4kiayG8H47yObL4ZEdr1sDCVZ1HrdleBnWBVUpDx
	EHyusQnntdVsdO6NGsU/ZIuOrwR75QIUfinzg45EWNTKB69Y=
X-Google-Smtp-Source: AGHT+IE91FOsJX86bWbyU8AyuQPpicRteiTDvBVkaVvAcVrV+Ib6kPhoWihWc6gKhdcyFaxX/H+rjg==
X-Received: by 2002:a05:6000:4287:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a558a4465fmr2085576f8f.41.1749642812090;
        Wed, 11 Jun 2025 04:53:32 -0700 (PDT)
Message-ID: <ce83a4c5-9007-4363-b0b7-6a87aa7693b9@suse.com>
Date: Wed, 11 Jun 2025 13:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ACPI: adjust decl of acpi_set_pdc_bits()
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

The commit referenced below changed the type of the first parameter.
Misra C:2012 Rule 8.3 requires the declaration to follow suit.

Fixes: bf0cd071db2a ("xen/pmstat: consolidate code into pmstat.c")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -186,7 +186,7 @@ static inline void acpi_set_csubstate_li
 #endif
 
 #ifdef XEN_GUEST_HANDLE
-int acpi_set_pdc_bits(uint32_t acpi_id, XEN_GUEST_HANDLE(uint32));
+int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
 #endif
 int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
 

