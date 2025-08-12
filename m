Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD7B223C2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 11:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078505.1439533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullhb-0004c3-F6; Tue, 12 Aug 2025 09:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078505.1439533; Tue, 12 Aug 2025 09:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullhb-0004ZO-BI; Tue, 12 Aug 2025 09:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1078505;
 Tue, 12 Aug 2025 09:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ullha-00044d-Fk
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:53:54 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41764fcb-7762-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 11:53:53 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af98b77d2f0so981957366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 02:53:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a14a0sm2190307066b.33.2025.08.12.02.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 02:53:52 -0700 (PDT)
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
X-Inumbo-ID: 41764fcb-7762-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754992433; x=1755597233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SkrBeJs3bBlhBzTUe7/wzT90ovrVxqtY1MNrd3Z0arA=;
        b=ZGLCJi1rJzvUVrN4urFYyXtDMI95tGx49cy7e7076odpsRscKHCQx4pH6xsGuoTtKs
         VCJJCw2mEm0Oock1DKn7yYS6yl+4K9HynDL6GuWzV1qeEfVC49YGAoNdz4cysGlHTEo7
         fY5zEnj2A9CW2pKOderSrRGuLjmRKM6oUlnhPt4K7cd6f4DPISUyf2wQUV9LYbDGMGiI
         VM7LJSpEe0vLd8QpptDX8eKX/EaQPXZxTJaYfbCk0VZ4rnbD2Hg/JdfyAsC1pNBGm0sx
         70qAi8dqx4hEyWxQg2XHH5gXYGJ37Tx+wcmhkiXmOqTO1YENas4rsc12ra42zARAhrKk
         x6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992433; x=1755597233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkrBeJs3bBlhBzTUe7/wzT90ovrVxqtY1MNrd3Z0arA=;
        b=v0iFT+0uyA8HaUynSoES9PNXNv2tlAwodaiJ/JojlBzigiynE5ruoJ7xCTYBBrchgu
         qUhURK6O2aGmjF1zHplnTPGT3cbmRFPNrE1QvMA8WaNtfabjkafJAm1xGAowOkNZalv+
         jbkz5K1wYhozrFgHlCs6wvT0z9ehZ5on+Ixp42aavGOwPWe8Jkay5V/Exl1cNT5UcYei
         a22Q5/izk+DNZaHwns2QTk8I/tWOfdoImmVMUnXZtFx11mn8M5waeuZ2vTM68emdRHoJ
         maVq5FYeqDVdKX81uG46ThtnM83oh3OFtDCuUXkItD1KfEq4FW9gsidOf9lG6qdzMmxj
         9WdA==
X-Forwarded-Encrypted: i=1; AJvYcCW46jpFQjOJ99smtSvMvP4xXzD1H2HG0UjHx3HqVIyj6riaJvsOT5xt5wPRtDkW6DVvUNYAxxPzp5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmV4cfytSQWnOU8EFZRhNAZalJ2jxFLFEf60F2R3m83WjvHWAg
	rUh4RwuqeH7YUk8DORu/C7XK4chdztyWZmomXVjoMYSh+zDeFuhvRTQwtmRrE6Wl8Yyd6l07jp/
	NIXI=
X-Gm-Gg: ASbGncsZZVqRbifQDRUuCMz7UlHaiiu9G9/iUzZpMyWdK4mdlXL9VElS92WGAqcubTJ
	k0xmZDkUDEjJaI+W5IFZN5SGdGzU86IpzqURxODnz6kXQBaa5IvYWOSI1OOkFu9diJUEYCR/SMS
	YhOVB+4Y4uY3NxjsBX1hfUflYhY/4YEIrpPi52Yq6pGw05BbX+SCftyI6eQabFGj50eaGIBmCxa
	UncLi93ojV1pMQu0Ivc5Unl3sft/n5SVCLYvxB/SytQghgc4qGa739AWPWAce1on1Ud4suwvrih
	SM8hYD1USp/1z5d3iqc4YtPZxa9Dl2L6fqe/tBIC+fK9tjAWkFvWOT9xo7YWgAqykFyBC1DN1H/
	ptzy+TU6WZ7mCUZJ28tvNlupZrONlh9G+My5PNXxDJ0Qaqzodhh7jsp1stxdS96SUb3rrLzunqk
	djz5kbooU=
X-Google-Smtp-Source: AGHT+IHzUZw4MLKxae/mz6UKeMx4w7R0P4Wkeao86eZFOG+GQPS7X7NBrLgusrItJvPFZu6++kSTLA==
X-Received: by 2002:a17:907:9446:b0:ae3:4f57:2110 with SMTP id a640c23a62f3a-af9c6588280mr1616502666b.54.1754992433236;
        Tue, 12 Aug 2025 02:53:53 -0700 (PDT)
Message-ID: <5a0124c9-f593-4bd8-95c6-98dcfe7fa30c@suse.com>
Date: Tue, 12 Aug 2025 11:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] x86/traps: Fold x86_64/traps.c into traps.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-12-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> It's now just the double fault handler and various state dumping functions.

Ah, yes - long awaited consolidation.

> Swap u64 for uint64_t, and fix a few other minor style issues.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


