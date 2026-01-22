Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEQCByHQcWnSMQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:22:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131B6279B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210409.1522080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vip0w-0008Lz-UT; Thu, 22 Jan 2026 07:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210409.1522080; Thu, 22 Jan 2026 07:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vip0w-0008JN-Rp; Thu, 22 Jan 2026 07:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1210409;
 Thu, 22 Jan 2026 07:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vip0v-0008JH-Nt
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 07:21:57 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08681493-f763-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 08:21:56 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so609140f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 23:21:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435924ae723sm15983260f8f.41.2026.01.21.23.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 23:21:55 -0800 (PST)
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
X-Inumbo-ID: 08681493-f763-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769066516; x=1769671316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1f/8vCASIfL1ZKsOCXvbw+kI5xMaZrYATdc8FjFcukc=;
        b=f4EcEzOupaLskxB+6WU21bQS+1Q5E/7G0MuWqJRbZwWTcSQ9AkByXgucL1xYekFMqB
         oBSQFLfPbHUBCXNJDbLXqV4YirfloNO8Pje4UGKe4gtjCeOzxLyZyrwRi1gmIbFVLAem
         szlWGfICUFC0T0t/5GuaJU3gbdmFGC25XBNWMk/u5VWhh6AqzqIkglbAAET2d3agwnVL
         +ud861kDqwMDpC1o/cnh/aAYyKJjRkQ7KvC7TEsPkdkQBJkmJprl/34YQkZs+4yf84/a
         8+HdzT1x1cVH5kMZTML11I/h1dIxtEkiFhWUiRpYpfXAD66rMwpzepQnM63RWJuL29nR
         aXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769066516; x=1769671316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1f/8vCASIfL1ZKsOCXvbw+kI5xMaZrYATdc8FjFcukc=;
        b=gViB6hCLE+6tDvnA/yEDZetedkHeGZDmfXYi/VMgMA9PRpKmsdU4yypyVd44SkJ8qS
         9cYugyO5XykYckhZjrd/fcigrt5c/LvOHPH6osRoxiwqDg/nhiGw2M/eqHbEuyDeRIDw
         Yj8j6cypdgapcJYA+SKiYTjkjpId6wqT2d3t/yOV9wq5rAnXNUywUnDQ7IFb0n9uBFzJ
         SSig9OXax46Jj7v9zW/fYOUyFm6W2McN5/pLN1J+//6elS48plZ/+ZVT0brJ44hXfRaH
         p82I/pOUffC1FHbWVqQ6H+/J8ezUQBzz2MtjjqsP4ijb+H7U/qnmHLn/ERAENpGzkga/
         5DSA==
X-Forwarded-Encrypted: i=1; AJvYcCXYkYRr0XrIfvhwBQI4T8VxcyeDw9QA4eqB1F5+IjtGWand0+jXtQ8GuapIzuaSDFT2nb/t0SyPuy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWahHNIBMmWAOWTpWRx0vMSzAq0uQhO33WkVqFe/sifKxzEYKd
	3Q9YTTqlTAS83L1VTT2pEYa0KxeEttURUy58uwnRJTx2CYnVf/Dk5EqgGp+3j5fekg==
X-Gm-Gg: AZuq6aK0nBWTWpCa9ToAf+DNN9uIpDEAt5MNI+UjN8pydXGW5pqWfioErzPPjlQ32HB
	MAb1fKJ9004TPqsvzD+yvLzHhVVFTj4VSLqPFltN63zKKIz7l9iaEEeoozMrSj2LhIby82uppZn
	xnU6AybVx60nOKhyUdtH2jXwyC3DxaR+xHsi7n5BkUR65zhjQmEi8RrDdKgsm89ASYylDYI06sN
	DerLKyMXIWG0YFX4WflHS1h7HkabJMoeYwGBC2j2rfWa/VyKa0ebiiM/nRCzD3YhOmaDWSqvXyQ
	UBSFwmgSooskbPJxeNcvh+KtZThK1r6ngiwdstURddv7t0CFw0B4U5leypR/ZH8OOT0VRtsaOUI
	myMBZUWvMZy5SqC5V7Sm3toR2dwMfm4FNYDk80R+hxYSt09M2sYv6Oc+MNxqVyjUN0U6VmTIAoK
	i1Lleo8afOx4d6nRI5XJDucvBA7r/qKgmORqLwVJpxEJQcnUFo9D1wPWFnmyQIo4IahHiy+6s6h
	aF6YKkcW3+3tw==
X-Received: by 2002:a05:6000:25c5:b0:431:104:6daf with SMTP id ffacd0b85a97d-4358ff39880mr13942566f8f.54.1769066516020;
        Wed, 21 Jan 2026 23:21:56 -0800 (PST)
Message-ID: <093938c2-58fa-4f8b-a05d-19bec67c5eb9@suse.com>
Date: Thu, 22 Jan 2026 08:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com>
 <f5157ccb30cb1fe32ed9c59963490afd7fc1bb85.1769020872.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <f5157ccb30cb1fe32ed9c59963490afd7fc1bb85.1769020872.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8131B6279B
X-Rspamd-Action: no action

On 21.01.2026 19:43, Oleksii Moisieiev wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -530,6 +530,10 @@ R:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>  S:	Supported
>  F:	xen/arch/arm/firmware/sci.c
>  F:	xen/arch/arm/include/asm/firmware/sci.h
> +F:	xen/arch/arm/firmware/scmi-smc-multiagent.c
> +F:	xen/arch/arm/firmware/scmi-shmem.c
> +F:	xen/arch/arm/firmware/scmi-shmem.h
> +F:	xen/arch/arm/firmware/scmi-proto.h

Two nits: For one, alphabetically sorted please. And then, why not go with a
single line:

F:	xen/arch/arm/firmware/scmi-*.[ch]

?

Jan


