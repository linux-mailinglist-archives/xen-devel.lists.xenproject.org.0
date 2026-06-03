Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xFLCCvrKH2rtpwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:34:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C64634B00
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:34:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YHTkRGoa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325737.1591061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfBB-0007MX-NA; Wed, 03 Jun 2026 06:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325737.1591061; Wed, 03 Jun 2026 06:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfBB-0007Jj-KC; Wed, 03 Jun 2026 06:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1325737;
 Wed, 03 Jun 2026 06:34:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUfBA-0007Jd-Gm
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:34:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUfB9-00AcCl-N3
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:34:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fcae6-2eae-0a2a0a5409dd-0a2a450bad8a-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:34:15 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fcae7-212f-0a2a450b0019-d1558031b153-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:34:15 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso4648315e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:34:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b63d810dsm36685055e9.9.2026.06.02.23.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 23:34:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1780468455; x=1781073255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zTd9Zsv71ns+G6hKTnB87XtpFXwSE7du73xfJdyH2fY=;
        b=YHTkRGoa+o12crZDd1OQSJmb8uIpVjpw34fTDlTjP3BACBWeTbbEZyqOUwCvRUk5gs
         JBVYLZKwAgbVbnBKFnuUXg6haQ79/YX/vo0+liFrem3CsJQqpb6n57c44J8iZ8XBwHu+
         lpl4o8VnaDnnjTzcHIoPGXa0Hh9S4UYuEMN/8Jnrun9EOSU8boC7I7cxkdkLknJvBKrn
         rlKlO0FTUbnRIRZK8GjqB7XzO6C1WuNG0MWNCo9By+dsiBf6ATe7WZrLUQ7cVO81Jgax
         6Qj+kIk6N94aU/Bfv96f/m9z85gLLMWuHPmrW7Qu/z5MVBWzACxHNd8wZoPkUwxoN/7+
         e10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780468455; x=1781073255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTd9Zsv71ns+G6hKTnB87XtpFXwSE7du73xfJdyH2fY=;
        b=grzaF9m67jIo5CfQpKGC2E3/srblrmxxc/rLJnsxxe78uZAiiyALRUBI5vVTPZYDrA
         azUsEci4A12oeJ4/kefdQEBiY8vyxr/FYYm+gRY4jiDsMxV/scQVhzb4bN/ZcxBVcx9q
         B5ZVo/+K00WdrBedkxdI6jcWlPhXyvB2skeDr1D3xPVwIVsazJnBJx4QIL8z5MNyfTdu
         em+qSgUAcTi7PNnI4coelq7fg6bAp3mNLFFHop1dNNnI/9edZ2GmNxGMgCSevKCarwvL
         tqQ9++AStE+1Ivy0mvjQrhi1MBLFi5zutMcMzu7vg7q46gtfDJ9g9d53kztTXkr6uu17
         U4vg==
X-Forwarded-Encrypted: i=1; AFNElJ/mr1TT0lreDaByT79u4qL4GNmj8fAGTKFsJy4238P6PWbhMgowLTEiNfBrq0qOrPNts+B4hfJ5CPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydUb5t65/jT6nRD4EGIgQ6pxOMhxyfir83FmOHd+543cH/2BFS
	Fp1TF3HgVSovuRdioBriOPjnZlfoQVNBdkTs2u/otX/32vRghIun50+2IPyaL5TYAQ==
X-Gm-Gg: Acq92OFjRm1/MnAcrtxmoKq2N9s+EUL22F9pOgDUSB72BZHsWxe3JsURK29DoMvzQTU
	OHpdJv7LJFUVfQ6hZpvKY2cE9SPyC6O0Lkn22E2qEgrPKdIVeKM5+e5TTha64xQT+PTOQ2ddkoQ
	RknQTTuntaBkveTDJaCKQHsnCeQOZdi8k9mYHt2b6zrDLXV6dU9BWHBji3GtlZuIlXo2JIp7uah
	vASwTGCSF0+qY7Z/9yaU2EOU/5rtAEtFsVrKVhU5KGnWDKTcdD6ZPwP/9uytWuDikKjZjV5xoZ4
	Y8Q9yINauyeTWFQjuMLDCNyp6clRQEv8R6Ge++IrtvXeIlyZ3XIba5Im9+6zV8GQaOP8uZCY+9A
	QhL/nOYMXcJeuO3cG0MhpfBNmLFVO8wNIuucmUie9a12NkbYicTyamYiuPG/BBuj5SLj3oR+Dky
	wdwCYWINl6NHTLwwE4qnHT11c002X7/MLI7FsPH7DzjtbrZ2lXxW3nUVVYwqlgBSgqOx3jLdnFr
	4lSETIAcOkha1Sb7cpBUCtPPA==
X-Received: by 2002:a05:600c:8b23:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490b5e893admr29644945e9.8.1780468455087;
        Tue, 02 Jun 2026 23:34:15 -0700 (PDT)
Message-ID: <76091f90-b0a1-419f-9261-83b83c939c8b@suse.com>
Date: Wed, 3 Jun 2026 08:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/shadow: Deviate multi.h as being included
 multiple times
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
 <20260602174629.2649448-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260602174629.2649448-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780468455-12B70F3B-A6D3782F/0/0
X-purgate-type: clean
X-purgate-size: 563
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82C64634B00

On 02.06.2026 19:46, Andrew Cooper wrote:
> Introduce a range to search for the devation marker.

This wants updating in light of the range, for whatever reason, not working
(as you mention below).

> This resolves a MISRA D4.10 violation.

Is "resolve" really the right term here? If you don't want to repeat "deviate",
maybe "address"? (Yet as always: You're the native speaker, so you'll know
best.)

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With the commit message adjusted:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

