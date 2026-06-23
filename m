Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EzjLMtaXOmonBAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:27:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F26B7DED
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 16:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Se3Xab6U;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344331.1603424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc25u-0001fp-4N; Tue, 23 Jun 2026 14:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344331.1603424; Tue, 23 Jun 2026 14:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc25u-0001ds-0m; Tue, 23 Jun 2026 14:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1344331;
 Tue, 23 Jun 2026 14:27:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc25s-0001dm-P2
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 14:27:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc25r-00C8Tc-IF
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:27:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a97ba-e002-0a2a0a5209dd-0a2a4509a19c-28
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:27:15 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a97c3-4999-0a2a45090019-d155802bd554-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:27:15 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so45154135e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 07:27:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666c57b95sm32734943f8f.30.2026.06.23.07.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 07:27:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1782224835; x=1782829635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2sAGrp+LXSAivQ32YkBC9pjGwmNLE41t3KzN+CoRxOo=;
        b=Se3Xab6UQLz5qDNXnXkyWTnv1YVTMipuIEEwgEcB3wvGIQyiEwo1GNYg2Ahw4ZjMor
         fy6PQCZmO9WxHP3BoEACMTFP88RyskcrXxdOqjAcQsijQgtMh3KeeoyH3LN+Fxkyig31
         T73wturX808Un7CQZ9JvcjoRLZZwBMuIlbauHbirHGROXeR+EgspfErI0ZTjcXHQZB+u
         x3qZnGrKhxYQl7zHmzd5KL+Aj8zAMrImRR4sK2lvj95/OOMcnCR5dPfhQmCrBmX3Ox5u
         sAQT+CbhnZ6Sxd3/ZWl6XXYOiXh5CK1081bhF+ZabkN4z+A33lDBpeLbhOR4NmvGujUo
         xxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224835; x=1782829635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sAGrp+LXSAivQ32YkBC9pjGwmNLE41t3KzN+CoRxOo=;
        b=qZqsDCJ3V+RGBS/yBwQfw1WGRrsO1ePDeDB2HNuz8bZUDsTArZGopTY6tojc4ZGQoL
         NrIIBinZTjqiRSgjT4Z7Wj6XMSiAfHJiZK0INhX5ufG+Dzb607z70cNtzhnRQDGd+R7G
         HPnTc6jezxuLsr/6sO6ub0awh1D7DkJppACDWunTrYIHwvvDXfx5ryakTaGg1L414Uws
         YwCFtRSsg9NfxkevnDmxFijGitERIGOjPQ1VI4X67Xml7oFJClpbxj1iumTgovvUei2J
         IkKClr7FhkzmQY8zMrBWI109tPm6+Z1avsZPN3Mgp/Na6CXrdGBitxvXuQ8w+CccEOmh
         muXg==
X-Forwarded-Encrypted: i=1; AFNElJ9TgDArbHN7b8biaF8I9K/X8MDW69La3zXnSS4bi33D/TROAS2eiR9fZRsIEaKoCEk2hYtFlq79GSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZFw2hyugJUk8aaOodzd6TuR8UtXn+aC1g9HwuiKgTVwBsiN2N
	uTJYeKxaqFbdtwpGnICKJDrx0n8x0VNkWJ3yB++cq4MdW24+UbLASBwsj3sayNWa6A==
X-Gm-Gg: AfdE7cnwlB4buuaMlS65bpkJHtXiXzzC8JbZn+aB4cJhTqgWWKuGi3qRi5IV9sGFk2G
	v2l288SUfrAhmJGwMbUrBYlUy66NOs4DOjmKeFOYRUcWtIZU5adka8TrL5qQIJDrjuir8Xg9Erx
	aNRS4tvhcl/lzBl9cTDVs3Y4vSVU1ZjFU4LP+w6U6HBLZwTx9ZYitfQhmhZ9x8bcyATs9DGWzkn
	Sm/sraZfEdj6j7J+Fc2id1KzLKF0pno9EJKXo/6JMz4SVqhQvJyyEF7pGsuWBPSpcPoPxrn0lJ9
	PLvP6J2ISIWHBZWS/hrXnQPAXotGAudBlsC/tQiJadFnkLx6FPGWVQT29eVnFs0VDeJZSE5NKRE
	Ga1KQKRLcNKQV+xbIP3RiJY7uxClN1BNfDHbY0fPNXDPOE7l+D/Lxz6z429Oi7C9oXw+Wk30F/T
	NJh17EDQJYudMwmYVANmpeIBrFLWZVz4PQG30HsGPi1rWUigsii9M8dOHCr4HrBphtU8d/ChS7C
	Cr3
X-Received: by 2002:a05:600c:8a09:20b0:492:53e8:3bc1 with SMTP id 5b1f17b1804b1-4925b3ad749mr38538105e9.17.1782224834620;
        Tue, 23 Jun 2026 07:27:14 -0700 (PDT)
Message-ID: <cdf9f154-896d-4faa-8c76-ca15cf5e706e@suse.com>
Date: Tue, 23 Jun 2026 16:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] char/ns16550: bound execution time of
 ns16550_interrupt()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260623103145.76383-1-roger.pau@citrix.com>
 <06c8caab-4722-4b02-991f-bdc4a4ac0ea6@suse.com>
 <ajqVNtt02XMUGk-X@macbook.local>
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
In-Reply-To: <ajqVNtt02XMUGk-X@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782224835-F55FD744-6B8EE877/0/0
X-purgate-type: clean
X-purgate-size: 788
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E2F26B7DED

On 23.06.2026 16:16, Roger Pau Monné wrote:
> On Tue, Jun 23, 2026 at 03:44:06PM +0200, Jan Beulich wrote:
>> On 23.06.2026 12:31, Roger Pau Monne wrote:
>>> +    if ( uart->force_polling )
>>> +        return;
>>
>> As the IRQ was disabled, is this even possible? I.e. should this be some
>> kind of assertion or alike?
> 
> Hm, I wasn't setting IRQ_DISABLED before, and hence needed this guard.
> But now with IRQ_DISABLED being set in ->status do_IRQ() should filter
> any stray interrupts.  I will attempt to add an ASSERT_UNREACHABLE()
> here.

Simply ASSERT(!uart->force_polling) should do here? It is not wrong to
run the code below in release builds in such an event. If we kept getting
interrupts (perhaps at a high frequency) we'd be in trouble anyway.

Jan

