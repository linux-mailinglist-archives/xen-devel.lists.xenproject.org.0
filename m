Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI4BE1GtwmkyggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:27:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FC7318002
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 16:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260989.1554140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53el-0002ks-B0; Tue, 24 Mar 2026 15:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260989.1554140; Tue, 24 Mar 2026 15:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w53el-0002il-7D; Tue, 24 Mar 2026 15:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1260989;
 Tue, 24 Mar 2026 15:26:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w53ej-0002if-Ux
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 15:26:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w53ej-00DdOV-6m
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:26:57 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2ad40-bab6-0a2a0a5309dd-0a2a45028734-4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:26:57 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2ad40-63bb-0a2a45020019-d1558030a9bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 16:26:57 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-486fe36cfabso22504365e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 08:26:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4870f7f5682sm31572855e9.3.2026.03.24.08.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 08:26:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1774366016; x=1774970816; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODZCxIGZjnHbkVmC3bG1mIyGlf3Z2j1k8VIBD4mpc6o=;
        b=B3301QOYbUp/5OZYgbrT62vcP74hXtfYYqQe1OxzX56htZxFNdWT0mbyT+N7Wp9YSg
         uEVR8Cnwz6IGnL60RfACx+MWc1LEUcEOMPCA6hZg4ARAcpGc+VEdMYk+G7mBb7vPzY1q
         bn5WmYhk21OJRkoW2JlszH5pBqiEskDTNv7H67mE/rL+90jiIXCuuGDRrgLC0Hy/M0Yp
         gqR1H6tHCxCQNJ7lAXLi1VYZN9IYJ3HtnpCF88dmUnh6ME5u6jTr3aK8qJ/C298rPNx8
         IU+gREfhfmgotxm70hVCCYy/PM+HIOzWL+jkTxz9VDzNJ9IpJZuwHJrFJ5rxSibPBCoo
         kcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366016; x=1774970816;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODZCxIGZjnHbkVmC3bG1mIyGlf3Z2j1k8VIBD4mpc6o=;
        b=G7qhNyGW6drqTCmJKRBGRTWveJODZtl3VHYLyuaDywY4/wPyHt0iUBeGDoAtLZ5dLC
         oVmRxmf9SZFHm9x8LPMkOCnYpI7qI+ZHO1qIOrN7cp/GIwklESwjq8XumA74NdqmyCTA
         GMhS5zE10rRmDfS0+bp8dXBL+rbntu/9GvFXAfxTg/yHg8T6ZCo48AMaCBqcDMAue8Nt
         DURu5GJVswjf0rppayoMEY7HmU3aOxgfT07AM5Ddp1Ss94/GSJpL1I4QRACPTaQWAfDX
         Im58HeI5jeEJc3eiHPtkJt1vAlJpOAVwmwcdV1uvvD3hMsJngiYHZZMWKLYlvW5DoHzP
         ub4g==
X-Gm-Message-State: AOJu0YwipzBOcwFV2MAEkgMi4TIJxyZAps80Zej0ZOu8gWRcis1zgkcQ
	XWwBA+tyIg0/waMZHNklAt9Er15va+iswspgSQJZPAida2z2M6LhpZ5N3FwevZh3xEArZ6feOgQ
	ksQq79A==
X-Gm-Gg: ATEYQzwoUi71IFD1xySsOjBNNO+FAn283x/n1UgyEYLL/xxRvJ+OCF1TliunsO+QAmU
	U20vKNUIry7oUkd1Id9z0A+JMTHj6oKEgUlAEv2vIa9/BNRJ8vgUN52MWY9Dsbnc40n5RL67tLk
	WxvNvlBCRHFUciuizMjg0sY1akU21VDt5l3zE9bQaUzjTyB34hyMHy7CRO82zXhPe7XyLRj90u0
	VloBnkwjOtd98lQQ/KZSWQyH+YNtD7nyDSJGvyg1gF7uAurr9ptuCrf2doIaHJgPnbuX4Zo+2ah
	JELqql3gsp3gnSCTUmcTeXWKijDmnjblcjLZHeEMWOpkN64+qnwU4UMkkLXRT8oghMAWSOD5Plh
	ehmY9hCgBgkANksaR/TSphw0FW7p3bX4YDL/ycU+cVZjojBpPRg1nks1WFSpmgmrU5y2t2lHFhe
	sHT9R9omxDr4tvV0S3UooO8bPDY4GcE9RMTEpmGzv6qt9t4YPAKS+cKCXTVzk8RuBT0CVdbKDI7
	i9X/xJVXIOYfFY=
X-Received: by 2002:a05:600c:3106:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-487160aac25mr2322785e9.15.1774366016512;
        Tue, 24 Mar 2026 08:26:56 -0700 (PDT)
Message-ID: <cb5ad24b-03a5-4c1b-9d98-8df534854b2f@suse.com>
Date: Tue, 24 Mar 2026 16:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] unlzma: avoid UB shift
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
X-purgate-ID: tlsNG-720697/1774366017-40497DB8-796185C1/0/0
X-purgate-type: clean
X-purgate-size: 918
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,cert.pl:email];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 87FC7318002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shifting signed quantities has restrictions. Since the wrapping macro of
read_int() type-casts the result anyway, switch function return type as
well as the local variable to the corresponding unsigned type.

Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We've inherited that code from Linux, and the same code still exists
there. As I'm entirely uncertain whether they would even care, I'd prefer
to not take the route of posting a patch against Linux first.

--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -30,10 +30,10 @@
 
 #include "decompress.h"
 
-static long long __init read_int(unsigned char *ptr, int size)
+static unsigned long long __init read_int(unsigned char *ptr, int size)
 {
 	int i;
-	long long ret = 0;
+	unsigned long long ret = 0;
 
 	for (i = 0; i < size; i++)
 		ret = (ret << 8) | ptr[size-i-1];

