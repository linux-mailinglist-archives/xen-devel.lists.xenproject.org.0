Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7810EAE7B66
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 11:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024494.1400340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUM3P-0004QC-TD; Wed, 25 Jun 2025 09:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024494.1400340; Wed, 25 Jun 2025 09:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUM3P-0004NY-QV; Wed, 25 Jun 2025 09:04:27 +0000
Received: by outflank-mailman (input) for mailman id 1024494;
 Wed, 25 Jun 2025 09:04:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUM3O-0004NS-D9
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 09:04:26 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 628b4598-51a3-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 11:04:22 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so4286268f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 02:04:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c887586dsm3856893b3a.158.2025.06.25.02.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 02:04:21 -0700 (PDT)
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
X-Inumbo-ID: 628b4598-51a3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750842262; x=1751447062; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAVbUXgy7vt1kY/50PVUiDr+/RKIFhkPfiwiNTsCpWA=;
        b=gf5tvw1J4q3fP68anuv9xKIpPRkZ8CpmmRDSVjL6ZE2TdzRQ4An5j9MVq0OYtFM864
         VKDoABIj2KjE0yl9R8ZwT8lbOBh0C1WATGRKf0f+JNzEYkUhUmfIL2SdHCEoJEiMOdAM
         kZar6Hf//piY35v+damdgIIuUmz057fjmFJiBc0Hld5kS6VCUONxSPTEji2MmVOtnKJH
         9/vPZgP+6FEunrDsX61Xff80dfKOVJH80Z61qGsIFhk1BEAqLBrKGOUM98ZBfPMSe5F+
         B5Ng90x/wTbguGPNDiYax9UF75HnA7U6L04gVNU8CaKbp9BEsSRVhtsd4aBLxi1HrqlW
         UJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842262; x=1751447062;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAVbUXgy7vt1kY/50PVUiDr+/RKIFhkPfiwiNTsCpWA=;
        b=lSIcMQrtPAhmaSJ+Wjg3LL4gjsUnanVntEim4tp9vwYQ+s5XMIs8lR6ghHaRrnjnMQ
         8NH68C/ahWFemcIBCaQSLKY0wLWjBDKQYMlje5dFO/Uuy2PzgM/DX5/oTLXUPE43lyws
         wRNp4xLISw/IPNwrS9RL97haTvyXmXZHv9+XJdrdSTsrgT+ZtgHI/tz9xvSUKmS5Ykrw
         KWdh4JJX22lOx5H+9+kvnASRPL49ABUKztHrFe9dg6oh8o40dlPzZdqtQ/fLYR5dCZQO
         X6iRuuu6SrfEyMc1Vwv6YV26aW+gRdOpZuff62WuWoQryfvlY5ZpI0jEEIF1kWqfjVC6
         3ahQ==
X-Gm-Message-State: AOJu0YwGxOKI9X33FkuFOy/K7SOEGITk0g9LASxUCNbhDt26yXYHaZdN
	v2YfB+Rpd2doNy1oW7hZARDMMs8jUwTGrpO9//U4W9i6GJr2q+Q+Eao4yAm0GB+Phmgih4P4nXA
	rVOA=
X-Gm-Gg: ASbGncsGjVSsw0RaY7WK69nwH1v8MA4rU1o/eYqKB064COBAPDqeVYyV+mcjVJUz8ja
	flW5b1WRCY2PQMHjiRt2v3qzAU0k7Naiyx15CrN2ILPA5lvT5O0OAmPYAE9pq4KbUFFAS7A/j1r
	hMGlsWJ9xWrDcfnE//DuEJeP3XGAgO+QQiS9pGhsr7k+oE2z9kio4A2MCR7mZqOqrdCbCf6buCo
	bYLdAxhxqdDCggeGABDmBQ9mdXnQILTnkzb83PTD5g6NUpi4wV8dtCRCKdswee75BYBQ2TLnYaT
	aRi9+0Mtg5hXrrc59wNHLzDOOSLEJKP4x7p/iLq3vskBZOlGKe0J4zcg6ybHTtfI7fti2Gz304R
	Ycf+wAOdCbcdqwxknCsQFNcTvsuspo3XyQuFEUYsmA/X1Cwo=
X-Google-Smtp-Source: AGHT+IGRO4recyp9hehWWSeWwTskw7onPVlriAxn/9Z9hc0X8O49QnU6wSNuB1YILzsMk/DnynHJsQ==
X-Received: by 2002:a5d:58cf:0:b0:3a4:f655:8c4d with SMTP id ffacd0b85a97d-3a6ed642557mr1253147f8f.27.1750842261789;
        Wed, 25 Jun 2025 02:04:21 -0700 (PDT)
Message-ID: <f68299c4-7aba-4bac-a50c-182f3cb5686e@suse.com>
Date: Wed, 25 Jun 2025 11:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: don't have gcc over-align data
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

For (aiui) backwards compatibility reasons, gcc defaults to a mode that
was the exclusive one up to gcc4.8, establishing 32-byte alignment for
aggregates larger than a certain size. We don't rely on such, and hence
we can do with the psABI-compliant 16-byte alignment.

Savings in the build I'm looking at:
- .data.ro_after_init		 344 bytes
- .rodata + .data.rel.ro	1904 bytes
- .init.*data.cf_clobber	 232 bytes
- .init (overall)		 688 bytes
- .data.read_mostly		 864 bytes
- .data				 600 bytes
- .bss				1472 bytes

Overall xen-syms' _end happens to move down there by 2 pages.

Clang doesn't support the option, presumably because they never over-
aligned data.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -8,6 +8,9 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFF
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS += -msoft-float
 
+# Don't needlessly over-align larger aggregates.
+CFLAGS-$(CONFIG_CC_IS_GCC) += -malign-data=abi
+
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)

