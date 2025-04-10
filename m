Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C2A83DC9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945037.1343307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2npr-0000Oj-L6; Thu, 10 Apr 2025 09:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945037.1343307; Thu, 10 Apr 2025 09:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2npr-0000Mp-HU; Thu, 10 Apr 2025 09:04:35 +0000
Received: by outflank-mailman (input) for mailman id 945037;
 Thu, 10 Apr 2025 09:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2npq-0000Mj-Du
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:04:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1982a8f-15ea-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:04:33 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso6293265e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:04:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f71sm43871195e9.15.2025.04.10.02.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:04:32 -0700 (PDT)
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
X-Inumbo-ID: d1982a8f-15ea-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744275873; x=1744880673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LOFw2YvriQ9ZYdx5OM2aUTS5oZCWyBxtI/fxz2Dg2/U=;
        b=BbxnvWPX45eVSewsPrRK+KpTkeBHuyqF1t8oTWZCJlbmG2LoEEBFImODToqekz4pjU
         5OkZLQbo9P/Ml890fVql2OkjeajEIYhvbQlyQZvUf2aTzYBFZ5pVtJkfD6rUWAWZqoB5
         kXwwQnGyL84dgpf6zzpZLgJbINUCMQtf8wrfyGDeIbk39PCkb+NF22p0hRBKZTJvhjDe
         GDoLHDJ6u3iJ24zUCeqiefUXrPFFxrh66yB/vW9XvubLI6lVks5iElFBJKM4/Y4cjW3j
         /gRb5Fp+MfyAZ1RYWBcEgxqdql1m+3PFsI9ASzN3nUO3HpOaQ7nPQYK4JujrrfZVGmNI
         WbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275873; x=1744880673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOFw2YvriQ9ZYdx5OM2aUTS5oZCWyBxtI/fxz2Dg2/U=;
        b=jNK0RPbAthdrgda2udwU+ZiBRWdGSDqMNfyNHA2Kx59vFdWxlLfClB3bxggQ2hCdkW
         7KevLGPiPj9zlCl2sN8vPfHE0mWDnNRtIjEfKH3UZwMmfcCtdhhGIbTEAtjP8ugu65XL
         JtuWaMFzNrK2kxMLiXr1aHKCQy/53MHUjiseUphELwTKVW2bQE1yD3kPaSlWg8QPxkR0
         prqbLq3GncAcoiFzvKgMYvUjdc8wRbTwPTjT7QZ//yaLCvBIhfZEDqfau6cjmwRu+59Z
         KsPIjw7b/lDLy34fCxZkmgWo87KZubyXNlo7h1o/oH6N+yf9WJjRpsyPoWPmwoWJE6I6
         EyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFqSxIpRrWyP7kJHFXfSaiz1yk8cOsyCsWskwId1ceX8r9AfpZimV4RM9d/X7Zsm8C+nlTtH+CrMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOxp+oC7X2Fd5NJWRw+P0uyd7f+/YeOkiB6XnHcaNKCJq6vIW9
	UX6j3QZdwg0r43KR/noEoefIbfHPjzot9WiNdFG8ikuWpCOnizrwtjWc5HtVyA==
X-Gm-Gg: ASbGncudPHMQLxGuoIyVhIvbHnCEMP6wW8SwW3l+sr2Kq7IeP9sgakBJxGdYwOIc67S
	TnFRTxDyMKOIT8zvgDpeDrphaMuF7yZvpKieUprqCioI0PTKgcgnipUcn0adho/DJJ2ZEnY6QlY
	XrFgkqGIReViz7CPJ7bW1OdRnqWHY79H6lvHUY+Ui5SPVgKkaZvM9X4nWJpxLlD3BPTL0zf9QTq
	hz8PNkyyTr4M43ZuhDIn+p2Ibd/mnCGCHdEqD3YguF7ejYaaJBfVvLJXc8LfwbNIc6+B43pk7VV
	p4qsXVrDD2M775STqv/feucuWUuy023uHgZj1iSmss1SM5ZHHFq7N1p8ja+EnmdqTyowQZ2OY1p
	4R3vsOt2V+qC/NhXdp9qvb78m4A==
X-Google-Smtp-Source: AGHT+IFPqiaqQaDfd0K1CsBbKurZW5kpLXyeu5IoVwRZWn29OitXw+Ri0iWpFzWfHQ/4u2TsP+2drg==
X-Received: by 2002:a05:600c:4ed4:b0:43c:f75a:eb54 with SMTP id 5b1f17b1804b1-43f2d7bc015mr16865335e9.13.1744275872683;
        Thu, 10 Apr 2025 02:04:32 -0700 (PDT)
Message-ID: <230e7222-386a-46a9-8e8c-2fbdb595b645@suse.com>
Date: Thu, 10 Apr 2025 11:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/16] kconfig: introduce option to independently
 enable libfdt
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-5-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-5-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Currently, the inclusion of libfdt is controlled by the CONFIG_HAS_DEVICE_TREE
> kconfig flag. This flag also changes behavior in a few places, such as boot
> module processing for XSM. To support the ability to include libfdt without
> changing these behaviors, introduce CONFIG_LIBFDT. The inclusion of
> libfdt is then moved under CONFIG_LIBFDT.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Looks independent of earlier patches, and hence may be possible to go in right
away?

Jan

