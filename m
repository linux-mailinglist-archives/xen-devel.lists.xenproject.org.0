Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E144FC1B968
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:18:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152847.1483349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7w3-0006M3-Aq; Wed, 29 Oct 2025 15:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152847.1483349; Wed, 29 Oct 2025 15:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7w3-0006Jd-7a; Wed, 29 Oct 2025 15:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1152847;
 Wed, 29 Oct 2025 15:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE7w2-0006JX-4w
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:18:02 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 747363c5-b4da-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 16:18:00 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso39495585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 08:18:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3a8209sm52520485e9.11.2025.10.29.08.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:17:59 -0700 (PDT)
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
X-Inumbo-ID: 747363c5-b4da-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761751079; x=1762355879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WTPQ7G8/dLYcX6seZg1ZbKS08xpwmG5ifUZeRUUFgyo=;
        b=Ko7jLAoeXD6TYfX82dP4Wkv2ojpA7yTfAWuv9dEZePBpwG7n6faOxRE7+NQnUK8Txz
         8UnZ6wYDNFvly00/QTxE76DBN7J1dA6lclP762N3sL61dNZ5VUbc+nsMq/bVCJxImGnz
         l1333O/URqyt7rEimap492JOr3qySW2GY6cbO+YgFkFURxa9Ebfmnl7xVkLHLamR/5GU
         nxFq+O3ju3RFn7cogCpebSSE+UCvmgiKX5bpO89MHFZOHaLqPOSombmiEozfJDp/AhQ7
         H/07Xvn5dL+t1JyjicLtHWWWCMoiwUL6cJTX0ratWuvla8Bj6niPBEjGJqCtZl92w+3G
         G3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751079; x=1762355879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTPQ7G8/dLYcX6seZg1ZbKS08xpwmG5ifUZeRUUFgyo=;
        b=LY54KC6yT0FgPNZtebhhhHbRMUcX8UxprM7SsyrCztGK7W/GN8m8dSOc4PVmJqx3Yg
         OA81GOT0O94hjR7iCJfpBJ2xBo4i2RsbrLvslTc98mk6mm9SIeKjDTdA+1/iooTu0z8L
         agFeBR+NR/f/3oF50fCMe0DJY2ERkeGbvg1xF6/3HGi8t0Sw/3l5e1N6WKuV1ESIwkdj
         o8FQPGCflZG1rQ32Sl97VUwHY+Ei1feUd4aD+UPoKG+R5myZhzOhQyDqjfj9aW+6CNL5
         uS2p/1T95iEHELLmPwWXkA2D9IKDcGUN1tSbe9MckOqzIXMGYg4h1jIA9fxoFj6TK8mM
         ONUA==
X-Gm-Message-State: AOJu0YyJJG+STnHQRXw3Xn7X+DnsfAG1ztcuCCOW9PzpKbMXfiUF2M8g
	nSEcKdLspnEwsl+Za3eQgD5F/+fZ8pzp1Hgfh8imGZ4PyAVwDS6mB+27UYVCPn9lEckEhud6r4U
	TE8s=
X-Gm-Gg: ASbGncuzanNVpvW7G3DH+CGxucEMgHw8hgqjQcm/936sbegsOLJMv8xoccOD5EffdpH
	A2hg58vuJ94rtUsg0fUVu7yfHp+2pONw+SKaR1RrueirY4Sl8FRoaoTL7IG8ZbG1wU8Rze71Cu3
	51iuvOXgkzIGMMLEDI8vbSiCslBZgxTDQPnAzFg05welEcbqjHkbIEtB8JD4aVXXV4gAGm0pyAn
	yPPAzLDm+e61lYL0w0YD3Cj9ty5+CZqyrJaaxgEWytfsFBJBhfRtPet4SirnbsvrYfHPr3LATL+
	ryTavEAmlKWebMeYJ7NfoYCggAJ9KTH2yN0WuUE51P102PLK+3TWnEP2Xft6za4HpnHwKVp8Pjm
	2HXkfEGVoRSGVuefj/7Bw2h9rgoLkRci0KU4e6eYJ3jh7z9cb7n9a2nz8Xm1ogzVoRHpO5xFCCH
	Od5MML9jkcmLDyi4M7yMB96crOrmLTDX1z+VlVqHLIw/jLBoR9FnndjPyvN/Ma+gkle8UEJYs=
X-Google-Smtp-Source: AGHT+IEH+l3Al2rIxNdiEhx3NfXzbunyJTeyp2l7McuTkCWZNaem5yCPBK80342UKpUBEcAUoOhyOg==
X-Received: by 2002:a05:600c:3515:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-4771e1e012amr33049875e9.29.1761751079318;
        Wed, 29 Oct 2025 08:17:59 -0700 (PDT)
Message-ID: <c7678044-1283-47aa-b7a5-b8334ad811fa@suse.com>
Date: Wed, 29 Oct 2025 16:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Shawn Anastasio as PPC64 reviewer
To: Timothy Pearson <tpearson@raptorengineering.com>
References: <1669204635.4117.1761694107160.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Shawn Anastasio <shawn@anastas.io>
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
In-Reply-To: <1669204635.4117.1761694107160.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2025 00:28, Timothy Pearson wrote:
> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
> maintainer.

Like with the other patch, your S-o-b is missing. You also will want to Cc
maintainers (REST ones in this case, I guess) and ideally Shawn as well (for
him to have a chance to ack or voice objections).

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
>  F:	xen/include/acpi/cpufreq/
>  
>  PPC64
> -M:	Shawn Anastasio <sanastasio@raptorengineering.com>
> +M:	Timothy Pearson <tpearson@raptorengineering.com>
>  F:	xen/arch/ppc/

Considering the long periods of inactivity we were meaning to suggest to
move the existing entry to R: anyway. May I suggest that you insert yourself
as reviewer, with maintainership - for the time being - falling to REST?

Jan

