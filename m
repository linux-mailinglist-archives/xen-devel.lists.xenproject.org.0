Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28374A7349A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:38:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929482.1332187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoNC-0001my-FV; Thu, 27 Mar 2025 14:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929482.1332187; Thu, 27 Mar 2025 14:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoNC-0001l0-C3; Thu, 27 Mar 2025 14:38:22 +0000
Received: by outflank-mailman (input) for mailman id 929482;
 Thu, 27 Mar 2025 14:38:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txoNB-0001ku-SX
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:38:21 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e2d8c5a-0b19-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 15:38:15 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so15228385e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 07:38:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e83609sm40015145e9.15.2025.03.27.07.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 07:38:14 -0700 (PDT)
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
X-Inumbo-ID: 1e2d8c5a-0b19-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743086295; x=1743691095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UR6nD0+bqUwdSWrGL791eC0OSY2LW22S+sdh8/j29n4=;
        b=ZVOCVuc8eVnxWl8eR2ni5KdMlfOOrnRMrTmaJnNTnpKGDDNE2mw9U6WBIOOD6AEytT
         W/KofadQJTkSb7QoNL+/JkF0Hnxq5PkwgoMQvmi/qqZkLMW0+J7EVO7WCOfqQ/OXGdqQ
         8wPpcGQt0tIjuZiX1rXuOZ/mEs4OXwt9YrPk8GksQYkuyHERWhexVMsnIdOxlG0PRkHz
         Hmz6izdRFVgxiQMSo8DFBGnjySjrH0A+wFTEaDyE49ZQgUsrlTSA0ZloAWcFiAvhclAa
         yc7aOkv7502W4y9K8TmWqDcYI0K26R7AiDPDO9U5VseRT9URO2KYlyjMRSyAExj6dTZh
         nmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086295; x=1743691095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UR6nD0+bqUwdSWrGL791eC0OSY2LW22S+sdh8/j29n4=;
        b=d6ZVJOmHoJTiEXZNDGxSmoR1rK7mRGkJZg8Vs9SvLtNnJj4JI8ovuLwkGjQ9tyEcdz
         yEg8o+pDghnlMU1EeUHWZIXJ/PjRY4bGhHqqcHwshWF1GoRizblHCNc/TDKJUH5dSAwA
         62FIBYfPCcgnViv4T+jCI352P47ddycf+DN9TxoOw4Qo1jNGaBmywDzkDXL2l0kqgs/0
         ImgtbPzi3tDQdRuee3z0B08sg+HP0wZB2uVWUczXkdQEIA3kZJop5wmPa+XReG/wPDI2
         gl/dgxRGje2s+JFBOqabFBE5wEUjRgXQv2m8ZEk0vDqbtGTz4QzB+avPRIiiAJVgI+Oe
         VneA==
X-Forwarded-Encrypted: i=1; AJvYcCV4HtR1XEzTJUfSCDljTWJA7L+7GFH7pD+DWkd+92s0xFfGm9T1oYx05apiyYv+gBhhsM0SdyAh1iA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz88sKMsb+1fNzUjqJD1E8I9ioixP6TMj2MOpB8W06sI+9V68ze
	4cgGfmfIMBSyctnyxUYOEHQUiYDEiiVLTOcnBuN1N4F4ftXHm5VMp8v8IG/0NQ==
X-Gm-Gg: ASbGncs3lr5pl1fWml32csuPQwzXxEyxy5nOSnHjk4klEzOCBj+Rv4pVHbMJYyOxwlY
	dZVtIS8PQuHFUyclai7awhcbdNZvPtFhAGnqPsrH/SkjBA/mIw+DtZBq2wuyeCjG49Euhv/6ite
	CPQPHeoJROof87NIHilFzJ+4qS73Dtzj0gdFNbig2t4w+pHyNIQylmDRQZcXJmT1pMCi1mgRfQa
	XDiZtkojQdoD/AXFamu52nqF2DXT9RA1+2y6IZ0FthDfwQQQkEbUsb7FeK7n7OxqCtfMdrDkTW4
	AQebf12C0kn+O+EkCqpm3hh+T8RRJbydP/PMioGsdMZNcAx0Qxmzn43XrfEyzoFPqByQ1WgVkBD
	YIV+oD50GB+GgIGCz4+vZu6Bl8alQLA==
X-Google-Smtp-Source: AGHT+IHVwRIgQ9334KEjMuckawFFz4V0XbWopOgWgNGGUcvnGQqdxjFAlQ96gz3njNqGgjsfWYWW/w==
X-Received: by 2002:a05:600c:1e20:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43d8e68a4b9mr3966015e9.13.1743086295154;
        Thu, 27 Mar 2025 07:38:15 -0700 (PDT)
Message-ID: <51c41f93-b8ef-452a-92cf-b48099234f45@suse.com>
Date: Thu, 27 Mar 2025 15:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.2
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ac97714-7137-47bb-b109-3ec4c69fbeb0@suse.com>
 <4bf1fe0c-2034-40d9-a5d2-ea10983e530b@citrix.com>
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
In-Reply-To: <4bf1fe0c-2034-40d9-a5d2-ea10983e530b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 15:26, Andrew Cooper wrote:
> On 27/03/2025 2:13 pm, Jan Beulich wrote:
>> All,
>>
>> the release is due in a little over a week. Please point out backports you find
>> missing from the respective staging branch, but which you consider relevant. I'm
>> already aware of
>>
>> be7f0cc651d8	ARM/vgic: Fix out-of-bounds accesses in vgic_mmio_write_sgir()
> 
> Looking at the patchqueue, the only one I can see is
> 
> c11772277fe5 - tools/ocaml: Fix oxenstored build warning.

Queued. Thinking of it, Anthony - I wanted to ask, now that you're committer:
Could I hand off toolstack backports to you going forward, much like Ian was
doing earlier on?

Thanks, Jan

