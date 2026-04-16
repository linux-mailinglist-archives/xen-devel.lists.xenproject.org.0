Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB5GJCnz4GkZnwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:33:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2940F99C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 16:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283584.1565770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNm1-0000c6-GC; Thu, 16 Apr 2026 14:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283584.1565770; Thu, 16 Apr 2026 14:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDNm1-0000ZE-DK; Thu, 16 Apr 2026 14:32:53 +0000
Received: by outflank-mailman (input) for mailman id 1283584;
 Thu, 16 Apr 2026 14:32:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDNm0-0000Z8-RD
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:32:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDNm0-001Qpv-7b
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:32:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f30f-bab6-0a2a0a5309dd-0a2a450b97be-10
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:32:52 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0f313-212f-0a2a450b0019-d155802bb8aa-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:32:52 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so107528435e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 07:32:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818da1sm54892825e9.6.2026.04.16.07.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 07:32:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1776349971; x=1776954771; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slDPYrctv6jfSsJ6PkEdWvubNTg8JImdwxpxyEkVm5o=;
        b=XPQJuhcGYVHw3eJMnZVXadtO3sT0l5DGiPt725vW1Or+NobuSPl9iIjWW1prRerUFO
         CFDTtzAKHOuhW7cd8rDogSRSx/I5SUdtusnJ5tbMnl4aZT06txUGxgqmEqISgvfgoA1s
         Bhr0hp1ZV4ZIyY8oGuEakekbyTJt7dWyxzXeQxd6JrkhqtqMDqndQ3CmESy2JqFyMRK+
         YckVHt2XRIShxjX/NV3WuxoxrmeZCrV3iJaQ8X8CLI2aA1rYUJDLIH91CtY3/dWHIuCY
         HHKsxG+qSqJPgXgEpEfr43GLIJvFkW0EZxB6mDN7EdjlrWWvYcPyclzDxB0pt0Inrax9
         1WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776349971; x=1776954771;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slDPYrctv6jfSsJ6PkEdWvubNTg8JImdwxpxyEkVm5o=;
        b=pnZ2d78qt+PBJ8EZwyexgE6EhzsYKhBa2/+ImLjnfsBdMtJe30DkprKbq8xiX5U6Sd
         ITHL/NPYCs69zw9ugfc4YDS9gdOUJM6j+IdTCer5ndblydzR0ARl3gdybFNlT2V1yKzN
         yJ20WVYO2wOUPMlThCPmgLbrHR7XMeeMUrlYd+G+sSzK2B+h+v9+8WTL8fmJgpZ9B/Z1
         t3xwvmOQr71r4hn3EaJCP4Lu0VHi7S5wvoRt0xmoBk4tBdfNH1IjiN6Mbh6lLnnbb9x9
         /vdTAr9yQs8vhfKRFEaM1lBnlz1mwRKOgxUuZZFkLeInnMlsWvjP0LUwZ743P8lPsA3D
         /3wQ==
X-Gm-Message-State: AOJu0Yxgb8ESRGW2VjbxZ0Te2PP76S423rMuGEjtvDs3I2kTi7UKdnFi
	ie+68Uv8EPkcDWc7u56x5PBzZG9T7Z/he5BLxWZAhhsFvzuA6EluHZ978mjMZA7dUW2HROJgo4U
	Fkhz8Iw==
X-Gm-Gg: AeBDietwQY1RZxQHQZ/6j5mtZDeZw8F2AWPBd4jGOtR3fR7pFZYc3YzyuQBan3ukKJv
	dOKNqIz///kZaQ11FajCd1lScxKCMHl24V3Ap3LPfQcQlXdET7E0p7NiejxSgWc9t1f+kaTtqiz
	yKVWYrwJ2gR+pHu9Gi8Xu4w/MjnP8xQoFK/m+NsmTtUDDLtj6Yqw+gT4pTcIiBaQIuMcK+4XyeH
	lRI6P6I5taY7/0Pvkp5FsDOe2IeRnu983Na9Ly98Sk5OScEyAUVxNV4N91GbQK2RD5dG38qbgLG
	2JZ1NnUX0Ou5WOSz2v5u0Q/dJTkhFTBp2biGsy2J1K0NSLfW28AYMJ5hqRLBspGQuQM1wbaz1RM
	aBjqjM93lzGyH0VkKHbBoheVEGG9mBeXE85HFvFjQQex87bFIMyJh7r7/wBGFYRItmuyTjKOTA8
	9BS1z9miWiJ2yMGE8mRN6uX1OtQM14blxFPgEiDnjBei40pKCkklmJFdRri0erYf3Y3VO3Q6rDG
	4aYzkV+n5Y3FDtF0+iFbIEpdA==
X-Received: by 2002:a05:600c:8904:b0:488:c257:a73b with SMTP id 5b1f17b1804b1-488d67effd0mr246519425e9.9.1776349971473;
        Thu, 16 Apr 2026 07:32:51 -0700 (PDT)
Message-ID: <29c2a896-59b4-4804-ade4-362f65ffadfc@suse.com>
Date: Thu, 16 Apr 2026 16:32:54 +0200
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
Subject: [PATCH] xvmalloc: adjust XVFREE() ordering
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
X-purgate-ID: tlsNG-42698a/1776349972-05D6FF3B-84052021/0/0
X-purgate-type: clean
X-purgate-size: 668
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EDD2940F99C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

What c4f427ec879e ("xen: Swap order of actions in the FREE*() macros") did
should have been done right away when XVFREE() was introduced.

Amends: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -71,8 +71,9 @@ void *_xvrealloc(void *va, size_t size,
 
 /* Free an allocation, and zero the pointer to it. */
 #define XVFREE(p) do { \
-    xvfree(p);         \
+    void *_ptr_ = (p); \
     (p) = NULL;        \
+    xvfree(_ptr_);     \
 } while ( false )
 
 static inline void *_xvmalloc_array(

