Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPmCB3e1eWk0ygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 08:06:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EA89D94F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 08:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215211.1525434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkzbw-0007Ls-Me; Wed, 28 Jan 2026 07:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215211.1525434; Wed, 28 Jan 2026 07:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkzbw-0007Jz-J9; Wed, 28 Jan 2026 07:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1215211;
 Wed, 28 Jan 2026 07:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkzbu-0007Jt-AF
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 07:05:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a76b66b9-fc17-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 08:04:57 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so5531231f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 23:04:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cefdsm4398152f8f.23.2026.01.27.23.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 23:04:56 -0800 (PST)
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
X-Inumbo-ID: a76b66b9-fc17-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769583897; x=1770188697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCOA0pcXuTqhvPYRJURwjEtICvZ3j2AamSimEK0mdr4=;
        b=Sv7t3ttwwYv6gdI5Czhf56RCR1akzGOKYnQRghuXHO/Y9TUG2joA7LevJNpm1FpVgT
         BCAB61rmbtxLxJDF5DStA6cU0XtUVeq4XAtPBgl9qEwmDdcdy1Cp03epK+Dxnb2Dzjjs
         GAtiIboEC3di7a2W+SRF6dxVLrgRLTfS0OAqA5x52rbV1nLuxjZaxbULNlQhbGKybbQZ
         EavTUsLiiE1M6qrT+2RIskUv9GKseHM6sP1hIAqABNT18uM6vwYF2zDiRkcndal+482H
         p6ZaD9YzeG9TzTFSFs6uWwQuGKE5ciqyrK3zGDMamgURa6XJ01AI8hJcfMMehxBrRwaR
         Rzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769583897; x=1770188697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCOA0pcXuTqhvPYRJURwjEtICvZ3j2AamSimEK0mdr4=;
        b=SOzR108TpACuKwPOEnDOaCXx+ZhxKYjQ2w/9M3tUavf7m3e7Ljl/PI/iUixC8e0967
         sr/n+6zn0WhG3DPg1D3tOJNkFgfDH1w4ZqmTv55QSdJ+DeXVM49h223zhzuz99FLYBEU
         R4nLDWhELBO+cd4VcftXr4EiZLJ10Oqp5uPGJTBP5eRUTujvDetoaTUCW+KDdWU/ZH/F
         XjD1jZ0E+tAWv80pVt6In4iEeZWZDOvJr3mP+1MWTdckxgX0/WHUKHxddevk9XvgxfzR
         iQceTSGd5J57HuwkhVPg15VQry1fPWe6mMMR4crA+qzZ+lumCrfqwkVAG18N6qKYzM1n
         0bsg==
X-Forwarded-Encrypted: i=1; AJvYcCWEP7g96F/Pv17yRpepUbWQJilRdKXLqyZtzHMAQRsMHwqXvhbtfFePsb+jTqeYfEHC/fV9rdudyj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQD7S0py3d5yDGlnZ1JaGu5+wKbhqRsosITLpwvKoRCx9XDLjX
	0tfgHFaMFKvmUNlNpAuPwbEUuMwKuJsdjSp+1KvEwDtC7+2nf965kRt+NqDNrti/dA==
X-Gm-Gg: AZuq6aIC4SEd3d9PSg/SM0R9xe21WIgjZKJrAhFZTEkPCyzAVQbw9J393CPg+uGWrmt
	OsEexI85mut6E6FCHR1Tbcv7FSET8EebwG4F9xt7E2owjcNfaggFesBq0CmQNjt/u/lTVdR/xus
	+BnI+b4+7k+FZ2IjIsD5iFo/dhVWvvN2WCrThfi9BcvyNfgO1E6JmzK8bfZuX9LJU8QiLj+0vqM
	vF0i1XIajz5nDb4SjYhw7XjuuHJ2vNbqhSDrgyiamD3qLnEwsH4ull190IncsXCSNTORs/OhtSF
	SyPKZKHJ3jnOTrVYLs3XALNi+iE2t6SKdATsqGbsMSh90dWashp3Lbg5JrmuStcE77ACOvWXmZg
	GTPIEFz4tNHVhuo4AGgrCagQ1Wa+jO7oYyhDpMQEZHD0TRpJk3/VT6A2r8gm89FNIQfReajdmp5
	7WQr9cUdzNWf4R4oz+xDqe9ugcnzzsIhu6baY/++gBnj6lqkMz9pYgkTxhHkBywio2JUvY9/Czr
	H0=
X-Received: by 2002:a05:6000:2386:b0:435:a52e:7758 with SMTP id ffacd0b85a97d-435dd1d8c12mr5989126f8f.57.1769583896754;
        Tue, 27 Jan 2026 23:04:56 -0800 (PST)
Message-ID: <b42af5a5-6237-47d2-9b74-0154ef8c2020@suse.com>
Date: Wed, 28 Jan 2026 08:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 74EA89D94F
X-Rspamd-Action: no action

On 27.01.2026 19:24, Alejandro Vallejo wrote:
> This patch modifies CODING_STYLE to severely discourage use of copyright
> notices when their presence is not legally mandatory.
> 
> Copyright notices are redundant on commit, misleading from the time the file
> receives contributions from anyone not represented by such notice, and actively
> harmful for attribution by the time the original code is long gone. They are
> plain wrong when added on code motion.... the list goes on.
> 
> All attribution worth keeping is version-controlled through Signed-off-by,
> Co-authored and the like, DCO and the cumulative contents of git history.
> License banners have already been superseded by the contents of licenses/ and
> SPDX tags.
> 
> Other FOSS projects have already moved away from explicit copyright notices
> where possible, and severely discourage their use when not.
> 
> Apache and LLVM take active issue with copyrighted contributions and Chromium
> takes issues with copyrighted contributions not attributed to the project. Some
> Linux subsystem maintainers already frown upon copyright notices too, even if
> it hasn't reached the point of being a mandated requirement yet.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> The actual changes are almost verbatim from the LLVM guideline, but it's not
> exact. Wording can be adjusted as needed. I care about the core of the proposal.
> Saying "please, drop the notice" on contributions where it's clearly not a
> legal requirement, or have the contributor state that it is a legal requirement
> and why.

This "is a legal requirement" ...

> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -24,6 +24,24 @@ license, e.g.:
>  
>  See LICENSES/ for a list of licenses and SPDX tags currently used.
>  
> +Copyright notices
> +-----------------
> +
> +Copyright for the code in the Xen Project is held by the respective
> +contributors. Because you (or your company) retain ownership of the code you
> +contribute, you know it may only be used under the terms of the open source
> +license you contributed it under: the license for your contributions cannot be
> +changed in the future without your approval.
> +
> +The Xen Project does not accept contributions that include in-source copyright
> +notices except in the following cases:
> +  * where a committed file already contains it.
> +  * where a committed file is renamed.
> +  * where such notices are on files from an external project being imported.

... may want (need?) reflecting as another bullet point here.

The wording of the first bullet point also can be taken to mean that adding to
such pre-existing notices is acceptable. This may not be the intention?

Jan

