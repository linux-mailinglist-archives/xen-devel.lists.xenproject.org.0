Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDo9K9CEBGrVKwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:04:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D3534A41
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308070.1579611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNABf-0000VM-F9; Wed, 13 May 2026 14:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308070.1579611; Wed, 13 May 2026 14:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNABf-0000TJ-Bd; Wed, 13 May 2026 14:03:47 +0000
Received: by outflank-mailman (input) for mailman id 1308070;
 Wed, 13 May 2026 14:03:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNABd-0000T7-OT
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:03:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNABd-00ERMx-4V
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:03:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0484bd-bab6-0a2a0a5309dd-0a2a4503af22-12
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:03:45 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0484c0-672d-0a2a45030019-d1558031c5e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:03:45 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so38921535e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:03:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d19974sm73566305e9.2.2026.05.13.07.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:03:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1778681024; x=1779285824; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyfgLp6BbNzu6gMmN240f/olsGIMSN44g4V0czTEdLk=;
        b=UoeZziFnqjkK3wgkqNhqrkPB5ZJz67zrG22iMtFi9BYKl+UVmUcWuwyCeNTf0ij3Pb
         1q+GguMLXQX7v0AZB/d9o630G2LMmXowyt8ZbszAux/XaxNGOi4bntXPl0WoZbb3jNG6
         N22qwh1lHbrKnKZHkC8R0h3c1giKvBA1KVcn3NqozjGKsGGPEfEwJIIezM4cvE0xelEH
         fY/+wPIZYSS/0BVKNKXuE9O6TAEym9ETZF9jeaKNQbql004qpw+4xkoYG4Z4kqONtu5i
         htLVHA7sqsXzJKhrhYbjWKvThztLmSaf5+2TP+kAXqJh2nP6DCJbpZ3PCQnuE6G6HS/2
         SMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681024; x=1779285824;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyfgLp6BbNzu6gMmN240f/olsGIMSN44g4V0czTEdLk=;
        b=hsAjYbPAUUL0z9ptgRc4zWUbaCEYqEV4R8yReiSI7gHiBAWvY5Jvr3K+R/OsON4s1Q
         ZvBeVOvmP0AMeMyCzI0CkAzEloCbhCFy/l6CgshWpMk9HEYti2g+vYXm4v20+yHjTqID
         44xEVx48+rs5SQ+5wEg/IIxJE4gJzEh7xoyrZaAbnSswJSkvGWSFUENExvC1t5fD86Qp
         BZnWEmay8CpLVVKCcbao/Dz9XdkMY/maVSW3EeBfcyBrdoptqLpCAH+xKWCq/OTe9URi
         QpYXfBDOwhmOfdbGMJ5zN8Rj9StjLkkC19kCHLD/vZzGZFeCdNTM1gw6cufkiDkplkgb
         cFaA==
X-Gm-Message-State: AOJu0YykK6oiIn43MsWU6+7caQcWEnfYBIEs1huueJSyDlJvCIAVM8Gj
	EWES22uCUCFiRd7TbPTjJfCl5HqTUZlGB7etXslbM1rXCPiJsN+4fYxQr4urqmTdTwl8RVv9NHx
	5oFc=
X-Gm-Gg: Acq92OETayr/+0bJhzsPE/ppfoDvW+v36aBzzG3WnOv6PaU9576o+1vIU5LGpbrGyY4
	EMYfYWh1mQDPCl+s2k0kO+hb5tnC5WFHItq90h5LG8WGdHYcyyUbVz8WGBAXnP7wOiPK7nN0uHU
	xySGzX38oKrqThGo6Qb391rI5ooa50sJWSgNIzd7eLOLosoNSD0Q3Fpu5ZwHmRTz+VPCQio60P+
	wfikwDE+NU1Wcc0R8ETWjATUjI3i0g2/FR2vIedXvkL+wcZSOT0byqsMnfzFAkooC4P5oKUmLNX
	ewjazxr34EdAtRAkJ9k8JaGuocxRZBK6b5RgXlPB2BWPfRyDebmKmb+/hELR+XHdp7C3rJjM+DF
	rh9NpseOAEfBTzayw73HM5NC5YTuM36lJlDh67SSeoCSRw2lIPNAUpwkNfnIlJGp+kPyuVIHHAZ
	Fh5zpehBl9oG6uuhsJ7gwn4JWb7FpiOt7xAyIiF1+lvkuDop/5hN+pbvKa3+KR7uB1QK/EkuuSy
	HXVohl4/UEe01w=
X-Received: by 2002:a05:600c:4f54:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-48fc9a4b276mr52734895e9.27.1778681024534;
        Wed, 13 May 2026 07:03:44 -0700 (PDT)
Message-ID: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
Date: Wed, 13 May 2026 16:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
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
X-purgate-ID: tlsNG-33051d/1778681025-41B92938-0520B090/0/0
X-purgate-type: clean
X-purgate-size: 650
X-Rspamd-Queue-Id: 3F0D3534A41
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,suse.com:email,suse.com:mid,suse.com:dkim];
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

... ("Conversions shall not be performed between a pointer to an
incomplete type and any other type"): Add an intermediate cat to void *.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
(covering more than just this)

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1264,7 +1264,7 @@ static void cf_check __maybe_unused x86_
 
 #if BITS_PER_LONG == 64
 
-#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
+#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))
 #define COOKIE2ID(c) ((uint64_t)(c))
 
 #elif defined(BITS_PER_LONG)

