Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCy/GG0qk2kI2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:32:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C913B144B36
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234210.1537521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrzd7-0007cK-AK; Mon, 16 Feb 2026 14:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234210.1537521; Mon, 16 Feb 2026 14:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrzd7-0007ZT-73; Mon, 16 Feb 2026 14:31:17 +0000
Received: by outflank-mailman (input) for mailman id 1234210;
 Mon, 16 Feb 2026 14:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrzd5-0007ZN-Pa
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 14:31:15 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e7d491a-0b44-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 15:31:02 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso19924675e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 06:31:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm489216705e9.0.2026.02.16.06.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 06:31:01 -0800 (PST)
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
X-Inumbo-ID: 1e7d491a-0b44-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771252262; x=1771857062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SmECOfBNCknFO/g/+7clCBEnY5bZBANfpMp/NQZWgLw=;
        b=BlxuT9fW4nfJbf1+JotFbqjMe1PPDmWInjWMaogI7nkYuqEAR6V4YanjlISiS801/O
         PVYOfDo4kDK/0j78FbsUJlD4JjIdj1PTv7bP8SrOKVDw6qvovkAoSOBwUxX4l/izYDx8
         GEghfyQ2ngV5zIQ3koS1fPdFl5QqCMNsif+xCJNvnwJLNNYZ9AoMVKCiMy0x+7+n51qF
         E2Fgx8TbiLH6xPmHLxodriVRA8V0xVignizS4uC7IKlnN57wiB7EfHGgI3YHfqUZqetz
         tbMZcwBttpYCk2B6f18xQDC6gPK06ixadMPsMfBc/JAcMTQ55xTGpxA1jS8z2JcSMn6l
         veTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771252262; x=1771857062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmECOfBNCknFO/g/+7clCBEnY5bZBANfpMp/NQZWgLw=;
        b=cAteCTAeefAtO6ty7P8CaqQAhgJ147F5Rw5hfv7/hVcxsCfGWOxcXFiVrx2BdGr3Ec
         MLz+JNovmU68RiC2ZCB2EUM+pJftrEqQ1Sw+wqLfI8Sa3/tK90YgEqzUu+0FvZceBtaH
         c1TGjJlnMuq75s75JcJJX5UvwSqPUN4EbZCZ5wYKO3UuFp/kziOuQDndw68jjQB3KMR5
         zfABh+dsdyfC8LY+BYF/9Gx4knymFPyG3pc7uah2s+ysMntw3TcIPLQv85DZp9DGEPBm
         +UhlZfyc38nHCPgkorlbaE/CGsLFB3GFGUXwbELnYH11dAGQsusDow4sK8yBNtFp1HzC
         2/QA==
X-Forwarded-Encrypted: i=1; AJvYcCUt1CQ3olTey/bxluFmU9bWWuGDdAitMyw2LT7HG5ydu9BsPCjzK3hq9lflAclxNxrOFk+cufvhNNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx74retsthhuk5Mm2C+pKNsFMhWjuJ5LtfmrjCYwwrgeXQhMSdg
	uBOt2vfy/9mgueOusT4FhfoedfjqhjeOuWFyG4B6kPCK2ihm4r+0jGlOrBnMJaQhjg==
X-Gm-Gg: AZuq6aL/AO+vo6GBTtqgIaGyqKVEzqkSKVVirDb2OjHed2YZQHZpKd4SwKsrGk31goC
	qIKRMLk2fOQywnPqooO55zs+eALb6zNS7MFtmXH1tTeNtEEfzAUJqYc9wU/YMH91r87tviZ9T3q
	/fpvgjEAVuvxsScgX97iJbC8utfINy854Mj71sl3zQzkh7x/NmTLoB//uW0g40sU0km+tLn9KaC
	teorCbpPnARpgR0U+9VVIFn9DQkrKgaEPDkHpW3NJh69J/r3DBV30hoUT4soUmX2n1EPVYMtW6d
	oQBKXUpfUdiC666Bn8AQcohVUIgk4rHI9ZarC3vNM6XjDPsuS1OeBOLEnnFsaGp4cU3+WIcSCkB
	DGFSiV/5yqgMJd9Ak3/r9wrwdRQ6DFgUrYJFN8lfUFjU4tbyMFB5Dx0dizTi4HpVoi/cZs0bswK
	wP0KNPbp8mWKsCH4+4uxpJcz+wmqO4hdRYUUvuUkdcA5yBDifO1N3GYX62ye7+PPFn4GZEDerVD
	m8/uAVqIj3KTfg=
X-Received: by 2002:a05:600c:8711:b0:483:fbe:23dd with SMTP id 5b1f17b1804b1-48378d9579fmr151078255e9.12.1771252261666;
        Mon, 16 Feb 2026 06:31:01 -0800 (PST)
Message-ID: <bcc6fa48-412b-49c8-8941-d54d9ade2989@suse.com>
Date: Mon, 16 Feb 2026 15:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/ioreq: Add missing put_page_alloc_ref(page)
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260216134334.3510048-1-julian.vetter@vates.tech>
 <20260216134334.3510048-2-julian.vetter@vates.tech>
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
In-Reply-To: <20260216134334.3510048-2-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C913B144B36
X-Rspamd-Action: no action

On 16.02.2026 14:43, Julian Vetter wrote:
> The page was allocated with MEMF_no_refcount. The MEMF_no_refcount flag
> means the page is allocated without a regular reference, but it still
> has the allocation reference. If get_page_and_type() fails, we still
> need to release the allocation reference. Otherwise the page would leak.
> domain_crash() doesn't free individual pages; it just marks the domain
> for destruction. The domain teardown will eventually free domain heap
> pages, but only those it can find. A page with a dangling alloc ref
> would prevent the page from being fully freed during domain cleanup.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Yes, it would be nice if this could be done, but have you read the big
comment in put_page_alloc_ref()? We have no choice here, ...

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -287,6 +287,7 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>           * The domain can't possibly know about this page yet, so failure
>           * here is a clear indication of something fishy going on.
>           */
> +        put_page_alloc_ref(page);
>          domain_crash(s->emulator);
>          return -ENODATA;
>      }

... we need to leak the page. (Perhaps the comment could have done with
saying so explicitly.) Hence why the domain is being crashed, so the
leak cannot easily accumulate. Otherwise simply returning an error here
would be quite fine.

Jan

