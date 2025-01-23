Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED8A1A48F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 13:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876232.1286611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawdO-0005Oe-5g; Thu, 23 Jan 2025 12:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876232.1286611; Thu, 23 Jan 2025 12:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawdO-0005N9-23; Thu, 23 Jan 2025 12:48:34 +0000
Received: by outflank-mailman (input) for mailman id 876232;
 Thu, 23 Jan 2025 12:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tawdN-0005N3-1l
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 12:48:33 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59660d26-d988-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 13:48:31 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso750810f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 04:48:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3279388sm19070155f8f.75.2025.01.23.04.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 04:48:30 -0800 (PST)
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
X-Inumbo-ID: 59660d26-d988-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737636510; x=1738241310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uubn3B4AJmy/tkkVoElarXDljvIi0RFazkyKWEB01/Y=;
        b=JXaNh18EPgSqWCGcHgwXInXIq+ZWKbX0WpHuKbMkBTtwtuqvS/WzHG6Ukc8VoBeAwd
         XtaqdwlPBertCFaxhPHWjdcfF9kooqBfzziK5auBGS0E3BUosazvRWfyB+dUgw8mEj2l
         KX69AQywxTojdKs0JhBCbCyrglK/mCbSxLAqE/ZN+jvfJGIexOs9MXgsv8C2Wb1IZqFI
         u+poqDMKcoZw9XdQZIpQLby7sQw0O+wM7Ilf53L7AYoa3l+0ultmZvre2gl9HJtDa+uK
         s6c0pYTnfAVKSp5S/n2nWnn2kgLA993Pq5k1zUmB1Dd5OhXOwZ6SwmcJKuZ7YVmNbzXr
         MXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636510; x=1738241310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uubn3B4AJmy/tkkVoElarXDljvIi0RFazkyKWEB01/Y=;
        b=LY/qzQRldYev6TIamRGp9swZiRTH9qMBtvIuBoW24a5Diqmim2L/QG0QAHwi1HQ6la
         p41VcfcYMQnTiDGZf/ZF3u3KYwiGZoVlkaw2KopQOl3Z4P6f5mgKTcVveIScz1AtYfXR
         kkegRysy9k77uBv02brhpeCU4+4HTi24wRp9yxhOphnTJvdTPrWe6oUEAWctCCDS50P8
         1q7Sq66Z7Vm9WVAq4XhGhfhpYTRVM7JmIsvszBs+2CYUqH07lfRzChcRSMIv7FLF/k8B
         j55zKypuAV22u2uUJNz31WsyirLuVPSfmzq4KmOeNFR5h6syoOQPRQlA/RS39TA+cws+
         5LDQ==
X-Gm-Message-State: AOJu0Yxix8zhmmGPzwXBfGuNiXMMS0KWLOr/0VxfBIABYYgTTjtIF2KQ
	Pi1HQtcScS7jkIolIiWs5KzgpGS4+dL60pnPlFq68jnKugViOa4FpuSQ2vkABQ==
X-Gm-Gg: ASbGnctHQcvC7mJPE3/Eu2MnChZxqxfN9+u2TNky4mkqM3S59Pd/nxNDnUKNUKYTU/U
	awawretC5JIXKpN60gfrDx4XoUhZt2pIGkWwuf7wPuInPttzh7IgDlLfpfbQdWFHvY2Kklows8l
	DrsJcHbtUj3zZQCbobmiOSf0gEaqGKJ2gzJ+kSCJFDg5AoJjRwppFGHPSrhZveuWTAd1C1sAQiM
	sQvRbkKCmuQ0QcRSHBGtfJhW/rAKmSCqPH18U+V8gj1d8IVYRcxsng5DRIhUOd35uKZmADF5Mfu
	Om7nKw53DsUFVP3kcnELb3VhVMcKtnR+XGrgvzdDeAwKJFTs9vAGjyEbs3timQPpDg==
X-Google-Smtp-Source: AGHT+IFVUwsy25aSgRw3fH0pg96VhrfWu1tcolophVQZLaj0kx20uVVEJX2dBFKOinjlfWMlYreklw==
X-Received: by 2002:a5d:64e9:0:b0:38a:86fe:52b3 with SMTP id ffacd0b85a97d-38bf56639edmr22787558f8f.22.1737636510603;
        Thu, 23 Jan 2025 04:48:30 -0800 (PST)
Message-ID: <8e19c066-2d76-4f4d-9ccc-ed57e02143ab@suse.com>
Date: Thu, 23 Jan 2025 13:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC PATCH v5 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <cover.1737470269.git.teddy.astie@vates.tech>
 <Z5I59HC77QxpPtJG@mail-itl>
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
In-Reply-To: <Z5I59HC77QxpPtJG@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2025 13:45, Marek Marczykowski-Górecki wrote:
> BTW Linux says it detected "Xen version 4.19." - shouldn't it report
> 4.20 already at this point in release cycle?

Not only at this point, but throughout the release cycle. Yet I fear I
haven't seen such, so I wouldn't be able to look into it.

Jan

