Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBbxM/JjjGkFmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:11:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B1123C37
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:11:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227319.1533669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq888-0003qq-IE; Wed, 11 Feb 2026 11:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227319.1533669; Wed, 11 Feb 2026 11:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq888-0003pD-Ey; Wed, 11 Feb 2026 11:11:36 +0000
Received: by outflank-mailman (input) for mailman id 1227319;
 Wed, 11 Feb 2026 11:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq887-0003QT-IZ
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:11:35 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d07e3ba-073a-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 12:11:34 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so4219352f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 03:11:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfda66sm4120156f8f.22.2026.02.11.03.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 03:11:33 -0800 (PST)
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
X-Inumbo-ID: 6d07e3ba-073a-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770808294; x=1771413094; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JDeUYhlKK/F6rFrMZHE2/V3YVxGSaaVWa6qx6Nv5b0Y=;
        b=ej0ioqGfucPgItD6P0loYDl6HZdap/0v9yDncZlY5gbFHRYB+e3T4d3fJwIvhMF7xh
         BO4c0jL2gjS0nPPMAtVI+OQyr7OYfxWC1hnl7p7u0wWfe7emrw2KopsbHJgSmkOkG/hI
         l8KgXxazo/joA3dEMkNW1SofGhysHyEhsQYMa2e6lOv2ZgYjkY1GJCP3WFQcgY2cWmJL
         CibGyxX4Li0E6OvtdSP5Xjn1EycK+//l0zXbMvcXfXTL6uc1VKBVLlxNB/MFy4ffb7/h
         jC6ggTRpinc1qezBbae5A88Hx4Bdt8Li4t9vXSDspjWMibLWdqfSoFsSP/YHEj5VsqAG
         Dd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770808294; x=1771413094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JDeUYhlKK/F6rFrMZHE2/V3YVxGSaaVWa6qx6Nv5b0Y=;
        b=eRynRWKL25bR+QsNj8dyfEEo+mNcWcyeL451AL06DItEZFIHTtTduvmgGSf9+aSg93
         BFGRjjg/0+jsKm53T+sADYWbZ3Uc9dAjJYhH4ID7XRHjLvlLJ6GmGT48Tw1l8TOptxHf
         JXvQ+CpVlqUMwImkmfl2H6nvsP2wkJLoQccLWLj3JmRRwRZhXynImYvioiGBzlp75ggE
         3xwGh3+GjAjaN/HTb14AYmK8337wCAzoQCe2+gk7dVlGfZE4C5/0c/NcY00KscQfsGgx
         u7ZuQdZ14whEOWZEtKKVUWbLcIsxRDkAg7lUGjyTJY+IyX0rWR/BdJlEeaXun5sc1lMe
         UfcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsZm1i7SmFqeZbasZZxZNxWR4DMct1Sijf7s/kvhZOcIUF3FtDnlvAO9SvxsJnqMHrrR8W3iRnWkw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy7e78fwlcDYdSXShLt9ZA2gmd769L555RE92kza5sJqviuV6D
	vT4YwjUqXgbmFBQbVYbois2i+WYTUK+aJEjdvod7tn77XV5eBj6iiosV1vNuA/SEvz0NOTT/m96
	NuHHVaA==
X-Gm-Gg: AZuq6aJm6QY56KfI4hl2XhslzJXwfV/6qggg9rivPSNTFt+AFxy0pT/7zqPMBszAx8I
	jQfUfAvzyLEPzcbNdonmrDB/05x+UJ05bmJvOYi6cZMq94aE6Rk6yRAx2Lx+TkTFy39EcIae/ju
	HdUGBP05jSyd8Py4A/XXnWkUBGCVCq0no+hZefeJCw3yfWuuxE5mRh0qXbpgeu+kxt/QAK9ey0w
	YfgS8/KXF2aTmjPDAJsa1QCN4q7Dh1yvBiVigMimabxdR52daol+C26YMvmaeUAxRI/Jr799/FN
	INDknZkZZmRc7NFO4dblLAtrHOrozEzhuxLYnOTGuc8tHXGd1lc7vJYGlpA5pqtVuELwMGPqM6Y
	0va5mnUKKgE9oFGfNq3ui46n9gyaucnjhDFkRgO/VWzSM4GEWIa/3572UqMiWLwJThC8onqsXWA
	WM+RjpmaHT/RqewN6BXgp0StS+GgiPM+egwplQuAXRJVdhAMDUEBnhIJPaoOOdKg1GX2LO1pBz6
	I1uXle054A+n6c=
X-Received: by 2002:a05:6000:2510:b0:437:6bcd:77f6 with SMTP id ffacd0b85a97d-4378455d709mr2587900f8f.26.1770808293932;
        Wed, 11 Feb 2026 03:11:33 -0800 (PST)
Message-ID: <124efc9a-b4f2-451f-8354-29ee78ac5bd5@suse.com>
Date: Wed, 11 Feb 2026 12:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/x86: always consider '/' as a division in
 assembly
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-2-roger.pau@citrix.com>
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
In-Reply-To: <20260211104638.7938-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3F7B1123C37
X-Rspamd-Action: no action

On 11.02.2026 11:46, Roger Pau Monne wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -413,6 +413,13 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
>  CFLAGS += -Wa,--strip-local-absolute
>  endif
>  
> +ifeq ($(CONFIG_X86),y)
> +# The GNU assembler will interpret '/' as a comment start marker instead of a
> +# divide for some ELF targets.  Pass --divide when when available to signal '/'
> +# is always used as an operator in assembly.
> +$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)
> +endif

As said before, I don't think this should be put here. Not even with the
new ifeq(,) around it. It should go in x86/arch.mk, or a reason should be
given why it can't.

Jan

