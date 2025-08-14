Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC168B25E60
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080996.1441138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umT0G-0001Ws-Sj; Thu, 14 Aug 2025 08:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080996.1441138; Thu, 14 Aug 2025 08:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umT0G-0001VS-Ps; Thu, 14 Aug 2025 08:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1080996;
 Thu, 14 Aug 2025 08:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umT0F-0001VK-IT
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:08:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccae6063-78e5-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:08:02 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6188b6572faso751029a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 01:08:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ffbc39sm23734915a12.51.2025.08.14.01.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 01:08:01 -0700 (PDT)
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
X-Inumbo-ID: ccae6063-78e5-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755158882; x=1755763682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qjVqwR5/fAfM5wM5RwQC73jEFLvhLkKoQoxSL541WxA=;
        b=KK71Apkmi5eed0R/rRjvxCAlDA2AHudfOSpArwDIe2994kF+aqZmgp8kRbkJkon2NT
         lyXVztcoguU57Luw7XAtbtqL0BGakAcqeRQWPotmPIj28QbQUA0+vqvtHxLlscSSRlZq
         BNjpBqPO8YaLvCgIjyUhT7LivPRAkFJmhk/m7Q+8kMZ6sIyHFR7bAJkD/xN9NaTTBNG0
         0kVPOHHwokZeQA77JdH93esE+1dLNsKMXvAWOXmdMaS7cCg/U2TjFkfY6I+oAwnO8qQH
         K5AWMLEIKRhw4imhFt5UWDg0TdD3n+ddEZNRM3/CwNKJpOohp5zWw36LL/ZAtEaHrUA9
         kDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755158882; x=1755763682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjVqwR5/fAfM5wM5RwQC73jEFLvhLkKoQoxSL541WxA=;
        b=Df7rglsDsobhPStgR50WPFgDZmKvCwZqstKf1qC+Ti14DqIHNs2NptYTktQk2nq5UI
         0lFBCS6eb1gmJhipmafwpypiIIntxaKMbDK4rqKFRXnLVnOZME/3qeB+dGOZRyq/5ptW
         V5aszekp5tJenWUz4aR8OjO4g5zFQWp81doXzDDZBb9aJmQgX5MGWYQxKY1GadMfUuXL
         NqsSleZWTHKCeLKlhbUiQKf8yywvs8ivNeqCMsFw7jqV1sQzCnHYcd2gJ4hsHNey3Cip
         /VFs+X55W0MWVBhWE8P+Vir50IjKzM1quT1PZUd9vyD4zNdertVfiSKHMQ8/IE5veKbZ
         QOYw==
X-Forwarded-Encrypted: i=1; AJvYcCW8w8VsmlA05ftPZ+7zqIDUCdSJiovaUr6qJKTO135DUpl9zZ2mowX7MZfZrGIrnzAQKVf/SXz8vZE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yywl0kvlJhPrrgkqi7NVZzyvfEPMPuvI0S7au3wLrN1wmDH0bAB
	5AtbEtLJp5QkUn2sud9/UfsSqtbZFJ2sUx2DcsRSLGtYbqocSwaxZuntdyK3A7JTtg==
X-Gm-Gg: ASbGncvIoodb44dCRTqyAMHauI94pYdBogLaUnanx4hEBLIj15H6fu0VBGq3Cpl/96x
	ZCLRDiXKx1WoHxEgY5+133jwnszQaJ+JQgXxJW0frmK56aUgHCrC8RySa1E0lAfd8BOOOmQgca0
	V06AY8sxJKS9yZusT0zprFNruSXEkM1btxWzQyKlyiRYIssxzvNIcdJ88iXnc7BoZ43BrfcE47o
	kKBCLXzcKDEdx98RPgR1BJhZNJDQNqU3PqoMhRq0JmuFGVFR/ZzsSo0xtb69s4SJpwXMqnz27ya
	fTikbXhEXm6fNPLm2dS8DUsCSZfYakKM2YN+w7eZGqQaOJvftwBvpNsehhczBGbfhh/GuFYTDuD
	49AEcYm9/9XDLKEmZg/ejvxOaRj1X1muF4TacS/8UXM4W8PSFBam8K7SObfoKGAvXx6a3FBiL/i
	S5CFxvd3b2CQ/wh6XSEg==
X-Google-Smtp-Source: AGHT+IFHJs5EWd/B2P8ysoMtoSUeIV7mQjPhmy8pm+FLG7/YDg0XH1aIpJDKq7EWF/nWK+yEIm/MVw==
X-Received: by 2002:a05:6402:5106:b0:617:d98c:3fa4 with SMTP id 4fb4d7f45d1cf-6188b9dbcffmr1672335a12.20.1755158882000;
        Thu, 14 Aug 2025 01:08:02 -0700 (PDT)
Message-ID: <0fde3942-22e7-470c-ad70-aa2c574d10dc@suse.com>
Date: Thu, 14 Aug 2025 10:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] xen/macros: Drop alternative definition of
 BUILD_BUG_ON(_ZERO)? for old GCC
To: nicola.vetrini@gmail.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
 <d716610470ddd7da75789cfa546ed209ff24e1d1.1755111932.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d716610470ddd7da75789cfa546ed209ff24e1d1.1755111932.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2025 21:12, nicola.vetrini@gmail.com wrote:
> From: Nicola Vetrini <nicola.vetrini@gmail.com>
> 
> The toolchain baseline for GCC is 5.1, which supports _Static_assert
> in c99 mode

Hmm, interesting. I can confirm the behavior, but isn't this a bug? There's no
_Static_assert() in plain C99. Respective notes in the "Changes, New Features,
and Fixes" are also saying otherwise: https://gcc.gnu.org/gcc-4.6/changes.html
has "This support may be selected with -std=c1x, or -std=gnu1x for C1X with
GNU extensions." Nothing new is said in any of the respective documents up to
the release of gcc5. (In fact, the compiler accepts the construct even with
-std=c89.)

Our misra/C-language-toolchain.rst refers to a section in gcc12's doc which
doesn't mention _Static_assert() at all, afaics.

Jan

