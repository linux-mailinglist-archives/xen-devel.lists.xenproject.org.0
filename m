Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGdwFb/TAWryjwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:03:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3850E83C
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306146.1578211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQIU-0002l4-Fn; Mon, 11 May 2026 13:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306146.1578211; Mon, 11 May 2026 13:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQIU-0002iW-D4; Mon, 11 May 2026 13:03:46 +0000
Received: by outflank-mailman (input) for mailman id 1306146;
 Mon, 11 May 2026 13:03:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMQIS-0002iO-BG
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:03:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQIR-006Tjw-ON
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:03:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01d3aa-bab6-0a2a0a5309dd-0a2a450aa54c-12
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:03:43 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01d3af-56b3-0a2a450a0019-d155dd33b85a-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:03:43 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d76dd4ee8so3939332f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 06:03:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6fffba5fsm177478885e9.2.2026.05.11.06.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 06:03:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1778504623; x=1779109423; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wUoJK4XDhRgnZtEgQTpPwZ92ka9XV+2KFMeknnPSOcc=;
        b=CpmlHsV4lNctvibB7crtljEca5nV04TevawPeb2pKL/T0d7ZXTQAYPR6qAazpJ6tfu
         4INXP6wim6dIbNDhZvgTXq4j45TAJCr4aUl+2cGqp4a5ueX7L16tcpjEEaodoak1hRL7
         mCNwjcNKJz6YfgG4Pliyeal3ng1RpnpKiigKAagkM4kAXbPZKdDTTXt8Ug6oGPevQEk9
         pYIRdycdy2HuuRbqPX5pznACk0BVdvFDox1vk6lnPLrc59HQdvvuQ/tBAdAYytmDxUxB
         gYEkowWbkiD1aSXYqQG4qijiRflhbY1ei6NSHFy4e00y8weJocFw4HcL/ddJkJfOUXJK
         CVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504623; x=1779109423;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wUoJK4XDhRgnZtEgQTpPwZ92ka9XV+2KFMeknnPSOcc=;
        b=NXr2QSlS8yJcEx8hNSbBvuJGLgwALswD8UiegouPqSgg+yqbFayEUtSI2aRrfHmi3j
         BmPRsfRIkA8IvTU/bKUDJtfBY1WnqhRrQBEfwavFXembbXqv8hfRWzhLKyy3RkEnudcP
         9gmssQ9PrqBAp0bJrMrdserdi2ZhAOaJ43pAFEPKA2dibLTcN+xwGKi8iptBGwL06Wty
         DsiSadwMQzZx4PvYxGvmH+bpWQED52yQrfDi339itsg9+T2PDWF/WRAV8vYzWNM+/QQV
         hyCDDl3rK/mIRw274PZj0TmKKQYS5qcNRIo3xVPRTyRV31p3hu5Ekj5SenxiT/ZU4zo2
         Lxug==
X-Gm-Message-State: AOJu0Yy3m/DhTlmQE1GxY3iFk/ttL5tFuVaRr/kHzPPdP0+pNCY4UCXY
	+FjkjPe1s0usjNpCSfv6K9rYWpPhZwuF5nJBHejSEBBojLEfnSn+4RoyhHhbgsvocH1NiTpgqXZ
	KFtg=
X-Gm-Gg: Acq92OFODQWIxDr/5TcS+nW5Tv8pxKr3+HkDQkxSkGAy3EWTKZKJRHTrUfIRcAl85GM
	c3/2UtJ5Oe+Dqmu843gx/ZkemStWJ21SzVWiYXWr0C/72HHvfeYWsnLeTBVCA/iqL4AboLrxrDb
	ZuE8eCobeWzHmIxo9KUoJgmg9SzXfdGUDGCxtxLYHRqoQ//0CXfZNbMaQNJVlUDkQZxStObOvMH
	DIon4EL2NbSWf1LZ47OEsqcEaK8rxnG2pPpx0K4q32DATU1AfBLvz4RjNS52grw8fH8nEM3VjEP
	b8aBgIoBxDKQyvUoD4xcQy18RpYsBS170ttoN9Hsna7kY1poTmyMirTgFjPpXrlDaQIlVvLleAO
	ZjZHFXYJkVJXunCSkRc0WRZXddFVv8eIWMWNc2uS+doKs+dmo58kD+eIQJRbvL1pNgQh75xSXbf
	t9fpEkDuI+X73PUQCg21FeXfPgKdewgs8hazyONxEHiAvqtYZ6TWcyB9JHGhyLE8gwhbMtkFVTR
	pw/HhdqeaElviPnVGwAJI+ZYg==
X-Received: by 2002:a05:600c:3507:b0:489:1b0c:8b43 with SMTP id 5b1f17b1804b1-48e706ad0e5mr151676895e9.1.1778504623040;
        Mon, 11 May 2026 06:03:43 -0700 (PDT)
Message-ID: <ced1547a-f1cd-42c8-a050-51430adc829b@suse.com>
Date: Mon, 11 May 2026 15:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] CI: re-work / extend artifacts collection
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
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
X-purgate-ID: tlsNG-4011c0/1778504623-7C67F8B7-96893E8B/0/0
X-purgate-type: clean
X-purgate-size: 212
X-Rspamd-Queue-Id: EED3850E83C
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,gitlab.com:url];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

1: re-work Xen artifacts collection
2: collect certain intermediate files as artifacts

Pipeline (PPC intentionally broken):
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2515787945

Jan

