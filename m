Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B5B0F1C8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 14:01:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053866.1422658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY9i-0000YS-Ui; Wed, 23 Jul 2025 12:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053866.1422658; Wed, 23 Jul 2025 12:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY9i-0000WC-RN; Wed, 23 Jul 2025 12:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1053866;
 Wed, 23 Jul 2025 12:01:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueY9h-00077G-5i
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 12:01:05 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4d9f4ce-67bc-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 14:01:03 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso3953688f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 05:01:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef82esm95030535ad.209.2025.07.23.05.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 05:01:02 -0700 (PDT)
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
X-Inumbo-ID: b4d9f4ce-67bc-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753272063; x=1753876863; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwpmrDDXoZWuxjl7QkuhILyhyM3WDzoMWBjGX4SE4HM=;
        b=hHCsB1drIwIH0ZK6zYbNaE7POIsvS1QIpODfzjX94L+WfOPgy95Tnn7t9eHrzuPR5/
         RWatIbT/p5Eeut4HJA4ZxlNqF8cbcu1VOefbqgplzmas+6nxKg1K1LNwpOwp2gUVrvnL
         D4m5TBHJ9Ob3GEd+C4Jj8fLnBnyuL+42Zw0aEYETPmF/DFEVE5c/cLX5Fn2CnT5lfZI7
         cIX2boQiPxYEA/dhV6hBskRs0C6DuoJectbadnaOu6Zp4V7O5v0Yz4c61C/Gwojkb8Co
         Eu4Dd7ocqAktlyJIvyPWEh4OO6p7IRw1HAnYXrgzNtZA37eTcTxlpWOyA5i6WRzZQci5
         ONBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753272063; x=1753876863;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwpmrDDXoZWuxjl7QkuhILyhyM3WDzoMWBjGX4SE4HM=;
        b=oNcxqCmJIhV10pigcwvW9y3aoeDEGx9ExK6Rlx1W1Ackjwe5Y9HTfiI5DGAqGguyL+
         PzOrY5GZdvmfHecP4FD4QMDBROIM1sgru8mb3YHtc2HkfffersxSUue5blwgvyppvSS4
         CsRzd1G8lVBJdc0w9YK4v7lAu039a+cVK9lIJ3BrzTGVTmP2cCBRebJeal8wY4BJTsb8
         0YkxLlLXZQdWSaxK5O1KsWYf/YL8wVQpsAXfqDg3fiQJFoFSV6zp9pGD+Ovl4UXs2r9D
         ULIPubZp75qqFLc1iD+pO9UVYbSMtrXW92XVmSmF36kVant89buYJ67cyoVMLBBldOGh
         VPww==
X-Gm-Message-State: AOJu0Yw8igbwByWVyt+6hmDgVWOfIXRem0zg2iyZThBmEPQE3fs5ydLd
	+uSF087WGm448whpnokNqvucceN3m2eZnRfHY778PJyy9r6qoJALlMMyAXjrLnccr1I6fQzvvTc
	0Oiw=
X-Gm-Gg: ASbGncv4zgjcZekKcvzGMJG1DUYN5Ieczxzk4ewVqPvuZSMd4Rxb0cgMJElnrCBv+WY
	7pAayVpJkVV7ogsn6w7ng6J9i0TkzYAcHZSyrdMoothjKlwRyukOT26A7lep49n3p5poAREseWt
	USNEqamqfUcPTf7wAB00XWvdctFiretA42xRMjsNfK6rBMKAtOvyMcGZxBMq1ZRtulqrXjcoRG8
	F5ehMhRbZb/QczoQfDpKYSh6CVvR9h03WcIn9Y/5LmMLNVoiC7QyXh+eU0jyKTqXjgB11uuTUo2
	OmJCHlI4LrFmMBinYCM1b/ohYVfX10wNl/fpdvHdH0f16VQnYII6qa/6VnHiCXUX2PJ6+fZxbo+
	ouarT8JxlruiuEqoFugb0Bfdyvji4q4PyMCggmUVXUwUjAQ+Wx65R2uixN0aAkDHL14x8Bqd4Mt
	izEmDkpcI=
X-Google-Smtp-Source: AGHT+IEH5TtauOAMkVKCoRdkSn7Zj9SDWTJHnyALehUA0eTz7JcPfKP9QSn5zSblUqPBr75ehhXmCA==
X-Received: by 2002:a05:6000:1885:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3b768c98f5fmr2203371f8f.10.1753272062829;
        Wed, 23 Jul 2025 05:01:02 -0700 (PDT)
Message-ID: <8b4e75c9-7633-4487-b56d-61218dfb93d9@suse.com>
Date: Wed, 23 Jul 2025 14:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPU: correct reset_cpuinfo() comment
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

Part of it stated the opposite of what actual behavior is.

Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
Reported-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -91,8 +91,8 @@ struct cpuinfo_x86 {
 
 /*
  * @keep_basic set to true retains data firmly assumed to be symmetric
- * across all CPUs.  With it set to false only CPU_DATA_INIT() will be
- * invoked on the passed structure.
+ * across all CPUs.  Only CPU_DATA_INIT() will be invoked in that case
+ * on the passed structure.
  */
 void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic);
 

