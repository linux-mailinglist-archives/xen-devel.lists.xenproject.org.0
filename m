Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D5B4085E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 17:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106897.1457530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSXb-0006i2-Fc; Tue, 02 Sep 2025 15:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106897.1457530; Tue, 02 Sep 2025 15:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSXb-0006gd-BX; Tue, 02 Sep 2025 15:03:23 +0000
Received: by outflank-mailman (input) for mailman id 1106897;
 Tue, 02 Sep 2025 15:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utSXZ-0006gX-RJ
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 15:03:21 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f707ef4e-880d-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 17:03:21 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61ce9bcc624so6240531a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 08:03:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040f1cf4b9sm727218366b.29.2025.09.02.08.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 08:03:19 -0700 (PDT)
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
X-Inumbo-ID: f707ef4e-880d-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756825400; x=1757430200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IuFyXOUTglkSB8mPMXD5cagEWTaZs+GMb0YUuWOTuoo=;
        b=WKgWE3PdhKrAyGIOUiKsYCL8CW0aZYEPmowv7T6K1UwVI2Iv33VGW7R2HW52rs6lKa
         iM5h9PuinwoK9Cp1/8wVk0p7TJlaorLVe+OKvIJ+BaBV8E1DrFs3KJJMCv26eScdyYPP
         9JHE3aNcYvMIAms70Xd+spJDDIv7KTo0EehenXVG/hNlon/aeqscitB0EoJ0p7Hea/X6
         2XIZJ8Xq/A+jhDPrbWvz9Iew+5S0I514RFC09JWw1J1CxMdxjE+/ihWS97QuPj9zQUsL
         WuntvQq5wOZaxST4FT23PehxZdgay8xLvrMtuSJcrmzConT2LtfnXUqgBVPmc3NfCWfY
         RSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825400; x=1757430200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuFyXOUTglkSB8mPMXD5cagEWTaZs+GMb0YUuWOTuoo=;
        b=m8lK7dICctt+T0srdIjxlK01jtymoEmWSiliEr/qQsZcNnkC50LM7n9gCVL5nG/LII
         8jlJfMYlvbGsTSdajJZqcAPXmwLE2PkYfNaOc7YrZl6+Y+Hqqoze+NyxotazwUz31hzy
         n9ns5golnTyJX/RcBrb1DMLkELxfjXgYEqlUVwTipDjnZlpnaH6y5/vkr0kjt9lN4aCK
         RVq/zLyoi1f6kk17+4xs9gO/LkPLBc6TIC8XP4cXsajSUc6e0IMNu/njYXcIfG7AWMCT
         A5GJqdfzFJ4uZYzeuGlQb+NuhOyN+mZFZTPdFT/xNIOfdHGNJu8hA2ukKlANnF71U8sU
         uOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTHM86mPad9w8R5l/iZfYd09o/z33CHXOlBuKN9P+cj5Rs26uWLsfU5Y7aiy3Ez/TfqlCpd3FaVvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMtmUq4oNtS/HWDw/N9XN5Kaa0IBjRJWbvC/PtsgrslIgFamDj
	LlHxknZXsh8L5Z691LPBUkOZHDvjfllF4oruUyliB8hWvClNSnmG9XYFIg7MU6qQGw==
X-Gm-Gg: ASbGncv+y/sQACLevw0Q1qg9OKb1OTtqCxw7vT6wcxJXygPPTwdxJXUgtD06ysOS9Fm
	mRX5R0Xx5wr6KpY9lUvybgOzrFZ34OkrFeUiSkirfcCq4sH39O7tHKKzbpxmhUQsxPvamn6cvJb
	SgSIzXEcIkuWixo4jKNni3Vc5vIeBmw2hK2TkABVmYbeXzeOn4vu4an6qQUTf9GO/lg1STFAKMs
	tauk3cRB/QqMhyAIk8q7YBnhDlDYARiNiFUUq9iTBYv7Z0yqUKOnVSxqI04igGMwel+fjSY6faV
	3iaHxy1dXJ8mBTw4O97AicyDuUlJIJqH8nZEnrl4qTYDGLFiNDEynaheFDaAMPgMd9FAlFvd39v
	SYwZPxGb3KhbWC6y97QnUrZQWW7l0tBa7PUOaVCiQmGyZFO1GVSoJ1A82K2BGwlGjs8/x7LBOpw
	C8pTAH1mcf+eS58kWwvw==
X-Google-Smtp-Source: AGHT+IH2qck9JtepdUptIY/39GkOljL2lV2owwGjZi1Jv5EJUgDmag8t+ZAN6JPznHGobsVMoK3/+Q==
X-Received: by 2002:a17:906:fd8d:b0:afe:35d:fd5d with SMTP id a640c23a62f3a-b01d8a33c18mr1222096266b.1.1756825400335;
        Tue, 02 Sep 2025 08:03:20 -0700 (PDT)
Message-ID: <7418184c-9798-4c86-ac7e-9898de5df089@suse.com>
Date: Tue, 2 Sep 2025 17:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Tidy up .gitignore
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2025 16:49, Andrew Cooper wrote:
> Drop unused or stale lines.
> 
>  * While it's necessary to have .git and .hg in each others ignore files if
>    using multiple SCMs (as we did for a while), they should not be in their
>    own.

Despite what you say you remove .hg from .gitignore though?

Jan

