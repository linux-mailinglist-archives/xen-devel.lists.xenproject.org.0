Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C789032E4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 08:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737885.1144385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvBu-0007PJ-Op; Tue, 11 Jun 2024 06:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737885.1144385; Tue, 11 Jun 2024 06:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvBu-0007No-Lj; Tue, 11 Jun 2024 06:41:10 +0000
Received: by outflank-mailman (input) for mailman id 737885;
 Tue, 11 Jun 2024 06:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGvBt-0007Nf-64
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 06:41:09 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94467d27-27bd-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 08:41:06 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so64050266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 23:41:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f3672d1efsm61063866b.224.2024.06.10.23.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 23:41:05 -0700 (PDT)
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
X-Inumbo-ID: 94467d27-27bd-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718088066; x=1718692866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu3ax5KVPeqG8BM8VsCcDtpYZL+s3TZJfuanIM6yJKg=;
        b=E0pheYonal01B20RBPY67zmkmtcDgWDggO6WIJlBmwYDWzIqGLKSptDsMeSN97OUgv
         3vfXhqObkgrkhNazJhEVy9cA3etoBEab9uzA9iyAJQ9tt3nX5OqD5bAxXL7rK7J6Qd5A
         B31IudoCjLSPyUeSh47QszOhW5Zwf0M+JyTjI5OyrecjIRTCqZZOpMfvEvEHcoHEtZvS
         KrYWnFXdHjzTg1xqdzSVLdV+YecZZgRV1/E2w48o5EuDGqZP/OnWuk8/nDFPWW0+Ij8+
         h/E8cj3RJI3SfGac6pjrpD6nqc0jjjPpJRdUsAZQkHL2jlmsEAduQ8jxbdVu14AEJEt9
         XBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718088066; x=1718692866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu3ax5KVPeqG8BM8VsCcDtpYZL+s3TZJfuanIM6yJKg=;
        b=YNHblUMCTChHWWo5zVjRN4ix95o//orWEj6ukxKMjUvkarX+n+LRC43u3nKtgR5m8h
         SwQvGm+D5gUgTTAG01fuy8yG8nqpKpK26FAB+ByvRv2IQHUV5tDU6+WA6rK5QfNg5zKC
         onVVU7k+CbjVJFDduReJngNXwNyF3ARbihshz/Rc26XEp12UQdpEDwfYdB6V5FsnzLoW
         OGpc3ofQUe2hfFZ8PJMJ/LEl8fVxrYEBH9gBRWoRy54Yz8FXVSbBBsaH1C4BeWDCtzOL
         4nWkWltPp7PRB38qxwaeHuu6bZve23ihHx5wqqoe2wXVDeYlJHvZXeRuOfIy5oOdLNKu
         YfGw==
X-Forwarded-Encrypted: i=1; AJvYcCXK+ViDsEgvYGA2IV7HdhS8hKuuMJmmcq/GUbzD3xU0j/r61lKQlI+BAV6+E50/DxeKAsjgzjtgDRNrCGthTBlo25UsfFHFSeRnt4vhps8=
X-Gm-Message-State: AOJu0YwZqVIMTm3f/hkWghBQyaEVZdNTj2Axjq2/sQmkkPUKrWv5ixlf
	VwmkJedt/AUoBOwLai0XeJapKxulyZG9HMrCKa6WTequXbS3K9KXpXbPHSydYQ==
X-Google-Smtp-Source: AGHT+IHrH2tqMk1qnEjMwCF/74ZahiYTmfudGevPccfGDqcP01Rl6TQ8pYazhXeDfv84w6hyEIycNw==
X-Received: by 2002:a17:906:4a4f:b0:a6f:1045:d5dc with SMTP id a640c23a62f3a-a6f1045d63dmr445833366b.6.1718088065655;
        Mon, 10 Jun 2024 23:41:05 -0700 (PDT)
Message-ID: <8787608f-f3b0-4fb3-95ee-98050cf95182@suse.com>
Date: Tue, 11 Jun 2024 08:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v6 3/9] xen: Refactor altp2m options into a
 structured format
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <cover.1718038855.git.w1benny@gmail.com>
 <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
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
In-Reply-To: <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 19:10, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Encapsulate the altp2m options within a struct. This change is preparatory
> and sets the groundwork for introducing additional parameter in subsequent
> commit.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com> # arm
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor

Looks like you lost Christian's ack for ...

> ---
>  tools/libs/light/libxl_create.c     | 6 +++---
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-

... the adjustment of this file?

Jan

