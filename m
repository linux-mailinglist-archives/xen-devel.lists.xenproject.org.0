Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BYw2Ny/SHmrvVQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:53:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212F62E2DB
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:53:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=D+Bs2gn7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324948.1590458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUObp-000075-Ov; Tue, 02 Jun 2026 12:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324948.1590458; Tue, 02 Jun 2026 12:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUObp-0008WE-Ly; Tue, 02 Jun 2026 12:52:41 +0000
Received: by outflank-mailman (input) for mailman id 1324948;
 Tue, 02 Jun 2026 12:52:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUObo-0008W8-1g
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:52:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUObn-003JTE-Eb
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:52:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed20e-bab6-0a2a0a5309dd-0a2a45039774-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:52:39 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed216-672d-0a2a45030019-d155802bc4e9-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:52:39 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso8081345e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:52:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c08f1bdsm159293185e9.1.2026.06.02.05.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:52:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1780404758; x=1781009558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SXb3soQXuUetc/QFa0kwySw+TqRN+wSeDeHU/l5U/gA=;
        b=D+Bs2gn7wPIgtcivNbA2OPoabpR969jQ+0quu73rNaBe0jlNhBmQ/aOIyfHzge47Da
         YCxsxEjdFubWQW5Xi21iRONi36MBAtAL+NLoln4KbWmFSpOo8ky1PmxlZcKjcb3A30YI
         0ErNCDXbvSFt454lX0R554awlRT8FahUsCoAltFFCTsdPvpqJCXZc1D84KULRjGZrTZH
         sjkv8tYtOCSxoHmXyo0+YdqkF8i7B0MaM5yuGhrM5iGUsG4Ed5y9ioS94uSnp3CQC1Es
         VdiyVWRst4ZAua0JVTaWYrvgD8Dz9hHhZmvc4+UvAjRHYsm2ywt5i85ukZiy5t8Hmiw3
         YbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404758; x=1781009558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXb3soQXuUetc/QFa0kwySw+TqRN+wSeDeHU/l5U/gA=;
        b=L8ZtxIFsflKl6CNbnI/TlnhbE3IxmRwdltqpskv43RkNkXL+Gh7WYTIxVP66kduxyu
         4h6VQm7eIP6jo3UXb/sNnHynLH2kcHcwBNle1YcQrp/NIGaKScCDLCwykQfbk1WUPzJF
         DigxjG16zDab1gY0+ydD0sM7DVhDJ5Zxcbeqn/ZFm6srIV3Ub2YUciPH1j/LnumeST4b
         nNKMJ83EM0j6ftIGFYo9G4EWjYOOQ3qmR4hMpWD3/onaqqkT4qzP7HVA1s4OQrDxnKbl
         v+D88CYncFahXNYs7QkEAOJkw7D51OXNbQ9GxUkSjJH+azf9fnteFPCw4JXnLsdRTZwN
         afzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wWTbs0hl6GdiVqjKGD5KZb6TydcPddh0L1kWGcEqGOXp9r5LEVQzJcuckiHvyxjiReEngMgwOhiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwVxd3Y85fhIATvVziLGcfXLlx5+77ohSwjOjnNsgf/jk0r9k+
	Bt6B72ob95TsdHJRVzlSZpmi4W+V7D5I13G9PF7e6lx/HXhPTsQzyp8Rb/7Ef4G55g==
X-Gm-Gg: Acq92OGLuU6GtobTpQsDg/n926kAZTrAxMGk0lbTXFfOqmJ+QpqZttBAvdjD0JcxRTW
	SeFreZOoYkOW5Cqwqmg2CulOiFdrrGd0HKStRA6ykn2Jee9bgnyBH2O1s1SfREgqSmQiF30NL1Z
	2789qxd31ctDvFQZUrDYxR74VM6ojB5qABN0q8Yw/1xmG/zccKvM2cR4eHkQum/NP1cUVpsnxu7
	VexBurgICVxyvFKXdG3a9Of/Ll0zQsizkKMq8Ykdclmordf94OLwSxc7ZZNDa41TGdsBjFegPYt
	Gybeh+Qd1BgbCIFXxlVd/6SHe2wfXUAjf5X/5+Hqd8V5oBuGU/Ex2OqFTbhXlAhhXRB3TRCeqVE
	NYpH+SMRTUfjngj6uifUXoff++0GtjP2KbG+gukTFjKJH8fA/Fy0Uv885+rTHF4n53OmIzep+KE
	ZTyMjltp5YjJpRvoh11enux7uMazdpJJxprHQplUKC6Hxtdlhmq/mx3dgHw830HWyCKz0xg2dJ7
	Ep+ry6hPg5RMO8EDd2YXMkC675CuU6tFoFK
X-Received: by 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490a2938f7cmr205584175e9.25.1780404758536;
        Tue, 02 Jun 2026 05:52:38 -0700 (PDT)
Message-ID: <372ecd28-16f3-4857-bc69-546291e0f1d7@suse.com>
Date: Tue, 2 Jun 2026 14:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/mm: Static memory: Widen assign_pages(nr) to
 unsigned long
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
 <06bbdf043e4be80bfc4f13926e8e02b42358f3da.1780058608.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <06bbdf043e4be80bfc4f13926e8e02b42358f3da.1780058608.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780404759-39370938-042164EB/0/0
X-purgate-type: clean
X-purgate-size: 1771
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4212F62E2DB

On 29.05.2026 14:43, Bernhard Kaindl wrote:
> Static memory assignment is currently limited UINT_MAX pages.
> To normalize on unsigned long, widen assign_pages() for unsigned long.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

The code change looks okay, but where's the connection to static-mem?
assign_pages() is a more generic function, isn't it?

Jan

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2851,12 +2851,12 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>  
>  int assign_pages(
>      struct page_info *pg,
> -    unsigned int nr,
> +    unsigned long nr,
>      struct domain *d,
>      unsigned int memflags)
>  {
>      int rc = 0;
> -    unsigned int i;
> +    unsigned long i;
>  
>      nrspin_lock(&d->page_alloc_lock);
>  
> @@ -2870,7 +2870,7 @@ int assign_pages(
>  
>  #ifndef NDEBUG
>      {
> -        unsigned int extra_pages = 0;
> +        unsigned long extra_pages = 0;
>  
>          for ( i = 0; i < nr; i++ )
>          {
> @@ -2947,7 +2947,7 @@ int assign_pages(
>  int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
>                  unsigned int memflags)
>  {
> -    return assign_pages(pg, 1U << order, d, memflags);
> +    return assign_pages(pg, 1UL << order, d, memflags);
>  }
>  
>  struct page_info *alloc_domheap_pages(
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index b3a35c4bc8d6..b4330269418d 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -168,7 +168,7 @@ void heap_init_late(void);
>  
>  int assign_pages(
>      struct page_info *pg,
> -    unsigned int nr,
> +    unsigned long nr,
>      struct domain *d,
>      unsigned int memflags);
>  


