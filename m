Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IOOjD/MINGrNLgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:04:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049856A118C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:04:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Ob8B4y9B;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341376.1601858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEHg-0008Os-0K; Thu, 18 Jun 2026 15:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341376.1601858; Thu, 18 Jun 2026 15:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEHf-0008Mx-TS; Thu, 18 Jun 2026 15:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1341376;
 Thu, 18 Jun 2026 15:03:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waEHe-0008Mr-CX
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 15:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEHd-004UTZ-PQ
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 17:03:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3408c8-bab6-0a2a0a5309dd-0a2a4503c672-46
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:03:57 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3408dd-a3da-0a2a45030019-d155da29e49b-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:03:57 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-befee9e5ef7so134474466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 08:03:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4619a041986sm39201158f8f.23.2026.06.18.08.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 08:03:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1781795037; x=1782399837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MBJiCiqt9fmIlUGG5epJm6L5+xzYynZ9zDpox4hJBRE=;
        b=Ob8B4y9BWvkLOa4tqS4PnOHYeq5dc+sPibdhm2UytGP/kIclazV2SHgRGI2EGuWnGI
         rMoAW/XbETEYOTRQNKJ/rh1aq22Db5wabbJKC5d32KjpJh4NXB1Kt5mAL7qN87RpCdIS
         XimwnlMpn2Y67HSah3iPOq2B/J98aXNAv0M/q0lKSz0G/JK2jR/DaQ9P4OjoN3saGEay
         PixXt4+Irx0hMF29BAjh6wgzc/nolifQsiJhmKlrQMwsghEy1wTu6ZanEjReTffnrxKC
         0/Mh1pfyetzuk7b11ZBuefqIjNUap/0UjL41bPaiw2r+g69SvsFu2x8WXISkcQhFLVgV
         hK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795037; x=1782399837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBJiCiqt9fmIlUGG5epJm6L5+xzYynZ9zDpox4hJBRE=;
        b=JDwFOf5cnSePq8+WqCuv3Nz8lnAo+Qbbq5CusA98tobzVMj6lqNln3fYI1NWDLKR/Q
         auu2nSkGi9dljRy+yp9oNxac+RV5imXrZKvphw8I+NkZ0XzDQhasDrD68fDIkuoipmEX
         kNsDVPWdQeXEVa5DgWdN3osPR4o24LyZAI8OoeepyZCvJ+EWevCQW612G38NjtY+NJdk
         5DOLhbdeYX8IQhlX2ve3QvDGtLsktrWrnfi4pJR+KpW+Wt6e5wXAlvrOKd7ATZzLNNqk
         yqkQyC6HJPVgz27PyFkd2fIGzQA6BWiDeYPTRvJcPk50HgSvXQwnfA4wow7XHjid2nNP
         mlnw==
X-Forwarded-Encrypted: i=1; AFNElJ9J3e9LEJUVcb3HP+UZ32mS6eJychOutN+49RlF8g/S4yukYkdQnQL2ZHLkTx9cFJSTdfWpYwvTDnQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMDhzWwBUplUAdDwm6HHeOVP3J0nLf2GCavAeF2xHtqt/Nyrkp
	q3KfRBvpoW7EO6lrIBlIJr5RTUR3AUdj6OoyAH3QHujKSdq09A/JjKRHXoOVuHdsIQ==
X-Gm-Gg: AfdE7ck2Cc3N3fLGeA4d+W+2MUf7/OzWiV/4X3t8MYaqz7d3DNTWlhC2av6OPcQ0g2n
	um32GPJaI8qhfurnhVwFKcQkCjiADJepHQ03YqLRICQZNfgwF76dKRnAbggYs1d9kci2B3NQGBR
	72lWeEKw3a5B5Z5xYIBw8q3UYZYu+atYnMEkQ/BikO/NIWuVwDr7Z3vXdT8PFC5EJLdtK9PNNcR
	bqJZw+NCsR7GGeiGRdaEMKqmTSg/xkO9FbRptN/oh3geRklwL5Z93PGLo+1KKt1+hMH8F6ednZj
	ZUFBgN7xhWqMdUBML50Arva6WcveCMOx/xWpm9fYTf1NR1cXutgvNUiyvgNkJVZ1+Os6Rs+DR++
	8F+ETllo2DG00SKTu/WLBAfFAP9XRgmdDdUecn1zSHuMd3I9AcZgqpHC+U3KlcHA/8wcfrj3M66
	8MBOaSb94j//qEbsgQSdYkHz35yO3rhR27rum/HPfCWiqOf3yGE7LB+Z5M7cshyM4Q87ha4wkBn
	x3g
X-Received: by 2002:a17:907:3d11:b0:bec:436f:1857 with SMTP id a640c23a62f3a-c05a1f462c9mr594419266b.7.1781795037067;
        Thu, 18 Jun 2026 08:03:57 -0700 (PDT)
Message-ID: <3d32d75b-acf2-4ece-bc9f-56cf13eb7a16@suse.com>
Date: Thu, 18 Jun 2026 17:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 15/15] docs: Document support for PCI segment in
 dbgp and comN parameter
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794561.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@vates.tech>
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
In-Reply-To: <1781794561.8631fc262581453bbf619ec5b2062170.19edb3b5d89000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781795037-673DCD84-FE32871D/0/0
X-purgate-type: clean
X-purgate-size: 563
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
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 049856A118C

On 18.06.2026 16:50, Teddy Astie wrote:
> Now that we accept full PCI SBDF (with segments), update the documentation
> accordingly.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> In principle, it's correct, but I don't think ECAM is usable
> at the moment EHCI dbgp is initialized, which would prevent
> the device from being probed correctly if it's not on segment 0.

Right, that depends on what the ACPI MCFG table exposes. If you really want
to allow segment numbers here, the caveat needs mentioning in the updated
doc.

Jan

