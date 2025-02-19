Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF1A3BDE2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892773.1301726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkj1C-0003fT-5y; Wed, 19 Feb 2025 12:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892773.1301726; Wed, 19 Feb 2025 12:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkj1C-0003dF-2n; Wed, 19 Feb 2025 12:17:34 +0000
Received: by outflank-mailman (input) for mailman id 892773;
 Wed, 19 Feb 2025 12:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLUF=VK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tkj1B-0003TF-Ih
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:17:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e54c527-eebb-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:17:31 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso45571025e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:17:31 -0800 (PST)
Received: from [10.81.43.31] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d58f3sm17596738f8f.73.2025.02.19.04.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:17:31 -0800 (PST)
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
X-Inumbo-ID: 7e54c527-eebb-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739967451; x=1740572251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiB0H3djkiBrdEqPNlu/ZbyOsdVvUYhn3oufuIbn9XE=;
        b=SjpEXV3cw5a3hNeUhFZCsr7fvnmXMIq8mW3aiGRCXnyCLFxG+z63fhI9rsb+mANcJN
         AzTJYB2sQY7GlmONtUNZoJ8McJ38s85WM046nFKAXttdkwzhP/xyrZbO9mnHsKIXsCOw
         XIZUv+1sUESQTWCl9lkPgFA2sUhX5A9a7MFvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739967451; x=1740572251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiB0H3djkiBrdEqPNlu/ZbyOsdVvUYhn3oufuIbn9XE=;
        b=fIkCpK7AUGZcW3Fp/77M79bkouTSCuTV917BhARZbzMYzjqSdpJQSAqbYbfzkEB6lL
         oIBpj2YyOwiAFcXHWY52l7J6b/UAFyue6f6TNXzLmoRLgB27AZghriX3wtNIz3OCGw3I
         xDCkxGLjwsnYKdSsa5ISC/Kd5SpfgFxWmnM/WlQ3jYtV0NDG1+a0Kv0sNKjeGIki6IIT
         DX+INt0C00fz97LJH1FtRSOeKL5ytzC1++Ex4yqfrGTDeEYvY/csFhsSEUv/L6xhFKn2
         iEEtKtdmTbczo32lKjk9NJ8avwLjGa0/j5OOi+OJE2Zueca4m2RxQo1INVfWbv6654Bu
         IyJw==
X-Forwarded-Encrypted: i=1; AJvYcCWnpj0CCXOrxNOVw7P/WOIAp7BKM8XyUkhRo46eTMVfEY+0acFzG/CO7963PLH9oVob+V16mX4mIVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyX+s4yinOdsAXH8/rs7CYo6uDselR+b5AIlF5lTWHTVtGYD6Zi
	i8RZQ+fAveC7/1wP51UnybWdht7KRBL9b4cfpABjgfE/srCfjlvusBD0JKj0GZA=
X-Gm-Gg: ASbGncuO5ehMPoAG/QZTQhLC4fo0TALxdhZIlnC+Qjjxpwy1koQ6Bgl7OY1L3dxpLY1
	7lm+AyvoZAKytQ/Ngox3lC0DHi0BDy5cY5u6K2BnEcb8qFx7/pxQ2+5aZcA7T4FLujXdOf2Jqfj
	e0JjZpTZ8lzadVghIE8y23qfqbSgwQXDaQBiJ/jL2o/ZeYZ7tSPmnf3rWAlF8Yz7ukbMw7QChxJ
	AzwfJAkIbeJKGYyjPeiQG+pb2etZEUGVnX5bL/ujfAQb2kIs2cTjOPSspFKxezGhN1mk22yXDYE
	k9/k2u3L0eEpDH+tL8dP7f1V
X-Google-Smtp-Source: AGHT+IGQPgKAgq+XmchRv2+36qBcjhn2xOsGMDNEJxP/de2R24K6QXsY2e/kDrcewZptZD/TQt1esQ==
X-Received: by 2002:a05:600c:1910:b0:439:8dbc:1d0e with SMTP id 5b1f17b1804b1-4398dbc2311mr87236065e9.10.1739967451389;
        Wed, 19 Feb 2025 04:17:31 -0800 (PST)
Message-ID: <21dc9b2b-d99b-4dd5-a11d-13cc1bf6bb71@cloud.com>
Date: Wed, 19 Feb 2025 12:17:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC PATCH v6 07/11] iommu: Simplify hardware did management
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1739785339.git.teddy.astie@vates.tech>
 <56ac13967ba7dfbb229c65450c79f6838a3aee9f.1739785339.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Frediano Ziglio <frediano.ziglio@cloud.com>
In-Reply-To: <56ac13967ba7dfbb229c65450c79f6838a3aee9f.1739785339.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/02/2025 10:18, Teddy Astie wrote:
> Simplify the hardware DID management by allocating a DID
> per IOMMU context (currently Xen domain) instead of trying
> to reuse Xen domain DID (which may not be possible depending
> on hardware constraints like did limits).

Minor: here and in the title, did should be DID if it's the acronym, 
otherwise can be confusing.

...

Frediano


