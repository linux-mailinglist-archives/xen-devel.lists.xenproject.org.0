Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A22A65341
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917014.1322015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBQ5-0003ni-GT; Mon, 17 Mar 2025 14:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917014.1322015; Mon, 17 Mar 2025 14:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBQ5-0003l2-DQ; Mon, 17 Mar 2025 14:26:21 +0000
Received: by outflank-mailman (input) for mailman id 917014;
 Mon, 17 Mar 2025 14:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBQ3-0003kt-7v
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:26:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca4ec071-033b-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:26:18 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so19072155e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:26:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d33f5771dsm17826405e9.38.2025.03.17.07.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:26:17 -0700 (PDT)
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
X-Inumbo-ID: ca4ec071-033b-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742221577; x=1742826377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t2VvaNoM7m8xC8GhD8od2X8ta3pdf/K0jWYFvW7PdYs=;
        b=Fn32qWop+O9jARTVOvpI6PqroGBMEXPJq7fAmdjro5hKHaw6wJ5PR8fHTHOrtQ8dGI
         i/MrIet+nWN1nypHCzou6q8TJdxFXxzJ7K06He0mbKxmG5xZ5cDr6wcknHrCuwjBQEg0
         eylQgDMIC6k0PSe0EQF/iFdz/zdWqaktw+IgrxUN+UkEjT6vpoN96N5quOmn/qRkGMNu
         PxkcnQSC2ebkYHDiNB6D/f76Pgx3Moyko0Uld2fxUYPD/onByXjBDFPTsGxUmj9llV9N
         X/tT9wCxlkS0V1EqKywCV7YBvoRRrsYAjm4qMDIC4Vsdv//DLBO6BnhR7XBy7fAhuscl
         yy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221577; x=1742826377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2VvaNoM7m8xC8GhD8od2X8ta3pdf/K0jWYFvW7PdYs=;
        b=J1luyt9fjj3nVe7oz8Jtj2bByzb4cRkyIQhtLAMGEe6YcjdpQcRBw8Fv3i+DEufBWv
         SBoj3fLXeJANc8yaYoxOHk1DnvfZkjtb3Rw3/hxYpc0GhNkgtXUia2IG39aFnCNLg2cb
         XkQ57OZF6dIR6jV9OosV1ykWm6tT93pQdadMYL/iu+aiWleP8Jm8fHm1bhnKZaMIUYht
         j0CBsP7F5S4ELSoujiiF5M7X5o3/6brsjiK3dg6V9yWVJhjiXrXBicQ127cKIWmde5Ar
         hQJ2aDeFXYEVM+L4WQwRoYzr/LVFyIjlr9ptUE8siIa5aguU66VDqydewdteXrD0ufN2
         ppDA==
X-Forwarded-Encrypted: i=1; AJvYcCVGU1d2CWlumgfTJ8wfF77LzvRan7UbG7r1XqE9IHo7WGVpV4GEEETWH51AMIsmz0LkGSlsia6gXyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaEGtwnfEI+Z/MHEy79n8tXcZ43hutgMfaIE3ccw+DtHwx2SPH
	7yBDQ6cXkBN8Nmvj12Qj075/FqyYz2U5IraLMlXkfoyUBG72SIL3TxVoHAJBXg==
X-Gm-Gg: ASbGncthJR7hFRnp7yg1IiIn9tm3FztXlianBfQl5OUClazU6zaXjSZCazVBDZe8ojJ
	MkNZB/lI43YDGGwrkdcejjjqVP7HPeZZVe2GbYA/bLH5XJjS3ZRks2kHN9G728MHyCYo6xyorHf
	9Ebc8xeHa57D4GaA7fN7ljm1dx584HVHNcm5UMHN2IaXxx+rV9K2+WQomPsLL2actHTEDRe0Jly
	ifgKNcHuPT9RtnY+4ssJD0x5O8q20F4npZeAAiG8qS1QfsdaS6n3uflmRGgBXbAGDsWD44irCOo
	ZiU3WuMQsF5NJY9kNdgIeEWEg8xIlVXo0UQgnFvcPhl7TajgAtAI4wEZRq6y9M/uiDvmefYUAxg
	R5aqsqLaRExpm73SQZO7tdp0BMUE6Sw==
X-Google-Smtp-Source: AGHT+IGfSTzYiHoHIJhy3Ix0RjJ1jhVugeQDfrxJ/IKs/8KSFgaM+JSbRvtCrFvLzYayoWThKjqC9w==
X-Received: by 2002:a05:600c:548e:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43d1ec74ec4mr129968835e9.3.1742221577643;
        Mon, 17 Mar 2025 07:26:17 -0700 (PDT)
Message-ID: <c4323947-bc2c-4554-b67a-5efe3ddc13d4@suse.com>
Date: Mon, 17 Mar 2025 15:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/23] xsm/dummy: Allow hwdom xen_version
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-17-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-17-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> Running xl queries XENVER_commandline and XENVER_build_id.  The hardware
> domain should have access to the command line.

And that's because of?

>  The hardware domain is
> at least semi-trusted - just allow it access to all the xen_version
> info.

I'm unconvinced.

Jan


