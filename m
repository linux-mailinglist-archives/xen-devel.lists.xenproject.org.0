Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NjVMJSQBRmr/HgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:11:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB46F3B44
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:11:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=cL5Onyrj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351208.1608441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfAdz-0004uP-Qj; Thu, 02 Jul 2026 06:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351208.1608441; Thu, 02 Jul 2026 06:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfAdz-0004sD-O7; Thu, 02 Jul 2026 06:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1351208;
 Thu, 02 Jul 2026 06:11:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfAdx-0004s7-UT
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 06:11:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfAdw-005TDF-5M
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:11:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a460101-5cb7-0a2a0a5109dd-0a2a4504e734-44
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:11:23 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46010b-a01d-0a2a45040019-d1558030d0b7-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:11:23 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso7873345e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:11:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63648d7sm20787575e9.7.2026.07.01.23.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 23:11:23 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782972683; x=1783577483; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e0Vj9mvIyK/vkRH+VB0ecw51YmCBg+xpoBt6a2CHhJM=;
        b=cL5Onyrj8fE74Ytwvjsb0nDQI33i/TwFPnu1TTYw1B60jNxLejOcKnnCOM2czSSYfx
         tgl+y1MTJcQJZYn00FMCFzDExQMZLhtH52dIluwGlwd8FOGjwjSn7xUpueTkdV92gcP8
         GsASZU953x4kCUUFcJ5yFQ3NJ5jMCkCGnMQayVEWB24/ltGRg3usq1y8oAhE6MOSJMia
         dRwHBWnoHOdRYvA8MyUZNY2a+zDz0KdrhL0d7+todCQf3VYVj0vbJup00rhTAQ495bkI
         +Tfb8OW5lFmpNHGD9nOPbfI4U4llsUSkai9nAWHcaZ5FelFZcpReqGfKmc+ccfMBAE1S
         9k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972683; x=1783577483;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0Vj9mvIyK/vkRH+VB0ecw51YmCBg+xpoBt6a2CHhJM=;
        b=X1hiQ3Orjp8dxb5syGBo2Yv3KzjeSkPppjFQJ/CsBgzLq6AtK5s2vVEV2b7PQdEVlL
         wl5P/fJG06jarTz+cE0dq1BgxqqFLFJpE5djqsm+vJQmiLHdMgC5VI0vkKB1SRXmgW1S
         s31qEdEukBUhA3Ax3WqZ5F7FKgR3ZCjGDe/YglPox+nh16NknpYi1gNnNQ7Cof+1sBr9
         zoRrfykWkNGR54qn7exWD59cfY15DEGOpAdZHajkYbVqa1xPKzsegyHttvWzN83xoN5A
         AfZ9cVXEl7zlYyaA8ZWxqZmS3yqGY+/y0hdEXSoB5YvayBM26Ic/VRzXW3qw1wzGxHuZ
         Obog==
X-Gm-Message-State: AOJu0Yz1oswpge4KppuK2HAj0HzAj2HnS/5uP3fxMjOhSEWQp832ln9/
	dzuK5jjwrP9kdhdQae+AK7cvReKvvFQ00zdoM95XbWPN9vyCj+iuRAERFFErkEvEzRNI+j+hyJR
	ndd1sXA==
X-Gm-Gg: AfdE7cm1I+QRyYHoTQpq8xQxQyZ6tzFN4FMMEpK9DiuOzilQbg+AsDqwfCSUzYW/cxu
	+dymN8d09iIvIFrGQWkVJs/9ecJL0URfw31Lll5utBAkT0KU5R7PEDQzzVsDcu9tfaxXbkBWit4
	uvEJpKtHtyKOeesx3pcgyFKsEIvJGCKikA0e+s2iISTxTZXKoyR8uaIPgCxP4wnwNKAGIaWGJmj
	ZDF57H0B4o3YwcUyNF+n5m+yvk6Dbu6zD304vXYvqHZo/q6cxLQbhnlohlXWEcA3DiDJfcthp2G
	9ykCPbMCI8IqkfwMmxktX8ePFaQ1fyuyW9APk6IY30noz2fNYmnSERk1S2el/UEgndC0aNS5YbU
	pqYaDiVfNPmJy2bBrSLRI8q6DpP+CQ4fIhp25tBOFqCsuKRMepk0TDa1xOG59B2l2M9yOtOFF5t
	WWEU9ijFuuNIw+oLCnF2Vk+ENi7Q6T2+ul9P4bF6F4C629sDRql/XVnc55UPezLVstLq/THFUk2
	eTu
X-Received: by 2002:a05:600c:3e06:b0:493:c548:87fb with SMTP id 5b1f17b1804b1-493c5488ce2mr21468245e9.36.1782972683334;
        Wed, 01 Jul 2026 23:11:23 -0700 (PDT)
Message-ID: <7e0c8795-cc60-4b78-8601-6a999739467a@suse.com>
Date: Thu, 2 Jul 2026 08:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/Xen: correct commentary and parameter naming of
 xen_exchange_memory()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
X-purgate-ID: tlsNG-ebf023/1782972683-AF9221CC-ED16DE08/0/0
X-purgate-type: clean
X-purgate-size: 1985
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2EB46F3B44

As documented in comments in struct xen_memory_exchange, the input to the
hypercall is a set of MFNs which are to be removed from the domain, plus a
set of PFNs where the newly allocated MFNs are to appear. Present comment
and parameter naming don't correctly reflect that.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2: "fns_out" => "fns_inout". Mention parameter names in comment.

--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2291,18 +2291,19 @@ static void xen_remap_exchanged_ptes(uns
 }
 
 /*
- * Perform the hypercall to exchange a region of our pfns to point to
- * memory with the required contiguous alignment.  Takes the pfns as
- * input, and populates mfns as output.
+ * Perform the hypercall to exchange a region of our pages to point to memory
+ * with the required contiguous alignment.  Takes as input the mfns to trade
+ * in (mfns_in) and the pfns where the new pages are to appear (fns_inout),
+ * and populates mfns as output (fns_inout).
  *
  * Returns a success code indicating whether the hypervisor was able to
  * satisfy the request or not.
  */
 static int xen_exchange_memory(unsigned long extents_in, unsigned int order_in,
-			       unsigned long *pfns_in,
+			       unsigned long *mfns_in,
 			       unsigned long extents_out,
 			       unsigned int order_out,
-			       unsigned long *mfns_out,
+			       unsigned long *fns_inout,
 			       unsigned int address_bits)
 {
 	long rc;
@@ -2312,13 +2313,13 @@ static int xen_exchange_memory(unsigned
 		.in = {
 			.nr_extents   = extents_in,
 			.extent_order = order_in,
-			.extent_start = pfns_in,
+			.extent_start = mfns_in,
 			.domid        = DOMID_SELF
 		},
 		.out = {
 			.nr_extents   = extents_out,
 			.extent_order = order_out,
-			.extent_start = mfns_out,
+			.extent_start = fns_inout,
 			.address_bits = address_bits,
 			.domid        = DOMID_SELF
 		}

