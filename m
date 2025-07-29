Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6CB14A55
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062235.1427873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfxt-00049h-DY; Tue, 29 Jul 2025 08:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062235.1427873; Tue, 29 Jul 2025 08:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfxt-00047p-Al; Tue, 29 Jul 2025 08:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1062235;
 Tue, 29 Jul 2025 08:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugfxr-00047j-R8
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:45:39 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66a2ebd9-6c58-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:45:38 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso491649f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:45:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6d6312sm6575665a12.62.2025.07.29.01.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:45:37 -0700 (PDT)
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
X-Inumbo-ID: 66a2ebd9-6c58-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753778738; x=1754383538; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=27gHmFIOtg76bBCFM16Ll+rvPzNpkPQtDBDJzNQEynE=;
        b=HU+iepIhNM5HVcCTIsZJ9Ad0O8x3ba79eagsBrhCKwGuJyfF83vqZZc3hFWe7NMESQ
         M8cO9dv/rprdmUYrdj6yo6oZR7lrPS6CFxjR7P6QeQFAwCAoPSJC0GotnzQA6OumZJNu
         LcS1ia9FkO+e7cS0iV7wtbjYiuQ/N34fGml9uLDKRqRbP4+f6nXSMVSuEwE//amARB3e
         PjkidoysuTBtWrYgD7yw4iysKT/bNsdloQmzWyvAngsuIdfyFzQCSMQAlt1+C6YU+AkO
         uZ5Io7U+OkeW3Q6UaC1x8QtHJX0nPxVoNuBUVSLq5qvP/AoQQSi19MctsH/uXrw6akm5
         hedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753778738; x=1754383538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27gHmFIOtg76bBCFM16Ll+rvPzNpkPQtDBDJzNQEynE=;
        b=QKGxRqGlKYFllYTsKbZAXzEcZwW6vJJz4GpJOtJ6qeu0mBN13wYHKFGZQFQ49F4FS2
         rKzH5On+CrQcxLl185i9qXBHpu+J6wHBvjW+QP/P31K6lFKmwZrNLfYsFWB3Cm4/RDVT
         Mdng0kNgTq8kIUje5Pk681BGq4V3KjkW1UMYD4CgyIEuvxhsROmfT3/PIKnOodFXCZKN
         FZqd+2RqFX0geUZhxy+DH+jMEd1Y9azZkYbvaAa4/bHfA7suea8BnuCxAT2iiHwvVH8K
         Dl4Pbs/yL9a/PEA/2ihB+FJcxYZ9AtrLgsjB6x8eFmKyLYe1UYfZ541ONwV/NKAjuViV
         OnNg==
X-Forwarded-Encrypted: i=1; AJvYcCXhhw7k4IMJycbvsQXchuyFl19AiNHkgsLeyLcwScNpleEeLEDVumix1B+Bp2Q7nGcguwUDVCzZDoo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweBg3leIePqPu/GigzlwdXx/o7TcKKJ6zCzWqcxcJFyjelSuAy
	XM0Lh7r4rUmudbvruoHzyvyKf47BeFptVd4Fwn0qYi+Oso6T0i2ifpe/pSQDM/Z/wQ==
X-Gm-Gg: ASbGncvzTfppiKmvKQTysgXPLvyGBXEHcq+Tt3kAw0yTDxPORJvFtonFKkwa39MQwEj
	z9tJOZjLyqWRVFrytl3bOs0Nu2A3fNx2xnbSvYYRo23xKbOkxW1XzW55LcCY2gtQDp8U8AW36Mq
	4OtdUBvlxySJebSdKZhNNOo6XZ2dW2gLqBQ7lDKfkuhZXcXk4bFIkcKGSSSoo0aH5GuQ91FbwpD
	Y0AInTvDBQ8Y/GmVxbhOSTr9LzB/FuGPDNWbATryyQ0G7JH7r+hCiBiTVYPlV6nmgfRrKs7M720
	dc5bX5RxpmBjJj32mPW+yoNDm1ZunSKwVFCrVTfXUqB8rhEZlN3QJzyAfu3wunCzAkr9kdjIqpB
	dMZIFrTNPrffmmwR/QndlzZuMI48Idk/Qvt8qjNAsHAc/Y3f/wvdTsqh70cOSbFbUKX+2QgzLIo
	/bte0Ay3s=
X-Google-Smtp-Source: AGHT+IE4ZC6Uc+uafJ1WnTLhff68HJ46xH39mVUzagwiLmHKkgbNPb1deKQgudERfDaztEmJWLiqAQ==
X-Received: by 2002:a05:6000:25ca:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b78e726421mr1974162f8f.26.1753778737817;
        Tue, 29 Jul 2025 01:45:37 -0700 (PDT)
Message-ID: <cae2290f-1888-418d-97e9-1a54265238bf@suse.com>
Date: Tue, 29 Jul 2025 10:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drivers/ehci-dbgp: remove use of
 run_in_exception_handle()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250728202300.1017904-1-dmukhin@ford.com>
 <20250728202300.1017904-2-dmukhin@ford.com>
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
In-Reply-To: <20250728202300.1017904-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 22:23, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Polling is relevant for early boot only where facilities requiring
> run_in_exception_handler() are not used (e.g. 'd' keyhandler).

I fear I don't understand this statement: How is polling relevant for
early boot only? If the IRQ isn't found to work, we continue using
polling perhaps for the entire lifetime of a system. For ns16550 I
know I've seen such systems (especially before MSI support was added).
Note that there even is a way to suppress use of an IRQ via command
line option (setting the IRQ field of the option to 0). That implies
that polling is going to be used forever. For EHCI there isn't even
an IRQ to use.

Jan

