Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B4hNJE3GPGowrwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:10:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BC6C2E9E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 08:10:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DIBdFv3L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345264.1604179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdHw-0004Ae-MR; Thu, 25 Jun 2026 06:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345264.1604179; Thu, 25 Jun 2026 06:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcdHw-00048O-Im; Thu, 25 Jun 2026 06:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1345264;
 Thu, 25 Jun 2026 06:10:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcdHv-00048I-9h
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 06:10:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcdHu-0046qa-0Q
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 08:10:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc639-2eae-0a2a0a5409dd-0a2a4503915c-36
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:10:09 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc641-ec1a-0a2a45030019-d1558031d420-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:10:09 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49249072f03so10128815e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 23:10:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492640362bcsm59890655e9.8.2026.06.24.23.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 23:10:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1782367809; x=1782972609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9uQ3GmActnxHqiLjAPBAnJujv2cVYk3eXIYV1nwLTCA=;
        b=DIBdFv3L9nvwAutAO6bOtJVXG7UxSvV+xtGKEb21/2yEHYopsl9sTemFo1GIFkZgzn
         goqwt5XJa7wt3F2/4CPSrS+dewSjg3xH38ZSPfCx9MGvCusdvEFZOz3MYrlyqJGNiDVv
         Ymf8K/WXARAPtRiVJE1zDhfXLzvDs6bCI4mY27BUgDEfSkG36/0UlKDE6poxp7kYLwQo
         PogRXw487oAx5HddFZgNXg8Zr0h5ctjxoFjLWkz0GibxFyF2dorhRd/uCbTQF8Mv5x/O
         6gd3fn82/J4MMP/pa/9NTHU4Srt8/Mr6KhbIOGa31BDpOUZNaJ/TssoK+yEaTqDgD9Sd
         Yeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782367809; x=1782972609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uQ3GmActnxHqiLjAPBAnJujv2cVYk3eXIYV1nwLTCA=;
        b=K2IlnP46amu5S3gfjIIE/X4tFg6hcHhBzbiGGXeflD+OwlHw9eZTWREDgcNKVQHVaY
         S8YpRu2VUkudRX0pEZefBDPP/PpW2CSc+lkncLurLJZEDv8DcLGmHhZj8ScZw4LPt+SL
         va0yF7Huuy6I0tWhN12xcun1xhmmkjPC7vtgwh+NyQ+q9aBD3lzEOALN+x30uoEr9Y6v
         yWhQB9ddLorZ1keiDTtgeBWDE+0hqC6xn1UhIgN4iHuNBMXflGkPdz814tWa3ojbic3G
         WX01hPeNfxGYdE8EFBCS6n/cyxcSi2D0mTNsqMlxTyqacVBhxY9dW6GUUhEiQcLBoP7d
         eSMg==
X-Forwarded-Encrypted: i=1; AFNElJ9GA4JrkmXs7CgfAYFlh4azq7d8jJR74caKoN0/0OesOw5/h4Uq2y5pj9twnskfIC06qiNCJJKF8M0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDHVyAmSC8c8ri4Djo9fLImqkLzBM72axGexut7PRGinbbwDLC
	9ndWqy93zB0wYoKoSFCT8JZLxJJ90mP/jPj/U3+/2baZz53GO5pgvn2KkCXudzyrTw==
X-Gm-Gg: AfdE7cmwdsXhb5zCxMt7z7RdSv1/T3922unA6aOfPc636gmsimAC2vIGAQrxg88+cQe
	9lB1rKCn3lyHP6wRxNl7HA2u9s1BIecVw6dgVjJAGfImAcdc4/W8MOrZhIqMwGWeMgurvRr4BM4
	Tz6sMm1+mZZMZKwT9I8H+Apya2ciabMleS4te6gmnaOs8sIYNQnv4XT1AQKSD1qps9WQw2oRe8u
	KH+tBWnuv8D8lwrzgoHCn7Z/eJmf0Kb9bK/rmLWl2TOo9YRTB9HLfJ/N54iRfyirwP+d7tGKzMZ
	5QASUD1jkcATM0rAKHg1+IXowjWDlJg07Y5hrAVbfKeGD8SExwTe9WGcM342ydddTwqjdLxmnDz
	7x7WTgx6416APOFveRI+JhIDbqFUO3kIFOwhU/aYxjSssqfcKC3kbmHyzPwJgzUxhPhWffgPrQ0
	XM8NxQ3uMq2y+B10Xr2ilk4hKhCp4pwGxfWZFNoOaxxgG8VGXevX+VGRZ3RWZgI58IfuXG3NLi4
	iJh
X-Received: by 2002:a05:600c:c059:10b0:492:5ec1:4e14 with SMTP id 5b1f17b1804b1-49266885964mr8147755e9.24.1782367809411;
        Wed, 24 Jun 2026 23:10:09 -0700 (PDT)
Message-ID: <9fce0916-5500-495e-958b-2f51c6b1c3f0@suse.com>
Date: Thu, 25 Jun 2026 08:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/23] xen/Kconfig: introduce HAS_STATIC_MEMORY
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <22c02e188a0b38806f08b7a87f00f03c14aad742.1781693963.git.oleksii.kurochko@gmail.com>
 <2e9683f6-25d3-442b-9661-d32f979ca43b@suse.com>
 <08a7ba82-dac1-499d-ad7b-0dc0de82ab16@gmail.com>
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
In-Reply-To: <08a7ba82-dac1-499d-ad7b-0dc0de82ab16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782367809-B51BE5D1-04D25384/0/0
X-purgate-type: clean
X-purgate-size: 1526
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E59BC6C2E9E

On 24.06.2026 17:26, Oleksii Kurochko wrote:
> On 6/23/26 10:26 AM, Jan Beulich wrote:
>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>> Architectures that implement guest_physmap_add_pages() select
>>> HAS_STATIC_MEMORY; STATIC_MEMORY then depends on it.  ARM selects the
>>> new flag; RISC-V does not, so CONFIG_STATIC_MEMORY is unavailable there
>>> and randconfig builds no longer require an explicit STATIC_MEMORY=n
>>> override to avoid a compilation error.
>>
>> How did you come up with the connection to guest_physmap_add_pages()?
> 
> It is because of you mentioned in this sentense ...
> 
>> That's a close sibling of guest_physmap_add_page(), and they all should
>> fall in the same group. The fact that right now static-mem is the only
>> caller of guest_physmap_add_pages() is secondary.
> ... (the last sentence)
> 
>> New callers could
>> appear. guest_physmap_add_page() could likely (in principle) be
>> implemented in terms of guest_physmap_add_pages().
>>
>> What you're after is a way to {en,dis}able STATIC_MEMORY on a per-arch
>> basis. That's all what matters here.
> 
> I will reword that part in the following way:
> 
> Introduce HAS_STATIC_MEMORY so that STATIC_MEMORY can be enabled or
> disabled on a per-architecture basis.

This is needed, but ...

> An architecture that supports
> static memory selects HAS_STATIC_MEMORY, and STATIC_MEMORY depends on
> it.

... this merely re-states the general concept of HAS_*, so imo would
better be omitted.

Jan

