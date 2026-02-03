Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IO9Lvr/gWmYNgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 15:02:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC7DA4EB
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 15:02:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219283.1528185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnGyE-0004ZP-6B; Tue, 03 Feb 2026 14:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219283.1528185; Tue, 03 Feb 2026 14:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnGyE-0004Wv-2v; Tue, 03 Feb 2026 14:01:34 +0000
Received: by outflank-mailman (input) for mailman id 1219283;
 Tue, 03 Feb 2026 14:01:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnGyC-0004Wp-9W
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 14:01:32 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d5df6c-0108-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 15:01:30 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so41604395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 06:01:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e2e3bf18sm125182925e9.19.2026.02.03.06.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 06:01:29 -0800 (PST)
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
X-Inumbo-ID: d6d5df6c-0108-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770127290; x=1770732090; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=012uemFsGFDcR9WXwhkbQapD4OLf+mRfpXPFB9Btaho=;
        b=eF0SDtXl0LyAX/A6k4wNMdK6l74ebN8tIvEy5bOIJ8ar6QmZaFGjxZOTk4zfgHWkFI
         JRG8Gaj+v24YSfHCBmm3h3mmla+jot+LhQVuvYopUz8r5UPycJrqJSiqPcotouRDyYYq
         h1gEF9RMCRjsMMKgiZetY5PoaEe45wMXnRPUHZs1j79IBsAC5ZAG9cICODfU0NEIAIiN
         2z8NXml4b8zzyRqtXSzFYS1ivUnhpGX2abnlzVoCHfDRdhRfYvduzBxMqvpZof/pQEiZ
         zduAovYYcB5ANoIBv0go0jm9zCM5RW7O/L/w4tyYU1kF7lgZHTU4dBpVLBcfl453Jqb5
         8RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770127290; x=1770732090;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=012uemFsGFDcR9WXwhkbQapD4OLf+mRfpXPFB9Btaho=;
        b=oYJFXszMoJ2+5ac3TSQ0cZ1d1eyalhb3wcBEu0Dqf8NhTBJ8W7Ak0ycLv0IzWAsvon
         B9naIhh6SIv6ToJLcUDKGeYNsvOKunnpmBORTpPU6mosBdqV/tm+2AZnHQwrLbd9zwCB
         F+uYsok82y1D7qc3H3ro3cmsZjYP2T63Xa9LnsHEOgehe39utrPN3P/FZFarq2D0fRIL
         zXu9cUpvsOg8X61cxO9sAbJg6YGm4jl9CGQT/GkoypKt8k3halZMJ4FUc+PDjLHfNJvK
         R5voXfa0v0LrhQyEIu1LmvUsvsQqIC3thuccbNNXSxV9UVZMBSHtt98G8lEZ6Ziej+It
         gYjg==
X-Gm-Message-State: AOJu0YxQ8imuaKcGN1yKz+tRDtX6Cq14NLcHTXMrxfRW8Op8ej0FXEbh
	Zh0KmDnsPsCiUhCcwNjhCRq1uzmwaJ/vLYie4IKp5IqpQ8BGVQgoJUrzdtn9FJU1H+9z0LTKU6Q
	QTXg=
X-Gm-Gg: AZuq6aLNAM66+LhLPb2eMWgmK4FYRWHfqmRyAdPTOnpKvsFzAKZaE+nqX7z1aMiCeIi
	MYuXIeOGyCPD/B73qAhBiJuXELSfJyH5AV0drVjlW2/JrNIbcMykiYRg+fUYBTQIGnvn8ZDkgO+
	qQh6TyMgmgrp80Wp2GTcWmilHYiRhpXmmGnASlJ9tWEkMLoyZt47CSEiI0dT8H65HcNZQE7hfMn
	lfltj1l9Wc1azRmXzlSnp5v59xyQ+Ax8akje2hy2affRahw0iVwBN0FTaC8eXQ71okqQzBq8gU4
	8OaqRErUJZvLYUyIgt0oYRq+t24yNNIazqOIMCWPRZNEL1H0pj+hjXBN24aPEzeP+r06788XDFZ
	0QoDFJZ7Rc7mKnDpH1Eyv8Afgam/bhSnVKp+g7M642NQZGXGd1AvtS/ECt3Ls7ODV6tpoydns/R
	SuiwVISvnsojrl18XRwayY0c7FcomI/oHZmT4Zv6199v1C5rI5Ak3+TWK+b4+pZfRg8H3y6TJ40
	Ek=
X-Received: by 2002:a05:600c:310f:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-482db4597eemr223153825e9.6.1770127289606;
        Tue, 03 Feb 2026 06:01:29 -0800 (PST)
Message-ID: <1ecefc98-f1c2-4116-95bf-a86c3b066843@suse.com>
Date: Tue, 3 Feb 2026 15:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/P2M: correct type use in p2m_put_gfn()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 04FC7DA4EB
X-Rspamd-Action: no action

Everywhere else gfn_t are passed into respective GFN locking macros: Do so
here as well.

Amends: 819cdc5a7301 ("x86/p2m: re-arrange {,__}put_gfn()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Easy to spot by adding ASSERT(!gfn_eq(g, INVALID_GFN)) to the respective
macros. While imo that should be a correct thing to do (as with
hypothetical split locks a valid GFN would really need passing in, in
order to be able to figure out which lock to use), we can't do so right
now: The lock is acquired ahead of respective checking in a number of
places, e.g. in p2m_get_gfn_type_access().

There's no clear Fixes: tag to use, I think - the problem looks to have
been introduced by the gradual conversion to gfn_t. I probably should not
have added gfn_x() in the referenced commit, to unbreak things already at
that time.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -338,9 +338,9 @@ mfn_t p2m_get_gfn_type_access(struct p2m
 
 void p2m_put_gfn(struct p2m_domain *p2m, gfn_t gfn)
 {
-    ASSERT(gfn_locked_by_me(p2m, gfn_x(gfn)));
+    ASSERT(gfn_locked_by_me(p2m, gfn));
 
-    gfn_unlock(p2m, gfn_x(gfn), 0);
+    gfn_unlock(p2m, gfn, 0);
 }
 
 static struct page_info *get_page_from_mfn_and_type(

