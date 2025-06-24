Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55FAE5CA5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023110.1399018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwsI-00041k-IU; Tue, 24 Jun 2025 06:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023110.1399018; Tue, 24 Jun 2025 06:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwsI-0003zM-ES; Tue, 24 Jun 2025 06:11:18 +0000
Received: by outflank-mailman (input) for mailman id 1023110;
 Tue, 24 Jun 2025 06:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwsG-0003y3-D5
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:11:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0874fc67-50c2-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 08:11:14 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-453066fad06so167455e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 23:11:14 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e8109728sm1015666f8f.82.2025.06.23.23.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 23:11:13 -0700 (PDT)
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
X-Inumbo-ID: 0874fc67-50c2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750745474; x=1751350274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W1QzhyfwToBoxFhW+A1SUZaMdU32sCbyjFDgTEr98l4=;
        b=J1hHh+5iiQ3Khb5n0jw3a1evreRwWKtgl2RLexqSU0x6k5tncQCWevr2KFWnCEnLyN
         KQYlSH1yYxDJn4+cOe9zFpmXlgYfnh+wkrOkS3AUf7ayL0jwaTQbRkkfXIlk27u1u7kA
         QUTHBU6VF+EPfVHv7AoBK3emh/5ZceuW7EO4TSDBcPPq1ZKMqgA1vP0iER8u2KgLaes+
         G/X5vKXL3z7yQT1txHRdNzB74NORHYaA1g9kuXuyj3tm7I1iwS5jwhqzrupStzyESR5H
         pNkiXDBGk6/IyDqEspsxwNKNNLPC+DoBXe+ZVYuXHZ/znrVNCvEPVqrBwJqzilbt21f1
         Rl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745474; x=1751350274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1QzhyfwToBoxFhW+A1SUZaMdU32sCbyjFDgTEr98l4=;
        b=unkqGMLk9ANL3pfm8M+XmG+wUBwOv2ijM+fidMbWYN7RsGK+tJuZ48CHcTkpscPpTO
         T47Bc54ygUH2inkOTDBtFKrH0ZCDAaUpKZ/oT1aFHguDTXyj7ppmlCQAFfYXhqeg3YO4
         1EPsBcHctBabAPpWOZZIYzJyrww9SbBU1H+a2oowR7GFC9KNAivxPDxHtOiBngu11nYQ
         KWVRnbIaegSqnjhQgeCIcdAehlnqvhcKIuI4YDAj1xjan6Re5RJ3v9QJbKufojEC6fVC
         IRdtnDuJrOUdXbqaInCmPWJKI7imUKjscMf1GxMtFPoQUq9dS0br2yC+kNNd2Tbaf/Ic
         sAIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyz3kvZJ265zslk+h9OnJBTlk5N+Zy10VCh925Yvq8s3LhXphfZ6NqtnFgE2uqjI9qUI9t19063QA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5MJVjZ5mtki774iozTV3KP41uo6osJW2TeNVxGIx6ae9J+DKG
	/1MGv7lZcJXnacEsXZZw2hFlRwj/QFzRif5v/OeNulv8V3wZLRwDvERVY92rJGzReg==
X-Gm-Gg: ASbGncuxHuD2yF2UggVnjBS3ziYwsA6R4tlwFKqG5Oo/VfZA2Lf4Yno22KI9+BwzxB/
	HNfwVbGIughcbMKMv/VWy6ZYA6dWUg2oZ3R3Se328Dv282j7Mudyv/5WyyyECZ5k8I6uPPTyoTd
	t1BiqPYDtcpbfLGtp9jACXVZllWsK8eOKYzAMVORzoSzR4fNUj1PdO0ayRaa+ae1CrR0RfmTt/7
	TrkRWvukFCETbZLFiiNTcRfxSwIV54hl3fp2K28BjTyKjk0SpziyClRhj6tqAN5XXVx1lkaz9bL
	9k128FEOfxmXV6wEhzultX5o3fhYNWFC1mZwFvg28df+4WkToisjnnqkDGukasdRq9KsGbeG1A/
	W08R75dzX+j5LjT72SpEFnEzk/AE+8/u0Czc8OlskbCjEcfwBp6FWh0pwE0Q2xxGbcoq6FPzg9n
	ZCF5tr/1rWjyWJI4vBMA==
X-Google-Smtp-Source: AGHT+IHIKOIGaPJxhUWBzCKhUX8Efb0U/rFeIunkGNXLVsDJ0z96MluIDjiB8i2mLzQJysEApoG3iA==
X-Received: by 2002:a05:6000:400f:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a6d11932bemr12606503f8f.1.1750745474011;
        Mon, 23 Jun 2025 23:11:14 -0700 (PDT)
Message-ID: <0c6d5b49-ce69-4f16-b61e-ad1378b20807@suse.com>
Date: Tue, 24 Jun 2025 08:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra/rules.rst: allow string literals with memcmp
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, michal.orzel@amd.com, julien@xen.org,
 roger.pau@citrix.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506231642450.862517@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506231642450.862517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 01:45, Stefano Stabellini wrote:
> Rule 21.16 is about the types of arguments allowed for memcpy.

Seeing the subject - is it memcmp(), memcpy(), or both? (Writing from
home, where I don't have the Misra spec to hand, and hence can't check
what coverage the rule has.)

Jan

