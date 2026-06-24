Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fqFKFePXO2pHeAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:13:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10746BE797
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:13:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EXdw2zQT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344921.1603931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNPR-0003xS-1E; Wed, 24 Jun 2026 13:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344921.1603931; Wed, 24 Jun 2026 13:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNPQ-0003v5-UX; Wed, 24 Jun 2026 13:12:52 +0000
Received: by outflank-mailman (input) for mailman id 1344921;
 Wed, 24 Jun 2026 13:12:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcNPQ-0003uy-9z
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:12:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcNPP-000NxJ-MZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:12:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd7cc-5cb7-0a2a0a5109dd-0a2a450b883a-30
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:12:51 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd7d3-ac48-0a2a450b0019-d1558032b1aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:12:51 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso9831105e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 06:12:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9371sm6881900f8f.21.2026.06.24.06.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:12:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1782306771; x=1782911571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D290iCblh7YNU8g2/RcQq56rbMtF1Go5W+L/3TQn6yM=;
        b=EXdw2zQT2etAKJ56950ZP43b0tA87PIQse96B6kPcJo3iMjzASs8WRAhQECd+zMmBC
         rP6qMsG/uhzs1XHCfmOupr1c4Wqe3o9vpEm9KvKSUs43WhA1W0HhLZv4mW4KiyTJQF/7
         pDe3r+p+X38Gwyf6S4N0RXTN/13obzN1RIR/uoSOPtaJ22Z5SwERCqu007d4ZrAqwTPr
         G38+uMSa/6y3X/SDC8Lv7CZobUC0fkti9ozmvP5spgyzRJ5s4EwUctHLbVuOBEP1mAlK
         nsOjgpDM81M1nzHTEX8GNRMKrbGWehk4/VY1+XoOKg8Epf+v5ZsfDIuBKYI8S0mObvNr
         tgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306771; x=1782911571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D290iCblh7YNU8g2/RcQq56rbMtF1Go5W+L/3TQn6yM=;
        b=It47w7vtqc0sq59x27wyw/Ln8SlbZmSWTDuBaGMUqPSj+9IvMFXWUYI9HgvLbj5tAp
         8v5PlKtTRO2nUGT+vKdLSLHIospjgBIXuehwyFhnQISH8vpZQNIifcHdifHGOBLAYn1B
         +X7GDNrkZbSoEHZVYZq9itXOpG/+cYsa9VhE9xoptLsyA79OOBeyJql+sZjiHHnme9fG
         NtcJCdk0IqodkAkdHzBUn1FzMK1pERtyTwCP22cOpIBh9C/AZOnKj9l1H6yPv08Eq+Vc
         4OdJEwwRJ0ZOC7kZlMkp2L5K3isp5KR33ZUYukBCHYyetrN9S/vhyDkLu2U12R4FSThU
         UheA==
X-Gm-Message-State: AOJu0YyLqgj+hJd/8BY9P5+bnQvWjEL0UfwkxvM9i4sA9swHW0T5/WZC
	RGDq8rLLnmreymdWSFyCqjU9A/RCxFQlDsdOUhPioHTIzKv281joNAwwGz99OjqlgKUsgZLr+63
	lTwp7gg==
X-Gm-Gg: AfdE7cl5jAkY5Qo9JHwfwJSBbbBcPM2GAQjFyEsm1Rsyv3UR3oaQi4p7CIuGH/pDhJR
	kfUyq8jd09lW7hpATyPRaSzy5NXRrBooBgCwN/3sMAC8K4N+K0pw6rC//Ya56sb2bJ/PmiPMg7+
	D0r8S3yYW0oPuAftMyRxX5RS0+S5EE7DuKaNBVA6gS8H6QUL/M7m75blGzHkrev3sm2Rth/XClY
	ErK43SkNE9L3g0gnM/iFUbAkoc3OZw+xrTTVkrH8Yml8Ra0v2JsBhe6EOOCF820h9wiZzBwphJg
	CcR1n3zMCQihPvRsQZFtCJmDsk4u09ghOYMB0BgBaBDY9o/s/NH/OlnmWqNcUGP/MYTGRch8523
	jM0vAvsdi8440XbZKxJbZtWMj1dYZBIigEtR8dFTYOoYgOQVlTxYj2fv5n+yXDisK2bAqFZ9EsT
	2hR8Kl6BbrE/YuyFnmAn5QTOuSHLO6f2kbKLATWbGmorA0MBr85i6XZIJ7pt2SblOozJ+n6C02v
	Tdx
X-Received: by 2002:a05:600c:c490:b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-4924908f4bfmr302321095e9.15.1782306770919;
        Wed, 24 Jun 2026 06:12:50 -0700 (PDT)
Message-ID: <0f71d767-16a7-4518-a692-ea9b8d482e3d@suse.com>
Date: Wed, 24 Jun 2026 15:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a3bce99e5494_767442bc3001679a440720@prd-scan-dashboard-0.mail>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
In-Reply-To: <6a3bce99e5494_767442bc3001679a440720@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782306771-A653B220-5DAE36D7/0/0
X-purgate-type: clean
X-purgate-size: 1402
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime,coverity.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B10746BE797

On 24.06.2026 14:33, scan-admin@coverity.com wrote:
> ** CID 1695360:       Integer handling issues  (BAD_SHIFT)
> /xen/common/numa.c: 483           in extract_lsb_from_nodes()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1695360:         Integer handling issues  (BAD_SHIFT)
> /xen/common/numa.c: 483             in extract_lsb_from_nodes()
> 477     
> 478         if ( nodes_used <= 1 )
> 479             i = min(PADDR_BITS, BITS_PER_LONG - 1);
> 480         else
> 481             i = find_first_bit(&bitfield, sizeof(unsigned long) * 8);
> 482     
>>>>     CID 1695360:         Integer handling issues  (BAD_SHIFT)
>>>>     In expression "memtop - 1UL >> i", right shifting by more than 63 bits has undefined behavior.  The shift amount, "i", is 64.
> 483         memnodemapsize = ((memtop - 1) >> i) + 1;
> 484     
> 485         return i;
> 486     }

Without contextual knowledge I think the complaint is reasonable. However,
for nodes_used to be greater than 1, we will need to have ORed spdx into
bitfield on an iteration later than the 1st one. Yet only on the 1st
iteration can spdx be 0 (or, if nodes[] wasn't sorted, only on one of the
at least two involved iterations). Hence bitfield isn't going to be 0, and
thus find_first_bit() is going to return a value lower than BITS_PER_LONG.

Jan

