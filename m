Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAmDMId+w2m6rAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:19:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358333201D1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261711.1554522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HaR-0003nD-8a; Wed, 25 Mar 2026 06:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261711.1554522; Wed, 25 Mar 2026 06:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HaR-0003kl-5u; Wed, 25 Mar 2026 06:19:27 +0000
Received: by outflank-mailman (input) for mailman id 1261711;
 Wed, 25 Mar 2026 06:19:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5HaP-0003jp-TE
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 06:19:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5HaN-00BGic-GR
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 07:19:25 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c37e65-5cb7-0a2a0a5109dd-0a2a4505962a-20
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:19:25 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c37e6c-5aeb-0a2a45050019-d1558033cdb4-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:19:24 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so38164485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 23:19:24 -0700 (PDT)
Received: from ?IPV6:2003:ca:b744:7ebf:2977:bdbf:7f63:e225?
 (p200300cab7447ebf2977bdbf7f63e225.dip0.t-ipconnect.de.
 [2003:ca:b744:7ebf:2977:bdbf:7f63:e225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48711764509sm104512755e9.13.2026.03.24.23.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 23:19:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1774419564; x=1775024364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mNo7+tkDrQm2r/ihneTJZEYXIu63vD+e4rWhWD8j3Pg=;
        b=HV6zCoLhKcrxsnqpgHQ0DlKLZAjXwjyWLKR0i4GOg3+Tqg3GLdoha4vsiJYBwMXzUH
         HAqIbUlivQqSuzGOV6h/8GZ++C4T8/tJ3NtZ9OOMtQfivfbNITEKZLdIcw2d4epl+Loa
         xWnSZ1z+OEwL+FStPxIHqaLu3TSDpMUi3RFBOJ0u2CsMNm5aE8xkQlTEAd6r6/sNOc63
         pvjhrfs3RTV5NWcG4qTKHXZx7D8ORPvz775V6CQxJ8pviwdj5uOwBkGzk+y4ppDdAQ9k
         7nSKMiVxyWdDL/aWslwoP8G7vjIb7E7jGPAxG7cab2of0PBnGENwrW+FiFF0CQ0WpJ0i
         +s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774419564; x=1775024364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNo7+tkDrQm2r/ihneTJZEYXIu63vD+e4rWhWD8j3Pg=;
        b=FcBukMTuI6+skLk+YllBbC+nAKIkLRsWNt847mt4HZnSpVz0EAKrKA9SEyHAPsV/N/
         4CQXKUoajwVc1M/m/1lh0dKrPByjMwyPoRtLslgs+XGaMbP0EDffvj4VjmTZW0xwi8A7
         Ge1ZLV8B1ioSvl0I8Bq7lsIT8uME3Paz3rfLL7cJ3MfTmV9mCJPwPDDDBorPoIvaQh1L
         qJTLOXIs0T/ZaKbv4ztcIJ18iD1LqLUmBiupmUzkI14HnH1i5uElRWr5G1HJaVngSj0a
         b51IZmfC3aB8o2MK7+4gaEbnXqfwU2YYiEfGKhwMNieC/CcHJcgm2v0e7iE+s7YH/87R
         yYgA==
X-Forwarded-Encrypted: i=1; AJvYcCVAbbpWi6sU26ePlSNI/nAXKnv3P2Dwm/EChPSXMZ40gzXWX08HfiIW2aBA+MMANVCwnLC73KHGITs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFGC40MjJVx1vWaRbAQFW+xDrgEU9GyNDJ8rYST8IQ0oa3kStB
	LMMRtuT5r+tT4b3rKwYb7Aye/StJnm5AEkCiOGLia41aGJvoCTdDR5Csw1UHbVnzoQ==
X-Gm-Gg: ATEYQzwbuQ1tbahZ2G2A+DLz596QxvpckfkC/b492A57SYiHAeO2TBHqAS/SRaCMcpc
	68FNj03fD3NCrucX4MhQs3olyRTEkzFuewPiF0sFSFvfiNKGgcKUkkag1dNTmWuT1sh9J524oQe
	yGubpiCnYqhyOXugVnsC5TVsGr7JsFXkq4SSua7I/ziwdpPap3KShe2K4hYlcAOygyCdES/ArUg
	gA29uE+iU/6ROQLdRPhJG4nGAjplnJm6glAISSaZcGowcY22difXuVx25QoBx8N7pkpR/r99lyW
	jg7NhD6YdDlvJxiToTT/UrHUB9FWDIJ9beehwnUvuRSl+eowtAd8L0glSNPfodyLhW1Z31x7vQe
	JA7HzRT0jYePUiSVjRfg0uwe/CxvVxGy3h5v6MNW9xgZGqOaQ9/EGtCcW4Hzi/Nz5Gsd7HykT24
	83d5HqLtxHjI/vQuU4wTzDiCH/7H/MbdDs40a5PpBflX//nKyyt5xcpMAdiFsSCZ5CbhWghVQhe
	mMf7f/sAIeB5NeXOvsVaNGQ8mKQdxc20yzXjsla7GchI7M5oj9VSGuxNA0R
X-Received: by 2002:a05:600c:3b22:b0:485:35a4:939c with SMTP id 5b1f17b1804b1-4871608dca6mr28945105e9.29.1774419564274;
        Tue, 24 Mar 2026 23:19:24 -0700 (PDT)
Message-ID: <845ddb3d-9493-4a01-96d8-3c9386a64e50@suse.com>
Date: Wed, 25 Mar 2026 07:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arinc653: clear entire .dom_handle[] for Dom0 slots
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3cde1263-d5fd-4bb0-a0ce-c5bf5d735a20@suse.com>
 <435e3eb6-76c8-4ac3-8838-ccb7174a13e7@amd.com>
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
In-Reply-To: <435e3eb6-76c8-4ac3-8838-ccb7174a13e7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1774419564-23A8F488-0EAFE639/0/0
X-purgate-type: clean
X-purgate-size: 1482
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
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 358333201D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 18:10, Stewart Hildebrand wrote:
> On 3/24/26 11:54, Jan Beulich wrote:
>> When that code still lived in a653sched_init(), it was redundant with the
>> earlier memset() / xzalloc(). Once moved, the full structure field needs
>> setting, as dom_handle_cmp() uses memcmp().
> 
> The whole a653sched_priv_t *sched_priv is still allocated in a653sched_init()
> with xzalloc(), so it's still redundant post-move.

No, because arinc653_sched_set() may have "polluted" the entries in the
meantime.

> With that said, the code is
> only setting the first element (of an already-zeroed array), which is suspicious
> and misleading. What we really should be doing here is copy unit->domain->handle
> to sched_priv->schedule[entry].dom_handle.

I can switch to doing that, but aiui for Dom0 that's still going to be
all zeroes. The difference will become relevant when switching to use
of is_control_domain() in the surrounding if().

>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> There being no "else" to the if(), what about other Dom0 vCPU-s?
> 
> The condition is checking minor frame entries (i.e. available slots in the
> schedule). Once those are exhausted, Dom0 units beyond
> ARINC653_MAX_DOMAINS_PER_SCHEDULE would never be scheduled.

And hence the system overall would likely misbehave, without any halfway
clear indication in the log as to why?

Jan

