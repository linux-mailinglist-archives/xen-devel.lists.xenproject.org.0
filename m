Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vt5nEBbxH2rXsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:17:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634266360F9
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=bV+5i7eo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325936.1591300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhiG-0000Xn-6x; Wed, 03 Jun 2026 09:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325936.1591300; Wed, 03 Jun 2026 09:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhiG-0000Vu-3b; Wed, 03 Jun 2026 09:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1325936;
 Wed, 03 Jun 2026 09:16:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUhiE-0000Vo-Hx
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:16:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhiD-00EoRs-MH
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:16:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff0f1-e002-0a2a0a5209dd-0a2a4507c45c-0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:16:33 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff0f1-229c-0a2a45070019-d155dd2cd47f-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:16:33 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so2957784f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:16:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b616fdffsm41017795e9.8.2026.06.03.02.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:16:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1780478193; x=1781082993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l5A5dWXPWx0wsUcpAXdOIZsI9B5Z+1y2G6lKVCliRc8=;
        b=bV+5i7eoYn4QexPozCOwrTGA65P6r8JPkgAlJvXbghPHdbf+JwPEg4K5kMadBjzOHG
         P9NoRaL5WGUXrAA84d1ogZddOi80cTrGAlYyUneQOCRRaF2q9uEgnTPDLoD59GM26l32
         ULmLN0iWF8Pj1k2JH8Sz00o/gcgLs0fQbMUxCk5n6n30j5wFI8KgfJRcQYJxsyJJN/Tq
         qJ0/9IitHJSFgSIIHJbc6LfDSSWG61h7PPBphTD8FW2r+ScocV8zm2lCkjirDBpnIcet
         WN5pUW9f0q4STHtS9Z+WeA75bSjJh9mzmc1lxrE4EjrdlR6rgtr1sPH99ydvIldZMJ+7
         oQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478193; x=1781082993;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5A5dWXPWx0wsUcpAXdOIZsI9B5Z+1y2G6lKVCliRc8=;
        b=YLuFciu6Fnff/UhWBOzHcXKCteAzzZ/4u9ech/YL9cPt/3RPCtYLKfqk9gHQvWFnq1
         bHFJbiSAxashK89xKmBFO94W3LWH9/vXTOezK+98YDQfEoPRfBnwSN53g/COtd8S2ZYE
         LgR2JqHjw744et/Ew0Cmbxw4C51OOG9Je/bYth+32tOeKOdqYqE+J5YPvOZLXQ9KEuAq
         kABQdkZ9b1fkm8QVSdK4Fz/qHSMqMNJxfzDYgWDaIs2kfKyxnCb7LfBeJjAObxJlPvTr
         qo/Bfr/8cMi9nbvZrn59k4WHJE5xv3INBAd3RotLpBwtru/+oCLMo6/yaa12KXp13A1X
         ssXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QO15c8d76XG8UqOyqmOWcE07lOU/KpXE03tU3I27HI0XrCNpnBr8WnE+DEywgQBq0UUTabTKeqfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy462E3WFknzX58id+6t6GnZxMChtq3nX8b7Cm5io6dYQ4SyB2
	34NRWBabjUcuAoaB1GXHAnjuTJTezGXcvZCSFsCddwvv8u8ulrkk8ztW/s37tuAmrg==
X-Gm-Gg: Acq92OEa1HctJ81YSjC9o4eR+w1aBAwHT2aCJE8wGfPYMw7dWs47/7+H45HGgGn6N2w
	wO6KzcpxOsP8cyyyM0XDbABXKnjujHqwt2qqt783bgHwB9B13puTIH6B/zZkNgkWP6lHwdDSrYu
	ALOCxogU/L9Spn655zGjmtEmT/2SFXQSgtSrSvAz+3ZHDMiMZJU7tCX851YU6UCqBupFbswJZdz
	k6VKXurXp0Q7sMyVxoXyJwEi1v1EjVenqMh+X7X0hwTiXdrzU4+fvmDcjTGmrL1sPkpBGZDN7Y8
	OPJm7eFYYYR6UdD8NiZZtEQ0YvmjLHkwAeTfkP1iqM7BvwittBs7qEgZ3YcmX7XUx84MFZKauvx
	9DHL4J5+fbad4ViF036hLtlFSHvZ8tNYD9+ZQLicK0N/dxglPowIrJ3X4rGns7P31DJZHK8CJsA
	3Ak3qClnIcBJzDnRAYt4Sda/A35nLzXTSmyyMgA/Ghf9mb8dQr0HzPuIpfRQUcfW9ShedvhaD6z
	zMeiNB7q2nO2LGIiaNya4REWaS+pMoyEJrE
X-Received: by 2002:a05:600c:8b84:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-490b5e835b7mr42489205e9.6.1780478193001;
        Wed, 03 Jun 2026 02:16:33 -0700 (PDT)
Message-ID: <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
Date: Wed, 3 Jun 2026 11:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780478193-0B979C48-46AD10C6/0/0
X-purgate-type: clean
X-purgate-size: 1878
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 634266360F9

On 03.06.2026 10:53, Andrew Cooper wrote:
> Switch to using the system liblz4.
> 
> This brings libxenguest's lz4 decompression in line all the others, rather
> than using the unsafe decompressor from Xen (itself a port of Linux's unsafe
> decompressor).

As stated in 84f04d8f0dbf ("libxc: add LZ4 decompression support"), there was
no shared library available at the time (and on the SLES versions I worked
with). Later a shared library appeared, but the -devel package still wasn't
there. On my main dev system (intentionally a relatively old SLES version) I
therefore wouldn't be able to build/test LZ4 anymore if we went this route.
(FTAOD this isn't an outright objection, as the goal of the series is
certainly good. It is mainly a data point to consider.)

Jan

> Andrew Cooper (2):
>   tools/configure: Detect the presence of liblz4
>   tools/libs/guest: Use the system liblz4 in the bzimage loader
> 
>  automation/build/debian/13-arm64v8.dockerfile |   1 +
>  automation/build/debian/13-x86_64.dockerfile  |   1 +
>  tools/configure                               |  79 ++++++++++
>  tools/configure.ac                            |   4 +
>  tools/libs/guest/Makefile.common              |   2 +-
>  tools/libs/guest/xg_dom_bzimageloader.c       | 128 +++++++++++++++-
>  tools/libs/guest/xg_dom_decompress.h          |   6 -
>  tools/libs/guest/xg_dom_decompress_lz4.c      | 143 ------------------
>  tools/libs/guest/xg_dom_decompress_unsafe.h   |   2 +
>  .../libs/guest/xg_dom_decompress_unsafe_lz4.c |  39 +++++
>  10 files changed, 254 insertions(+), 151 deletions(-)
>  delete mode 100644 tools/libs/guest/xg_dom_decompress.h
>  delete mode 100644 tools/libs/guest/xg_dom_decompress_lz4.c
>  create mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
> 
> 
> base-commit: c069c014f21fd1f5925d8c30c18adb4f26381475


