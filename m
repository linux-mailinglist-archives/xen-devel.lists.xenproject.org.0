Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOcmOY0g1Wnr0wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:19:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC133B0D39
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 17:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275116.1561079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8D0-0004s1-7R; Tue, 07 Apr 2026 15:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275116.1561079; Tue, 07 Apr 2026 15:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA8D0-0004py-4P; Tue, 07 Apr 2026 15:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1275116;
 Tue, 07 Apr 2026 15:19:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA8Cz-0004ps-Ag
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:19:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA8Cy-00CaI6-JD
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 17:19:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d52066-2eae-0a2a0a5409dd-0a2a4504defc-20
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 17:19:16 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d52074-bb33-0a2a45040019-d155802cbc14-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 17:19:16 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a4bc360bso16916465e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:19:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488b739e00bsm155012865e9.10.2026.04.07.08.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 08:19:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1775575156; x=1776179956; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9o5xjBi7lZ26EURuFKUWFl80uEHdRXN0oZw8Lukf8j0=;
        b=Rr23SaEOHX4Owqf8H5zONNW/jgcDvIEprqXt5Pi1JRZ0rKF1pB9NYMDtGhcRaYBcgE
         jv5jD91zKrcFam7jEuJTOsN/r06Jb4fJ3E1xwUbyts3sb8HlVkOz95LtzPqPEZYCl0BI
         0OqIHyY1V42qGBb75Hv/1Mvtv1gw0stRtfAutqMNukWn5SBDsBjbF4ZnbPFyo/t7f4c9
         LoYa1V5nOzV077fKW+nhTH5wi+oJjd/T2vNDykUyQh6WbKiJX+qnFeozudBRoXgivPuh
         B4eLBfO9wstolPgbluGsncmTQ+Q0l33LoiDwa/Rys8gwa9xa21SPBYPg/vZFgTeNcbva
         lo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575156; x=1776179956;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o5xjBi7lZ26EURuFKUWFl80uEHdRXN0oZw8Lukf8j0=;
        b=MUIa9a8Kg2GA5Jn8fhfkZZoRgMksGUahn/cPxI+7MfKdGPPhivEtuQDGUbaXObX0oZ
         VC58c+GCCrag6MZEyczLL83I2PaLW+tfVQ04eePdXDFsVM3bYAUJPWA5OqlxICzkhOzu
         vz7KR/VASyVBBZYlLHuBedu80YtPAtQe9wf+mghYbO+ZOKqULGAKxrXRKwrHQTWSN2AU
         Dv1PPHjxxzjK72t+dsWRMm2qakc4NasrSItLc2hDRrQ42THQdKl0tnKxd1Q5pgMbCf5P
         c62qRtTaOvaLYObx71L0ji9u7Kk3LTsCpWvsy1YRpa8CpRI/wmy3YdUfEvA7lrwcNaR8
         4geg==
X-Forwarded-Encrypted: i=1; AJvYcCUhbNj2/LXGv5YYqVzGKcAiW/tWTnqAzHzyVdlEwddBB7pNmVxv2hWAQ+IZwOu+D8IHYP7Is11YQ7o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTAjaDN1LZ3cJeJkogKob36qa4gsjaDtHxfHT/L2w6B+1Pd/53
	kIl+4audZ/ofge9oBvHf6k/6zwVqPqM24FgjEplLaYP/8yVRHShodlPSy7DTVMf7zDATsKklqf1
	xdIfwZg==
X-Gm-Gg: AeBDiesx7duaaIUJYnkw4uATB2Jfv00ly2fg6lcRC4gj760Lb/oSvo/4XMiKAHQbksV
	EKKYSJvjGR7Q9Da7JayAtX4k8WMswRUjMCrv0joxod0G6aJXfScgegUJfov1qmOEzCUhk+Ybf6m
	voo1NrXeUWXG2dkUVjM4kp7cnkn9G72hzv9LM5zXlR4pZRpMOvkYKr9sqxNtTm6fv+1YNft0mYI
	XSlulnG3vQG96GpDXUPgdypgWuC+k2WUxbC2jkN8JY+HQJxqOX8feapM2w16eoYx/82deb8RTFX
	1vQ+g6cChq/T4ri/JU+RIgqdEYfDfY3s5SFgznGUkXGHfrU5NFsUpr4c8zPVW96RDFM8RfmsFiI
	4yDH7opmXXt7pCvNeUINwemXhAD+ZhTkgq58t457G6G8mb8i+oMZQ0UpAZCxcKM3xE0jFg2A/Im
	2aUe8zWVllhSLyyHWsQLETezCYRtrsBEmYi0zyVtVqekOxgUD9rdToSvNlkxF6bhoJNuWfoVkGD
	MskJ0xMRL7phKY=
X-Received: by 2002:a05:600c:c8d:b0:485:4eaf:eb54 with SMTP id 5b1f17b1804b1-48899793093mr238007635e9.20.1775575155642;
        Tue, 07 Apr 2026 08:19:15 -0700 (PDT)
Message-ID: <9dc724f2-bf03-4da1-b91d-289015248548@suse.com>
Date: Tue, 7 Apr 2026 17:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/emul: Remove fallback path from SWAPGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260407142351.73049-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260407142351.73049-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775575156-33B3051B-4A2DAA39/0/0
X-purgate-type: clean
X-purgate-size: 775
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3DC133B0D39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 16:23, Andrew Cooper wrote:
> In real hardware, accesses to the registers cannot fail.  The error paths are
> just an artefact of the hook functions needing to return something.
> 
> The best effort unwind is also something that doesn't exist in real hardware,
> and makes the logic more complicated to follow.  Instead, use an
> ASSERT_UNREACHABLE() with a fallback of injecting #DF.  Hitting this path is
> an error in Xen.
> 
> While adjusting, remove {read,write}_segment() and use {read,write}_msr() to
> access MSR_GS_BASE.  There's no need to access the other parts of the GS
> segment, and this is less work behind the scenes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


