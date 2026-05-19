Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG+cEk08DGqqawUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:32:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F2157C486
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312736.1582830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHkZ-00015W-QJ; Tue, 19 May 2026 10:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312736.1582830; Tue, 19 May 2026 10:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPHkZ-00013j-KF; Tue, 19 May 2026 10:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1312736;
 Tue, 19 May 2026 10:32:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPHkY-00013X-GV
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:32:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPHkX-001efs-Or
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:32:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c3c3b-5cb7-0a2a0a5109dd-0a2a45049a84-42
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:32:33 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c3c41-1dec-0a2a45040019-d155dd2feccd-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:32:33 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-44a14580111so2484419f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 03:32:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767d0bsm42787312f8f.3.2026.05.19.03.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 03:32:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1779186753; x=1779791553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh8m19d56sPfpyOc/hIoN39qYR/TSzKl2UDhOkuehPo=;
        b=YP2M+aZoW3aRpuXFGPBcP4EBdQUwvUU1rFEPT/ZGBA/2g1MQbV7F42xP4ONhBus0AX
         fnQwiPEx9UQLc/I13UTC5mj+FWouEMrDdLDhEJ0UEflKVRo6YY3F06dRAB96wj6oTY8H
         RLEnwh0yR394+bKZylJ8b3SB7urefapBHRxNiph4Q7oYoxQQCe2yOxSCsJKy51EFfAj8
         FQg7zYRZcaxMh3iIMH7rNkvncxKWY9bQegKrfcf49aCE8drTjF9k2xYGRNLxMzXZW8Iq
         VCJw6exXnJVcFQuUjWyYX5HmISHykts7NbKoTxUtw2WqW/XFu2UcAVlqFPwGc2FoDpy/
         uDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186753; x=1779791553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh8m19d56sPfpyOc/hIoN39qYR/TSzKl2UDhOkuehPo=;
        b=aF8ZMstOFjjSuwMo8q2nzkOHF8lIS02oBDfbGHfMiOKBLRIoRIzyp4fYUNZRE1ty63
         DdqlXY+Rw/KwVnRGX5GY7j8xif46mLZgHAHal+jAUnupxghKOfpBtXqHN3kd9074sbnB
         Xste1irhkSWG+gr843w/Q/+aLhYJxsnk31OAXziWFggYTyi0hPwIXsMlPwHvMnO3FN8L
         et1TSqWD26ke/cZl2DL93/p31O+I5Jk802bMaHRM7C5Um6mqAkaw5tnYocUjvpyhjsI3
         6SFDVaPEqv+xZ0TvhoJHXrtRIgsLqiVZb5EwehuWEg5PYB5XVqNlZ62cWe2iCNPOVmOb
         NgPA==
X-Forwarded-Encrypted: i=1; AFNElJ/PFHceC1art+ZSg5BECoqL1cePzp5AVe3VCXxBjUyFafOGzyG+JpJ8JhXpcq4fAPReEU93wSSJZcU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/X969Gg6RaxCnALEmve4c6BoP7gCeit/emGdPApjBv0tcd1ra
	2s0zGc5TIo9vR/XT+9rrKnD2DC786EhGZ9ZjiiQOkpL0/ebEy7CwbpE0ov59hA1SPA==
X-Gm-Gg: Acq92OGX88txYFTGy7qv6i6qvqF6o1wSL4aUSVkF+qxyz79a0BHsV3T+MyvKJ0QaNMh
	R7iDoNL7Bn5jeDe3Zoy4jMM9VZOttlyrhOHmjx0857acr4OMNz25L5GB9m9EabD4ZaZSKg3h7O/
	5tvSSm3O9fNFHSSsgoG+tL9T4N8sPWiF0MyOQaZM6V70EQNleC4l8gz5Dev8RMVBQjfuGA8J6aF
	E8EMn5YLmZDVXmA7w0EyFCQa91VsJNCPyU4u2SGbC4XJOA5ZpDP2ZjWIoD/IbZp/MCioP3U87qo
	WDbQEeXI7/4ewEfw0xcWyvdx9TUYAqgoWsJy9OOgdKqoFoaWJubycB1dfwHgfbuFhzjBeRZKHWb
	rVT8h6sei3f5XYo1ef4OnadQV3+6aKs+XKRGgvau/KHqIvcx06zI/7cezGBXQLCtK1pymw/OmQy
	qqipOeVxbiXpgGqTQHMyZgsPwMqOPeleeD02MaKXB8awSl39wvkmH1qb88rmB32JE5MIP+Eo1fb
	+Hu726aM4CHeYwJJWpD1CzRUQ==
X-Received: by 2002:a5d:64e9:0:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-45e5c5bc7f0mr30923556f8f.5.1779186753047;
        Tue, 19 May 2026 03:32:33 -0700 (PDT)
Message-ID: <6a000480-60ec-4ceb-955b-83a0fdc129cd@suse.com>
Date: Tue, 19 May 2026 12:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair: export XEN_TARGET_ARCH during
 assignment
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8b3120f7302e591b2828cb77c5f903c84149d498.1779186401.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <8b3120f7302e591b2828cb77c5f903c84149d498.1779186401.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1779186753-491763FF-4167DEF8/0/0
X-purgate-type: clean
X-purgate-size: 985
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B1F2157C486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 12:27, Dmytro Prokopchuk1 wrote:
> Move XEN_TARGET_ARCH export into the architecture selection
> branches instead of exporting the variable before assignment.
> This ensures the selected architecture value is correctly
> propagated.

This reads as if something is being corrected, while ...

> No functional changes.

... this says the opposite. Is the whole purpose ...

> --- a/automation/eclair_analysis/prepare.sh
> +++ b/automation/eclair_analysis/prepare.sh
> @@ -22,12 +22,10 @@ if [ $# -ne 1 ]; then
>    exit 1
>  fi
>  
> -export XEN_TARGET_ARCH
> -
>  if [ "$1" = "X86_64" ]; then
> -  XEN_TARGET_ARCH=x86_64
> +  export XEN_TARGET_ARCH=x86_64
>  elif [ "$1" = "ARM64" ]; then
> -  XEN_TARGET_ARCH=arm64
> +  export XEN_TARGET_ARCH=arm64
>  else
>    fatal "Unknown configuration: $1"
>  fi

... the reduction in line count then (at the expense of some redundancy,
which would increase when further arches get put here)?

Jan

