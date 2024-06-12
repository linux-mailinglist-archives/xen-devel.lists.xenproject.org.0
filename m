Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27090905376
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 15:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739322.1146327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNqE-0000LG-1Y; Wed, 12 Jun 2024 13:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739322.1146327; Wed, 12 Jun 2024 13:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNqD-0000Ix-U6; Wed, 12 Jun 2024 13:16:41 +0000
Received: by outflank-mailman (input) for mailman id 739322;
 Wed, 12 Jun 2024 13:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHNqC-0000Ir-Ur
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 13:16:40 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01116f7b-28be-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 15:16:40 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so287400666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 06:16:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1c99d8f1sm426917466b.175.2024.06.12.06.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 06:16:39 -0700 (PDT)
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
X-Inumbo-ID: 01116f7b-28be-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718198199; x=1718802999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IIBq/heXgaX7T28VY8MGlPRmzmqXncKPkrU8y33t/6Q=;
        b=Mmh7EiEOBFRwDyV91f2ap5XTMIEWo3YTypsleYMGQq48N5g/fWTtGxLmmNYp1rozSo
         UVcZOKQzihLQM4ul+x5MJweNkukTQrgXmdtj+jdLgDQWQHwWgXIMTFtDtQ48rWKUb8GW
         yf+KDfcHXdKeXi9/p+Qyo0ATyAWwFxhZyUH6jIFs8CP5DBX4fMd8kMoKf0LsF0YsboN8
         d0GEYo3ABWaoVkqDeYiyMzAMwpSDeN+dzFMbMlLd9uCXfRcWYdhLOCfOaBcqwXoaHgrw
         s0HJOcQXF7ygNGhXDq79hLFJn8vkCo0dZYGQP0T9/p5WmyRHSkonaecVMMeflWuvbTam
         0kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718198199; x=1718802999;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIBq/heXgaX7T28VY8MGlPRmzmqXncKPkrU8y33t/6Q=;
        b=dbugReXPgfwlbgbsTeqCh6qlCxC+iWIqKY4zwDeo8dgi1RyFZK9qt/VaWHNjHEwJ6z
         xxiXtjFF+eWPgWlog1wPqnIkrX8l4hObP9frktUBYGj/6koFz/juj+TLz/yyrNxY1kF7
         XDAhKFlLt26y7BTXdRXd+xOpjAR9hY/lr75Ji84TvQpqkao6ljCVDxuenspnJzEgLZ7f
         pRXwN5pdpNyQTJp8iZCwGNHj4TG2MRLhA7UfLyBVRMmHXgx4UDFqNvcAFI9GkDlUaD64
         gz73X19f+oFZQw03SZKGpXYQv4h2eNBwL+nezhyONF82t4NsiVRUnhQZE8KjSdxyq/7w
         obzg==
X-Gm-Message-State: AOJu0Yx4hbdML/XNA2gvAGDI079bLlhWWCHfYLL43Hcj2o2Dng0cue9E
	aczJgGNl2OnbQnp3UN/ojiCHK2FXniy75RronRELkxKCKijxlChjUp+DQXxEO7tN5PfiYzgLlyA
	=
X-Google-Smtp-Source: AGHT+IGa7qIcGL9sb6ucqx2qnH+S/tl++sd2dtseLK+/TzKRMt3cKSekBFUIbqMltkXqp/I+pnl8CQ==
X-Received: by 2002:a17:906:d972:b0:a6f:6ef:225 with SMTP id a640c23a62f3a-a6f47c9c2dcmr115080166b.19.1718198199385;
        Wed, 12 Jun 2024 06:16:39 -0700 (PDT)
Message-ID: <175df1a2-a95f-462b-ad49-3a0fef727658@suse.com>
Date: Wed, 12 Jun 2024 15:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.19 1/3] x86/EPT: correct special page checking in
 epte_get_entry_emt()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
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
In-Reply-To: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

mfn_valid() granularity is (currently) 256Mb. Therefore the start of a
1Gb page passing the test doesn't necessarily mean all parts of such a
range would also pass. Yet using the result of mfn_to_page() on an MFN
which doesn't pass mfn_valid() checking is liable to result in a crash
(the invocation of mfn_to_page() alone is presumably "just" UB in such a
case).

Fixes: ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course we could leverage mfn_valid() granularity here to do an
increment by more than 1 if mfn_valid() returned false. Yet doing so
likely would want a suitable helper to be introduced first, rather than
open-coding such logic here.
---
v2: New.

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -519,8 +519,12 @@ int epte_get_entry_emt(struct domain *d,
     }
 
     for ( special_pgs = i = 0; i < (1ul << order); i++ )
-        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
+    {
+        mfn_t cur = mfn_add(mfn, i);
+
+        if ( mfn_valid(cur) && is_special_page(mfn_to_page(cur)) )
             special_pgs++;
+    }
 
     if ( special_pgs )
     {


