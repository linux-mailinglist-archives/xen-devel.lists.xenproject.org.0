Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD7870763
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688451.1072564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBNX-0005zM-Nj; Mon, 04 Mar 2024 16:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688451.1072564; Mon, 04 Mar 2024 16:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBNX-0005xV-K6; Mon, 04 Mar 2024 16:41:27 +0000
Received: by outflank-mailman (input) for mailman id 688451;
 Mon, 04 Mar 2024 16:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhBNW-0005xP-4G
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:41:26 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09af01be-da46-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 17:41:24 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a458b6d9cfeso52947966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 08:41:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v27-20020a170906381b00b00a449f43a7afsm3646231ejc.113.2024.03.04.08.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:41:23 -0800 (PST)
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
X-Inumbo-ID: 09af01be-da46-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709570483; x=1710175283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+HJ4iJUbtPJxRimA7erqWi8lOYahXTGCDnG02r/PSo=;
        b=U6MbQQo3Ca1KpYGXX/It/JMMQ4/QsKcodpgUVuLehwzwrP3Pvdq4B9NTzwN7QUv9TL
         79heWoD/bUcVxX1ThDgEWL/nTPAkmz6qblL9kDnCcETIVeF/UETCP1UG6QnNu6vFXVyj
         bWs/Sbp74oJ8TyY0Ht6w32E4uP9IrV0MHbD1RnK58r9+2MGj1+58RDEe2RQVleMqWj5R
         X9yP1veasMqiVU7i+UzEJWbLDIcxIsOUaMaBeKPlZ6kKL3InPu+c+whbAqW8iKGliU66
         /GwRj7U7ei7yYFfCOwnjHc2Qkd2Elk1pc/dIbWQ5tG1g0A615Wp3kMLNPsQlAP9N9N5q
         FWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570483; x=1710175283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+HJ4iJUbtPJxRimA7erqWi8lOYahXTGCDnG02r/PSo=;
        b=eOuRcIyeqMEzpwz7UrnW5225Dw+KXeKcI3azFdsue/LW766hRBBPONRG8j/AKc2eDI
         fbfys0iiS34RP/RFcDsjfsU7Yv5fcQwK09YzON0h5/L79nxiNYW9jni4FmKK0sfq6+Jk
         /g7PbvdW+k5uLDKzBKufGlJzuXToplCyfcBuYCSUs/I0tRwuSSzqx22tl4eKND9dYGR1
         8ekdQ3Huey9iPLjZaEbit+l4yS11AOTHWDqJe3S3AnAm96AGQWYvw2gXG+oWQGdCQMPe
         geDYuUL2naj24DpDjkhiuVaLI+tFFHcZh/ZNWuP/9bJ8mLhTjZlUhuD5+f5elnSyC+TV
         OxfA==
X-Forwarded-Encrypted: i=1; AJvYcCWOJQ2wvd2WT2nTr1KjlLu12frFF5ljUNdazZxNfWMmDiUa987U+62nz54uNr16bSNDXKC92xFOUpKcQTlagftyPp6TIC4WZf7NjGoyvH4=
X-Gm-Message-State: AOJu0YzEX3+TxIVnDdnC45I4hbPbwWlgvrd4cROMLtXu0Nzg4iy6bGDJ
	QIINZASCvm7hZQJCfwhExkR8GrKjEJ/3GWBh2ZPEHz4N51qd/kV7azA7oGOj6A==
X-Google-Smtp-Source: AGHT+IGxNuVgF7/4XRCbxxGRYY9YtXVQIrv0RlKOGYd6qYunEAnzq7a1YWfFd6zuh7/UFUi7l4xmYA==
X-Received: by 2002:a17:906:d215:b0:a44:7a25:736d with SMTP id w21-20020a170906d21500b00a447a25736dmr6374751ejz.21.1709570483690;
        Mon, 04 Mar 2024 08:41:23 -0800 (PST)
Message-ID: <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
Date: Mon, 4 Mar 2024 17:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
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
In-Reply-To: <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 17:31, Julien Grall wrote:
> On 04/03/2024 16:10, Andrew Cooper wrote:
>> It is daft to require all architectures to provide empty implementations of
>> this functionality.
> 
> Oleksii recenlty sent a similar patch [1]. This was pushed back because 
> from naming, it sounds like the helpers ought to be non-empty on every 
> architecture.
> 
> It would be best if asm-generic provides a safe version of the helpers. 
> So my preference is to not have this patch. This can of course change if 
> I see an explanation why it is empty on Arm (I believe it should contain 
> csdb) and other arch would want the same.

Except that there's no new asm-generic/ header here (as opposed to how
Oleksii had it). Imo avoiding the need for empty stubs is okay this way,
when introducing an asm-generic/ header would not have been. Of course
if Arm wants to put something there rather sooner than later, then
perhaps the functions better wouldn't be removed from there, just to then
be put back pretty soon.

Jan

