Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE3A61C68
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 21:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915378.1320902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttBW8-0001D3-AM; Fri, 14 Mar 2025 20:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915378.1320902; Fri, 14 Mar 2025 20:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttBW8-0001Ak-6k; Fri, 14 Mar 2025 20:20:28 +0000
Received: by outflank-mailman (input) for mailman id 915378;
 Fri, 14 Mar 2025 20:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ttBW7-0001AZ-J5
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 20:20:27 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3c83672-0111-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 21:20:26 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e61375c108so3284262a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 13:20:26 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816968bfbsm2312036a12.17.2025.03.14.13.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 13:20:24 -0700 (PDT)
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
X-Inumbo-ID: c3c83672-0111-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741983625; x=1742588425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5wMjfzLtEb/bi5LDuKwlW64dGVHZpMNyWVYDE3SWlfE=;
        b=uufGFfIQ/gPuHframATXd5/RuiJ7VQJAr/lWeMT0aVTvwB49wEOwiJTmbTGCR/OQlG
         L92PuNiJpETWFFE13TcZhuc96Uu326yDXvRR91RzL+7izjrv2kby59ORlrCn+522keBy
         Emlny1ovGPS16LQbFmky+JF0dw7o7jZTy1SlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741983625; x=1742588425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wMjfzLtEb/bi5LDuKwlW64dGVHZpMNyWVYDE3SWlfE=;
        b=d9K02JirAkekQ0Xy6b3l0QQVKdPiepUe4any3g8vKZeTc8/u1935tsqwpgtdmPm81Q
         /Vm0nHV2ELoDGQKQDRqMOmEh0aWRhJ7+ABJ0UufC0Hp2DYOx8tQs5mfR9IqW5UVY8ucG
         3RbmjoofgFOOBfkzgSTI4mzajOiBR77Rum1UJkqni9jQTKUCSBnRYTEwVvw4QFfZQTfw
         vzH48p+USLN7uWYE0bCObOmc8AUicby1lWiuJftrwUQLVp06CNoIbROaiKd550V43epK
         5SUWXPwRyf9tNWFzE9nQSza+QehNHf8xOPU18d8A3LD0QYVvogeIh8rdi46YXLLYmCDD
         hbLg==
X-Forwarded-Encrypted: i=1; AJvYcCXzVaCe+HMWYY27LyspmmOgfkuHjc+JwfXVSGMfwgnzwrngE2lLPy4XMBsZxIkOKWSdpiEN+pd+xR0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVYFDj6cBU+8mtYrBNZQktZsqop+5KaIk2e0GqXwDnOtEfyIAs
	s9DXy+B5IThGrihe9oxlxQulqXSSUILVjuXu8+Wi0+wIP9UAT7U12OCgXyB5dmA=
X-Gm-Gg: ASbGnctpHZD+3MgKzGpn+gmOa95sC3mLZ0hm8EgVG3mhW8WiaL+5OQgooll7LRcW18W
	nNLc6ZfMPBvfL6axga6nEZ6xq+M9G8r5RqyGdUazmGT1H9Ube6nUHnzil41S7kG7H7qf9o/tMS7
	tWzbwJcIaVJvqPK9NY2+N0hXfPYTi+b3H8/SjEor0Rok+NvTorfBp6KzJbvjz9XhOs3C1jsXT3q
	L24qay9dc8AzQ3ji0Vh/0c2puDD03wlNNVpyC/1XOT23xJ5aNoWoxL4zWVtXioIX09byGVzGgQq
	qJ1HSp/RdaxClqKYp8WoUMAxLtVDvRXcMYyd/UgnVMyqyFm5DRHhUDWjNK6Z5A0UOCRCU4bFLGy
	vkkI9/3UP/fAgjPvuk48=
X-Google-Smtp-Source: AGHT+IF/JGHAZtsJRAS2hezl81WAqJBvZ9Oxhm3QMYaYH3gudEh02GFgOflbqZcVYvIOVdXzgO2VcA==
X-Received: by 2002:a05:6402:35d4:b0:5e6:1838:e8c6 with SMTP id 4fb4d7f45d1cf-5e8a032c2b4mr4546803a12.22.1741983625401;
        Fri, 14 Mar 2025 13:20:25 -0700 (PDT)
Message-ID: <e9c35acc-007b-4b31-aa27-3a9b852fc0cb@citrix.com>
Date: Fri, 14 Mar 2025 20:20:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: add HVM-specific Kconfig
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250313023822.2523270-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250313023822.2523270-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 2:39 am, dmkhn@proton.me wrote:
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> new file mode 100644
> index 0000000000..2ca664f36f
> --- /dev/null
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -0,0 +1,76 @@
> +menuconfig HVM
> +	bool "HVM support"
> +	depends on !PV_SHIM_EXCLUSIVE
> +	default !PV_SHIM
> +	select COMPAT
> +	select IOREQ_SERVER
> +	select MEM_ACCESS_ALWAYS_ON
> +	help
> +	  Interfaces to support HVM domains.  HVM domains require hardware
> +	  virtualisation extensions (e.g. Intel VT-x, AMD SVM), but can boot
> +	  guests which have no specific Xen knowledge.
> +
> +	  This option is needed if you want to run HVM or PVH domains.
> +
> +	  If unsure, say Y.
> +
> +if HVM
> +
> +menu "Hardware Support for Virtualization"
> +
> +config AMD_SVM
> +	bool "AMD-V" if AMD && EXPERT
> +	default y
> +	help
> +	  Enables virtual machine extensions on platforms that implement the
> +	  AMD Virtualization Technology (AMD-V).
> +	  If your system includes a processor with AMD-V support, say Y.
> +	  If in doubt, say Y.
> +
> +config INTEL_VMX
> +	bool "Intel VT-x" if INTEL && EXPERT
> +	default y
> +	select ARCH_VCPU_IOREQ_COMPLETION
> +	help
> +	  Enables virtual machine extensions on platforms that implement the
> +	  Intel Virtualization Technology (Intel VT-x).
> +	  If your system includes a processor with Intel VT-x support, say Y.
> +	  If in doubt, say Y.
> +
> +endmenu

Looking at the end result, I'd suggest dropping the menu around SVM and VMX.

It would be nice to group them under a name called Vendor Support, but I
don't think the Kconfig language can express this, and the full menu
becomes empty if both AMD and INTEL are deselected.

Having them simply at the top of the HVM menu seems like the less bad
option.

There is a bunch of cleanup which should be done, but explicitly not in
this patch which is simply restructuring.  I'll do a patch in due course.

~Andrew

