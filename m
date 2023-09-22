Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739377ABA5B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 22:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606989.945133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjmMl-0006IA-7J; Fri, 22 Sep 2023 20:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606989.945133; Fri, 22 Sep 2023 20:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjmMl-0006Fi-4Y; Fri, 22 Sep 2023 20:03:07 +0000
Received: by outflank-mailman (input) for mailman id 606989;
 Fri, 22 Sep 2023 20:03:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5esq=FG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qjmMj-0006FX-Et
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 20:03:05 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e797ca-5983-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 22:03:02 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4054f790190so4917575e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 13:03:02 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c300900b003fe407ca05bsm4168486wmh.37.2023.09.22.13.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 13:03:01 -0700 (PDT)
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
X-Inumbo-ID: 08e797ca-5983-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695412981; x=1696017781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h6CVIWV6uAepyKg/re31PSIo9QSntPfiwd1DIrFOUFc=;
        b=OcEw23bY+JpM+RzMNzHTmjjlCm9mvWAJU5PSOCmxkb6hUgYxnTZmV8zwIfaqkdeutQ
         hy7ktISaAT5YLGLuM3xyxhrTywnx8xTlDKQTOQ9TvAIdd3dBVSmYpHL2PoqkehyOKDNI
         M7FvFvT9n3jlCMjVkW/6a+uH2kRfz8zyFPgxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695412981; x=1696017781;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6CVIWV6uAepyKg/re31PSIo9QSntPfiwd1DIrFOUFc=;
        b=QaWCqjQ0jGl+rOJtyFsPbKWBpJgx9Z7Y13vbbjfavbbeKC6xAV4hjjXhDOjJzbY/lL
         cm5K4sSk3MOXli76ZjHdGO6zk8eX1z8GrMrH6LEVMGbmX80qh3yhV3yDw7HNvoii3lTV
         /BkgoU0nfcwmDnQuny7TYdTOXmKws1I/fYd4hEC2Bgcy2Syb72j/uQugzgH+WvH5CvQe
         AV6ZXxr0v7NmNVwJeIP8M0kk8Ep4rGVrakpRUrGVTjzNY62+BMenofcP0ehmhDl4adMr
         2AYdIjH65hqCJSyBaMeohVJ88AxOt84W6IObnVZe+CZYgfBjoPsNuRGIl3AzCmkou+LZ
         abAg==
X-Gm-Message-State: AOJu0YwZKvh9MSjUOtYEx5jp0CXh0X2m6WTgIgMXToVahlbzX/QOkrhf
	3hFLvWcD6JsMKwvljAzrYAj0cg==
X-Google-Smtp-Source: AGHT+IHjQFUQkR8JRwXzUoh3J1Th8Pq6ONePPjZP0WWzVDdLDccHTzRw2F5ZWKAUyZydORsaQ/ueYw==
X-Received: by 2002:a7b:c8d0:0:b0:402:fec4:fddc with SMTP id f16-20020a7bc8d0000000b00402fec4fddcmr313388wml.17.1695412981564;
        Fri, 22 Sep 2023 13:03:01 -0700 (PDT)
Message-ID: <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
Date: Fri, 22 Sep 2023 21:03:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
In-Reply-To: <20230808130220.27891-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Several things.

First, Shawn: PPC has gained a HAS_PDX, the deletion of which needs
merging into this patch.

It was added as part of 4a2f68f909304 which was "minimal to build". 
This series address the issue you presumably encountered where pdx.c
appears to be optional but wasn't.


Do PPC platforms have (or potentially have) sparse RAM banks?

If like x86 the answer is definitely no, then you want to have
PDX_COMPRESSION=n

If the answer is definitely yes always, then you want PDX_COMPRESSION=y

If the answer is system specific, then you want to offer users a choice.


On 08/08/2023 2:02 pm, Alejandro Vallejo wrote:
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0d248ab941..2c1d1fc3a2 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -23,6 +23,16 @@ config GRANT_TABLE
>  
>  	  If unsure, say Y.
>  
> +config PDX_COMPRESSION
> +	bool "PDX (Page inDeX) compression support" if EXPERT

This still needs hiding on x86.  The minimal hack for 4.18 is "if EXPERT
&& !X86".

Other adjustments needed depending on the PPC answer above.

> +	default ARM
> +	help
> +	  PDX compression is a technique that allows the hypervisor to
> +	  represent physical addresses in a very space-efficient manner.
> +	  This is very helpful reducing memory wastage in systems with
> +	  memory banks with base addresses far from each other, but carries
> +	  a performance cost.

This is still intractable for a non-Xen-maintainer, and inaccurate. 
Whether you get any benefit at all depends on how the sparseness happens
to line up.

---
PDX compression is a technique designed to reduce the memory overhead of
physical memory management on platforms with sparse RAM banks.

If your platform does have sparse RAM banks, enabling PDX compression
may reduce the memory overhead of Xen, but does carry a runtime
performance cost.

If your platform does not have sparse RAM banks, do not enable PDX
compression.
---

~Andrew

