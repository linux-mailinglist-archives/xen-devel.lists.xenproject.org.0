Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D6ACDAE5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 11:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005289.1384774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkJz-0002xN-B9; Wed, 04 Jun 2025 09:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005289.1384774; Wed, 04 Jun 2025 09:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMkJz-0002uP-7g; Wed, 04 Jun 2025 09:22:07 +0000
Received: by outflank-mailman (input) for mailman id 1005289;
 Wed, 04 Jun 2025 09:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMkJx-0002uI-Kx
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 09:22:05 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f8353e5-4125-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 11:22:02 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-604b9c53f6fso2573848a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 02:22:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7fed60sm1059114866b.24.2025.06.04.02.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 02:22:01 -0700 (PDT)
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
X-Inumbo-ID: 5f8353e5-4125-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749028921; x=1749633721; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyJju7FtrJuI+Yce7p+wMhH4nnhxOspZPYR9aN/hzpM=;
        b=eofn/ggx83+bkyTBZ6kTp/vXLzkd0muV5A/tdMRMw/0mTRzTUMLNcF7HaOclZQKKZx
         JibE4mZ9VMQdKzRgrwJL6D3Zc3OhW/a1WhA4j1KKNaLqCSjasMJ8SKZpo/VoknOIr0BS
         G/GdrXyy8h+tQzyyLd2tkWPgUBrNK0OrAV9/vfj7wZ2d6GEQnSNel/FWw9uENZre7CO/
         NGZcGmHZ0W+4V4WMCJ63R5UToxZ7Hg+s7asFb1UR/w+p3AduZNduss8FL0pTewYaImgA
         QgkuQyp3kkohqGqhMBRgiDoUVdfIemoepqUDZF4igkcFu7m3/alh48uCa+aSBPm7iYky
         WkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028921; x=1749633721;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyJju7FtrJuI+Yce7p+wMhH4nnhxOspZPYR9aN/hzpM=;
        b=m6sC2WJvTZGMgMosQ1dlbcu49EfHqMekqJMuHg6tBQX+Cf5RWjgMYMnsVOdpozso/O
         bR2kKkTkTEEE9Yd8xVMFAAI78gJA9zbJ83WkAxk0P5n/k/WS8SPS3BhxSDhK8nAEFwHt
         M77CuPYhBLBFXTkm9gEbYPMR3Ay/w+tyJj7snME+DfiXxR9IJuhgfngps0PcL/faL3ZG
         bMtPYDGXiaAV2MSlO5vNuKjEZQKlQ6OTMIUv+g2qkMToDON+ORWDFw3JBp1D7dLFpnKJ
         C54DMeSwfnEo6zxQczK9YBqUgydqe77ZWE3dAak5cz40ENeaIZ4Hn3YejMrGudScvza2
         Xeeg==
X-Gm-Message-State: AOJu0Yxg663jXJV/y3A8yqNQxbyZGIgHOJQCLwg0xlzPD9CHsv3tvCHU
	iwhzc2GQ3jg4NH5eoGsDcEkG8xl3xaS34xtGlEEnK5dJJGX0edbwfxbLQoipSuoTv1Rz+eOk6Yw
	FBI0=
X-Gm-Gg: ASbGncuDWfgYO0CKJR7Z1XB6Zw6qXexDKwxofLGkUtkRG6GVGgqZiP7MM3a8UqYHC9N
	S6RDLXAxyGMkS4DFHZhqCcg7MKShJ/mGklE6xA3eHUsVdMoEQc5Hisc+g1gSIrbHac8FLP1hPvY
	6IpgUrseq+QzGmUPiocLX6FG8S4yBSb7JwbYcpK/vemgalijkZv2PkGHGu+B/kxhvaubba0XeQ4
	WmWVyxMkxjlNKMbFV2moQ+JBvSsR452ZFJaNeBetFVtRvAeRqQIXlo3uqJgaL0nMki+kuAv3MEm
	caPzojACj0DsgV4Asqrb2J2VlT1VwY0KPlnBkXjrmVRPPmhChEfdeKsN82zyK7R+HJ+JujCKsZ+
	SttUe6FVYj8/iclPAYtcF/Uw3zTgWuabh36Mp
X-Google-Smtp-Source: AGHT+IHBvWeQZWoOHAEtcxhVvqXA+G9HI/tcnryBcpwHkW5Ivj2urUODZ+G9/bVqQ2A05vEWN9OGtg==
X-Received: by 2002:a17:907:3da3:b0:ad8:9e80:6bac with SMTP id a640c23a62f3a-addf8c996f9mr201719966b.10.1749028921461;
        Wed, 04 Jun 2025 02:22:01 -0700 (PDT)
Message-ID: <5dadf381-0f97-4362-93ed-aa5b01d73d88@suse.com>
Date: Wed, 4 Jun 2025 11:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: make mmio_ro_emulated_write() static
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

It being non-static and it not having a declaration (anymore) violates
one or more Misra rules, iirc.

Fixes: ff3e5dfa7c2d ("x86/mm: move mmio_ro_emulated_write() to PV only file")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -337,7 +337,7 @@ static int cf_check mmcfg_intercept_writ
     return X86EMUL_OKAY;
 }
 
-int cf_check mmio_ro_emulated_write(
+static int cf_check mmio_ro_emulated_write(
     enum x86_segment seg,
     unsigned long offset,
     void *p_data,

