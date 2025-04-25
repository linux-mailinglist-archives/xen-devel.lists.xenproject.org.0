Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7BA9CC2D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 16:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968233.1357899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KUV-0000hB-Be; Fri, 25 Apr 2025 14:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968233.1357899; Fri, 25 Apr 2025 14:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KUV-0000ed-8r; Fri, 25 Apr 2025 14:57:23 +0000
Received: by outflank-mailman (input) for mailman id 968233;
 Fri, 25 Apr 2025 14:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8KUT-0000eX-E8
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 14:57:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 962dd381-21e5-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 16:57:20 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so15789995e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 07:57:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5369cc1sm26945845e9.32.2025.04.25.07.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 07:57:19 -0700 (PDT)
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
X-Inumbo-ID: 962dd381-21e5-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745593039; x=1746197839; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tektL52K2VrClu4Lx4GmS+MUB1SUZ5mGyZugGsRBqsY=;
        b=MdcesEUE/ec2fVl5KnhfJ2I9aYMsOC18bmFLwUXSk4X3WNP654c3RS6gdtDU8aMcTL
         WBIpwjYqt/bbsr9xV4g1nxMdVsfDiyqzUT2O/lp/2CAEzOm1G+mb2W1ERn7fJyTbSE8X
         HIuYK3uYmYM8bsEEQJGOhWuIT5Lb63TEZdDkttWa2zKsEeOJF9w5Z5l5ILfarMTEvtj+
         WumYVA+5IwSiRG4C0gjdLeoxZCZHzIwTfW/o12AnIR4Gmsoc6y43LXdgOqiwpqoXMN88
         9c5PaEfUkvWLImV9S+U/9CYqj1Llalk4vwicTMPEFrUb+nXdNTSznDU8hByEDOesv88j
         Bl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593039; x=1746197839;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tektL52K2VrClu4Lx4GmS+MUB1SUZ5mGyZugGsRBqsY=;
        b=eAGiHq0mxCVUJkgQw2LuEFrkEGiApI4sqWAuFHZtLaTPM4wnqOlwmazkOHurqFox7a
         cqkIrLD1u0mPzrUu+trMeSGhmXAPiHQ+xemgQ1vSdxzkAxqPgoeCQU1UOmJ/my61Nj8Q
         2mW8TeNXLwxQsqb7Nr95tEtqou9VncvjC1WwyHe/0rePNvSY9Pc6ZiU1lPs7GKynKVP6
         IPyzyO86hRegYJuAUY7I6jAIYcUufNNYCUMvqqZZ7FbOSfGWCxmuYMOvtnsAZGzyw6Ly
         LAQyG9pnhWoEoB0bw3WyH8oHUOchsnsKznIl/A0TJDq5LSRObIoo+DFq/aNUs1EO+Q3G
         SCzw==
X-Gm-Message-State: AOJu0Yx5UB/lO/3wCZxn5GwBTkLdeOY/zhQnE7L3F5ttJAJmd1onBZ5D
	CJKcwTaYOg0W0YfeGS0+/tlGjbRpcdrprOUr3gMPNVDixHhNso1hah6Sr6oH0zWUEW1srE77x44
	=
X-Gm-Gg: ASbGnct60uYsm8zWhIpOH6rFELL3ChLGrnNQXZZzdZKja4ZIlCo1YjvUyTY+ATVFQxo
	aV0JqeRq2N6tEvG/DlJ32LF3BlRm+4BMxirkAgQFBprFG1H4uAnJcoADJDLEXUMieKMYi9yVhAH
	niEKSWsZh6sHpjz6bqJ4nVC3XjZvxYx6bwJPsWoJ+bAHkOCUaIK+P0PWPpDCb5jJYUsRYxfsXpf
	+CufBCXDGs4OCTqoWlEPWZpGle4yhU8/549lSf4XZR6wAdcvijF3ywmYdta0Qs+i5MLWK+/8daY
	gYIWyFfByYc2p8CpjRgIJeWTCjQZinG9pq/+9BzGqcIad/DmII8bYR8R+SaeyKgqHVQTGLyJpKT
	ol8MRmCoKJdcgJ2hsK4ydWCUMZg==
X-Google-Smtp-Source: AGHT+IFZv2s/NHENR66TiYS21vg4TuT5/yX/xThiBTpIBICTej3BjvUx9EW2P2DsmxxE/rslZcjNjQ==
X-Received: by 2002:a05:600c:8597:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-440a6f4d886mr23296045e9.12.1745593039563;
        Fri, 25 Apr 2025 07:57:19 -0700 (PDT)
Message-ID: <8e31896e-3603-4969-af7c-3175ceacff55@suse.com>
Date: Fri, 25 Apr 2025 16:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: constrain sub-page access length in
 mmio_ro_emulated_write()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Content-Language: en-US
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

Without doing so we could trigger the ASSERT_UNREACHABLE() in
subpage_mmio_write_emulate(). A comment there actually says this
validation would already have been done ...

Fixes: 8847d6e23f97 ("x86/mm: add API for marking only part of a MMIO page read only")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Emit a warning message otherwise.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5195,8 +5195,13 @@ int cf_check mmio_ro_emulated_write(
         return X86EMUL_UNHANDLEABLE;
     }
 
-    subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
-                               p_data, bytes);
+    if ( bytes <= 8 )
+        subpage_mmio_write_emulate(mmio_ro_ctxt->mfn, PAGE_OFFSET(offset),
+                                   p_data, bytes);
+    else if ( subpage_mmio_find_page(mmio_ro_ctxt->mfn) )
+        gprintk(XENLOG_WARNING,
+                "unsupported %u-byte write to R/O MMIO 0x%"PRI_mfn"%03lx\n",
+                bytes, mfn_x(mmio_ro_ctxt->mfn), PAGE_OFFSET(offset));
 
     return X86EMUL_OKAY;
 }

