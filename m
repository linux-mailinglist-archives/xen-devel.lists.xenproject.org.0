Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJxzJ+uS2GnifQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:04:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E4A3D284C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278318.1563188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB4yP-0006vF-7z; Fri, 10 Apr 2026 06:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278318.1563188; Fri, 10 Apr 2026 06:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB4yP-0006t7-4f; Fri, 10 Apr 2026 06:04:09 +0000
Received: by outflank-mailman (input) for mailman id 1278318;
 Fri, 10 Apr 2026 06:04:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB4yO-0006t1-Bd
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 06:04:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB4yN-003jtH-5U
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:04:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d892c4-bab6-0a2a0a5309dd-0a2a450ad46a-26
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:04:06 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d892d6-ee98-0a2a450a0019-d1558032b8df-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:04:06 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so20913465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 23:04:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50289sm4899182f8f.28.2026.04.09.23.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 23:04:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1775801046; x=1776405846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gf0Tpy8Ukpd5M0cyLBBCqNp5SUe9H+I4XWYBw2bV+bU=;
        b=blDSwK1QceV/p7VmzRl/agh7aUvhIg0iwhsguScU5ikRL7XIK6rZdiAEp5c1JjOZ9Q
         iRyldd+b12syyio9pus2KYmG37m4Fs/oFPxYWCp/ccneedmJg31NC+KoJ1ctPNzC5rNg
         gK5jI2NHheZxCPaomnr3tvqQDWZBGm53IWgsbEINb3jouK6WZyTgfLlKVmMSPyzp+pFW
         y4HwJRGxoUm/qqR6t6kF98DNY8IvKequsIygFLc/cIKXlqGlCYqw1hYC61Naa38YhCgV
         HDml91NvADQFrOdeFR4RhtXRYpmEKrlGC4mChsBZP5SatrLWfWpDh7pRuWVreSrhyJ7c
         LXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801046; x=1776405846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf0Tpy8Ukpd5M0cyLBBCqNp5SUe9H+I4XWYBw2bV+bU=;
        b=XM3tnoSfIiAlpKHEEet8xfqIpZSYgasB5Icpsc8x/vL6a04BqHNiPLAX2QkTQTQHv3
         nP5oDmYuUqlnawc1mmbORdpn2Z9oQ1e/6Bc8hKoi3WcReLKyMvbpD5kZxYA1DSrpXRhH
         vvg+OrnMnf9plKkS8UQmCOKo1yAI4FwPrwvbS0elNrT4iV8nylnGNSRj3r232fOsoyQ/
         JmUBjmVo9szuM5zPPKhNANBV54WKiXdYYXMWx0hDwfsHcuLomlRPOoT9cAjiHYXeXRGc
         sUxXAYy8gJEdM+ur7iGkD7mQW+ZzXpIDftDr4E8UKbMKs0iplbqtmGD/cl65Kij4JNXi
         nauw==
X-Forwarded-Encrypted: i=1; AJvYcCWUonuIsqxQZd/p9NDp4bTO+m0476UPMCi3fSHZQg2f0kAUxzW2JXMYEacy2p4yy11JRMT5zTIRzIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXeWYSCtB2Yl1w+rrlzWtiyqgb9BEbAZs7eQkt4pyBcTVhWUGN
	huDl6wn9W2bMzqZpvB9bivF7wA8BugXGwVuHDBMCP2sEbsdtfzw8a3Sv+xg43Ytdqw==
X-Gm-Gg: AeBDievPj97OAaRaNylKJ9z4kC1yDxICZ6QB3Tx5xw/DFQ5geisGsbwEcPzWORbqCZC
	2UdT0y3NEq65Z7h1WKcA4T8O7Ix6HkVxswTfbIbRww6oU+yQJSpr5A9i9MV5q2l4WMc5DrenkAf
	9rS39nSuoSgqcekYvb6Kvc70zwj1IM7s3wAuuQt/N3P6saYBvRTFy690WGDVejBGkR+mnuXBjDD
	8l2lHqwvM9a2Vh14cQR/mjtIDQ/terI4QzFcSnHmU0lNV8vyBM4M22Kkvz7q7teUZgytodKjqaY
	/D4KLXSXr3HJX9TQzg0/hcesQTi4lQVSE2NbiMk36xrwWlNsXIVO4vKxGdztB24Q+ZOiBrMQrcK
	8eHZiDAJMSPtfhNtt7h1Slrtyg6i8yyKq4+w6+ffMifPsNDNZl9L+NWmMMSuoltr8Ne1GlCbFcY
	QPaNW6ZApA8IJcZs3th0rX+lVzNDHya9megX43VRP46Wgxm37w6CiRl1YG9wMztvO41kQjZSGlP
	mqqfaH1+82ntgk=
X-Received: by 2002:a05:600c:a30d:b0:488:c2aa:6a39 with SMTP id 5b1f17b1804b1-488d6889a78mr12896065e9.24.1775801046392;
        Thu, 09 Apr 2026 23:04:06 -0700 (PDT)
Message-ID: <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
Date: Fri, 10 Apr 2026 08:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775801046-0FD420B1-A499A03F/0/0
X-purgate-type: clean
X-purgate-size: 1071
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 05E4A3D284C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 19:37, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code".
> 
> In certain build configurations,

Can you give an example where ...

> the function 'altp2m_vcpu_idx()' is defined
> as an inline function that contains the 'BUG()' macro. This resulted in a
> violation because the 'BUG()' macro makes the function non-returning.
> 
> To ensure compliance with MISRA C Rule 2.1, this patch removes the inline
> function implementation and its BUG()-based unreachable code. It is replaced
> with an unconditional function declaration for 'altp2m_vcpu_idx()'.

... a declaration is needed? The sole non-x86 reference I see is from
common/monitor.c, and the sole relevant Kconfig option I can spot is
VM_EVENT. When that's off, the file won't be built at all.

Further, BUG() and a few more constructs have a dedicated deviation
already in place. I don't mind a useless function to be shrunk (or, as
per above, perhaps even dropped), but the justification then needs to
be different.

Jan

