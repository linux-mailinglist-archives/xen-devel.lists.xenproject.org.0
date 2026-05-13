Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBvcCj5kBGq6HgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:45:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC6353278F
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 13:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307878.1579449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN81E-0005me-IF; Wed, 13 May 2026 11:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307878.1579449; Wed, 13 May 2026 11:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN81E-0005k9-FC; Wed, 13 May 2026 11:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1307878;
 Wed, 13 May 2026 11:44:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN81C-0005iQ-K5
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 11:44:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN81C-000Ge9-13
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 13:44:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a046424-e002-0a2a0a5209dd-0a2a450bb526-44
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:44:49 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a046431-212f-0a2a450b0019-d1558030bcf6-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 13:44:49 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso58449745e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 04:44:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fce37b182sm71879535e9.9.2026.05.13.04.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 04:44:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1778672689; x=1779277489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gwBkQd9qd5e7EV+25xbt2DulcaBMv8dm8NGWegkW3Ow=;
        b=cpy8b6PyX5A4NtjSZA4H+LeHllppSFQ1veL+gUQdyDmuI0tczLSqg/d6RYe1jf8bO+
         OACmFsPhheh+6EylhB9hHB2tJkc7f6+ASYeNm3E6Fg6aQg7QNFuA7lKIet5Y3ABOrLQR
         1/ZzM/2oqZ4BseD0uVUHpqdAfnqPofINioGUa+zY3wETyBDDb+8Dx6MtzHHxmCtuysry
         nQBOFfPeUo1PoX+afXqRcLtXTPPBtL7fasdd6c5YRbfRdKowBabdmdZGngceaktSicHG
         87LIoZ0KLRY7lfxocW8Y1SYHi76/rJMS0UEpijKCaAtyC3hnTgEVfcMqhnxyE1sVt7Cv
         njWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672689; x=1779277489;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwBkQd9qd5e7EV+25xbt2DulcaBMv8dm8NGWegkW3Ow=;
        b=TG/F/uHLR5oyAVm5REIIn6Yrs1tan3N9nRQCeS3khXV4Rcir3Pm6GVwyxmfEN57Z/5
         0LKVAVHPfFggeU9PT1ebNLX70QxhnJjkMSuPijK+WXVKCgRGO8JY3p3HbKw5PoK9fbRk
         aDAC6zMJOlu2TygGZaGuKj3i3a5u8UtheRbeowwhGtf4VMaNKOtFMJKNdJWsifsUFP0z
         924L68OiZXfxdyq91RaTnU9LMmdRY/5SjMnOzK26yppUHg3jq7zkvfkpslGdOH4ty4wU
         HnsarB+BDQ2OZeDrgnPfXF5BNwJETM/sZ8UDWlig8f+uJOskp2Hyxj99ZxSRIKeZOjmd
         A+Jw==
X-Gm-Message-State: AOJu0YwlGyc7XOI9YOQCuay0LcK+LAzzhr5Soec5haj31SDWWGEeyEU2
	9mwJM2tFRM5du9fdOw+AoscrKxnPbzmD4bfkaDW3llYS/OO3eWA/VLHchR2uKcrTYBCw+8zK+Ee
	GO1c=
X-Gm-Gg: Acq92OE+q946S6YQwkyUOebMIGlhMkz/We4omIedkaKw3QIMYRUZq0FYlapke11lvnv
	L6gj9m8aYYl3bUgF2+a7bO1Am20DZA0pNt3qANSJ7dqLXIDUYTBH/fQxaCopaavRjPlgLpmQte1
	iAq/8PjmqFtYhNBTldbyKUjrAzj880YEweXNTG495or2Lso0z0jSJUQqIY1PMXpzBkn5SuZ0fZJ
	lROHSj3OWnVPFrdWME9eByEUXMaZFwpuBCCSeu97VhRoJlmpVS0NwKmSzkUvzzcu9eLn5thWiOI
	mQkQ0fLzS8oTXz13662VVFckyQn4tpXS/pjnMRWRYslxoS9O1EGmyOvWFi7yndsSb0TfuV8LMVj
	xv6KBQHYYYIH3faCNsvhKfVa3I8l1hxwgZWy/1JYXXmJcHWcfmhE7Yji8KglmtLJcPABsiJ2bPa
	4BaTkueOEKT7vbxf5MaP1TQfayFmC+V495xH1ULJR/FrtWKMhCx+arlREd2d3f6DVVVbaAqXnC1
	yj3BQyZW4kmhkRzu7rdjfEO4A==
X-Received: by 2002:a05:600c:3513:b0:48e:635a:18d9 with SMTP id 5b1f17b1804b1-48fc9a34ae6mr42181585e9.15.1778672688744;
        Wed, 13 May 2026 04:44:48 -0700 (PDT)
Message-ID: <871c0ca7-898f-4bc6-8115-d94d40b88301@suse.com>
Date: Wed, 13 May 2026 13:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] x86/PV: rename a local variable in pv_emulate_gate_op()
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
X-purgate-ID: tlsNG-42698a/1778672689-12971F3B-A993FEAD/0/0
X-purgate-type: clean
X-purgate-size: 1840
X-Rspamd-Queue-Id: 7FC6353278F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

... shadowing a function scope one, thus violating Misra C:2012 rule 5.3
("An identifier declared in an inner scope shall not hide an identifier
declared in an outer scope"). No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Technically, as the outer scope "rc" isn't used again later, we could
simply drop the inner decl. That seemed more error prone to me, though.

--- a/xen/arch/x86/pv/emul-gate-op.c
+++ b/xen/arch/x86/pv/emul-gate-op.c
@@ -286,16 +286,16 @@ void pv_emulate_gate_op(struct cpu_user_
     if ( !jump )
     {
         unsigned int ss, esp, *stkp;
-        int rc;
+        int left;
 #define push(item) do \
         { \
             --stkp; \
             esp -= 4; \
-            rc = __put_guest(item, stkp); \
-            if ( rc ) \
+            left = __put_guest(item, stkp); \
+            if ( left ) \
             { \
                 pv_inject_page_fault(PFEC_write_access, \
-                                     (unsigned long)(stkp + 1) - rc); \
+                                     (unsigned long)(stkp + 1) - left); \
                 return; \
             } \
         } while ( 0 )
@@ -359,10 +359,11 @@ void pv_emulate_gate_op(struct cpu_user_
                     unsigned int parm;
 
                     --ustkp;
-                    rc = __get_guest(parm, ustkp);
-                    if ( rc )
+                    left = __get_guest(parm, ustkp);
+                    if ( left )
                     {
-                        pv_inject_page_fault(0, (unsigned long)(ustkp + 1) - rc);
+                        pv_inject_page_fault(0,
+                                             (unsigned long)(ustkp + 1) - left);
                         return;
                     }
                     push(parm);


