Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201485B5B3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683219.1062619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLjO-0005Bd-DY; Tue, 20 Feb 2024 08:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683219.1062619; Tue, 20 Feb 2024 08:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLjO-00059B-Ay; Tue, 20 Feb 2024 08:44:02 +0000
Received: by outflank-mailman (input) for mailman id 683219;
 Tue, 20 Feb 2024 08:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLjM-000595-QI
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:44:00 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302d2b1c-cfcc-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:43:58 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d22b8c6e0dso35155281fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:43:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e4-20020adfe384000000b0033cfa00e497sm12625060wrm.64.2024.02.20.00.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:43:57 -0800 (PST)
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
X-Inumbo-ID: 302d2b1c-cfcc-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708418638; x=1709023438; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOgTjEhG2Rt/NwiHYCsYDA5Wdy3noyY+yuNPEFFsPzg=;
        b=O7KtQojJn7TnyfS0OmV0h1QbhMZmJQABGHUu+KSzb6Xzwd17HKUOTFjUlMox1N6hEd
         8GzqIQmu9y8uEI2l1i13zMtfwRSEF/T78v5wkzkXCPBIk7Rq7rKIHRCy2qd1bOEPKv+e
         ITuy9ijBpmG5nE/YO9peOJKhPbUzP+e3m2gi7kbxyFDJFXS83QBzt6c58kXfsjQZs7SQ
         tr00fwdyRLyn5bZh/DvGIccfAf4psFjtX8DO4UzFyBgV1KgRDNlh2QQqXHBYn4Q3hS0g
         3hxO7zf8BXMsBssEEI6uhR8OrtllCBf09ELel1PmlFkUIHbm+K83HrJC0zhfHc4pBusu
         m72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418638; x=1709023438;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOgTjEhG2Rt/NwiHYCsYDA5Wdy3noyY+yuNPEFFsPzg=;
        b=hrsMUif5xoqzPEHZNtMumJqXPl30eH58JjBMusZE/S14NYyga/dnX5OYfIYlPXzzuW
         jTSgmT2B3VdJfb+wAO3FF6709jB8/7PH7RADxdQkQ76eDM3FiDhivf9j2VpvaZJEwd6a
         zamKTForFBku2dDYAFBGF99EdB/uBfgzreXqzMXMxVxsthuO0f0v7xlSz0c3FoP5rjYt
         W5+mWQRw6Hb4wprQI0gPiVX6UFAfhEMVXiFDaI2W8hn93sR/WnzURDlJkQ4McRjuNQjJ
         x+/DHnVQ57G1DhXY/HyIKExgx5TYSlryhYB1W4vteOyMjzK5XRMrl1igOwg+kgZHXb9K
         /OCw==
X-Gm-Message-State: AOJu0YxCFlfg69FCEN7sIWLv4/fPI4WyFMHEGVJUWJcHNV79OXUr7ox+
	IoqaCzTqZLO2P3IcD1W5z20X/T0sZG6zUARBA0jsfZL+XahfLxSHKghFd8ifpn5HXhP6TFrxqPQ
	=
X-Google-Smtp-Source: AGHT+IH+V5abe8WkFg6AOmptl7bUoXVIyt0//P4+uEvxo1d/fUMC9mqKG0K8DRD0ExxEfTDfM6i+aA==
X-Received: by 2002:a2e:6e08:0:b0:2d0:aa06:f496 with SMTP id j8-20020a2e6e08000000b002d0aa06f496mr9653761ljc.40.1708418637886;
        Tue, 20 Feb 2024 00:43:57 -0800 (PST)
Message-ID: <55c3a781-17f8-47f2-9629-515e1aea77aa@suse.com>
Date: Tue, 20 Feb 2024 09:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: make sure build fails when running kconfig fails
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
Content-Transfer-Encoding: 8bit

Because of using "-include", failure to (re)build auto.conf (with
auto.conf.cmd produced as a secondary target) won't stop make from
continuing the build. Arrange for it being possible to drop the - from
Rules.mk, requiring that the include be skipped for tools-only targets.
Note that relying on the inclusion in those cases wouldn't be correct
anyway, as it might be a stale file (yet to be rebuilt) which would be
included, while during initial build, the file would be absent
altogether.

Fixes: 8d4c17a90b0a ("xen/build: silence make warnings about missing auto.conf*")
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative to the %.conf rule adjustment would be to remove the file
only when the sub-make there failed.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
+	$(Q)rm -f include/config/$*.conf
 	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
 
 ifeq ($(CONFIG_DEBUG),y)
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -15,7 +15,9 @@ srcdir := $(srctree)/$(src)
 PHONY := __build
 __build:
 
--include $(objtree)/include/config/auto.conf
+ifneq ($(firstword $(subst /, ,$(obj))),tools)
+include $(objtree)/include/config/auto.conf
+endif
 
 include $(XEN_ROOT)/Config.mk
 include $(srctree)/scripts/Kbuild.include

