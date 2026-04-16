Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKMmFg+c4GnokAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:21:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1EA40B76C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283076.1565372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHyR-0007qI-N4; Thu, 16 Apr 2026 08:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283076.1565372; Thu, 16 Apr 2026 08:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHyR-0007nb-Jr; Thu, 16 Apr 2026 08:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1283076;
 Thu, 16 Apr 2026 08:21:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDHyQ-0007nT-OQ
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:21:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHyQ-008q4O-1e
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:21:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09bf5-5cb7-0a2a0a5109dd-0a2a450cbb94-14
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:21:17 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09bfd-62f1-0a2a450c0019-d1558034d048-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:21:17 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so71944765e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 01:21:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f58163cbsm34521655e9.1.2026.04.16.01.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 01:21:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1776327677; x=1776932477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=204vXJ5Mf5lwfgk2mPSushMQVKP5YvRBh3FzXyP/C3k=;
        b=DNTGDIj3sVxzCQ60SYSz9vC+AuUQ9mRJ78hM9lOLvGJ80RGtpgB0VBBvRBd/bBFC9i
         GbCsVBf18lymlQO/6aM3ojd9DkLZBgWt7ZpDPe9Z7kKhwjWGicwmOzKeuPu1guBzK3DZ
         V+4z7i5J24J0t4mbJiIUDaNQtF5Bydtj84nkataFnh3Ll1UDvdQzFT4SJO6krlbnDjQN
         VFKht/jbgk8ut/hhX5sfNrnMIgz+i6MvtCiiJkHLFIKloOKZh9Y8dZakWawggonSSP0D
         zKyNYKmX5jyWIe66iXS+AJ6u9XDHMSc0x+0Rn/qTuWiqL2sB9QGE3ebpcKAGiCQzb4GB
         pOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327677; x=1776932477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=204vXJ5Mf5lwfgk2mPSushMQVKP5YvRBh3FzXyP/C3k=;
        b=Q9GVwogPejqgR3PVd75ingK+yKTK23scepJ5LfHbZUOcyHYd6HnCS31W1Cu1r2qhLw
         Abg+0dXkMljNw78u8vM+aZ94Pg9iddUM4PhPn2ket4Aq12AuRXmHhnUjTyvO/ZV9DlWJ
         abi8w8Cu3CszBK876y2dih9nFEUgkwS1oDAWKdK7zNQRb0Jcib1NzRNUiqRecC9/BtCD
         hAAJZ3WzltaDdFsNs+QDKUPH8QxOf7A/jlUROEmVmpToY/ZJC7V2ppEjH/sZ6NDuNQea
         fdvgN1kaSrx4J6FNukXqMHF9nx+xFekLybGUaJLq1PPdgydortcpDM9/N8Zhwdej3h1Q
         qoHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OyepxgogJIJwxEgI/eg8VQhtttCXRo+E1OPPuQggTj/N2qsHPVU0h+PS0Kw5rpXhhLUVwRTJ4Arw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2LEd2wvu63kG5v+EvmKsNgHQk3fTa9ArOv9q/oqrK1G9mYijT
	oGJ80z93TtSxFVu8W21WenQnoU8/lWyme0Hs1a9P6U3KAaUZknfZIGdhX33hG63b+A==
X-Gm-Gg: AeBDieu87mNzXsDizACwPmOiYF9oN5aCSt6Bv4nAnU3f6Eoac1IkdduA4/K/H91TC0P
	VrOhSHKidkfx/vD9tXAKfu4mm518AdKqlCS6Z3d6K3gsefvxO478dJtCFAIjMErXs2PkZ8C1kC7
	N/I9uiW3cLd61zLuUoLSFLPTcnz+orKeBwA81m2cYOpmGusFxiebqvXxh6gvnLQfxAU3uQTOA2P
	9VnJmOtmc1JwYJNZd/VZZfeGDWQcTabvWrmBflDCRi3yCGTet3PGH4J74Gr1ERIAQoUE5MAgfwy
	G/RGDLUzQ/lZLnipQtdSannzuB3cJNlHzS+PFV+GEC7X+l5EBIrHt+Ogrg37JQjfK2yKFiuc50I
	9TTvcJdh62g8xNdjQsax/Y5gC2ROuSt87CMZRqB3F3rziz0/xDBPozLiENrwuz/21g104Jhj2kT
	7aekw5J69f49d/27SecKQdwv6HbfduAZ595XohcwSkvGi1HA2vI9Jt2Kt7BBp0/ap/3dwVp13Y8
	gbacuX3DwZSIteVqoCyadRtRw==
X-Received: by 2002:a05:600c:8b6d:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-488d688209dmr319229815e9.25.1776327676870;
        Thu, 16 Apr 2026 01:21:16 -0700 (PDT)
Message-ID: <4f9e6615-b9ab-4c2e-9345-100e73eebbb3@suse.com>
Date: Thu, 16 Apr 2026 10:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] vtd: Drop dead check for permissions in lookup_page
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
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
In-Reply-To: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776327677-F5A00CF5-A136CAC7/0/0
X-purgate-type: clean
X-purgate-size: 402
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
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2B1EA40B76C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 12:09, Teddy Astie wrote:
> `val` comes from `addr_to_dma_page_maddr()` which is a pagetable
> paddr and doesn't leak the PTE flags in it.

Did you read the comment ahead of the function, in particular the part about
the caller passing 0 for "target"?

> Rather than returning entries without any permissions, assume they
> are always r/w.

This wouldn't be any better.

Jan

