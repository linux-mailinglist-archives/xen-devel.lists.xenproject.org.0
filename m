Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JcWPKtgQMWpHbAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:01:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA6468D5A2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TvA6OQCn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338828.1599885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPfH-0000Ad-4S; Tue, 16 Jun 2026 09:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338828.1599885; Tue, 16 Jun 2026 09:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPfH-00007u-1i; Tue, 16 Jun 2026 09:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1338828;
 Tue, 16 Jun 2026 09:00:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPfF-00007m-Qf
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPfF-008tyZ-7I
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:00:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3110c8-5cb7-0a2a0a5109dd-0a2a4506c738-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:00:57 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3110c8-7371-0a2a45060019-d155dd34d44f-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:00:57 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so2305033f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:00:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26393asm45176510f8f.5.2026.06.16.02.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:00:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1781600456; x=1782205256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3KIC7FhXKRQjgufOU+xqDX7cseUxDHhdniiRrgNNmds=;
        b=TvA6OQCnA1iAaf6MB/1LqUfTG7XFlSQliEWj1LZwlS6txF9hiHzVUe2w9FOCTnAbTW
         PWXiQ1jtiE8w/pmHu+taZp3Pu7SZOZHmmhcCxgOKvjt33hHoWbbFWe58/v2rDwZAlCU/
         buyu7YINHBhLHxOFvC4TYS8Xk8J8rZRRZZIv79rvnZX0F69tb9PYXEIu973TSIFmFop/
         gWv8soeUUx+Ef/cjCmHQnapK7wr1P2QBEUIM9Sd9E3fjhpQDZUFrtdZtz/AfQVg/ZUd0
         eqp4FlBgUwePwtL+dIdzUkZSs/0v9vKVv17s/vmq1s49Sd0WoeIf0Fr26w4/FHmxY1xO
         ZgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600456; x=1782205256;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KIC7FhXKRQjgufOU+xqDX7cseUxDHhdniiRrgNNmds=;
        b=FcCfYPCw7bipLXL1Wn67oy8Ml8Xeef97fQDh6ik2OEXfeBHs5xtPWz0GLEZnv5f9pX
         cXTadjbhbjZe7oGFyolnX+PaU7Iv2Aefvzu1xjA9PF3GA9OESmoLoRt07VKEIDcflTQ4
         C1sbAPvg3h0P4hTJp/soxWhOpfTOpBihZm+G47/0UunP0IDUGMrOT+DfLJXhLxPcMI5o
         2Lj0jOLJxtU8YHDsqV/2On5GCaUaavELtYnt4MrPkAUutjrYog0w+H7eWvx49ZT/PY9B
         Bw2KRq3kQv2/23RAjxjc0VM9I0b3r4/3fKGZLrCku9l6b2f3z4RMnC3PhqML/ZRmiUZJ
         jPig==
X-Gm-Message-State: AOJu0YxiQ0Ozq3fZjVipSsL1srpt2Bbs9elRy2s1AgfTbJHpkqC8pjAw
	EVfivEOpmZaDow9HqQ8A0Dp5GrgwyqD35Rrhy7DXKczHB1dxqTVzFM3KzysI0c4FA/e0OTXqtOY
	TwyM=
X-Gm-Gg: Acq92OGT1gSYCOA6TzGoLPkznp3B/oRi73Yy/uy0A+WUQuf8pVirTw63BCoidNWsC0v
	ZlFBCpUjE1vmJ8CqVsJc9gjFBCF5JAuo3Wb9Zcdfanw8Obz3moyuLcblSHpLm0a9Hl92YRV4Pwx
	NjGGxU7oQa5TxVpjE3L/OSleJgqFNJIGy62KVynxs6yUH/Z0QnUXUO1pOahXPHRMCoaZsRJScF1
	aRqtYXV9cq5dpvpB0YUd4PO6QMJLtOlJ92eIAo+bZ1OPLWVxVG4MClB4MS5888tpNBaoOB3SYoG
	o4tMuL+tK8V+FG+TqW/ST1cgQ2w8+uoyQiCBn6e6cGTGDxSTEOFa9F86tJW8ShZ+8bbvWpd48vZ
	chXZW1t12rX+J/4UeTZX6HnSZCwMT3o/z2N+DLUEbBd9fuBvba+0VNF/7skL77suL69PXEzNWX3
	ttQS7Ff9KKf5957LBHoqSP/Ahlsd8Hs5X8pULrgdvM14ErvrsnWSYQDIxu1T+Nvi7nZ4i78e3Tt
	r9ruAF+NUgtPF0=
X-Received: by 2002:a05:6000:987:b0:460:3233:f994 with SMTP id ffacd0b85a97d-4607ebf6969mr19546916f8f.43.1781600456261;
        Tue, 16 Jun 2026 02:00:56 -0700 (PDT)
Message-ID: <8adede4b-f25d-4a77-9fec-bd099119b005@suse.com>
Date: Tue, 16 Jun 2026 11:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] libxc: adjust string size calculations in
 xc_{,de,test_}assign_dt_device()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
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
In-Reply-To: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781600457-8596CD75-D3A002AA/0/0
X-purgate-type: clean
X-purgate-size: 1043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[lists.xenproject.org:query timed out];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[xen-devel-bounces@lists.xenproject.org:query timed out];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FA6468D5A2

In preparation for a hypervisor change also include the nul terminator in
the size calculations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1592,7 +1592,7 @@ int xc_assign_dt_device(
     char *path)
 {
     int rc;
-    size_t size = strlen(path);
+    size_t size = strlen(path) + 1;
     struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
@@ -1624,7 +1624,7 @@ int xc_test_assign_dt_device(
     char *path)
 {
     int rc;
-    size_t size = strlen(path);
+    size_t size = strlen(path) + 1;
     struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 
@@ -1652,7 +1652,7 @@ int xc_deassign_dt_device(
     char *path)
 {
     int rc;
-    size_t size = strlen(path);
+    size_t size = strlen(path) + 1;
     struct xen_domctl domctl = {};
     DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
 


