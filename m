Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C68C2788
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 17:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719947.1122860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5S3I-0004Th-In; Fri, 10 May 2024 15:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719947.1122860; Fri, 10 May 2024 15:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5S3I-0004SA-Eh; Fri, 10 May 2024 15:20:52 +0000
Received: by outflank-mailman (input) for mailman id 719947;
 Fri, 10 May 2024 15:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5S3G-0004S4-Bz
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 15:20:50 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e08bab29-0ee0-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 17:20:48 +0200 (CEST)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3c98b66c5f9so1260214b6e.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 08:20:48 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1cccf3sm18098816d6.86.2024.05.10.08.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 08:20:46 -0700 (PDT)
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
X-Inumbo-ID: e08bab29-0ee0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715354447; x=1715959247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2HZxSem/Mq8C06oiBy6tz2P6HbSGkkWucCT4/70iKno=;
        b=rUcyGXKgnbnEcF/w3wFzMlrcPU6CxJragL5RA82Z4oo5BUpzF8y0gsu+IZa77KMsrD
         gZeWyumtQg+dNeyWKf1BYMW0Pk7HQs6y6PzcS/N8CrKTXbTPJtrAsUYHgMG6Lff0InYS
         GQic9w1D9Oy9M8sAzKaW5pFDsaixDi+9aH3Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715354447; x=1715959247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HZxSem/Mq8C06oiBy6tz2P6HbSGkkWucCT4/70iKno=;
        b=I79QuIdmJDANeo6FrRwvZ2+lNVx9msGa151fCAEIahST06ASFBFqyyzJxaCMjY206o
         UZna/97XeRnDDZGqzHvBmiXSVvuTncTWouWkDJCQx08RdOaDHSrNqACyK2NG0n3QLqP/
         oxzHU0XI4xmcDi/ZjNIUTHM7S5O22HZ+wasRWi7hH4k0qH5SEkoPQfebxpb0mM3A3330
         mwqvWAo1sDB9z9d3r0EAuJIhY4ynreBC9gd0LP2G5pTr5RUJb8EqECeo70T9UT+FpML9
         4igNn56kRkLcM09HkODPljvSkbqREneAhUpuVcZTEuu5UszeAeg4mmOw2TJDJUEVjJUS
         o1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9F2vCeT6/28nvgV4kGpbJoQLyI6gyu1n0C7bDK7mAgXmppdHw/eK8lkJq7vWgw+W4/6cqKn54NeqKMuaDuZu0qrUtoVO8zp5lJY8Yp+Q=
X-Gm-Message-State: AOJu0YxU57vGFnQPsNbD6Y5nUZs9kr6OIbLqpDemzGdI+qbyHzKxRXPz
	zr73E/xzGOjQAQo8dWEcKJ6VIHH5V/n1qm2VXjQSq5C2MmSymu9nru8mzy7oFhQ=
X-Google-Smtp-Source: AGHT+IGztjJm6j3+zuVyHiPtl7OVt1FKtDVfdX+zCJuHrN+GPKlsAPa8r+pNKroFQwicOWH9nCsIXw==
X-Received: by 2002:a05:6808:2208:b0:3c7:4976:7953 with SMTP id 5614622812f47-3c99702a800mr3613347b6e.3.1715354446880;
        Fri, 10 May 2024 08:20:46 -0700 (PDT)
Message-ID: <df58677c-d9a3-43a7-b5b4-85565ad73b12@citrix.com>
Date: Fri, 10 May 2024 16:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] libxl: fix population of the online vCPU bitmap
 for PVH
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Oleksii K ." <oleksii.kurochko@gmail.com>,
 Arthur Borsboom <arthurborsboom@gmail.com>, Leigh Brown <leigh@solinno.co.uk>
References: <20240510124913.49945-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240510124913.49945-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2024 1:49 pm, Roger Pau Monne wrote:
> libxl passes some information to libacpi to create the ACPI table for a PVH
> guest, and among that information it's a bitmap of which vCPUs are online
> which can be less than the maximum number of vCPUs assigned to the domain.
>
> While the population of the bitmap is done correctly for HVM based on the
> number of online vCPUs, for PVH the population of the bitmap is done based on
> the number of maximum vCPUs allowed.  This leads to all local APIC entries in
> the MADT being set as enabled, which contradicts the data in xenstore if vCPUs
> is different than maximum vCPUs.
>
> Fix by copying the internal libxl bitmap that's populated based on the vCPUs
> parameter.
>
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Link: https://gitlab.com/libvirt/libvirt/-/issues/399
> Reported-by: Leigh Brown <leigh@solinno.co.uk>
> Fixes: 14c0d328da2b ('libxl/acpi: Build ACPI tables for HVMlite guests')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Note that the setup of hvm_info_table could be shared between PVH and HVM, as
> the fields are very limited, see hvm_build_set_params() for the HVM side.
> However this late in the release it's safer to just adjust the PVH path.
>
> Also note the checksum is not provided when hvm_info_table is built for PVH.
> This is fine so far because such checksum is only consumed by hvmloader and not
> libacpi itself.
>
> It's a bugfix, so should be considered for 4.19.

Bugfixes are still completely fair game at this point.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

