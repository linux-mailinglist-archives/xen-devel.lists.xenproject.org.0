Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA1AD56DD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011727.1390183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLRK-00019n-H3; Wed, 11 Jun 2025 13:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011727.1390183; Wed, 11 Jun 2025 13:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLRK-00017H-ED; Wed, 11 Jun 2025 13:24:26 +0000
Received: by outflank-mailman (input) for mailman id 1011727;
 Wed, 11 Jun 2025 13:24:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPLRI-00017B-NJ
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:24:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6324d1cf-46c7-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 15:24:22 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so81173725e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 06:24:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5ee6f5a0sm7221753a12.21.2025.06.11.06.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 06:24:21 -0700 (PDT)
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
X-Inumbo-ID: 6324d1cf-46c7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749648262; x=1750253062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KpYhWG9RKSTcTmwrmvAe0Ss2JhdNfWMbAPQxPTkYUbo=;
        b=GwJGBURhvcDCkUuHl2nMp+o3Ra8ac+aW42m8RbxtTsUxkvy47MOOc9FPsibX5BOJHh
         /rb1IpZSrD19alZ1FLp52WkEY/l3rjzobIWTXdgD2M4e6qXXzyKhXGCortSV9vsreDYm
         EscEHWCi5CLuN07lJ2YdtJdl4dFA62De4BXpMxZtvCDBmb2OSxVt9HVQ5RmOr623Gch8
         IhB8qB/x6+nHJlMfUYCjjqcHvsjI58OPrtZjsEH6NklzGAUWodPhtDHKRg5vSm8860sD
         nXqLx+ErBjKCC4NrFFO7H802uR6TWJVDyFxqFzRcuFPmNdPH8GuyDpgg5nB6vICHYm91
         vH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648262; x=1750253062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpYhWG9RKSTcTmwrmvAe0Ss2JhdNfWMbAPQxPTkYUbo=;
        b=lQcsl53Kpxbly9GLCX/kaHdKZDAdqEktSWQVeCXseL+2fKLpycfOvFnj7vXEKRkEvB
         nxyNilnkG1n8Ot4S3gGoFgkKYGPvKk90A6HltywJpToV/Ad1MxBGx/Cwy7JBSmmTug4i
         gObju9w4zPxd3zY9LYv4npxE9Wm2FgOxZrJu/Aj3A1O6HK5n92JdVw3uHEnXl+97WBR3
         N654XCqtXjYfHuc26TEpduQYxh6WzjmjGfi6cE6acy3jRbNM5BDYHpzTHRuBS7eXQjVw
         0a7vT2J5fTkhTk7ryLtaa1uhiFRg08mYDr30QcPIf7FzvNCmpEMEAP/QNeiXMrABzzno
         ecog==
X-Forwarded-Encrypted: i=1; AJvYcCUUhN61VJZAcGnPHBztrMPpYIiM5LtLDALXx2SGYFQawIqPeKHi8I/+jT9V8ATyw65cm23PXvGqXJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWmVZ5BafujlN9r5hk/97HXxWmOrqxcf03zcxCSOnlIIv/4qKC
	xr/wIis/ks8LOrQaqsUC8HIQ7foIthVH8Qpno0sJwgwrBssGYlWiGGnmPjr6MY+ynw==
X-Gm-Gg: ASbGncv0HXm1u6UEr4paca86eAe0MTscx2efDtNLBHo6W1CBpUSTR5w5OaPwxqDTZ2L
	4TrAsUV47YV6/0UEVz2FFk0MX85w8oNWQIcAUR5dgG0LDaKl7ia/TeXDsJkEPKVNHR+2oOSKqts
	xYLIXYpallxd301HSGEbUKwuaaD1atEwHyPCX5W1dH1t6yBdu1oyiLuoQbLypPt/nU9bk5cT93h
	uHUx2vtU3qXGQJeMNn4ndE6PvPuI0vF0XOESn+V5MUBTXQL4b/Z644PKqGA/EW5NgpgzQJQ2r+9
	4l/mlLNDagPLtPhV/kUFeJ/Qf+t4ajpmGcDcHw9TaQh8MBXPdFfxdlHyk1FzCJuN2Ov2fsjRAJb
	9sO6bqEtWFPuSVsOMRpzMM4zQmbWIM66Ic9uxzUiyQSHkVsQ=
X-Google-Smtp-Source: AGHT+IHBMqSuRimEBzbgvVayZ3bReEEDINyesdmi93NMbjAS7Djwygfh9v0QfhA7E4totVSDOhg0Qw==
X-Received: by 2002:a05:6000:288c:b0:3a5:2fad:17af with SMTP id ffacd0b85a97d-3a558a42896mr2806900f8f.57.1749648261941;
        Wed, 11 Jun 2025 06:24:21 -0700 (PDT)
Message-ID: <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com>
Date: Wed, 11 Jun 2025 15:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-4-jason.andryuk@amd.com>
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
In-Reply-To: <20250610225737.469690-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 00:57, Jason Andryuk wrote:
> To add more flexibility in system configuration add the new
> DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.
> 
> Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  This
> will enable running device model emulators (QEMU) from the assigne
> domain for multiple target domains.
> 
> Stubdoms assign target allowing the stubdom to serve as the device
> model for a single domain.  This new flag allows the single domain to
> provide emulators for multiple guests.
> 
> The specific scenario is a disaggregated system with the hardware domain
> providing device models for muitple guest domains.

Why the hardware domain? Unless a DM also needs access to some of the
physical hardware, it ought to run in a separate domain. Conceivably
such a domain could service multiply guests, so maybe the "single
target" concept presently used for stubdom simply needed extending?

Jan

