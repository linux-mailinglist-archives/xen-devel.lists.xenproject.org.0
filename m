Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C88546E4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680352.1058483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCFl-0004md-D3; Wed, 14 Feb 2024 10:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680352.1058483; Wed, 14 Feb 2024 10:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raCFl-0004jU-9v; Wed, 14 Feb 2024 10:12:33 +0000
Received: by outflank-mailman (input) for mailman id 680352;
 Wed, 14 Feb 2024 10:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raCFj-0004jO-SD
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:12:31 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f7b5a7c-cb21-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 11:12:29 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50eac018059so6887278e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 02:12:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c204d00b00410df4bf22esm1453519wmg.38.2024.02.14.02.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 02:12:28 -0800 (PST)
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
X-Inumbo-ID: 8f7b5a7c-cb21-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707905549; x=1708510349; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pnu4VXy5X8iZt6vvrCxKxi+hnaJLFi62JTayobfCEu0=;
        b=I5JKJyd4eEgh2DkRqvO9Rurzvp4PuY403IiVanUFTHTnrZOaRGEWVMQ1Llc1KtD+F3
         iF309RF5QxtagorDftdhzyNJXDbLT6fselTbniky33aJ1i/Hi5SYEz3QasPBfSBhtdIL
         iD4al0pyFV48udaHJxM8v75yMqRtiLx6ZZiGK1EQ7sbvhU2iCxz/bdhO2S97tcOVdSqh
         M30DSb4LCcU+4vsVTnnCsxPA4jvxH7D2CEioioX5oU09HiUqRnyJU6QhR53zNKjRD/hG
         TUkVnGvzaDKdq7KTbUaVMSGKwBZUB8tDmnVDustmxwur5I3sOqVOETI7BLtFlA+iSMmG
         Gz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707905549; x=1708510349;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pnu4VXy5X8iZt6vvrCxKxi+hnaJLFi62JTayobfCEu0=;
        b=AZHyecZKruWNxJpHWXpO++5IINejiicd3qg6dEbHEA8aBeF+zk/kphrHsH1fkNsSye
         aYFz3TLA1IgC/jW7hwFluCClTpgomwZZOoIdak7o40dCFUMmKnbVPtRCOvXElMLnddy1
         dw4QOZgaji89Zn4MGe/D/FRXqcCahC07t0pPL8brPdpc0VKg5LZf4UQtnDSzuK4nZ2kU
         dCyMw4heAn5N8cmKUjMs38T0V7cWO/z2MyHQhJYlF/oyTaZ4GmVa/4P5EQ8CT75fH5bN
         GIhcuGc+h44Nxya0OX9J8v9G5EQ6T1DoTZdf8F6NxavXj6zVefyoGRLsD1qo67T+BYHT
         yX5Q==
X-Gm-Message-State: AOJu0YzVaM+aTeckJMzRVkeAe3j86hZNtllhKgnhaZF9Z3faDRqJNy+o
	/vp4c8Jck48ZDGABxgaTQ8K/XuqW5vKi+FJ5Nr79ScoMJpbKlGvHPZmYWYRWcuKowd35dODIWDA
	=
X-Google-Smtp-Source: AGHT+IG3QnsVOHp4kjee9gR7OshWqgfwQNgC1rLlP678YEJa158UljafE+ez5qWAho9mMNWzhZ0gjQ==
X-Received: by 2002:a05:6512:234f:b0:511:a90b:5334 with SMTP id p15-20020a056512234f00b00511a90b5334mr986271lfu.20.1707905549268;
        Wed, 14 Feb 2024 02:12:29 -0800 (PST)
Message-ID: <79ed633d-b0bd-4a7d-a0c6-37a034e1ee96@suse.com>
Date: Wed, 14 Feb 2024 11:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Argo: don't obtain excess page references
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
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

find_ring_mfn() already holds a page reference when trying to obtain a
writable type reference. We shouldn't make assumptions on the general
reference count limit being effectively "infinity". Obtain merely a type
ref, re-using the general ref by only dropping the previously acquired
one in the case of an error.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I further question the log-dirty check there: The present P2M type of a
page doesn't really matter for writing to the page (plus it's stale by
the time it is looked at). Instead I think every write to such a page
needs to be accompanied by a call to paging_mark_dirty().
---
v2: Re-base.

--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1426,7 +1426,7 @@ find_ring_mfn(struct domain *d, gfn_t gf
     switch ( p2mt )
     {
     case p2m_ram_rw:
-        if ( !get_page_and_type(page, d, PGT_writable_page) )
+        if ( !get_page_type(page, PGT_writable_page) )
             ret = -EINVAL;
         break;
 
@@ -1441,7 +1441,8 @@ find_ring_mfn(struct domain *d, gfn_t gf
         break;
     }
 
-    put_page(page);
+    if ( unlikely(ret) )
+        put_page(page);
 
     return ret;
 }

