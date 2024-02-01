Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DD845222
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 08:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674232.1049048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVRfd-0002jW-Ae; Thu, 01 Feb 2024 07:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674232.1049048; Thu, 01 Feb 2024 07:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVRfd-0002hr-77; Thu, 01 Feb 2024 07:39:37 +0000
Received: by outflank-mailman (input) for mailman id 674232;
 Thu, 01 Feb 2024 07:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVRfb-0002hl-Uy
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 07:39:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a8e9613-c0d5-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 08:39:33 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e72a567eeso5785675e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 23:39:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 10-20020a05600c22ca00b0040ef8aa4822sm3522786wmg.38.2024.01.31.23.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 23:39:32 -0800 (PST)
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
X-Inumbo-ID: 0a8e9613-c0d5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706773173; x=1707377973; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bz5FmuhEJiQexu5mu42jZymD7KqSCxtSIt0Um8+gwT4=;
        b=db6x70WhrqzoW5Ng8Iau5RWM6t9mXmB3xi9kcOmNmjIrGb1Cen8gjHHvzgBcp/TF0H
         P4BS//6BeqqCIHw0tXj55TwHne5wwPup2CthRnmWGVzRBgCGNTKUrdVqFG9viKL8wFNY
         YFGRmo0/OwvdQ34q+QX11+w+MU06hXpvQDxz6IK15iJJSQTgYgcL5PsDqYfuls2fQLuW
         G1AaA920xaPrfQ7w01CHgISagsP71FmkZSsuGCVC4GDiFe/zjiG54eOAzuhw7nGga9y5
         jX8oRgQpWJW6k5lR6STCOij7OUD2bRBMn0uOxHksJtIHEC83P3HDaE+7dXZE+nVvkEqn
         eWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706773173; x=1707377973;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bz5FmuhEJiQexu5mu42jZymD7KqSCxtSIt0Um8+gwT4=;
        b=nI5azqFofOsk0vhKLeGGb7ABiRHKji4RqThAGwPNLFikjLag0M0SCOgYbuQsnoWStN
         bZ2zB4Q65uZZsExPWYZo3EuRPwADZ40gE2ws4qLapaqzMYUDRiCezYsuItAfF3gtrLba
         IX1VKbI88q1DWrZ1qNjS85JXUWGz2BGPBzNya0e64bi5GWDJNqG6Mns1vnmJypQtE+vb
         RcKSD6y6/vIYotyvWYYIkVVLmd+0jGgalAVmWOM08GA9XbLYjsPuvC/FxiFqnDSOW5ko
         eHQoqA6T8dYd86Ptmr8PBG0R6vpDKoJ+X5xHAmBNto1mYa60EtIBkJKo2mOMj2PQFost
         +mLQ==
X-Gm-Message-State: AOJu0Yw9JQpl72P5F4aM7aaok3H1ymzt4hmmgVK556tT4e9FgWG2hW04
	t8mswSdSeF2q52E5kQYAoiesDje4AayPc8iJbXNOWd3kTj+w+M/Idi9P21oujXB5LV7LnUlBm0I
	=
X-Google-Smtp-Source: AGHT+IHI+PDZQn2TwuOAWsQO5Xun50aTkX0BHz5ysmzYQWPCRPzhA7d12I0X6nQ4pfD8oCB7K9+R8w==
X-Received: by 2002:a05:600c:538d:b0:40e:66ba:7fff with SMTP id hg13-20020a05600c538d00b0040e66ba7fffmr3798549wmb.19.1706773172939;
        Wed, 31 Jan 2024 23:39:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVkJeNTuUFK4VV99ciwxWA8mAtOgklaMsawAgkLQgEbncOZYC7E1zsj0RukpKDSFqGb6ZYlQbFlvq73DZwyvKFeZyqX+aFzsnhD6IGVEYKttQ==
Message-ID: <062053aa-455e-43d6-bc11-e25dc8052878@suse.com>
Date: Thu, 1 Feb 2024 08:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] shim: avoid building of vendor IOMMU code
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

There's no use for IOMMU code in the shim. Disable at least the vendor-
specific code, until eventually IOMMU code can be disabled altogether.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -21,5 +21,7 @@ CONFIG_EXPERT=y
 # CONFIG_LIVEPATCH is not set
 # CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
 # CONFIG_TRACEBUFFER is not set
+# CONFIG_AMD_IOMMU is not set
+# CONFIG_INTEL_IOMMU is not set
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set

