Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFEkBM0hD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:16:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FFF5A81FE
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315357.1585171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ58B-0001W6-Tr; Thu, 21 May 2026 15:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315357.1585171; Thu, 21 May 2026 15:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ58B-0001TC-RC; Thu, 21 May 2026 15:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1315357;
 Thu, 21 May 2026 15:16:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ58A-0001Si-IV
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:16:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ589-003Yqh-VT
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:16:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f21b8-2eae-0a2a0a5409dd-0a2a4503c630-8
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:16:13 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f21bd-672d-0a2a45030019-d1558030e4b6-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:16:13 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso7639275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:16:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035edbe84sm27887945e9.7.2026.05.21.08.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:16:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1779376573; x=1779981373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6bGHdzAN+VK7CfE++mZcONV/aWnaflTw/8Fi0RlMYa8=;
        b=MyiA3fb+2kbpc1UugVcAO5G7R5yxAXFbHlM7gc2C8+RvqAYeMd8KvIL/hW36uLVrMq
         WRHMe8ydoJjf2nUXL5MDeXSWZLUr2JSNJJW7D2UpzJpn59mAJvWojAf+2bTnHV964EZY
         xl9JXKqmqe73CpAPhqGhTv2728w+uWl+KxGq6SUQKjeRWEx1zLP8XPSR5bfVfmAr0PJh
         BxcWIeVO34zqoyxT8+VVNkz3kW4FJWp/puiNVt/aR4jJgpOceZhipLyEA+WzOYPhjbNJ
         B8LQRwDDAm5mPwoBpWjXOR4hPelJKg3TJ3vUsxbqedLYSZGD6L14N5LxJ+XEIDbq35To
         dI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376573; x=1779981373;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bGHdzAN+VK7CfE++mZcONV/aWnaflTw/8Fi0RlMYa8=;
        b=G/MDXhzolCTtk11clI77qYcA1OtYrxGBx+CM6zszhgL6pzvI1redvrzR5U2h8urCQz
         fQXKSqzGsATAYvGfGwsLI2V9a5NcnxB3ia1EXn83ylMTUxFWTyTaFMZV8t2ec4uU5yI9
         0BfKP3/i8k3Xd8eaxJiJ8Otv4hwd10L+pejzF434UYtGbsx3K7ePEIrUiVMHP+hizgaW
         DVoKxVRdty/BlGlVpKPwjTlf/PqTY29b31djF9csMm8Rs9OX/jb0veghSLexinAYwjt6
         TPOZf7bduzi3bMGnQ5EytKHzDGlDGaAUBn5TpMn0suIVdhqNeNijaiMhLEK0l9uEjJ7d
         5Krw==
X-Gm-Message-State: AOJu0Yw9Xlv8tXGWSVY+Fm20ySgDzXN2wSyE+wHGw8q03sH3JpYtQDqo
	UdtS9ca3Fc00K5OBSwG2z8bycupxx2mYtoFp03NaQpKcqFvw76UogAORTP3qssY58mtyJw03eAn
	kkhY=
X-Gm-Gg: Acq92OEjO6WXcjFxVk+F3b/hdSwQIAruTFIRkMaiQdC+mEoBODQsoZU6mm26SlDcesQ
	xp/b7A0eYnJV7F9tMT85wEXXTVeIPQpKdk1JxUCW9TGATju+PSxRh1YIJQs5z0nlK4VUV2ayCiu
	gXwM4LYkZsu22O8cC7B3UjY+b78r3moYDhk13ARTeHIAODus4K1raP40B8xxtkHS22mcsvT8ezC
	jx+6qUOfNJG5rMTkNKiq47HRJM/6niIbkmUtlFdTkIkHdN0UvSjQ3mGmtehVDnIUNaWy7YNTLzY
	VIoNeyXnScVfaN/xt3S+9YLKBIjqMGV0H0wcymUb47+3GXvlAENvidLyOkvTi1Ff8RwqVo1u0W3
	lm9ZS7RTcr8hWDd8pRx77euVzUV86WKkEneMd8JDxYzh5jSPGtWUr7RkFo8YHCg9HqBzV91jSC+
	h0VJSFfDPKePRRGfBng6PRcAmuw6l6VboJEB38UfQnabRkFEiiqBMOz+dne+w43RLb5SelWlEAs
	eBqbAO0r/tnNck=
X-Received: by 2002:a05:600c:35c8:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-4903d62f8e7mr24151155e9.22.1779376573232;
        Thu, 21 May 2026 08:16:13 -0700 (PDT)
Message-ID: <80d2e824-e6ae-47c4-ba92-e023129ff209@suse.com>
Date: Thu, 21 May 2026 17:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] x86/P2M: split a read_atomic() invocation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
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
In-Reply-To: <738daea9-ebec-4299-b0f9-49448293106d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779376573-40E68938-C04A9F94/0/0
X-purgate-type: clean
X-purgate-size: 1122
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 75FFF5A81FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Misra C:2012 rule 13.6 takes issue with pfn_to_pdx() and mfn_x() uses
(deep) inside sizeof(), as used by read_atomic(). Break out the MFN ->
struct page_info * translation.

No difference in generated code, except for a line number change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1332,6 +1332,7 @@ int set_shared_p2m_entry(struct domain *
     p2m_access_t a;
     p2m_type_t ot;
     mfn_t omfn;
+    const struct page_info *pg;
     unsigned long pg_type;
 
     if ( !paging_mode_translate(p2m->domain) )
@@ -1345,7 +1346,8 @@ int set_shared_p2m_entry(struct domain *
     ASSERT(mfn_valid(omfn));
     /* Set the m2p entry to invalid only if there are no further type
      * refs to this page as shared */
-    pg_type = read_atomic(&(mfn_to_page(omfn)->u.inuse.type_info));
+    pg = mfn_to_page(omfn);
+    pg_type = read_atomic(&pg->u.inuse.type_info);
     if ( (pg_type & PGT_count_mask) == 0
          || (pg_type & PGT_type_mask) != PGT_shared_page )
         set_gpfn_from_mfn(mfn_x(omfn), INVALID_M2P_ENTRY);


