Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHDxF8wv5mliswEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:53:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC742C620
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285989.1567117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEp3W-0004A9-Mt; Mon, 20 Apr 2026 13:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285989.1567117; Mon, 20 Apr 2026 13:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEp3W-000484-JU; Mon, 20 Apr 2026 13:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1285989;
 Mon, 20 Apr 2026 13:52:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEp3U-00047y-Mo
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:52:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEp3U-008gkT-00
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:52:52 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e62fa6-5cb7-0a2a0a5109dd-0a2a450889e8-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:52:51 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e62fb3-63b5-0a2a45080019-d155802db42a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:52:51 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so39946735e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 06:52:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ffad20f2sm108961675e9.0.2026.04.20.06.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 06:52:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1776693171; x=1777297971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yG3hxO9BPXWbU5J2ydmObugAefwJYm3R6/DkISkqRYw=;
        b=L7vbsvjgCqWPeQF/TT1xD5e+WawzlpS6KIonG9xQYxKY2cIP9EyZXqbv3BRRjmxalh
         TNfQQZnNGUxpG8EQrEal8omdUtO7T/uWwhb6XQlHfsfQ0f8KdV9U1rPF45BvBKI8nUTJ
         5Q0Pxx2RZowpyyLx6HwqpGKPEYiIlRrypxXBjuJ7V41VKpFHn8sW8XOoforWXUm8ke7a
         ravIsw7aM5151uEUbDmjRmKo+SStMfSbxyN08pV243WZ8b/LsFQo4X7kz2jRNOeNZwNj
         iQP0OG5kbFStZ5w6f1AKn6I5D5w3ZpoRNl8jmr08rqGdAvDilqcXm1W2i+L2UjyhTUbC
         hRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693171; x=1777297971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yG3hxO9BPXWbU5J2ydmObugAefwJYm3R6/DkISkqRYw=;
        b=T3Uuj+i1tSHH8HXIXljEhWLEozfEqgMn/tB1wgGylv/dIBX+Bk3nwuqkZ0Vyv0pR8l
         ocE47uustRdPRHQ0tgRyJkeMTK4TbvAORHQoEZMfA1Px3mBtaYJNfggXYlt+QTAjOeRc
         wMlVsE8hxIvVXWmZgOMjXNUH/GPHAFImFFUSiMey2FrXSgriOyK+lI8smMy/6Fd4PNSj
         tTwUTnLPF6cmNHLmUSrSn65UfgKd1NTqW0ArQPnxMpNaopAvrYRdKXxiKYQnGGJO+T68
         cRjcpOPcqiG9bItJru7jMhvB5mIVDFFL0a4Qp36lXPkSehJwiZlsPr4cmCL/I1rTK4f5
         OOeg==
X-Forwarded-Encrypted: i=1; AFNElJ+SyETDBS5a9x9eTfEpz+BZ5me9g6oWOpkHbxR5X7k9QItQsE8noO7Tpq1YIO+qTiiSYA/UvQZU/QA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6YsgGjUFDEysJ0FKAqgs90IRYXL+TCqovFHCzGycGQUiFnwzw
	5wBUkQOGR4AJLbLNW3KfT3No+dhBjlFrYctWfLh6/KA7rcp6rRUzHN4kjwO2NHcWlg==
X-Gm-Gg: AeBDiet5TvtfakbwZrlVhlirp+ZPxmhOgRe+JlxgHaxYhvOyHTNaJHM1fMoA0CMCt3X
	d6x7Js2Chy6IeCvQxpVP+xGz2bEX1ci1lJ/7YP3yInxabnCJ5ykhcDpEsE2oZUYaZW+KuvIIzvZ
	Da866MYXHGVxcMrGm1ZXg+QXLBDf6MNG60qOHoe19gi77KAS3BenWRAF4rD00WN6YZUEp/Xq1tZ
	nQnWBy7258LDByby/ZuzzpBQbQ/vWucS5WVwHQg8dtdB+T3eC0S5PzRYWiFZKu7fQOM6yorussK
	Lxfzu/eDhhHvWdVaLdQ6bX/GQK8EZqCgZEwKuoB0UjbE0WhDDAjzvzaq9KAbNkm17iiWQKiJMCR
	zFaKLY8n2JVFNQ96yPuS5tD0v9R9DL8Vs8jMv261kFT+a+9/AoHFK3wg9owbUYJOUH03l3A1SeV
	kptlVpHrtTgDHULRSufYxuf/t01ICsm15s+o09a/KpFIonMm7loRLXsrzcpqIdTuOmSl+MnrrQU
	gF2V53tpkCOIrctmtONlnTDPg==
X-Received: by 2002:a05:600c:4818:b0:489:1c5f:3a9e with SMTP id 5b1f17b1804b1-4891c5f3cc1mr34688065e9.13.1776693171238;
        Mon, 20 Apr 2026 06:52:51 -0700 (PDT)
Message-ID: <ec24d32d-9378-4a07-b84d-aaebfd46f517@suse.com>
Date: Mon, 20 Apr 2026 15:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] vtd: Replace macros with bitfield
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
 <3182da144d0cb998c9ae897b55285b7e408cd972.1775814143.git.teddy.astie@vates.tech>
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
In-Reply-To: <3182da144d0cb998c9ae897b55285b7e408cd972.1775814143.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1776693171-39D6BDB1-B820A29F/0/0
X-purgate-type: clean
X-purgate-size: 2260
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C3DC742C620
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 12:09, Teddy Astie wrote:
> Replace macros with bitfield to allow simplyfing the code and be
> less error prone when manipulating PTEs.
> 
> It also has the effect of directly exposing the mfn in the pte struct
> instead of derivating it from the raw pte value using dma_pte_addr().
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> It allows nicer constructs like
> 
>   new.snp = iommu_snoop;
> 
> instead of
> 
>   if ( iommu_snoop )
>     dma_set_pte_snp(new);
> 
> A lot of simplifications could be done afterward when switching the
> logic from maddrs to mfns i.e remove many maddr-mfn conversions.

There's no real open question here, so it's not quite clear why this is
marked RFC. We did do the same on the AMD side a while back, at least
partly (I don't think we got all of it converted yet), so doing the
conversion here surely is a good thing. The slightly larger ...

> bloat-o-meter (along with the previous change)
> 
> add/remove: 0/0 grow/shrink: 7/3 up/down: 227/-45 (182)
> Function                                     old     new   delta
> addr_to_dma_page_maddr                       949    1058    +109
> vtd_dump_page_table_level                    197     233     +36
> fill_qpt                                    1151    1178     +27
> print_vtd_entries                            486     504     +18
> domain_context_mapping_one                  2098    2114     +16
> intel_iommu_map_page                         909     921     +12
> intel_iommu_unmap_page                       731     740      +9
> intel_iommu_lookup_page                      185     176      -9
> queue_free_pt                                442     425     -17
> vtd_dump_page_table_level.cold                86      67     -19
> Total: Before=18446744073715636162, After=18446744073715636344, chg +0.00%

... code size shouldn't be much of a concern, albeit you may want to at
least mention the (presumed) reason for some of the bigger increases,
after comparing the generated code.

(As an aside, the two values after Total: look entirely bogus.)

> I guess using mfns 'everywhere' would improve the bloat-o-meter picture.

It's not quite clear to me what you mean here.

Jan

