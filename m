Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODzQOGZmg2nVmQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:31:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55562E8C8F
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220921.1529331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneqd-0004pw-H8; Wed, 04 Feb 2026 15:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220921.1529331; Wed, 04 Feb 2026 15:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneqd-0004nZ-EK; Wed, 04 Feb 2026 15:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1220921;
 Wed, 04 Feb 2026 15:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vneqb-0004nT-Nu
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:31:17 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8af3f2af-01de-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 16:31:15 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso11326365e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 07:31:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483109278adsm47879525e9.13.2026.02.04.07.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:31:13 -0800 (PST)
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
X-Inumbo-ID: 8af3f2af-01de-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770219075; x=1770823875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RfGcuctkZXLweMde0RuTwoA6cx2rr1R9KDeW8eMECeU=;
        b=J43uIN9+s/iRUG4Rfjz4W5nrR9kAK2MOBc9eMcqWq/0z2Pfba9X4H1loNsm7KVtUoQ
         6Zrr1KKGPT0zXGihke/g/4LXWkkVHWRuuIqi4oadMdyvy2JxS+7JZ7g2YYOeuDAlMdXq
         DeVRyEq2+niJRdOfBycQHEXw85FLAqZZ8lAY9f3Z+nJ6Lig1z4oDpPmFyRFf+TS0YBzX
         +Qg8olLBZoWDrhNWBt1r4u1qNo7ev7sKSXh0h3e3SuZH1zWNveOhwvJH9Yqevg92C2iB
         4JT5oCCOlZ07PFcaYD8j9xLasGbwi+ETndMaXU5Miiiu8WEcGx17X45z6bJPGD8JygNd
         3vVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770219075; x=1770823875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfGcuctkZXLweMde0RuTwoA6cx2rr1R9KDeW8eMECeU=;
        b=GH5XgnDbGWRc6hngfwrXLUnQrptSBHvM/HOAKkyVwIaTjWiiQDzui8tODZJo1W+3Zu
         HOT4J0SQM5pc2pM7LcKFvdYStjHO37D/Bu2R4C3th80u9GLo4BIHyniVjiWVhMKf/FvB
         nB25kLjyKZxjJElP7H55N+Bwm8RPTt3GkSBaMlh1W1dfwrArY2oWER+EeGW9n1Zw9gGV
         jfSGe1bLuMeFtA1jV1xyI0jhNY9T70W6E9HsrbFh2+Jlw+u0zm1DG68LJDqrmJEATfFt
         8wIf0k2pC3rDbg4Zm51uPvCQuXUBcSJUJlI6BLc3nEIP6zMbD3c6iTq8oWkLR46Ao/uh
         uN0g==
X-Forwarded-Encrypted: i=1; AJvYcCUJ91eSI9rbQwPIZ74q5n+eXQY+H0epAVNNBDrdkBlZm5w4QaPF9LzAXhPfajkF1Sv86qqPZWL6zfE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyI37y+yk9HObMf3ua5KcbthdoAyq05iFsbfLxSl5G5cwdWFneH
	KGiwa5yRIe1OFOz2VmQkJJ+vWct0rXLPcI+l4AlqU33i4lFKHcg/zeeieBjN48tB/Q==
X-Gm-Gg: AZuq6aJ0ecVgt8eVJw23XiRtJB8uMyXngKJOlWrDN9+2vAgNea2syCe9Mm23FaP7itC
	vtB/GH3NJwb1yJaxoGoUDUah9RcQVaYFI2tAR9+5BbPRqyZGPyEwi/3nZ1ch5YMlGhJvlL450u0
	D5sD1Jg1SRAdxvK2meYIh40OUx5SNMZSeNFNSSRKuG9BlPEiGMSX1lPyC7lFhdRyIlwSbjS5xr/
	/pnxCcRJ+eAKNNOuCWgVVCHi5yB2ZNbAweWIzi6wnFm3QDbf/47WazPUWm7amL4usxQ4J+adiqK
	hp6M+VrfbvHUJz5zQ6n9qukjFY4FGXxiCma1xw3qme7mImLWnQMTeL/ftSF+tl3Bp4DDlgDNJSg
	X5uv670EebOhUHrItBYrkXhHfAOYtW+80oVdUOSrHRn9hQOGN0ZfT+o7/WzUEuMcIaF9EYKp0Dr
	3dG7Y96eRUIXAViNqOZzb2vyhLAeDqm2/mtpP7Ojmw0fCNlWKo/rguCi/XRRACrSnrroPRMldPk
	uc=
X-Received: by 2002:a05:600c:154e:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4830eb1cc31mr44810495e9.1.1770219074545;
        Wed, 04 Feb 2026 07:31:14 -0800 (PST)
Message-ID: <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
Date: Wed, 4 Feb 2026 16:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
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
In-Reply-To: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 55562E8C8F
X-Rspamd-Action: no action

On 04.02.2026 14:16, Bertrand Marquis wrote:
> Xen does not currently document how to build the hypervisor on macOS, and
> there is no Darwin configuration for a Homebrew-based toolchain. In
> addition, the Makefile silent-mode detection can be tripped by -I paths
> that contain an "s", which hides build commands unexpectedly.

This wants submitting as a standalone fix, so it can be backported. But see
also below. I don't, however, understand how -I could be useful here - our
build system is self-contained, so any include directives used should be
satisfiable without any -I.

> --- /dev/null
> +++ b/config/Darwin.mk
> @@ -0,0 +1,4 @@
> +include $(XEN_ROOT)/config/StdGNU.mk

Darwin isn't really a GNU environment, is it? The definitions in that file
may be suitable, but perhaps a brief comment is warranted?

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -116,7 +116,7 @@ endif
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
>  
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> +ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)

While probably this would do, assuming make isn't going to make drastic
changes to how $(MAKEFLAGS) is set up, how about

-ifneq ($(findstring s,$(filter-out -%,$(MAKEFLAGS))),)

instead?

Jan

