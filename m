Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E3E84B2DD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 11:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676787.1053072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJ7C-0007EP-Io; Tue, 06 Feb 2024 10:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676787.1053072; Tue, 06 Feb 2024 10:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJ7C-0007CF-FN; Tue, 06 Feb 2024 10:55:46 +0000
Received: by outflank-mailman (input) for mailman id 676787;
 Tue, 06 Feb 2024 10:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+UH4=JP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXJ7B-0007C9-2W
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 10:55:45 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 459117fe-c4de-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 11:55:43 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a370e63835cso476695766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 02:55:43 -0800 (PST)
Received: from [10.80.67.148] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p27-20020a170906229b00b00a35a9745910sm994976eja.137.2024.02.06.02.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 02:55:41 -0800 (PST)
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
X-Inumbo-ID: 459117fe-c4de-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707216942; x=1707821742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7EGBs9t96C7x6Ctji4e+haWvBsMICLofs43/FPqB+k=;
        b=CG2qAfKyRboRsIFs3fowpV7ZV8WEBLdAnDZ3T/B7LXJ3c43DwAWuK8JL54Wpwx/9tE
         9ETlgf4uaVKhwjioMC2QuLxZtBJU5JHtnxbKE67Zq+2fHEqaKGxjB4MuIBzFg3F6wSnx
         3MvBXogib3fOFlNE7RhLjnXn1+gnLGQhOG0BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707216942; x=1707821742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7EGBs9t96C7x6Ctji4e+haWvBsMICLofs43/FPqB+k=;
        b=tkTFfZ6C8J3y6HvHWsn6YbHRY5Rl3IoWcliJBI8XaaMeVZfPmJN46fQ8x4lNPtwZGh
         QVNXfwo+db5UpbZkzGHslO0/lMEcbAb6+qiNjhTOJWjclkwifjQkQAHDqypEkmZxDgyS
         Dh09FyGqyiEVMMFsVqZET8k1QfDhxzAza3WBiJXUgrobrH0UNdai7Ww7HL6TpHzYVgio
         KldvrjWk/Msh3LjUvsA2+opTLhrUyQZ3/76cm2LONyUjtHaLOOaeGDx8FIEzDzTDt3CB
         RKDB5aiEEU72LXMWsj47DXox9CxhfoQpfR+xLZM9IIubQTOU4DEuC9dQbExFpPYKdnOG
         8XUg==
X-Gm-Message-State: AOJu0YyFjmypmwhAXOaqaQsxhP6aULF+ha+NxDlkPY5SoFe+gsQIzez9
	X7BrK1Aug4E7pLErFHpl7nlQIUQfA2tBr/k9FMm+tjP5MkOro8WYxlJajp9363k=
X-Google-Smtp-Source: AGHT+IGSvqqcsqfU2MPY9aUWvcirIzL2odXl28JYitWhL5z2xTHVwFC/tXyYO8yRNKow1ULFV5+bRg==
X-Received: by 2002:a17:906:3e4e:b0:a26:c9e6:d5e0 with SMTP id t14-20020a1709063e4e00b00a26c9e6d5e0mr1518283eji.74.1707216941973;
        Tue, 06 Feb 2024 02:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUTnqkMA/zXs7PZMVpAMNXUX+4Qnev6qFK0gUNA8wUI1QE95z7gmWNFk6V9xuLhKMqP8Rw6izHv0Qol71k9O4me3Aj755gm1ShYhpDtPs5yRgjlRrQYgXX5CdtKKl/jN3OTps8mzY3k+8B78R1VebnWzC2tz7t+UkXeiBf9+irl5u6FEwE0Logk4qeNq+VoLjlbNVf+cJhDGf9FrimX4AiLj/6ptTyP2mwOkfKw3TZGeBHEtIE6OzTfDZ5b4qcfvRdCvqlkcpsm7BkszRB1IWx2aoXP3CCDJGxMVJsP6yExm7NpCkG54bHdKKJohUT3zqoPgYtMQA4Q/YKTPDQDFLfW3ytY80iC0c5PzOkTj3xdFJ4UErTN0ITLs8nKxTv4y45Adie
Message-ID: <c0312e70-c11c-4b15-b6c9-457004b988d1@citrix.com>
Date: Tue, 6 Feb 2024 10:55:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Add configuration options for max_altp2m and
 max_nestedp2m limits
Content-Language: en-GB
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <9143475dddf8d0141fb3864ed90153591554a425.1707213019.git.w1benny@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9143475dddf8d0141fb3864ed90153591554a425.1707213019.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/02/2024 10:08 am, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
>
> This commit introduces the ability to configure the maximum number of altp2m
> and nestedp2m tables through boot-time parameters.  Previously, the limits were
> hardcoded to a maximum of 10 for both.  This change allows for greater
> flexibility in environments that require more or fewer tables, enhancing Xen's
> adaptability to different workloads and scenarios.
>
> Adjustments include:
> - Adding boot parameters `max_altp2m` and `max_nestedp2m` to allow setting
>   these limits at boot time.
> - Modifying various parts of the code to use these configurable limits instead
>   of the previous hardcoded values.
> - Ensuring that if the configured values exceed the maximum supported EPTP
>   entries, they are adjusted down with a warning logged.
> - Adjusting the initial allocation of pages in `hap_enable` from 256 to 2048
>   pages when `old_pages == 0`.
>
>   This change anticipates scenarios where `max_altp2m` and `max_nestedp2m`
>   are set to their maximum supported values (i.e., 512), ensuring sufficient
>   memory is allocated upfront to accommodate all altp2m and nestedp2m tables
>   without initialization failure.
>
> This enhancement is particularly relevant for users leveraging Xen's features
> for virtual machine introspection or nested virtualization support.
>
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Thankyou for the patch.  These fields should definitely be configurable.

I realise you're copying existing examples, but they happen to be bad
examples that we're trying to remove.  It is erroneous to believe that
there's one system-wide configuration that applies to all domains, and
this has been the source of too many bugs.

Instead, they should be parameters to the domain create hypercall, so
they can be chosen on a per-VM basis.

e.g. for some introspection tasks you only want 1 view + 1 alt per vCPU,
for usually only a single vCPU.

On the other hand, for nested-virt, you really need a minimum of two per
vCPU, and probably 4, and there's no architectural upper bound.


See the series adding vmtrace= support, which is the last time I plumbed
a number like this into the domain create hypercall.

You will want to split the patch into a series.  For each of option,
you'll want one patch plumbing the new parameter into the hypercall
(along with a suitable toolstack default, and sanity checking), and a
separate patch to rearrange Xen to use the new dynamic size.

~Andrew

