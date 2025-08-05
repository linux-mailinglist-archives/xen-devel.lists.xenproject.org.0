Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6CB1B019
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 10:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070126.1433778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCq0-0001mY-I4; Tue, 05 Aug 2025 08:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070126.1433778; Tue, 05 Aug 2025 08:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCq0-0001kN-FT; Tue, 05 Aug 2025 08:16:00 +0000
Received: by outflank-mailman (input) for mailman id 1070126;
 Tue, 05 Aug 2025 08:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCpy-0001kG-Ri
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 08:15:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69a90dfc-71d4-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 10:15:57 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-adfb562266cso848427766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 01:15:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766f9sm872386966b.24.2025.08.05.01.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 01:15:55 -0700 (PDT)
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
X-Inumbo-ID: 69a90dfc-71d4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754381756; x=1754986556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wt/RvL3z2MOCMJ7xgls2sDYSiF446Vvd5P2xrV6RHws=;
        b=XOFJPSmzW3EuFAs1UCQTsqVayC48/0uv7oj4k4a1DlMxW6vS6+WS+HpXaX/o3GRL0O
         ZKtqM5nlLllRCom4b3h+oGCtjXRhShG8yXVXXU+eIYrCUFfViBQuXV8CG8uDOJcDJ93K
         iUR5IM4WkxHshGZQMyVH80um57STo5z54U71CVdsPAx7WAGtQaxryzpXoHD1Ggux4e0l
         WgHslTS7Ooyx7ueUJW4qrT4LRz5OV+RZXncNaZi9dnFif1dxq2mGtrXM1omlZk3RgUlB
         d1J3/SmmrjeCwnbyeEfzuJIheuj/+v/4FQcekoDSMh+hkGBx9/jCdqMjsadQddJ2QULj
         +0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754381756; x=1754986556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt/RvL3z2MOCMJ7xgls2sDYSiF446Vvd5P2xrV6RHws=;
        b=QJMRKzReOPKwGwEBFoQso+vr53soXIQugoru0XKQ847Zq6oyQeS9c5KidmLrAcQMcY
         55GPHzkcOKPm/BITcvcX7S3HfzM32wyV7j1az/kCPh1MvAwWwkqH/YmvfQzpq71+LwoB
         bSiw35GljBOy1x34W8pPt8X3eGMWgGh4lJ4hhtEgpfUf4b0VArPe8CRnVPr2jue2d5Q/
         ZnHkYPEx9z07zZDuvgFcelUSux4QQjRzF2mXygrR1NNC2u78Yq3dO6u57MdyzCyJYqVi
         3cgZvUqhm8MMesZYB3w/EUIGvqJbPUXnGNdCZ9bZzj8zUslYx0x2YuG6j2UK92nD2z6B
         djBw==
X-Forwarded-Encrypted: i=1; AJvYcCV4dMS44OcSsV3Xfl+h1qrYLjrSxPL3Mbk9pJBV11PlyfygVowVnC+ydGlVXnXSLe5YEKKDXrvaTwQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywvs622eXzb1QNcx1sUa9z+3kS+vavwkndxeFukUsFsO6JsaQHS
	/Ppu8WAfJkrDg2repPAXYGh7hUOyyGVdgPWnFPDwqpAw4sJYINVZneU0FFeIqqf2nA==
X-Gm-Gg: ASbGnctY6hYTaIoaWpWqapmgVUqCI1GEVGhb1Kd03ZbZqtVHNek8z5U8Xt6RFT8ZlJf
	KbKEoyj7BGStBhQByea3cxztUh+lzVA+4D7ibLSJcvtNjDIpmSiAETtFy/ls4g4BoPG5jOaXiO4
	2S5UexxR6MwX+P4ba5E0kWan7wZsgaBS1SYYF7nsEJnxxdkN0wSOvLO++9UGODgCQUiqNkmsErt
	sGNsdIc00fg8uuDyWToscMqKTspLjki51/ozzENOa+k9NEU7DD2PS5QZdfPQBLjgovLlhJuPZlW
	0hWtF4Fce1MWUaRQy/AssC7kxRo4ikyEKdQdjnpLD+CLw4MqUCCSLmssFaYeyy6Jwd5lMuVsa1s
	GUKVD8HVmU2Se5hpCuIz8PWRj3uoS8k+CxNFs0cgu5erigrESVcr1GZuz4plsM7yGslNiDSj9aT
	3Bh4SV+aU=
X-Google-Smtp-Source: AGHT+IEzJJQyfsuj9JnPWMnVlLzedmSD5OtMHzS6h4vUGELTNbYGbHmGhxdzXeVZxTSC7VifOrrPhg==
X-Received: by 2002:a17:907:7fa3:b0:ae0:da2d:44b9 with SMTP id a640c23a62f3a-af94003327emr1384767566b.7.1754381756248;
        Tue, 05 Aug 2025 01:15:56 -0700 (PDT)
Message-ID: <321d07ea-1688-4036-a031-37c46dab5c15@suse.com>
Date: Tue, 5 Aug 2025 10:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: remove default case in single-clause switch
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <725ec86ac1aa883c35fb30b8f226c95cbe0934e9.1754322299.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <725ec86ac1aa883c35fb30b8f226c95cbe0934e9.1754322299.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2025 19:33, Dmytro Prokopchuk1 wrote:
> MISRA Rule 16.4: Every switch statement shall have a default label.
> The default clause must contain either a statement or a comment
> prior to its terminating break statement.
> 
> However, there is a documented deviation for this rule in Xen:
> 'docs/misra/deviations.rst':
> * - R16.4
>   - A switch statement with a single clause and no default label
>     may replace an equivalent if statement to improve readability.
>   - Tagged as `deliberate` for ECLAIR.
> 
> This change removes empty default cases in single-clause switches
> to avoid violations of the rule where the `default` clause lacks
> a suitable comment or statement.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

It's all CPU notifiers that you alter, and iirc the outcome of earlier
discussion was that particularly for those we _want_ to add commentary,
clarifying why only the given subset of notification need handling in
the particular case. It may also well be that the (at least) one case
of the possibly missing handling of some other notification still is
unaddressed (and might hence be wrongly hidden by the adjustment done
here, if it's in one of the function that are being altered).

Jan

