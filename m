Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AqkOViDy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:18:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A6365FD3
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268645.1557879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UIj-00050R-7E; Tue, 31 Mar 2026 08:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268645.1557879; Tue, 31 Mar 2026 08:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UIj-0004xO-4E; Tue, 31 Mar 2026 08:18:17 +0000
Received: by outflank-mailman (input) for mailman id 1268645;
 Tue, 31 Mar 2026 08:18:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7UIi-0004xG-8K
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:18:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UIh-001tCK-KN
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:18:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb8344-e002-0a2a0a5209dd-0a2a4505cbe8-8
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:18:15 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb8347-5aeb-0a2a45050019-d1558029a50c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:18:15 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so54324145e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:18:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21f279bsm22866149f8f.16.2026.03.31.01.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 01:18:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774945095; x=1775549895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rE+ZOIDd12Hx2UVXrqnhODh8th136e+Cdv47CkInP7k=;
        b=Hsx8YYxgqkAIcdx277mih1WMYGvVdUKBDSdC9/jbdwCWx1BmKQraP/1K09IzEvAsCf
         iS3yKxzoCHx3YgCAj8PbPAO50nBeh2XTJ4sd4Yo3O5E6sQoo476EDqEjVzju5EPJ3l6i
         wNd50CVuPOvqQR7Jd+OvqzGb4tc/pe+1kn3hQaPLFm8a6wAFXvOulvfV9AbXwOqKOU/q
         F0szAhr2ZtYP84OClqEJxbuJCstUi9gSI14wuVoSy+nWVe36T+cfW0+42/AFwO4AJH5E
         KeVu8EC0JktxMTrYiAZUvRev6TI4pcOEolLnaZk6W6WZb+licr2NVV+pRpAn22+jUKNl
         bgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945095; x=1775549895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE+ZOIDd12Hx2UVXrqnhODh8th136e+Cdv47CkInP7k=;
        b=e41iHpFhRJAZ5bZQ1NKDMYhLpI/1K4nslo0m3rzObanY+yKt0WPw25ABnc4zpurKvQ
         2q4iDbDLzSRr9QJ1M5YKmH43c4R3DNDHnQZvaTWbbR0Zb3PDvK6F/JN4hZ9+Qlu9SajH
         utAcyrF3szxgMmdh/tyn/FE5KHDy011uKYOUMYWcFiN97b+o6zfPOdqSHs77YH2bCKVa
         q/CZr9h/jfMTG4/DXfdfPHKm7dMIzktjoaGS3q2GtYN/1klGOaKpUj4zWNthPmvT33Ml
         h+wyfV+vaOXUDrJq6LhdbOX0ITy0iIpY7m2pgfHyVkeek1HGOcBFq2xzA0SPYfVLDCqi
         lIdA==
X-Forwarded-Encrypted: i=1; AJvYcCXPt/InW2SjSGSuN3a0pPNr+qKhqX/WSFQigLH00D3MWb78QJmbmh7Kas7dFzudw4ZTOkQe8TMMFDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5m3zP9UJQR7eIsQwQJkYeXFSaxz0MjXBQt1RXz2Lmu7eAK2b7
	Z4DaKaKNzm9wI1DMscD01+pHmmnxq8F/193TnjGMf+U55/eeogI1+Hbcm7JqUsagVw==
X-Gm-Gg: ATEYQzwMhV2Y9mzgHvgjLiu7TglhUV+BF9sx3aalFfSQ7XmhFbxtwgXwvIzXf+RHe+e
	IXofK6jJschqgaCi3y56mEm3qsqF9rj+0gkaaSTjS+4SNkON/cfheaotk8lYmBD2o9yxQD5IciL
	R6WLbhbmJeHlsQkX7LXLoh2KGr38ggW50PZNz5ZguZztQ8ndL+RWi4Op0vi/b/Ze8dtTLNVslQP
	HroU161AOWwkWcrqD48oDkno7exGz0xEcOm08PYTrzflxbtQjrn5nbCpfwKqZD2PwdzI0jaL2UZ
	frMshodOjVB1LPRUjIPikU5Nl22eCVhhktu24byWm7BH0Cyc6NFEVRtjUck5G0L8HDZdZnDrD2f
	x28aT8+9SG5EQGeehxrd4pxds53kHiNlu3xaSX/mo/bHfihWEb7+yQMu2/KqOO4TiYnJiR5MniY
	ndgGr5/w3pjy10RjogKHvbszoyu9OXt9ItOYS3c29ALoQJB4KrUUQ0S0RSU0xMlY5WYt3c8iox+
	vlZczp6jvBqRn8pMjRPwChj/Q==
X-Received: by 2002:a05:600c:6488:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-4887d01f7a6mr29193685e9.6.1774945094930;
        Tue, 31 Mar 2026 01:18:14 -0700 (PDT)
Message-ID: <70fb1554-9560-40e4-9cc7-dd8d7a8755b0@suse.com>
Date: Tue, 31 Mar 2026 10:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
To: Milan Djokic <milan_djokic@epam.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <5bcbeb1d614be413c13196a38d13eb3de5c549e4.1774918270.git.milan_djokic@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <5bcbeb1d614be413c13196a38d13eb3de5c549e4.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1774945095-20896488-CBC78129/0/0
X-purgate-type: clean
X-purgate-size: 1076
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,arm.com:email];
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
X-Rspamd-Queue-Id: 551A6365FD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 03:52, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
> XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
> enable/disable vIOMMU support for domains.
> 
> Also add viommu="N" parameter to xl domain configuration to enable the
> vIOMMU for the domains. Currently, only the "smmuv3" type is supported
> for ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>  docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  7 +++++++
>  tools/include/libxl.h                |  5 +++++
>  tools/libs/light/libxl_arm.c         | 13 +++++++++++++
>  tools/libs/light/libxl_types.idl     |  6 ++++++
>  tools/xl/xl_parse.c                  |  9 +++++++++
>  7 files changed, 55 insertions(+)

Nit: The subject prefix suggests a hypervisor change, when this is all docs
and tools.

Jan

