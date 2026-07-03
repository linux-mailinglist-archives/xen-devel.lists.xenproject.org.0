Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MFVjMHFPR2q9VwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 07:58:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FE16FEE2C
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 07:58:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UiVBW9qo;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1352825.1609151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfWtT-00017Z-UU; Fri, 03 Jul 2026 05:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352825.1609151; Fri, 03 Jul 2026 05:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfWtT-00014s-NX; Fri, 03 Jul 2026 05:56:55 +0000
Received: by outflank-mailman (input) for mailman id 1352825;
 Fri, 03 Jul 2026 05:56:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfWtS-00014m-QH
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 05:56:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfWtR-00FyMx-O3
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 07:56:53 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a474f0f-2eae-0a2a0a5409dd-0a2a450393c0-26
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 07:56:53 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a474f25-ec1a-0a2a45030019-d1558036edef-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 07:56:53 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493b61b52b6so806025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 22:56:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm15441046f8f.13.2026.07.02.22.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 22:56:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1783058213; x=1783663013; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IemmhEklWXsMozzSGD05TXsrjHUQafyMg5AZqO6fdiA=;
        b=UiVBW9qo5C0JYh6EN07ebuD0fkO2qfN9MT1RvW+1vecQl++BwFzW5iWE4g2Ygn2ozI
         CcEBHVntNRIRn2HjGB4khZ6MDcL6BcVlBm5UflFOytZjCNdPd+dVbykinWAg9GCddX3I
         QZCkh8D1cDKbltYO6kMRcQ19mOKm+zD5LEOUKBcGlIaMfsQkB+TleMxBCwkz5mtRCH2a
         LIVgLqA8q8h7HameBY5pTdo53Ytu9kiXLERqyyVYRXNX5sNaUFTRxCOlrwGzMsXcUZ6z
         fvgLP6NWIGhiKMZdTE+o9w9Jo3pNZ80rFP5l9nnJVhAwertRAYfgV3k5fw0FYZxvJ2SP
         6HVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058213; x=1783663013;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IemmhEklWXsMozzSGD05TXsrjHUQafyMg5AZqO6fdiA=;
        b=QvZky4efeqgsznVahAsjjrS+ewmGMC/X5HUfWCT0RLt4Axqo3AdqwHq103WzBCsyEd
         83qmWnPQ2kiA3OOqGrfdZ06ulGM+eFhtz2p/LdFYaNEGY3iUohu/cSVxs6P2sBXJkXFv
         saSexx/91TJ0GxinSiwr62NphHQbnan2R7BjaZDUc8EAuHhFa+J4JJHuO7kHz5YIARfq
         V2LYqekYtHaszvLLiibvOgIUfBrQ05JoqEGKx2SbnuWhEQ55G2ED1bqiDyHjdsw1k7ts
         jl13R2rCi/LrEub5s3uthdWB/PbC19VaerYzfmk9QPoLEWQQbvMyCd1MlEZSueMcfnM/
         TgYA==
X-Forwarded-Encrypted: i=1; AFNElJ8FVtQ52kyiXGnM7nQaNv6XvZ9/qwGjevLLZ9s3kqzAmsrBPWZ6GTRkaVYS58ndyBLjTqFruqqP3Rc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz07nzxY5YSouhqr7qhOJ+QC9Ul4FjBzRLmSUxcwLHay/6yja0P
	QWZXyqa+Hyr017pcoqTvXCKiiSN11nOf5g7w/ggB2HBw6BOTF/dFXYiUMbFspjygyw==
X-Gm-Gg: AfdE7cm+S83/HKMvWsOL+BXF2wz5Vk6710IWHdBFQfCATfW2g/lnksDINd1Gj4B/ZG7
	cKMLFe4HRSSInHQ9boWBoC7MkjYPOnMWARaAQy38WnX5woE8IFVeUfhlnYnOViEr6THo869ZYUS
	nuDlc8TM7vJql6PMRWgBbyb5IATVFYOzF2X/wyAB9NWoliZfiF8pslMhj28mqHN3y7rlWwTI6ba
	w/5BfO/ytMmEZvGVJwdpbexybeDpYPCtHoCbcTFsLxUrcZB068DMNSpS/lL7SRRo0/ngLi2fISE
	MkZrPBB+NknkSD3v9kOEAgflzU2AlOfqVrRClbfzFbKQJDfMPxRx8UGKmZ0CvQbtbkN0Qe2G/3+
	DkHE37sD8j0V/Ftrqxo8Xftt4lOLm4g6HjVtLV4vpHxzruwPs3UMkV1f4JJm7872vUAt7avgmLx
	HqIxir22KWXCcjimQJcndzx3IbSzklaNzbkdP4gJO4e6HXAFz9pO2JVuckcuh5/N/dKz13bewLb
	gno
X-Received: by 2002:a05:600c:4e4c:b0:492:465c:56f6 with SMTP id 5b1f17b1804b1-493c3cd54f8mr125599585e9.10.1783058212811;
        Thu, 02 Jul 2026 22:56:52 -0700 (PDT)
Message-ID: <cccb749a-a092-40cd-8acf-a1b7c8d5ae6f@suse.com>
Date: Fri, 3 Jul 2026 07:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] argo: fall back maintainership into the rest
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20260702163845.36453-1-roger.pau@citrix.com>
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
In-Reply-To: <20260702163845.36453-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1783058213-B55BC5D1-F7D8F105/0/0
X-purgate-type: clean
X-purgate-size: 433
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:xen-devel@lists.xenproject.org,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,xen.org,kernel.org,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29FE16FEE2C

On 02.07.2026 18:38, Roger Pau Monne wrote:
> Due to unresponsiveness of the current maintainer.  In particular, the
> committers have been trying to get in touch with Christopher for 2 weeks to
> have a chat about disputes around recent commits and pending changes to the
> ARGO component without getting any response.
> 
> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


