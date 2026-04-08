Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKKUIbpE1mkFCwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:06:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EAE3BBBD7
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275842.1561537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARfV-0006N0-RN; Wed, 08 Apr 2026 12:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275842.1561537; Wed, 08 Apr 2026 12:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARfV-0006K3-OP; Wed, 08 Apr 2026 12:06:01 +0000
Received: by outflank-mailman (input) for mailman id 1275842;
 Wed, 08 Apr 2026 12:06:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARfU-0006Jx-C8
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:06:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARfT-009uHY-J0
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:05:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d644a6-5cb7-0a2a0a5109dd-0a2a450cd984-2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:05:59 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d644a7-f40c-0a2a450c0019-d1558033ed9c-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:05:59 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso36095075e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:05:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5d85475sm17167415e9.16.2026.04.08.05.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:05:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775649959; x=1776254759; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vL+NPhak5gWUHDY0Q7SGnWQewBdfLXy+S5oN0ZPZmcQ=;
        b=bMFMD6lSVoKYyjcmHFApugflKqzcKLS+5Hdp66xS/Jly173IkSSTPZSiIFXlvEsaBi
         kWKrqIZTXIpYiVm8UXxfJoFLxizj3Vw3tHBHslYJk1/zv5losTldtUF7JkzJ6Vs26zdA
         fQ8sDx78UkCcv8kxTaWUrtCIo0mZFN7O2dQyw7fmY1QESihJ0StTqYYh74T27uv5m2xQ
         Wbg+SCUFPd4vrwikdcjlcJTxGZ0bGUwtmRzjmOUq0hEdMmqsZrRWsQbLhiXJ8Y0ZO9ox
         56RzP3BFe11W0ic8Q1zGT3T+aSPNRA+qBxtkf38ai3ObtOUBjIiZ4Y+9BYvkw36Mfe7c
         iUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649959; x=1776254759;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vL+NPhak5gWUHDY0Q7SGnWQewBdfLXy+S5oN0ZPZmcQ=;
        b=jpShImVfn1OFRFNRr89QPnwehv0VambCI0PxuRoNiibcmgX4ZDZomFOo7t9xFMyCvQ
         ZdvAQIXZOijNdeHQ5+2m4sN7g4rVi3thi3U4y50iWmvh6in/Q0cnhEmvTp/T4tjI3X0k
         5HM6Oo+KGbgxYJAW2WhODkbEcBcW21w8E2LiMAvsORYMATgjgbu8LUwgwcIWpK++s0fw
         twYdQQ5GN/AVrwTpfj3zRf40DG/o88xaXr0yG9xyojvrlt+TVh8erE/mZU4EpxTdQoaf
         byFz6n0nVtVaTe4unNfZpXdavzpay4qhwkLW9UPaDjG8TVHZnUXbo1Y8WcLM/cnRSYqL
         MuwA==
X-Gm-Message-State: AOJu0YxbwTYDEqxy8fMDnWpXeiL+82cgn2d3DgS5rNBaXQ7cKyh5Qpyn
	nVrsmwYObZhsoh/fN51Y381jTBTj+sxG0Mbd2WjiyywoNCAKHobWQVqjJVdOiDyF86/qKeHN1Dl
	0mLNJNg==
X-Gm-Gg: AeBDievKCkc1lZ+4MfQZmyieUu+cGvHNq6g4pNrnD/kwDDRPQITZHzOsbvI0qvf5v1M
	4v+jGDa3QWSOBjL5CuMRCV2pam7XlkEWZAy9EvZXCOsKyxzKywnODMT8N42sbkgaGXs2Y44K96V
	MeTfJKS+7AqqdDQHPZRG3fLvLkci9pcxKNSm2SAn28DkigWhM1bd+MHRsjOEegsYyTYtAwUbVns
	IWKIR0yD67IMREy1FGy21dvedQToIEv9i0seHGeNL4Q8yC7sN4s8291gHbzIwCMBzdI8lUws6vk
	a+09VBN7+ueY8he669Nj+DzAHXk3/MqrtYbx55clkmZUtQKWTrENzCQwuctL316mcrM25lEanH6
	S5ntVzaWzAE5Y+7NdDNJWt9+3E4d6H0Bxbehlxij782XA0LuQh7e9h+T4RWgrjn6WZbJA09HdQF
	L9pmZS7bqHuUvYPUnwwnwYp9CAMiShujWa5RP3iUP9FZuqNz1LSv1KAEci/cXNNKSn0TSilol7T
	7WEUuAFw42heWs=
X-Received: by 2002:a05:600c:1da1:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488998f488cmr288110955e9.29.1775649958870;
        Wed, 08 Apr 2026 05:05:58 -0700 (PDT)
Message-ID: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
Date: Wed, 8 Apr 2026 14:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] ioremap() et al
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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
X-purgate-ID: tlsNG-d25034/1775649959-83F42A3D-95AD36AD/0/0
X-purgate-type: clean
X-purgate-size: 179
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,suse.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E1EAE3BBBD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I found an old todo item, carrying out of which then made me notice
another anomaly.

1: make ioremap_attr() common
2: make ioremap_wc() x86 only (for the time being)

Jan

