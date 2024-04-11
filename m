Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42498A1FE0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 22:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704200.1100438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0fb-0002FG-KD; Thu, 11 Apr 2024 20:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704200.1100438; Thu, 11 Apr 2024 20:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv0fb-0002Cy-Gt; Thu, 11 Apr 2024 20:05:15 +0000
Received: by outflank-mailman (input) for mailman id 704200;
 Thu, 11 Apr 2024 20:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rv0fa-0002Cs-6z
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 20:05:14 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc09485-f83e-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 22:05:12 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6ea260f51b8so156120a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 13:05:12 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b3-20020ac86783000000b00430bddc75a5sm1307634qtp.23.2024.04.11.13.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:05:10 -0700 (PDT)
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
X-Inumbo-ID: cdc09485-f83e-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712865911; x=1713470711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e1XRXFV8O7eANmK8l6b+KFVGJ5AzU2POAqny7OawXFA=;
        b=NqrQZn4QAJ537kvc03TlL8vCE1N7ADYsXjDlI6XXyVZ84sGLMoUfWI/kVt7gONB8Tl
         oYFnyCHQJg0K6b53bDNUGc+ZJOXUbEi2kQar0TPRRfnu4pyDuxk2L69JwkOZiwZnSg2k
         U+B0nTIJZMsG42p4YaZ5YvBu2b4ahOCmq2zjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712865911; x=1713470711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1XRXFV8O7eANmK8l6b+KFVGJ5AzU2POAqny7OawXFA=;
        b=DFduJwgkzQyA1MO7IJ6c6FS0BYItNeLBHd+3hNq7mE8FZs/K7y77AqwX9nVTvXAE7Y
         uBiw9FJ9tH3DagRcXbRQSXGactWpIvBXPrM1sIzVH/5Y0c/FrFhfSbnttE3YLb6XzfEY
         ffoAjDF9SEO1da/HyDOk+wQpCeOGkqtfue7Dqc6Kc6wWjdPyMmkGxvMY1sGcxvUM2eFG
         smVKRP8gA1QcRmQ+Gg39u8zXV8Y6GQ48mnmPYpWQUdQVD4MFyMZb06ASknvt+0ZtFxBx
         Qsj6trJ3oXKsB63YieAHS0rbBU42j1iIXY7DJkX3pAT7JPutiUhW5sqD/PR3HMKgsUgw
         hW6g==
X-Forwarded-Encrypted: i=1; AJvYcCUgPLFL18gqW1ccUDbPkXgJwO2oGucnV4zPeVRQpKyNzcFlrNiWCDOz7Q6eiXdvB+Nxvrz7v1uFqbptA4ZXEXnAHSXoBNq3VQsUXtVvdjM=
X-Gm-Message-State: AOJu0YyTyFDMbFfg+rQszRyylMElrGSNF9KluZLFUTqkwCdxMezjGLRl
	XY1R3x05AJXPhciESb5b8rPlFH8OpxciKKXyeT2pcjdSDOAO3pkGDV/caqpfmsg=
X-Google-Smtp-Source: AGHT+IGKKvi5jwjQau3n674BN8FZ/22UpEqGnIvll7f4pPQ1Gn8VfbOZGUycBX5bNQl7XyjYFGkt/w==
X-Received: by 2002:a05:6808:c2:b0:3c6:1477:3b0a with SMTP id t2-20020a05680800c200b003c614773b0amr669549oic.19.1712865911324;
        Thu, 11 Apr 2024 13:05:11 -0700 (PDT)
Message-ID: <4bf2e6ea-a7fc-4cc6-aefe-4a9ed9ae97e1@citrix.com>
Date: Thu, 11 Apr 2024 21:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/3] x86/iommu: Drop IOMMU support when cx16 isn't
 supported
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1712580356.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1712580356.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2024 2:02 pm, Teddy Astie wrote:
> All hardware that supports VT-d/AMD-Vi that exists also supports cx16 (aside
> specifically crafted virtual machines).
>
> Some IOMMU code paths in Xen consider cases where VT-d/AMD-Vi is supported
> while cx16 isn't, those paths may be bugged and are barely tested, dead code
> in practice.
>
> Disable IOMMU in case we have IOMMU hardware but no cx16, then cleanup
> no-cx16 handling logic from VT-d and AMD-Vi drivers.
>
> Teddy
>
> Changed in v2:
>
>  * Added cleanup no-cx16 code for x2APIC
>  * Fixed commit and code formatting
>  * Added missing Suggested-by note
>
> Teddy Astie (3):
>   VT-d: Disable IOMMU if cx16 isn't supported
>   AMD-Vi: Disable IOMMU if cx16 isn't supported
>   VT-d: Cleanup MAP_SINGLE_DEVICE and related code
>
>  xen/arch/x86/apic.c                         |  6 ++
>  xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++------
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
>  xen/drivers/passthrough/vtd/intremap.c      | 65 ++++-----------
>  xen/drivers/passthrough/vtd/iommu.c         | 92 +++++++--------------
>  xen/drivers/passthrough/vtd/vtd.h           |  5 +-
>  6 files changed, 71 insertions(+), 145 deletions(-)
>

Sorry, but you've sent out two copies of each patch in this series, and
it's not clear if they're identical or not.

Please could you send out another version, making sure there's only one
of each patch.

Also, you need to swap ENOSYS with ENODEV, as per Jan's review on v1.

Thanks,

~Andrew

