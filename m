Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D59CF8A36
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196143.1514018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ZN-0000OB-Es; Tue, 06 Jan 2026 13:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196143.1514018; Tue, 06 Jan 2026 13:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7ZN-0000L6-C3; Tue, 06 Jan 2026 13:57:57 +0000
Received: by outflank-mailman (input) for mailman id 1196143;
 Tue, 06 Jan 2026 13:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7Rz-0004MT-QV
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:50:19 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a340ddc3-eb06-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 14:50:19 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43260a5a096so624029f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:50:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0daa84sm4502490f8f.2.2026.01.06.05.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:50:18 -0800 (PST)
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
X-Inumbo-ID: a340ddc3-eb06-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707418; x=1768312218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LxIHHnoWmRfEZQKRp7c/KawtwyGIc/YRyMoiBmbjtBI=;
        b=RsrYTQMd77w/i4NR2tSMUQeGxnUa5vi08TgmHHTS8+NeY12NvLXlLVr6Ma95yWIB/P
         d3qLDo8J+GttBcWDzz9RXYtm/51+CzY85nh2ROhV+PzYscPUmXCUc2VKmGt4lb/+qt0l
         O1IPOLTDwwf8STmaxY91GGjYAijrpLUvZVQjXqLnmqcHDoysY66XvBPI3RMOLasIWEyT
         PfCqlTvU7SKbPwTLKG3V0A1sxGNwFRJHEaxTF4xBV1X5LU+t7o/TihonsTKq9Mna2p3u
         8QKwouyXfpdEAJnhYSInaKU6Kc8dWMj919mzRyuCPFpC18BB7wdf3lqCbZeZXqy76c1F
         HdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707418; x=1768312218;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxIHHnoWmRfEZQKRp7c/KawtwyGIc/YRyMoiBmbjtBI=;
        b=ONIB+vNLqVZbdnEnKl5YSSBiy1962kRTXW7oaSHYsp5qEaSafsNJkdIeZXbVdR6iF7
         YUuQdH1xJc+lLHOIjvFpiUsp4tuycuDC4GMnMXamWM+LCTn4HZWMzVFiNb4eMoHPShh9
         4zK3/30ZDQMFN9xwUQ/52/7UbaOQ3EvXxWHhngSwYAlCO/1xYaXynvM65/ljWPBfmVIM
         A9KVfFU17t4v8XLIqvzAslkf2oqLb/uHw7TLSg9YvF5JWQN3nYBs+lwfAmHl+TgV5q4D
         kE7lMqmO4oB/oLWwO9+sjYpspQL17ui+x4QQ/rybXjA/WndqvHI1htDXkidXPWeiAoHA
         d+WA==
X-Gm-Message-State: AOJu0YxTgMMgN/8XsZM9PpjYwc0zkteZUlfZ85C45gf0TJSE3CFkESls
	Pa8fFsDhWuQrz23bGTQ1Sf/J7uyuTi9wdKpgCkDG+5ivHMKfWL8gS4iTsml0k7plSnBwBMKxNwd
	cngA=
X-Gm-Gg: AY/fxX7cfQNJK5Lh6QmfRKY9/eAVJargNQagFH3RstYNQsxwJK8j0OSpF6oFhP2Bvvg
	j0SQQCh66g/4embbNOp+MH1nUGVKI1NIYOj9Z+oWMJPnIRi/s/34m2I4nwTyHULc3XkwdSOqfeV
	wjp0F5h+CFwDqNBocRjlccWNDogDqQRnMyj8xYzWk+FCyP/iJGGN7K3vKCK+8+D9pbe/Md3wwO+
	6GVaaSkGVSA1IOQiQP15/qxbhLDS42ouEDMUQtihrYXWshlKnloeJ6TzMHxyOE9raxGYW4kIYUN
	IMTozgdhxZXdUkKlOBNRii+1Rx9OfOE0vWmbgkoKQzcNABj4bUWnbeRh0OL1Oo6uZZH00IOFPdA
	25+uFjP/0bYj7LDkrUioGcJvPHnFpQsPilwHTEzFz8Xussk74kARIlhhYq53yxG3SZwfIyyoiqY
	NwEDAxm7F5xmdXEKgs7xaHvMbpADsUdd0Ra8mf4qodSlvWjb5W9sGyMPJJChYgTEZMqaqOJ5KbG
	Ao=
X-Google-Smtp-Source: AGHT+IFoIKcKZEb6fpXZ3yLHOppIPAnw6aSQPSZKTVyBbq08Aq6Hb6k95aMw0wy4H5RvXABb/dNEoQ==
X-Received: by 2002:a05:6000:2c0c:b0:427:23a:c339 with SMTP id ffacd0b85a97d-432bca2ac7fmr3599687f8f.14.1767707418501;
        Tue, 06 Jan 2026 05:50:18 -0800 (PST)
Message-ID: <432bb0bd-96a6-4505-8c1c-7e8eb4de1f5c@suse.com>
Date: Tue, 6 Jan 2026 14:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] vPCI/DomU: really no ext-caps without extended config
 space
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
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
In-Reply-To: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Whether to emulate accesses to the first 32 bits of extended config space
as read-as-zero or read-as-all-ones depends on whether a device actually
has extended config space. If it doesn't, read-as-zero isn't correct; not
getting this right may confuse functions like Linux 6.19-rc's
pci_ext_cfg_is_aliased().

Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -830,9 +830,14 @@ static int vpci_init_ext_capability_list
     unsigned int pos = PCI_CFG_SPACE_SIZE;
 
     if ( !is_hardware_domain(pdev->domain) )
+    {
+        if ( !pdev->ext_cfg )
+            return 0;
+
         /* Extended capabilities read as zero, write ignore for DomU */
         return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                  pos, 4, (void *)0);
+    }
 
     do
     {


