Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6B3QKc3vxGnv5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:35:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8F3316F3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263498.1555414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gBF-0008C1-IJ; Thu, 26 Mar 2026 08:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263498.1555414; Thu, 26 Mar 2026 08:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gBF-000896-FX; Thu, 26 Mar 2026 08:35:05 +0000
Received: by outflank-mailman (input) for mailman id 1263498;
 Thu, 26 Mar 2026 08:35:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5gBD-000890-Qk
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:35:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gBD-001Fux-6J
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:35:03 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4efb3-bab6-0a2a0a5309dd-0a2a4504d9ba-22
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:35:03 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4efb6-c823-0a2a45040019-d155dd2cb566-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:35:03 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43b8e8e7432so550220f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:35:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919df903sm6708466f8f.30.2026.03.26.01.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:35:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1774514102; x=1775118902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JhzzZ2880Nvz6taQCKxFGYMBBImG7WeDD9RWx4ASTEA=;
        b=FrYa6n/pe/iWV17O4gqf33itLlroWQ9AusyIc1MR+hqFVkZ7EFFTAXHto2mY/8UJeL
         ++Oga0aYzSEV0np9GiMmEgxQLu4SeUCsh9JGPQdJNLMQrPfmDrCGvB6COpRTUXVk6t+I
         R9bL9hkePcDCJM4lBReN+vorW1fAEQbjybD1uH93UbPZr88wpVobapiV+OSKRBT/Wpvg
         N70K+c1OB3VnGUAK8wRhXOIqzTOVMdkryAfyjVr1WfPe9ZLSsDUGDRUKlId2YITZdmTt
         YVs426ST1Rb4NMUI4F8gNRaD6oCIN7blFexF8uqVDWkYrnRrDziHa27Ty4IcmMv27Yxi
         5W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514102; x=1775118902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhzzZ2880Nvz6taQCKxFGYMBBImG7WeDD9RWx4ASTEA=;
        b=EPCgbOuUKzKl2RkHjv3ntq2WCZOeY8IInkWEMd8I3LGIpsrGv7j/TXqzdaD78Q/lXT
         mhBjLc7w8ekrX/L+zNoBy+YEWCNMUIPGuETo6vFrLIqD4S3NXkgyCjlZTod0D4Bj7dNC
         e2dDJBsZJjUuubCmzbLnEVmakATo6MoaeT6Kz9DEi4FSqF5tJNS80Aty6e9dmvlKmJsF
         axzyRKy6pHAl8v9d78viA4dXKIGD5Fdk+D4lk5XOqQuTj//zIP7kFSJoQY0hkIvldVZ1
         WvC8GiCwrmwOe/0MlX8uYib8DdSO4Vdc3FgKRkNkxc2t2mL0w19/jf123/kVwkwkP8ul
         b26w==
X-Forwarded-Encrypted: i=1; AJvYcCUh7X407iGglWWYQtnqd6rsykk88y/guG3XZ0Rn4Hm1b5zVL5+OptiWy+0MAZhzsrcu9tgwkKcPikQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/rsmZ/2Q+tX+ovegMaduzLWu4jQha6Ctoe57nLdCQ5wqtk88S
	iR3nhwTKwqlxOr450G7WOr4ANHJdatH2ueZa+ORy6rTnKksUz64r2euLPGbD4ibLdQ==
X-Gm-Gg: ATEYQzzs8X1bFEw/VTYMw5meiCwidqI6IWGGFdRtEi67dABx/jZzTVJ7wLJJeOWoeYl
	YEE+sj12DI994UHMSyHJBxlD2KVMcEaZ+fc24BDJnqsD5UGp8p+FOmfO8JODS18ggWdqDsMcWn5
	GQ4hz2JHtulimDKgzf5xLqGUqSgkYEUBB/rJPW8SeBl/zSEtabGtsxBxbBEy47aRwoYGQWkhoBE
	wC8Tfaba4BnjG1ASDiatKsqcA3brgPJm1jBITHNIERhcXWh7tj9hQNyFSgbQQ8hCMX3SoWhuza8
	+REgDGJz8QOTyLhlqFeosLw1fnqawWESjVMYTLhkBsR440SxUy2wriZFHA5evEO9QQb1ny8Aqgy
	bkkm2E8UdN0WchZagCAgUsiuYEnAogzLr8tXHYE7izmLlV5+o3wg/dg/t3iq6rUsc55qUGA+qZo
	3mRHZQ1bPicdbUu7NFUAgCMyHnrZ8NJeAQhAo7GmnJqvb81RzTeRLXtDBQ6ipfzw9XHaj1gGYzg
	FMfGF0USIpGFJtjsBgGw/N26A==
X-Received: by 2002:a05:6000:2892:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43b8896cedbmr9250073f8f.6.1774514102480;
        Thu, 26 Mar 2026 01:35:02 -0700 (PDT)
Message-ID: <73fdb2fd-8ec0-43ae-8e09-77a3d095633f@suse.com>
Date: Thu, 26 Mar 2026 09:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: do not assign pages to a domain until they
 are scrubbed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260325100803.6640-1-roger.pau@citrix.com>
 <20260325100803.6640-3-roger.pau@citrix.com>
 <73c705eb-95f9-456c-ba0b-c6e0f7730ef1@suse.com>
 <acQMmXyOGFe5AN2i@macbook.local>
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
In-Reply-To: <acQMmXyOGFe5AN2i@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774514103-B249D9D1-B6431888/0/0
X-purgate-type: clean
X-purgate-size: 1574
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1EB8F3316F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 17:26, Roger Pau Monné wrote:
> On Wed, Mar 25, 2026 at 03:56:05PM +0100, Jan Beulich wrote:
>> On 25.03.2026 11:08, Roger Pau Monne wrote:
>>> ---
>>> I've attempted various different ways to solve this, but they all ended up
>>> being impossible.
>>>
>>>  * Prevent non-scrubbed pages from getting extra refcounts (iow: make
>>>    get_page() fail for them).  This seemed nice, but the cleanup using
>>>    put_page_alloc_ref() was impossible as non-scrubbed pages would return
>>>    failure in get_page(), and so I couldn't take the extra reference ahead
>>>    of calling put_page_alloc_ref().
>>
>> A special-case variant of get_page() could be introduced, but maybe that
>> would still be overly fragile.
> 
> It seemed too much complexity (and risk), just to deal with this
> scenario.
> 
>> When we discussed this, what I had proposed didn't require use of get_page()
>> though. assign_pages() would install two general references (plus one type
>> ref for PGT_writable) in this special case. To free, you'd call
>> put_page_alloc_ref() followed by put_page_and_type().
> 
> Doesn't that risk under flowing the page counter if there's a parallel
> call to decrease_reservation() against this MFN before?
> 
> How would the freeing done in populate_physmap() (in case of
> concurrent calls) know whether already scrubbed pages have had it's
> PGC_allocated bit dropped?

In that case put_page_alloc_ref() simply does nothing. That's why we have
this wrapper: To avoid open-coding the same check in many places.

Jan

