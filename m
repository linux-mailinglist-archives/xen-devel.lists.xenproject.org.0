Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMebCcrl/WkPkgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 15:31:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA944F71A9
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 15:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303639.1576914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLLIu-00081y-5y; Fri, 08 May 2026 13:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303639.1576914; Fri, 08 May 2026 13:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLLIu-00080A-3O; Fri, 08 May 2026 13:31:44 +0000
Received: by outflank-mailman (input) for mailman id 1303639;
 Fri, 08 May 2026 13:31:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wLLIs-000804-BP
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 13:31:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLLIr-00GPEE-Ok
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 15:31:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fde5af-2eae-0a2a0a5409dd-0a2a45049a14-40
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 15:31:41 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fde5bd-1dec-0a2a45040019-d155802ab012-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 15:31:41 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so20242535e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 06:31:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68ec417bsm37773545e9.10.2026.05.08.06.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 06:31:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778247101; x=1778851901; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2ISDk4MdsLKYANHE4Rm8Zw7eqfUKPepgzsZoDF+6l4=;
        b=AdkvPZyFKWkcl8A/IbJ8oGuRUXdNQ3LsYQtNrZIGW5HI+Dmp/rMSlDoAprOK13GfSs
         GKpo1VFSTLke86iY6WgnXxWjMtq3jMrgav7yl40E6+GkTp02IWqEMPnnA16FVSX5g8ON
         AiO7yS3/R+QY7b3J5nZMdgzG/1NuDK0jj35KUme9HbRLoY/FXbkEBwO2i/zyhLDKgnaj
         jVFmLvJxqTEfHjk9uyaxLhSpe2XlF9eJQ8sgNco1+U6Bw7DOFoj5sSleB+CMLMdA1U5d
         ZoILvp06+9u71gdoUmrQJK68G0wAFVLoo16qEmMgjvKoOIycl9kJgTf81Dm/y92k31Gu
         ZQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778247101; x=1778851901;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2ISDk4MdsLKYANHE4Rm8Zw7eqfUKPepgzsZoDF+6l4=;
        b=fwS401V9QxNEQyineY4XTX0nG4Oy5IS88kvYLlFGfISJkiwAtPZadMmBHkzzjhTnfs
         No9QeXJyF2eWwZn8b05qk3bIYKgqHklMAJ9GZDKnxLHnvtwg16elVHS/9Eb2ErNbgZJa
         m9rPXWwGTxjdcmTncbN4KfUtyjLb5GdmLhmLOyPGsSH+1zYz0cMcJeDQ/sRrd0cEvjFp
         Hgv7M0LKwtOV91OZllRw+asyjH52E1A6hNvokvh4auyn9rWf+gqzUH5rr3iDuQSVkO+5
         +ijGCTSip1oT6r5FRItN7sWXn1lCDR2JpObuiOnGqmEmaSj6BFx/DTUg2BrFo+nRBvbu
         1Awg==
X-Gm-Message-State: AOJu0YzcC/3xsXyAXmgNjrjp+nw8G/9GK/bmEwsR4a6TSk9f75QEPkpC
	1metRwanIMWAoRpbaFLjSZu20mK8ZO4XSkoZh+T7NPQHwlC4z00exQu6K0t+PkmwNmbAelxXAsm
	OgMQ=
X-Gm-Gg: AeBDieulcEfBu/kyx/GBkR+tqxNHellfTRJmzJmYkVQQajm2QCfcK8tNp858yrIuq5K
	AZ/ZLQqKQcVvA+E0JBA3asn6nIK8SKska147wmN6PVs7gEvK2Q9ai+Nsrs+HlggtPYOnnjVCOdf
	uhdG5tgPKC7MHxDqWG9sYqpx8ov0Ou210xVTnk1PLcbYK8E+fp55MBoxBbnRBkbFg4L6YxSd+DN
	z4UPTJI3w6gQTlZn4OdEY4oaJSlCx9cDydcjDtlpyTllmXrUmfPpzhdpfyTnK6pI53RBb9tBh6y
	hKsWicCYhpzCWXo9K+FaJuUC4erj9TvQysm9LvAK+75nkMEobIBL6VAlmw7WCo4EPPmYMpuZtCn
	6oqbjHC3WKawLM65AJzokP/Mi+3zP2UaCWtLMQgdZjKs/fZp71VsaeugNjKwJ1hzgHX64/W27dU
	vB13ZNBaMS5ujPhZsI2B8xoLGFldvUK7GKqfk6LLFTIAPMLAdu2anQmMurc1CD3rGVNTTNRL80i
	KQ+ZTzHQAU9+fphFJiE8CKCorj105QCIecG
X-Received: by 2002:a05:600c:4703:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48e676ac029mr41739255e9.20.1778247101025;
        Fri, 08 May 2026 06:31:41 -0700 (PDT)
Message-ID: <20642e09-5dce-4979-b126-b24a78db698e@suse.com>
Date: Fri, 8 May 2026 15:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] time: drop dead code from gmtime()
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
X-purgate-ID: tlsNG-ebf023/1778247101-28F753FF-0CC86827/0/0
X-purgate-type: clean
X-purgate-size: 1298
X-Rspamd-Queue-Id: 8AA944F71A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

"days", as calculated, can't be negative. Drop the respective loop and
change its type. Similarly "rem" can't be negative and doesn't require
more than 32 bits. Change its type, too.

As a consequence, the tm_wday calculation also can't yield negative
values, so the respective conditional can be dropped as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/common/time.c	2025-07-22 16:21:18.000000000 +0200
+++ unstable/xen/common/time.c	2026-05-07 12:22:11.687769995 +0200
@@ -45,7 +45,8 @@ static DEFINE_SPINLOCK(wc_lock);
 struct tm gmtime(unsigned long t)
 {
     struct tm tbuf;
-    long days, rem;
+    unsigned long days;
+    unsigned int rem;
     int y;
     const unsigned short int *ip;
 
@@ -70,18 +71,11 @@ struct tm gmtime(unsigned long t)
     tbuf.tm_sec = rem % 60;
     /* January 1, 1970 was a Thursday.  */
     tbuf.tm_wday = (4 + days) % 7;
-    if ( tbuf.tm_wday < 0 )
-        tbuf.tm_wday += 7;
     while ( days >= (rem = __isleap(y) ? 366 : 365) )
     {
         ++y;
         days -= rem;
     }
-    while ( days < 0 )
-    {
-        --y;
-        days += __isleap(y) ? 366 : 365;
-    }
     tbuf.tm_year = y - 1900;
     tbuf.tm_yday = days;
     /* SAF-14-safe use boolean as an array index */

