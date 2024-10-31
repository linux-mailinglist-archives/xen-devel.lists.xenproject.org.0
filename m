Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C6F9B79B2
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 12:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828623.1243572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6TMm-0004Sh-Rc; Thu, 31 Oct 2024 11:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828623.1243572; Thu, 31 Oct 2024 11:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6TMm-0004QZ-Ov; Thu, 31 Oct 2024 11:29:28 +0000
Received: by outflank-mailman (input) for mailman id 828623;
 Thu, 31 Oct 2024 11:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6TMl-0004QT-Q0
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 11:29:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6108cdaa-977b-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 12:29:23 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43169902057so6611885e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 04:29:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7bf7sm1876635f8f.9.2024.10.31.04.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 04:29:22 -0700 (PDT)
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
X-Inumbo-ID: 6108cdaa-977b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYxMDhjZGFhLTk3N2ItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzc0MTYzLjg0OTYzOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730374163; x=1730978963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MFYxgL7EbXbaBOApnXIMRn1/932VR/yWe7WQlOIWzvQ=;
        b=fdeZjJN82rXYkMUJFSbTaOuaHHo37J16BHyaiK/Jko0pbpL+XfPebpZaVux2YXb352
         YMcCphFaKGUHKfZHCPM3Ja5uu7vrHCIqO/Yyg+cjf01HBZSLgmSsa8kgsJwEc/LfYYl4
         hVtEbiErbsYvInG0VOaqxQuiDGiY79mL8pcVG1qVHV9BcPyVK+ySd/PHLlQ/pywXtshA
         NxZAslLflNtXC3Ej2utjhTmkcAuuoM7PlEif1azGgU9yeTRckpk3ZnSM+AlaVKlDg4ar
         y6vZoGOpIEsNuV+rpexH4PnvR0aM7nSd7+kqjFNr1i/h5aT46Jct5KcCd596+sC8zjVM
         dXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730374163; x=1730978963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFYxgL7EbXbaBOApnXIMRn1/932VR/yWe7WQlOIWzvQ=;
        b=uk3jz41quyHOAOsL81Rh+06Kod1USEXxTjvDHsP+270rkrk1LUiRnq2rroYPSoT6Iu
         49Et6bRUVvBEzibrZs6TYAY+vsuUfn9r/vmJNFoUuy/p8qqi3F+I+2D8CuR1H6vSe7wJ
         2Ni56DonkoToZR7MPP83TGBCMWzZb40Z1hb2ikZXP1PqVuqnoqdCkmpWTTwalHXI7qZn
         4FzE4g7BpmTGB7mkqtwNqAFrtEiVrJhvV6EA/SALMNlMdZyGSN4uKK4XW+U8FDtgFV7S
         erQTNLE6ftBjPKIxUISm4xRW6hPNkOCszTd5vu6WH3/XmduCr6b1FGHFwxp5NrXSSnt3
         +ecw==
X-Forwarded-Encrypted: i=1; AJvYcCUc122QtGELeg4QwWmNvnI8vZQfv1s52O9WGyyW/nl3RX/VdTnqVHfUMEtfEUOx1tNmLfEfmI9wEh4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZAolOl8FTQRlVxk4XXucyfTc2RyKTr0P1m5lMa9DO6ZCyea0Z
	T9uiZ1BrXgTSl2/g8+aecWDzzSwYnqNCok3hrFefXfYi2zEfykPxsEQljrHK0w==
X-Google-Smtp-Source: AGHT+IF6aOIsDZ/mmN276jBrWealKn3MOe884c0xZMKye1ASn+6zdvpp3L9n9YX1RiBqjw52AlZohw==
X-Received: by 2002:a05:600c:548c:b0:430:4db0:3fef with SMTP id 5b1f17b1804b1-431bb98f341mr55582465e9.15.1730374163225;
        Thu, 31 Oct 2024 04:29:23 -0700 (PDT)
Message-ID: <f1219d7f-3133-44e3-bfed-bbc6db3a486c@suse.com>
Date: Thu, 31 Oct 2024 12:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86/msi: harden stale pdev handling
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
 <20241018203913.1162962-2-stewart.hildebrand@amd.com>
 <fdb156eb-ea82-4afa-afa6-105e605eba6d@suse.com> <Zx_PrF9_ITzfcCcI@macbook>
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
In-Reply-To: <Zx_PrF9_ITzfcCcI@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.10.2024 18:53, Roger Pau Monné wrote:
> Anyway, no strong opinion about the commit message adjustment, so with
> the type changed:

Btw, while preparing this patch for committing I ended up confused by this:
I can't find any request to adjust the commit message. The only other thing
I had asked for where plain int -> unsigned int adjustments.

Jan

