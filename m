Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hwqJAZbdH2qbrQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:53:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B44635687
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aBDq4LSy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325819.1591167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgPS-0007Fp-Ko; Wed, 03 Jun 2026 07:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325819.1591167; Wed, 03 Jun 2026 07:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgPS-0007Dg-Hw; Wed, 03 Jun 2026 07:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1325819;
 Wed, 03 Jun 2026 07:53:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUgPQ-0007Da-W4
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:53:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUgPQ-00HN9Z-3h
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:53:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fdd4a-2eae-0a2a0a5409dd-0a2a45048112-42
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:53:04 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fdd5f-1dec-0a2a45040019-d155802ff016-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:53:03 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490af320e2aso24376165e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 00:53:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4004sm5601481f8f.9.2026.06.03.00.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 00:53:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1780473183; x=1781077983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hQBbA0BeRSilHQju6MRDMgMQ34bh3W2P0XlO+6zEcG0=;
        b=aBDq4LSyv5U+EUpOA3g27B6a97LUyYgJmT8T+KBa3xQpEgrt2lrvpB1h+TX1rdO7Gs
         gs0lYvALpmA6GVmLzR/mG4qADAiaR6yoUqOBVMG//UwwZHRpwKRm5Du63J7Es/uCZeIG
         dojKsgFRdlDgU8Mx/yptI3KIRbJ1Y0rTQs3MTcAd1NReFXUI17nQLgv5XiThaNz//Hl9
         KOs5SrdXWLUBvNOKH/K9gBdOSGH1/b9uUUBwrFLkTNCNNpqox0NDHTPb3y2XN/XVlBed
         NQCFnV1L8sk3JnaPFHENk+TplDvA5NupjfBSig0Rj75loUv2VvwM07RBmMtYnAbW5zl/
         pTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780473183; x=1781077983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQBbA0BeRSilHQju6MRDMgMQ34bh3W2P0XlO+6zEcG0=;
        b=CrZ1z0VS9oCdw6CzbdOz2MhLUVrUjRJdNe5D0fsEbWNSUz7mYbmL5UnJPt1XFDn5FS
         fQxEL5RRF5EB0843stpQHJINenqynmScC9AKGMbfrpWAN4VFjyRv8Top1qFDhIPG4kDh
         4tDb5Nk8d6RzimAuzd6PC7Da2rMtRHXUpnmYGaNv0dhcpFnJdRiQmFSe6WL244S7Eq+F
         64sq7MPv6LrD/8gle5NRiSEmH0VFuGQYRGXAvInwLz+qMuNLU6ZejP4cAVZciy3/uOiP
         YAQrP0NF6zzQ1CIzpBV0wG59l+LI1adiSr67tnTAqb1cZZv0rNwCxle65i03jJziXNG9
         nWDg==
X-Forwarded-Encrypted: i=1; AFNElJ+1AizgMXihR/OFHqQGeukYl+jGhhMOptFkoPMEuBTyWHooYb9eOtAaTSfepbOloothn4AfzrxbZDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBlepkuzWea4bqCVh1R8tXxQEw7Y1pliN8W3jh15pmaJ6fwVYB
	kog8g/h0AFlifH1AR95ZqM5MqeGW9W3YV0be0srEmttwF8MLLKGuxQsfMA+KrqDbZQ==
X-Gm-Gg: Acq92OEJge4CoU0lGPDlrfY18oQJNzLr8uvhEL4TGEccHOjdyFAflz82Q8meuPmS11L
	NRbmAbGzTSFyGpumY6AXj7wxD/gzFVFcrd0FRyqQtmbI9CVIoU69xwHeYXD7Xzeslf3GzWLmGLN
	lDM6NgeSNvatZ2l/Q3dXnauKLjxekr+dzIczG8PXJ1qU4fbcT0DEyDNxgVZnL1Lz/D2nDUlrO8C
	Fpp3H2qcRiqfAAqbH8ZJ0lqLn6FigPnv7UXQ8Hl++JvwWznFmOsMwaK69SkezgYPNrFoMvR1ChY
	tFnuDYRdO7lWaBOVqh/ui75Wi23EVrIkujVNIE0VVC/LaLZHn6HLkF+bDox5MvYF1zanDl+QxYH
	/oggM1+4QHCqQMhbcMH4rLpjxONFjQ2aRxO2vHZ3dEh8NvNZSlN0YuTMCKUpQJN3McVxOlGOdsr
	7aVbCfhQ2GsI4lfAbLRHTrkfv8kqgZR8TIYAQQimuHVjXQCD/93Fm53ynfUTtvgpGP1ERyNe/1r
	er7cXSkzAReE15OQvHG8TOy0cCB8gpAyfK5
X-Received: by 2002:a05:600c:4e87:b0:490:9d1b:f05c with SMTP id 5b1f17b1804b1-490b60e3f91mr38110365e9.33.1780473183102;
        Wed, 03 Jun 2026 00:53:03 -0700 (PDT)
Message-ID: <e1a9f1f9-6c97-48e9-8dfa-256c11b034b2@suse.com>
Date: Wed, 3 Jun 2026 09:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1779709902.git.dmytro_prokopchuk1@epam.com>
 <ea6996796564e18334e9951449748e5ac4a8a7f6.1779709902.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <ea6996796564e18334e9951449748e5ac4a8a7f6.1779709902.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780473183-42D643FF-54C0D61F/0/0
X-purgate-type: clean
X-purgate-size: 2556
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,epam.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60B44635687

On 25.05.2026 14:05, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro
> names".
> 
> Update ECLAIR configuration to deviate intentional identifier and
> macro name clashes by specifying the macros that should be ignored.
> This includes 'hypfs_alloc_dyndata', where the real function takes
> an allocation size and the same-named macro is a typed convenience
> wrapper that expands calls using sizeof(type).
> 
> Update deviations.rst and rules.rst accordingly.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

While I'm okay with this approach, were alternatives considered? E.g.
following the xmalloc() naming model, even if that has a name spacing
issue (which ideally we wouldn't further extend)?

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -132,6 +132,12 @@ These macros address differences in argument count during compile-time, effectiv
>  -config=MC3A2.R5.5,ignored_macros+="name(update_gnttab_par||parse_gnttab_limit)&&loc(file(^xen/common/grant_table\\.c$))"
>  -doc_end
>  
> +-doc_begin="Clash between 'hypfs_alloc_dyndata' function and macro name in 'xen/include/xen/hypfs.h' is deliberate.
> +The function is the allocator taking a size in bytes, while the macro is a typed convenience wrapper used by dynamic
> +hypfs nodes to allocate per-request traversal data with the correct size and return type."
> +-config=MC3A2.R5.5,ignored_macros+="name(hypfs_alloc_dyndata)&&loc(file(^xen/include/xen/hypfs\\.h$))"
> +-doc_end

I think this is too verbose for the purposes here. The details can all
be had ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -176,6 +176,15 @@ Deviations related to MISRA C:2012 Rules:
>         unused 2nd and 3rd parameters to avoid warnings or errors related to them.
>       - ECLAIR has been configured to ignore these macros.
>  
> +   * - R5.5
> +     - Clash between the 'hypfs_alloc_dyndata' function and macro name is
> +       intentional. The function is the allocator taking a size in bytes, while
> +       the macro is a typed convenience wrapper used by dynamic hypfs nodes to
> +       allocate per-request traversal data with the correct size and return type.
> +       The implementation explicitly undefines the macro before defining the real
> +       function, so the name clash is controlled.
> +     - ECLAIR has been configured to ignore this macro.

... from here.

Jan

