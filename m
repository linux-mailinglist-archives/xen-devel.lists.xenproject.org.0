Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDtyH1VkBGq6HgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:45:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A75327A4
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307887.1579458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN81c-0006Gu-QG; Wed, 13 May 2026 11:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307887.1579458; Wed, 13 May 2026 11:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN81c-0006Eq-NR; Wed, 13 May 2026 11:45:16 +0000
Received: by outflank-mailman (input) for mailman id 1307887;
 Wed, 13 May 2026 11:45:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN81a-0006EV-Hz
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:45:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN81Z-002bZs-Um
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:45:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a046448-2eae-0a2a0a5409dd-0a2a4504e9a4-10
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:45:13 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a046449-1dec-0a2a45040019-d155dd35e1e6-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:45:13 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4585a116a4aso2624280f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 04:45:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549120eab7sm39590855f8f.23.2026.05.13.04.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 04:45:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778672713; x=1779277513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8KDAfpZOnzo89l1OvnPb3ALjiYAkA9DUYfDlOPj7cuI=;
        b=N+R6y1M2ABZQ/E5qhaMyzBGgaV/Pm++wPS+lz0Lbln8AFteD0A05a6iqlW+67OX26H
         gAMp2Pq5e+FkHYMl/1zeQd2dGy281jpGXuC38tUnPsaHjaImPW7uia5avzZQZOwVdWnS
         G8SGVrvZrTnNgzUFa+ReTBpVW0XwhWxLlPpt7yJAlV4Q6XQkEUkSZaKy8JFQLyE9w8FB
         qx0Y9yjFiZ5SuSLff+NoZ0rSK04cers1vQBBxkXvWfn+8jpSmK3EsUlpK+gL8a8p1ZJU
         +GjlWtw16eVMNCvh94oN0e727/G8SXzRv0xtl7KuXk2TUz2kAm3zhoBv2c2lGaR+U5TP
         3PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672713; x=1779277513;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KDAfpZOnzo89l1OvnPb3ALjiYAkA9DUYfDlOPj7cuI=;
        b=JUVj5Qak2iRJQ0YuqZ9T8qhQx1NutKQll6YiEVLeuDRwnOYySZjFbVZuN0UEcF+rwp
         mEsx2nAHSyfWaKDkXzasgHAQh6p9h67gFc2McJ6m3PHsk/KlQtxWR7sdSVVocxupBGs2
         L7a2AChdNnYfOL4tojg460ffVdSYwUJCZEV/xlmb7/WvJNcgCHoqEkfnu7wV4TLQB3O2
         DVQEdnoTmdHQQBL7cxqtZQ+Bux0zQv4EtZR6DhAJtGo1gIFa3R8JJOKNIxuVpT0BjdJ3
         t65UZq7/fK9s8uyxstJZn9RngfT1CzA41JP3tVz9ytQvKuWeJdh5y6wUYodnJSksvTB2
         g07w==
X-Gm-Message-State: AOJu0YzhUaWZTzL9+hyk3QVmsE2ubSXUi40GkD0epXbFJsYEbfNAvPCd
	MPQpbA1m+VxZht+xleZLPD/yAYvNDA/h8qX1zyHakZQT/8Q/vwZdsgKBfQRJIgosnebE1KHLVP/
	jwXM=
X-Gm-Gg: Acq92OHs6X+5a5f3WPLzKMokfpgOI2cpQbZ47wagP24Ba0LtJ+bRIBwamDcuuOG77A7
	rl5zZx5BOmvSqFO0nyIAxuxeSwHLarVuCAOpcCKSyetl+M57uEp2J7iOlgzmg0W+dKAfBnaYPQV
	BuHylLt1qLlI2THUGolAUA3+RxPJ2fvXkUKuf9Oh3T1HlfIfvhUbNR4cOG1S2w3Uv6bmRTF8Cbt
	2Ma6aBe0LL3tfBwcAZAc3p5rH5E4nR7MT4KOCkbMMevF3kPXDK/5rPeGBA3GA3dRv5lHfwYQ+Qf
	sOX0U1xwzdpFetgYMYlmnqKnw+BoVcNzKyWMuSGd52n7v5UfhRKl41bfKZSWS2Asv0mSD/tGXDe
	ApRhQsHlrBTmJoNS4pfjxSr5RRrh9/uTXUWr2x//mkYeN8mfpc/AnYWnQgDBgZ9MVFA9He/oAe1
	OCPT5b4ebXjvKM7sAyHFMvSzWbHRZcGRN1I1EqEZYpEdDblt0ertCTffDPIouXjErKU9oQSsXuZ
	i9bH9S7wlzLKd4=
X-Received: by 2002:a05:6000:4203:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-45c790b2918mr3990637f8f.9.1778672713343;
        Wed, 13 May 2026 04:45:13 -0700 (PDT)
Message-ID: <86b0f926-6733-48ca-90d5-5601e7c6f0bb@suse.com>
Date: Wed, 13 May 2026 13:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] x86/shadow: conditionalize / rename local variables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
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
In-Reply-To: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1778672713-41B7B3FF-3D8EEAA2/0/0
X-purgate-type: clean
X-purgate-size: 2006
X-Rspamd-Queue-Id: DC5A75327A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

... shadowing a function scope one in one case and the global _end[] in
another, thus violating Misra C:2012 rule 5.3 ("An identifier declared in
an inner scope shall not hide an identifier declared in an outer scope").
No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -857,13 +857,13 @@ do {
 /* 64-bit l2: touch all entries except for PAE compat guests. */
 #define FOREACH_PRESENT_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)      \
 do {                                                                        \
-    unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
+    unsigned int _i, _nr = SHADOW_L2_PAGETABLE_ENTRIES;                     \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
     ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
     if ( is_pv_32bit_domain(_dom) /* implies !paging_mode_external */ &&    \
          mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2_64_shadow )          \
-        _end = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                    \
-    for ( _i = 0; _i < _end; ++_i )                                         \
+        _nr = COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom);                     \
+    for ( _i = 0; _i < _nr; ++_i )                                          \
     {                                                                       \
         (_sl2e) = _sp + _i;                                                 \
         if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )               \
@@ -3349,7 +3349,9 @@ static pagetable_t cf_check sh_update_cr
 #if SHADOW_PAGING_LEVELS == 3
         {
             mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
+#if GUEST_PAGING_LEVELS != 3
             unsigned int i;
+#endif
 
             for_each_shadow_table(v, i)
             {


