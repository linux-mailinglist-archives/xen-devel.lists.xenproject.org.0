Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nU6PO42MT2rbjQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:57:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889DC730BA3
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 13:57:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QGMdzCUd;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358026.1612312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnN0-0000hc-Ah; Thu, 09 Jul 2026 11:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358026.1612312; Thu, 09 Jul 2026 11:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whnN0-0000gD-81; Thu, 09 Jul 2026 11:56:46 +0000
Received: by outflank-mailman (input) for mailman id 1358026;
 Thu, 09 Jul 2026 11:56:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whnMy-0000g7-8F
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:56:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whnMx-00Emew-3n
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:56:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f8c73-2eae-0a2a0a5409dd-0a2a4503d59e-16
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:56:42 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f8c7a-f2d2-0a2a45030019-d1558035c9ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 13:56:42 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so7246555e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 04:56:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f213e8sm48834190f8f.34.2026.07.09.04.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 04:56:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1783598202; x=1784203002; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sv1lkAmLEVDqcV/2O5RxGLO/sfmJzzA9DQ5sfvZQKtI=;
        b=QGMdzCUdhxuvcEVY2SZvSDEu1n03/5Kfc8cJ3JJTEjicMaQbYjRBc6SxBAs3d6TnSE
         ZRHeBERJiA5GZUdFxlSlbC4b9ld0sh+1yMvMOOjOiwoiwBk2wW+RuN/tnvrp2B3/Bz0J
         sBS+rCwRHnRE4qlBkjUXeUsPYrOjOaENmgMcLZ2OluwCM3ZqSp/ce+Y2QffXlTnLOnzF
         H9JPcUrbmrnClxqc+Yb1lgouZHQ9pp1fnJNBu1kXJPHY+Tm2fdOqfwZhvdnwvbJrQlfV
         Lw6qqbi+2JxRdkwPxrqpeyBIenjFSHbZiYRiYeXtwvYT/6+TF/Mwe84Abpwwq/rhI9nB
         ijMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598202; x=1784203002;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv1lkAmLEVDqcV/2O5RxGLO/sfmJzzA9DQ5sfvZQKtI=;
        b=YhzUGeU36NH6+vXn2O6Mqj9YkG1sCufO+mcC6KWwlrAH/RFL5v+BKAZVl7i1d+xFjq
         9byTVXsprJ0uaj+sd90ZP23FRNtZeMa9n6nppw2t2Z9ll/rs0SJqwxuHbIVsv8NWk061
         CGF8Rt/p0WWIgxuoeakqvxQD0NICFQToxCqlpmfPuQtwAMXVC+Apij9FSC8Pmn8N3SN2
         PgY3yjEA+S9bDw0xRzJEyjRewUvNHizWuDrIWLjy8pimJfJGIQiMZNlFmyz7MLaRv7Br
         l9+WPWTiSqfIKLCQYJiyl9gRgSPpQALUdgV9cbQaJbjBVyHJMu6qSn3KQ5ncdayZxZbI
         mLvw==
X-Gm-Message-State: AOJu0YzA6g79Bo1ClgfsR8FNEmp0kBYAZnL3VCgRCz/29dE3of/vE0vu
	SItIgWQ+3U6zirapuJXzI8rPF4EAA6ECeKUF2nzthVO6cE4OONj/6l+9vMxgoofAuryN5yR+Daj
	GIoIxXw==
X-Gm-Gg: AfdE7cnwM4i5q1ONMO1aWsbKBCiu+xzdGgSkUR1ON2Og8BUcr6HBkSyFQB97W09FFgE
	52ncKi2O+jb4ZKAOebtLo5pMyqbdu6+TfZbyciG74lPHvjZTX+X3+nHm/y9ONnhU9rt5JiCFZAo
	m+5HIp6jWLsFkY/UxRAast4O15rBGMv/Pdpqfnq1iat/JpKZKqdxurmFlQIvpLhXhHfCPGKI7wW
	HOh3QonV3Hc0pmVXbrjPImFCP2MdNMIMK4x8mQwVRZgCao0fi57OzcGbb+Jg3hOWVZW1CCa4dF/
	4hDZENFr1bm4M56BRC7KAK5W212QPd5AhP2jWTRe1xCQoHQnhxnAgHLB57EzbSn7IhqY05h9gvP
	W6oOKiu5bxB3+l/rl+dwzga/rR+qHZrjZtzjm0Yxfjzv8ddaUBkoWS1178UnsJl52A9Y8yEUwEU
	/i7ENXSfuGiSyMKQ0ar4v5oogYGUdHxcJt0xc54KftZ+ueizLyjlOOfpFBDdvP+coP8HncsLrI0
	uA3jERYobMjuUs=
X-Received: by 2002:a05:600c:a0d:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-493e6841006mr71313245e9.13.1783598202408;
        Thu, 09 Jul 2026 04:56:42 -0700 (PDT)
Message-ID: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
Date: Thu, 9 Jul 2026 13:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: adjustments to building of the insn emulator
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
X-purgate-ID: tlsNG-33051d/1783598202-C3159CF4-ED92A6B2/0/0
X-purgate-type: clean
X-purgate-size: 155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 889DC730BA3

1: x86emul: drop wrapper C file
2: x86: put x86_emulate/ early in $(obj-y)

Possibly the latter patch could also be folded into the former one.

Jan

