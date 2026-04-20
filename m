Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNmqL3Es5mliswEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:38:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B81D42C19C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285955.1567098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEopZ-0000sc-7E; Mon, 20 Apr 2026 13:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285955.1567098; Mon, 20 Apr 2026 13:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEopZ-0000qD-4S; Mon, 20 Apr 2026 13:38:29 +0000
Received: by outflank-mailman (input) for mailman id 1285955;
 Mon, 20 Apr 2026 13:38:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEopX-0000q7-L7
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:38:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEopX-00DYNK-1h
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:38:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e62c50-5cb7-0a2a0a5109dd-0a2a4502a32e-12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:38:26 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e62c52-af86-0a2a45020019-d155dd30dc98-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:38:26 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43fde5b81a1so2247468f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 06:38:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm32582720f8f.37.2026.04.20.06.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 06:38:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1776692306; x=1777297106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wTvE3zsOSz8T+uOBTZ/XAGfk/EzcI8LfSRnRscNugZU=;
        b=Y/ywFqJpKPk8svUzm7XNCmXabE5xjYUIB1aEikLpPJ20KHCuoKf2X7cnOMkYjYtl74
         L39evY+GDB2ezWW+cBPuqHhC8zJFb3l2V0g12Ag9LDW4dvEm2ipceD3BENOPZSBeNO0Z
         +HoQ0JX4a6YgYTZaMKkOJFRmXKUDDGUMIRd76Q3C8LFXi5+39wjfihJufABZ6kKniVtZ
         HhzYYOjYNUVcfr56cv0Siy2LQwo+U/2/3zDdWpyXV3CVtk4LZY33PfHrulu87B3g/xkJ
         RN57pOYXg/yefdlLRLS9jb1/XfCkRCgcca3gbtHm+Weg0g7cBJR1wkNfPGNhB0sX8ovA
         z+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776692306; x=1777297106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTvE3zsOSz8T+uOBTZ/XAGfk/EzcI8LfSRnRscNugZU=;
        b=eZht0TukdqzTds7OlspOFmmlSgSa8jV9VfKzrbKZzgmw34hyVWRAWTGmaSQNAn5YwZ
         uEcVjFd/Q83WmHQtyddDwbHaRsaW9TMk6rFEiVMHDeOAlDoXij5kZrTzHwbbag8iDrnK
         aLcXC6DxkcIDAPZQsFFk/Ch8dyxzLmAd/gSqfP6gDBQG18HLNxng50mjEaAck+zwdWdW
         L0ZjARFFwd+qQRlOLpur0U1E5SgcXst+tjpWI9FSIAxC2jyPqBFcO7drIg5MDQBug5SY
         7FYIjbs5+m9pBqQd61PA7nmyN21Et/ZKGb/APG4FggJ9ihW5HSEqGY4FIDaE6a37JHHz
         b/aw==
X-Forwarded-Encrypted: i=1; AFNElJ9N+YtXBPONPA5uNKLTocwAvVXTlMxaY0ixPCzmTizlUnzNz+sDEoP7wXu+D89Hj6oE1kAixQa8T70=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya196cX3vtcg4rX2Fd2HaYzJk5tvW+0XyWoXmsISRECMnbbgVS
	5sTYhvlKZy8zNgAchVo8AunrqJwNBsamHXr5BiRFXEAkXTHlT/Mg4T1bgSMLBlXwXA==
X-Gm-Gg: AeBDieuwp2kKHXmDhWMA3ce3oZyU3WlfzvkF0biFNV+TJuJMJdDa80FCy7ZrNviBqeb
	Vu3WLbvYigoSRYDtDlsO5jGLJONY0VFypHdLjGZOQu0M4NRutkljCnXSFSL1nMyhU3l1TJx2ohk
	LXZtVmdgzMkECwf7Ry9s3HZ0QsZ9RyU0TRH/B+WBiUlPtxPzWo2gfSSFhyEWUiFTMH/8qoS+Lvt
	k7MMhWF1RWwUilo5Zq0YxOxcioKn4gcZKy52mYYXom1Hix/dvB4y+ojE/ixDlvJ1an7zvTwEYPR
	68bMOxIWsutfk3ySYdjsbMoJRuu75Cfcg3xId4AB1ckutSKK8FyAxAU2Z7+FUv0m+t1hUWYH9l8
	giyiYtQQ/MsEYj0Hbqom3k4574AvJvoL/prvslQlz5H0NDQVhHTvNZGR3TKz5pUQus02hwCLP93
	mEUj4VRgw5UoYuqUh906mEsnRW1arHbzIP+7h3kzOpmciyK5YF+EvyJXyzAuCB9gqa7kPBnlgHk
	Z+t4pSZJZek8fmRqYLW7rb9fw==
X-Received: by 2002:a05:6000:2312:b0:43e:aa88:f1a6 with SMTP id ffacd0b85a97d-43fe3e12c58mr21097403f8f.45.1776692306181;
        Mon, 20 Apr 2026 06:38:26 -0700 (PDT)
Message-ID: <692cc080-ac6b-442d-b694-8e50e482856a@suse.com>
Date: Mon, 20 Apr 2026 15:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <20260420093820.825969-4-julian.vetter@vates.tech>
 <cd9b42bf-5399-471e-9b86-dcf13eaad9e6@vates.tech>
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
In-Reply-To: <cd9b42bf-5399-471e-9b86-dcf13eaad9e6@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776692306-8A4C5161-DC114E90/0/0
X-purgate-type: clean
X-purgate-size: 802
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2B81D42C19C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 14:49, Teddy Astie wrote:
> Is there anything that would prevent the use of alloc_domheap_pages() to 
> allocate a configuous set of pages at once; and vmap_contig() to map it 
> in one go.
> That also prevents the ioreq pages from being scattered around.
> 
> We would lose a few pages by aligning the size into a order, but that 
> probably better than the alternatives.
> 
> That way, we would only have to keep the base gfn (or first page_info) 
> and size of the allocation, and don't have to use a array of mfn nor 
> have to reverse the vmap to track it.

Well, higher-order allocations can easily fail when there's ample memory
available. Hence why a goal ought to be to avoid such allocations at
runtime. That's why we (now) have vmalloc() and xvmalloc().

Jan

