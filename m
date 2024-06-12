Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33B390537D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 15:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739324.1146337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNqa-0000l0-7y; Wed, 12 Jun 2024 13:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739324.1146337; Wed, 12 Jun 2024 13:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHNqa-0000iv-4v; Wed, 12 Jun 2024 13:17:04 +0000
Received: by outflank-mailman (input) for mailman id 739324;
 Wed, 12 Jun 2024 13:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHNqY-0000Ir-A4
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 13:17:02 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e08868c-28be-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 15:17:01 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6e349c0f2bso680882466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 06:17:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0ffcbf38sm544927766b.142.2024.06.12.06.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 06:17:00 -0700 (PDT)
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
X-Inumbo-ID: 0e08868c-28be-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718198221; x=1718803021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YkdNjBOZ78Xa9HqoWeOu8L3vhUg6jdFS1CUj7DasUQM=;
        b=NaBF1Vd3LhQtM9NPdUWJtCNV8uRmGIGJEIu63CvWks+wmh2gqUKdzeqha3VuvSzabI
         Qi514K4khOxJAvsDvDrZBzMu/z7U8/yM2aL02WWwbW/nqT8eP0+9C9BYWwa4WaBie5b2
         al8cXHxnSVjlOnfv7BciSqL04uUPEvyjKk5oQv53ysj5LYkvVpZsvc+TuA2puxi+SKgm
         CrRO4Ddj50rFK3iooxHVeDmf2BDXHSrLNpdNQMZhXnt1TmYqNbNtSedury+ozS/Ia4O5
         6r5eqdBRa3Yw98ui2+FtCMzPMkg2iUYUatfhY1OIWSQXecFjl8SKRIxxxvPqM1LVNPs5
         zM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718198221; x=1718803021;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YkdNjBOZ78Xa9HqoWeOu8L3vhUg6jdFS1CUj7DasUQM=;
        b=ovsPzmrTegy20117T4lQ8rWC7qbEtUR0/X5eOnJEHefe90+QdlXwJxajW6pHE6aGw2
         Xixhx/Fe65UPOumIxUY1VAc4ICTIZuAX6nPArjJ/9Lfnmqj+DnclYrBs+GvMLb1LsCff
         67cDr3uehqX6qwOPCLa8+qIN48DUtWocUAXL0a3DV4BoNWwnPhbhR9p8oGkwZtt3BqQ5
         lDYhr/IXf+AH7SCvZxS7qbEx3dGIgZRecD0fT10ObCYLsKx5aZ58D0eMLbBtF/IO9Uhg
         zV3bZ9/lOGwfgrFzIEJlg8IG3yubAIWr+Qn4s86RYXhm/YiYlLoZEWH4Xah2TLiAhL4J
         nyzA==
X-Gm-Message-State: AOJu0YzcXq5FRgiwdmTOMgMKNUMXslgsu9PWqAiy1ibOfMf7mmOI2jog
	DopBcMJ6e4Ii6rXya4I4jFIwPsBwH9tAk2m6zWu7+dvIHfvkOLl6BhWA5gI/8OSJsBqj46i+kKo
	=
X-Google-Smtp-Source: AGHT+IHq2OVHWuKZ/0M/6EvrW0HJ4JL2KtqF1J1urmoia2YhOyNoort1lZ3zhFA/wiaWN+QQ9uI9kA==
X-Received: by 2002:a17:907:f81:b0:a6f:1972:7fd with SMTP id a640c23a62f3a-a6f480272c3mr110037866b.67.1718198220955;
        Wed, 12 Jun 2024 06:17:00 -0700 (PDT)
Message-ID: <d31f0f8e-4eb7-4617-86f6-81f38b5c61aa@suse.com>
Date: Wed, 12 Jun 2024 15:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.19 2/3] x86/EPT: avoid marking non-present entries
 for re-configuring
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

For non-present entries EMT, like most other fields, is meaningless to
hardware. Make the logic in ept_set_entry() setting the field (and iPAT)
conditional upon dealing with a present entry, leaving the value at 0
otherwise. This has two effects for epte_get_entry_emt() which we'll
want to leverage subsequently:
1) The call moved here now won't be issued with INVALID_MFN anymore (a
   respective BUG_ON() is being added).
2) Neither of the other two calls could now be issued with a truncated
   form of INVALID_MFN anymore (as long as there's no bug anywhere
   marking an entry present when that was populated using INVALID_MFN).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -650,6 +650,8 @@ static int cf_check resolve_misconfig(st
             if ( e.emt != MTRR_NUM_TYPES )
                 break;
 
+            ASSERT(is_epte_present(&e));
+
             if ( level == 0 )
             {
                 for ( gfn -= i, i = 0; i < EPT_PAGETABLE_ENTRIES; ++i )
@@ -915,17 +917,6 @@ ept_set_entry(struct p2m_domain *p2m, gf
 
     if ( mfn_valid(mfn) || p2m_allows_invalid_mfn(p2mt) )
     {
-        bool ipat;
-        int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
-                                     i * EPT_TABLE_ORDER, &ipat,
-                                     p2mt);
-
-        if ( emt >= 0 )
-            new_entry.emt = emt;
-        else /* ept_handle_misconfig() will need to take care of this. */
-            new_entry.emt = MTRR_NUM_TYPES;
-
-        new_entry.ipat = ipat;
         new_entry.sp = !!i;
         new_entry.sa_p2mt = p2mt;
         new_entry.access = p2ma;
@@ -941,6 +932,22 @@ ept_set_entry(struct p2m_domain *p2m, gf
             need_modify_vtd_table = 0;
 
         ept_p2m_type_to_flags(p2m, &new_entry);
+
+        if ( is_epte_present(&new_entry) )
+        {
+            bool ipat;
+            int emt = epte_get_entry_emt(p2m->domain, _gfn(gfn), mfn,
+                                         i * EPT_TABLE_ORDER, &ipat,
+                                         p2mt);
+
+            BUG_ON(mfn_eq(mfn, INVALID_MFN));
+
+            if ( emt >= 0 )
+                new_entry.emt = emt;
+            else /* ept_handle_misconfig() will need to take care of this. */
+                new_entry.emt = MTRR_NUM_TYPES;
+            new_entry.ipat = ipat;
+        }
     }
 
     if ( sve != -1 )


