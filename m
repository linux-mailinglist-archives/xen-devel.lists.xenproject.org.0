Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5395A26C86
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 08:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881098.1291219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfDBz-0001S7-2h; Tue, 04 Feb 2025 07:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881098.1291219; Tue, 04 Feb 2025 07:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfDBy-0001Ph-WC; Tue, 04 Feb 2025 07:17:55 +0000
Received: by outflank-mailman (input) for mailman id 881098;
 Tue, 04 Feb 2025 07:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfDBy-0001Pb-Gb
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 07:17:54 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2654981d-e2c8-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 08:17:53 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5dc75f98188so8336325a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 23:17:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a57181sm874617066b.170.2025.02.03.23.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 23:17:52 -0800 (PST)
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
X-Inumbo-ID: 2654981d-e2c8-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738653473; x=1739258273; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tdpAnW/81P9m1JUfXaTokigW4nsMssIV9P0YLweA24c=;
        b=OnuHB324sVo/VjbSIQe3yEaIsgJZ58pn1QPGXpP5ZeAvZ86HU/e+z+t+ojptfKywAh
         OC7Bqa/OXuRHpWaBavi+60wRL44JfP9Y9LkQm4NGm5b14CI+qUexhR+UAnoCy9SRhRV9
         pR7VrtgBp/d7iP5bD63m+JqEQdVHroo+/7RitqnuF6K2ZQXxv8oyo+RIhJIkqmQj/dOg
         rsfyRdppzQhSx2fgiD9DqSnT3tUFuTLmPjTt/gkVXLNOi/Tv+tcOIS/XbeCujSFR/0or
         9g6V52FC4mVrzWkdch2H2tU+PTHzaGGd7EsZewiBhbQ/3gih5TNmYxVxhYk5ToJdqMgD
         buQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738653473; x=1739258273;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdpAnW/81P9m1JUfXaTokigW4nsMssIV9P0YLweA24c=;
        b=a9Y+JEPE1yav5RcFdtuF7CIoz7hFXJW5QwjhK1wnsvkLA25DfR6DCxPj2rqeKu9fTv
         Mbb9fuofNNWERwqtgurnbpgJ6AU6UrBQt0s6tK2Pm4uDXQZk9ldckB11vDeKDkZrc2/D
         EErjZJw9rIca2eo8RorXOiyY/etAA1QVtn5K9NUXN4M1UH2uuEWP1rHlTBsjbDCqZY9E
         lQFN77Ib9FpCxgIy91DPo7LoZVkRjFWzQye6u3+z+Og4Yd8qtSyjHSQN7o9gOJIJs+ZB
         feH2br0ALRd7209THv4lSD0yhR26IXyhSZIzF3AafNR5Fvz4LsaIG+Pt1Si+81lDodhO
         4/dw==
X-Forwarded-Encrypted: i=1; AJvYcCUbolfuC4vAZnNloHFAOgUwHxyew5VOtj91c6gmKpyM/eE4219GsyWZUVeFsAvR+NhQ2HXULdxx/CI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMoa5RQBDcG/bYTjaq44ukDvRbmpZ00SJpG6G9ieLP1/Y188nx
	7K2ecxoK79jf74HuhBfoJXiazpYnCSVyHhrvGqZ22J9R9s1Kh6g9aywBChYWnQ==
X-Gm-Gg: ASbGncs7u/tS5/YEboh2/cdo0YonTPPFWZXOe1Vho/XSe6hCQFmKV0sEt+PwuVJki7a
	PDx4peVPSHonqGQEbmPJd9brWqhscxyoeK/uIXbYulk58cewyzSj5/Gt7Wgd+Fllu8gNZaRRyt7
	a/kRmoFvbddDuFfAxCDYhqjAaYIjiowgcd4KlwIPw5pQ4NEOrBqplrdNwuVsyD3bDlJoUJUrXmj
	FkNqjeG0oyVMCm/ej1kE0yOnAUgiE7nLrdMH8BmkFiVU+x70+nf6sA+g56ZAlPbcGamrMZibe/X
	B/0yMkPyrvJGnp38+GLDa4vOXsI9ss6ovQvizDyo6svyqnMy71T/XcRtz7K1rljoFYsispvJ4G+
	l
X-Google-Smtp-Source: AGHT+IHXp9nGWDbJAyWC/TSFlvjN3+158bUekNIcPBGEa7ZAlJXkMu1oRmMHLfBUEQzf/cZIC6kRMg==
X-Received: by 2002:a17:906:c146:b0:aa6:1e9a:e45a with SMTP id a640c23a62f3a-ab6cfdbc62cmr2516336866b.46.1738653473123;
        Mon, 03 Feb 2025 23:17:53 -0800 (PST)
Message-ID: <3b4acfaf-31ce-4d1a-b3e6-1a58478c7b0f@suse.com>
Date: Tue, 4 Feb 2025 08:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 6/6] PCI: drop pci_segments_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>
 <4d0d0eab-4649-4f9e-bccf-c77772523679@citrix.com>
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
In-Reply-To: <4d0d0eab-4649-4f9e-bccf-c77772523679@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 18:04, Andrew Cooper wrote:
> On 03/02/2025 4:27 pm, Jan Beulich wrote:
>> Have callers invoke pci_add_segment() directly instead. On x86 move the
>> invocation back to acpi_mmcfg_init(), where it was prior to ????????????
>> ("x86/PCI: init segments earlier").
>> ---
> 
> Need a SoB.

Oops.

> I definitely prefer this version of the fix, but I think it would be
> better if patch 2 were merged into this.

See the reply on the cover letter sub-thread. I'll be dropping patch 2
altogether, with patch 5 (perhaps moved ahead of patch 4) then being
the actual bugfix.

Jan

