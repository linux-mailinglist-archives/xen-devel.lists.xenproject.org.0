Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88896E557
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 23:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791406.1201239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKRR-0005qI-SH; Thu, 05 Sep 2024 21:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791406.1201239; Thu, 05 Sep 2024 21:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smKRR-0005nS-P9; Thu, 05 Sep 2024 21:55:01 +0000
Received: by outflank-mailman (input) for mailman id 791406;
 Thu, 05 Sep 2024 21:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smKRP-0005nM-VT
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 21:54:59 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dc5e578-6bd1-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 23:54:58 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e1a74ee4c0cso1551910276.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 14:54:58 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5201dee3csm11304876d6.14.2024.09.05.14.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 14:54:55 -0700 (PDT)
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
X-Inumbo-ID: 7dc5e578-6bd1-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725573296; x=1726178096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b2e5JEWQZdTiB+8isTMfhLoS6lSugTbr9fVq/3FynJ8=;
        b=YZQlssdRNNaacx3FOONRQyHNYByEPR/xG9A6rsjOKnYSqY7CztitnkD7KpVWuZHK2W
         nNRaW6yhA31UImb17OddqVQLGwUoBgdhO1CM9/hxaen3lzp1aggVq3vWyO3lCy0CpJ7K
         2d5lBjOBP63xrQjZB75rumpn1ROinT+A12bpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725573296; x=1726178096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2e5JEWQZdTiB+8isTMfhLoS6lSugTbr9fVq/3FynJ8=;
        b=QBqOYzsI2riSPBUERKmLEERRnMnWX4JZEHVsfVn1qhFzWqZXBl9iSIo7OXSM+BYwxy
         fyEPnejE5GSrf44suSEWxbCQ3MB+MVOyZQNCOYUikTY+YNJDd3F9U3jhU9dgtlpc+jAY
         MVG8JnynU70d78zDn/Btg3v5kJYXZvGb47ztc1dt3cuG8pS3jiKqFoJYuzu2m3fwkW5G
         GRsUyCfd7fhQENtdbMgjvARm8hWveXVJMmeKP88NVFYchqTT2matSY5iz+gdbPca/QvO
         OEXdpyy2RwdwgX/dmSg/EOfYgkPj/Fp8Nih+Z0Etsf+80SEj0vDyIVsT3FSUzzWY2iSQ
         1GsQ==
X-Gm-Message-State: AOJu0YxJILrqpgCpNYSZz5cWGpooUcosB/JXpHsZUXHJfaFTDoqbG2ve
	GYEyAzh09UaZlJcduG5C5U4DZ6OdRkI5dw1PK6KxGgNqC1Mu3HnmgTpLNdoVkAeWu7QlG7uLE8p
	t
X-Google-Smtp-Source: AGHT+IGgJ45WlXamcHPOP96ql5qBF0ob06XFnreXF6TUNSL8pRRzrkaLw29uRu/y9v+zVIL18nwQjQ==
X-Received: by 2002:a05:6902:2203:b0:e1d:31d0:c8b3 with SMTP id 3f1490d57ef6-e1d348ba8bamr816617276.21.1725573296025;
        Thu, 05 Sep 2024 14:54:56 -0700 (PDT)
Message-ID: <418f7868-325b-4f6b-8d79-0882eaea4fd9@citrix.com>
Date: Thu, 5 Sep 2024 22:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [ping] Re: [PATCH 2/3] xen/ppc: Adjust ppc64_defconfig
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
 <20240621201928.319293-3-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240621201928.319293-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/06/2024 9:19 pm, Andrew Cooper wrote:
> All of CONFIG_SCHED_*, and CONFIG_HYPFS build fine.
>
> Add a stub for share_xen_page_with_guest(), which is all that is necessary to
> make CONFIG_TRACEBUFFER build.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342672505
>
> This is in aid of getting wider compiler coverage with the subseqeuent patch
> ---
>  xen/arch/ppc/configs/ppc64_defconfig | 6 ------
>  xen/arch/ppc/stubs.c                 | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/ppc/configs/ppc64_defconfig b/xen/arch/ppc/configs/ppc64_defconfig
> index 48a053237afd..4924d881a27c 100644
> --- a/xen/arch/ppc/configs/ppc64_defconfig
> +++ b/xen/arch/ppc/configs/ppc64_defconfig
> @@ -1,9 +1,3 @@
> -# CONFIG_SCHED_CREDIT is not set
> -# CONFIG_SCHED_RTDS is not set
> -# CONFIG_SCHED_NULL is not set
> -# CONFIG_SCHED_ARINC653 is not set
> -# CONFIG_TRACEBUFFER is not set
> -# CONFIG_HYPFS is not set
>  # CONFIG_GRANT_TABLE is not set
>  # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
>  # CONFIG_MEM_ACCESS is not set
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index 923f0e7b2095..a10691165b1b 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -333,3 +333,9 @@ void udelay(unsigned long usecs)
>  {
>      BUG_ON("unimplemented");
>  }
> +
> +void share_xen_page_with_guest(struct page_info *page, struct domain *d,
> +                               enum XENSHARE_flags flags)
> +{
> +    BUG_ON("unimplemented");
> +}


