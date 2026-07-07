Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LulaHk+7TGpcowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:39:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5B719358
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:39:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="bPwM/QNy";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356089.1610745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1L5-000440-7g; Tue, 07 Jul 2026 08:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356089.1610745; Tue, 07 Jul 2026 08:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1L5-00042c-4c; Tue, 07 Jul 2026 08:39:35 +0000
Received: by outflank-mailman (input) for mailman id 1356089;
 Tue, 07 Jul 2026 08:39:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh1L3-00042U-Jj
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:39:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1L3-003r2V-0J
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:39:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4cbb3a-5cb7-0a2a0a5109dd-0a2a4509e5ae-32
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:39:32 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4cbb44-97e6-0a2a45090019-d1558035cd42-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:39:32 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493c55d5c7aso37218985e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 01:39:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0f294b3sm33370175e9.3.2026.07.07.01.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 01:39:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1783413572; x=1784018372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ebJEHPpWkUq2HKLR8WguIFlefqpa9MHDn8M8BiymsU0=;
        b=bPwM/QNy6PEWJYZh3NKD0sWwTTk3pjcjxTAwwykWzDhXvqwGAa+D3fCUkbeJ0+BhwL
         7pFwuYwUfon5AyTQkNUdUI8j0Bkqtz4MDnRiTIO7GwjrnEhd4vMGmEQ8RqkTEOQlwuJI
         6900r5eeqxY0d1a+YD+H/LLNLGCR/9e8kwledUbt5Kocntec4aNj0xjSAQxLLWVPx/G9
         btxNCwYEnRIMSZ8fdueiRN1uCLenzIJu0rXl1Mosyez0EmUu3p5FlN4pJ5K+2Sr+0tX8
         FD+8R2EpYCOUol2UyrNsHPpN2NSyoNvDrp1eVpk/Uw5VpikKn0q5SyR4R5+y9xQnCFL9
         iXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413572; x=1784018372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebJEHPpWkUq2HKLR8WguIFlefqpa9MHDn8M8BiymsU0=;
        b=efSkwuwxU8lhe1iG5L2cTFwaHf5UipTb4anYY7fjcctgE8Qczb9JOs5VgOUooL5lS5
         gy56IsNAaxb5JraV7BdDj8oA5F7Y5QD4GyUzl96YDbiTa9OTkWhPVSMhY7SUOZF6b5oP
         C6SsdzKWZadOqZ1pygjgt0UfhcNPgxRr4ggJG+9BvWziaIEjDhX7E9xKi9fh9xQhyYFr
         BIA22r1HFP2p6/+R1MA/nCfjMSvnTMFIphWpBQOik56FdKp7dnfCxBnq0i+O38jwhz1Z
         B/TvpOm00VQQIQLU6by+tNIK5olP6jVIx8ATYbMz/175al3jSQPc6fkkVNaE5nafR3d7
         EsSw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2thY4rb4+Rr57LZZBmqtQbTCht2eb1Ncjs6Bu7dQ0ryg+qqHqHlAimbzISJdHyFW578YiikNUC9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqG25PF2XU01aYjAXDREp/+RLUQ1ubuQWWI9vOhWyLiAsDLgvA
	100zxgZecpEapRSKOJ2UBPSEpytQYo+ykrcoB00MnN/XlaDb4o4DENDRkIKNE8Y7tQ==
X-Gm-Gg: AfdE7cl5tAIL6c9QGxyyvkRFJ/bPvRF633ZgBVL4UKk1IemfI+H0r/4sQQBZrUJBcMX
	PrneSFSTze+AMcP4d+DMvi+C8h5mR+4sEkUmSApGiZ2ap6+CG9IYhDUlvtgKVHXmN9/QS21iAwp
	9T8SB/A19U3AqC2r4Kt2v/P7caXRMQJ2kdeWWMI16ys2fRBdmcGUXDPxyoXLajTkSmcRHY46BQR
	QcQuzAETzQp1eeNxYNPVwvssojm9lzzMXZRMX3ZS1Ov01r9TCTNSpd5JC6CpVjcgZq7W9YQcRfA
	Dtr3UdkU9N4y7nI1XFYa8vPjfExAlUvpqCFI80RzisXd4sbPmssY/5Fn6mRDpF7JUud5rMfaanJ
	UWACCYzAN4l2L1m/w9Mc+En5B7znrnNNFxsWI0OjP9A9O5JBHSlgRfKJdhaZX8YXAvYcw80HoM5
	2AjSLraf2rQ6JH4QOMegBV6tzWz4snpkcjvYTgfMKhbYrhi0sKeiZo/2F8QqU3+JWbdgS8y9TiB
	nTqKxT70GycLXI=
X-Received: by 2002:a05:600c:3f0b:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-493e1ff0070mr17324415e9.26.1783413572371;
        Tue, 07 Jul 2026 01:39:32 -0700 (PDT)
Message-ID: <eac4528a-f9b3-476e-adea-63d317ef30fe@suse.com>
Date: Tue, 7 Jul 2026 10:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] stubdom: remove grub-pv
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20260707083459.226297-1-jgross@suse.com>
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
In-Reply-To: <20260707083459.226297-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783413572-46D3C986-170597CF/0/0
X-purgate-type: clean
X-purgate-size: 763
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:samuel.thibault@ens-lyon.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7B5B719358

On 07.07.2026 10:34, Juergen Gross wrote:
> The grub-pv stubdoms (32- and 64-bit) are disabled by default since
> several years now.
> 
> Remove them in order to enable removing quite some more code from Xen.
> In case someone is really depending on grub-pv, they can easily take it
> from an older Xen build, as there is no Xen version dependency in
> grub-pv (a version built 3 years ago has been tested to still work
> with current 4.23 staging Xen).

What guarantees this to remain this way, when ...

> Juergen Gross (5):
>   stubdom: remove support for grub-pv
>   stubdom: remove support for building in 32-bit mode
>   stubdom: remove building of libxenguest and libxenctrl

... there was this dependency on (unstable) libraries?

Jan

