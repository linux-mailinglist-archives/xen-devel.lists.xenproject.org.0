Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ERkFu1fymn27gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 13:35:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8935A55B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 13:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267434.1556926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7AtX-00054J-CI; Mon, 30 Mar 2026 11:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267434.1556926; Mon, 30 Mar 2026 11:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7AtX-00052e-8j; Mon, 30 Mar 2026 11:34:59 +0000
Received: by outflank-mailman (input) for mailman id 1267434;
 Mon, 30 Mar 2026 11:34:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7AtV-00052Y-NZ
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:34:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7AtV-00GKjD-3S
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:34:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca5fcf-e002-0a2a0a5209dd-0a2a450689e8-38
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:34:56 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca5fe0-3034-0a2a45060019-d1558035ac48-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:34:56 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-486fb439299so39840755e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 04:34:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c9506dsm263601925e9.7.2026.03.30.04.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 04:34:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1774870496; x=1775475296; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXRCZYhfiOXMyDaM8umPhi6xsmZXvlmdqNRfyyJ8Sho=;
        b=bjmRlY2TzjmYlTZjLRv7B9h/SiO/xcSrUVJZoPIv/u8RjhRqXGtOsnHyMIQVGMenjZ
         kjbGwRM9Sk2NXN1bOQRhQ3WswXsNbzF79RlOzcnZY98buwnpW3OExbi8M6d0lIj3kXeh
         XCqDxtORql1VPTIeBxIy4ReXsebcWtP+ZBcmH81FGM8OxrCQMDk9SxozwRi2qZ8oHR1W
         ljg3Vg+mcR/efIHgersVgctKqNybnlHJj5VqQZ82+2fPZhzdiG2i8Sp789cMvelBrCwT
         Sj+c+Vutlu7pgwXlXNff4l2TMqz7SOsGB0hnolrRoiwlVdTdY/a+IK3iuZ0LJgUxAyBZ
         qP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870496; x=1775475296;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXRCZYhfiOXMyDaM8umPhi6xsmZXvlmdqNRfyyJ8Sho=;
        b=ZfdZt1F4q60oXA4ooeztCWhlAeH3Kb24gUkIUxpvJF8iNUi+MqXWF1sllfnV7X2RSS
         tGS+4W/AIzEiKCKb7atte9Nk4IhkZWnY70ZUIwQeckOaasJfvaYs4Xk/hfOAGYVcdk/U
         nU8kpSkFWBGmUJg32KkZXZWOHNnp2W3DXK7O1pa78jatpJQoZDliw70sSb43B1mLo36l
         BR2cmTJ8OigCDjsbRLnSgljLJfl1f6EoCtPD3SA1fEkxmxlJHxmiqtixfqzQhkVd2nik
         ZyxZgbv6NLCb/cSKIZZ+ffBDuDv7B4Uoq5ztNTQaAxeYg7aCViDf767aSVtEhLdX8H5H
         sqLw==
X-Gm-Message-State: AOJu0YzBHB0e1ZDp9aB2lTSck/e/sHkIkwAOz5corHr8ox07K30yVMrZ
	rCrEp1fwmISILVGXDGDyiFbc0ptlaKRU0nrOHW3gFf32c5riJTm4nRo++IHgXPoRAHp8iQR70bB
	v+tmn/A==
X-Gm-Gg: ATEYQzwuUhCawkpLyrtssmjf+If55m36McAzU3W8+1m99YlIB7jPA6XyD6YIty9Ij6W
	K89YfJYvmLoCw0rBAlaC/GUWG5MLcJFoG/CDxL00+zMLgHUHC7CgPYLvlAhbEgOkG6RLt1k0Tr3
	OU8HHTy9pSnf8HIRJc7pNTVMKve0s0R5UhGjvnmsgnXZDU9Crt3FkKWtITWsAaMmlGSMDIeDJhY
	Evh8V7gMIBnfJcvBDYwpLLkywp9wuGz92fNxqRFnBvvGLSu4hpFTSW99yt6ZhM1Ifm9AM7tpRtH
	UtVadPCKQdaEw1l1k4T0fJARSzvmEAOUbQbf09zBOB8aW17y8a95ynl3aERIMhQCmINu0XNEK0t
	gmhg73DjKfyowxUYdGxD4LHvD9cODHWqusgKT4DhD6MTLgwzG5mG6ONrcuZP9X9yuw1rMkSPZ9x
	L7jLbqMlY8rNRSkrC/B/N6+tcm+M2SdbG1ie+7QjbSC/sYRfDGEXE8oH/2SGpRjaXkyM9f84OV5
	1fM8KYAEtGYXWqvJJ653/F9IQ==
X-Received: by 2002:a05:600c:4743:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-48727f0e5c7mr185765645e9.8.1774870496365;
        Mon, 30 Mar 2026 04:34:56 -0700 (PDT)
Message-ID: <0ba80bf0-e786-4e17-936c-0b769194d369@suse.com>
Date: Mon, 30 Mar 2026 13:34:57 +0200
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
Subject: [PATCH] common: move safe_copy_string_from_guest() to lib/
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
X-purgate-ID: tlsNG-16d1c6/1774870496-785811C2-5C26E525/0/0
X-purgate-type: clean
X-purgate-size: 1720
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 9ED8935A55B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This function is unreachable on x86 when XSM_FLASK=n, and it is another
good candidate to put in an archive.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I question its behavior: If the guest supplied string isn't nul-
terminated, imo the input shouldn't be treated as valid, i.e. no nul
should be silently appended. This would then also eliminate the order-1
allocations which will result here if exactly PAGE_SIZE input is provided
by a guest (all callers passing PAGE_SIZE for max_size).
---
 xen/common/Makefile                            | 1 -
 xen/lib/Makefile                               | 1 +
 xen/{common/guestcopy.c => lib/guest-strcpy.c} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/{common/guestcopy.c => lib/guest-strcpy.c} (100%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index dac8b711cdd3..6018e256147f 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -16,7 +16,6 @@ obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
-obj-y += guestcopy.o
 obj-y += gzip/
 obj-$(CONFIG_HYPFS) += hypfs.o
 obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index dcef1610b2a3..933f6d96fbb8 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -6,6 +6,7 @@ lib-y += find-next-bit.o
 lib-y += generic-ffsl.o
 lib-y += generic-flsl.o
 lib-y += generic-hweightl.o
+lib-y += guest-strcpy.o
 lib-y += list-sort.o
 lib-y += memchr.o
 lib-y += memchr_inv.o
diff --git a/xen/common/guestcopy.c b/xen/lib/guest-strcpy.c
similarity index 100%
rename from xen/common/guestcopy.c
rename to xen/lib/guest-strcpy.c

