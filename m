Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1362A6E23D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 19:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925955.1328825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twmTY-0002cv-1X; Mon, 24 Mar 2025 18:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925955.1328825; Mon, 24 Mar 2025 18:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twmTX-0002a8-UV; Mon, 24 Mar 2025 18:24:39 +0000
Received: by outflank-mailman (input) for mailman id 925955;
 Mon, 24 Mar 2025 18:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jtpT=WL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1twmTW-0002a0-Cr
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 18:24:38 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3df48ca7-08dd-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 19:24:37 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e66407963fso8406280a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 11:24:37 -0700 (PDT)
Received: from [10.81.43.157] ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebcd0dfb33sm6486122a12.68.2025.03.24.11.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 11:24:35 -0700 (PDT)
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
X-Inumbo-ID: 3df48ca7-08dd-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742840676; x=1743445476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fmfTGaU4qWrkMM7zMF85OgI9e1HIGXGAW1TTXQ2BA8s=;
        b=fMKiquI9Im14MCupjBw++8uq5nY4/ezQ2bmosJqdVl2KiaRgOGl0pDXWyj6PsClS2w
         AQgwcPaVHMKTlg6wwPenMj6U3PcrNlylrIsX3M/989clwvv4SKve4z6UI+oFl4C/xRfL
         Y0P0rCNuHhIs9RYCdYHtFVAVGKL2xsNiti7Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742840676; x=1743445476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmfTGaU4qWrkMM7zMF85OgI9e1HIGXGAW1TTXQ2BA8s=;
        b=tn1VjIxzip/8uvKTEMQ039a8YUwwGwdxo2/7+gzreSUoQ64aUTsC22UX6RVGWN6GUb
         O09qa/bjh7zt4OS5MKcLMVNmz7nDTkbc7Iw+/kXYExKAZDWLypalVqu9VLyDtx5eDgRw
         FbPJpv8vn3nVQeJBeXY26OCLEsFPwBjg+MyyHzyBUqKX6qYSfdhgz8RmVTi+98MaLOQB
         CEEzzx7B/wMNnXRElRJP5lWlfPYLvshElAfrdNiZ8Gk0jD8LzVF4pk0JH/eWg6fGansN
         u2cE7VK1/5tRfvrwbXHSnB59CzFkqSqMMe3yBaxihd/rxl4BwpPuW+eMUqH+Lo5WKF7U
         JZXA==
X-Forwarded-Encrypted: i=1; AJvYcCVgdEX3hMwPuoegNWYEVQdUFRLZl25KF+KtcPrpsuLp46pcUWt0Jo6HeJmRzZqGu5FAo+EwjgUXhzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzso+NrfQkh1VINx+X+gTJEVr/bGZh4OaBSPe0c1aV2FqIgAWWW
	FEOw5AonTFSdKlnqYqxv2r9519EO/v1voYZNygMh98odghKDTQSPSeTqEWjqN25xVniN4nQi42t
	dXtY=
X-Gm-Gg: ASbGncu/aE/dq3LhurVRcm6piRbhaBJoGWGX07frjhprT3P8suyNOuMPH8u/+H+7Ake
	b5Xy7P+GssdGs6BSb8AQ4HF0LYdYA2HbT2NzUBbvcmQsCbgLRw2zYBLtsSU5mKEUVwPePa+MUby
	ZkJ+CMGGm/XebdTwKQoLdvyCSXuiATrIeIWRQ6CXIwnmEo1p9U5LuS5+g+4orD0y0ldxqFp6rBJ
	KXdTXMKv+d0Gkpv8vAiZCiEexf6Gabz3k2MLfGit5jYXTkqjPsHNB0ZkkLmw0b6NSIxzGTckfSP
	Ggoi708tWwA1uBSNW9TMs5d2cEq1EwpaTJELsMeMFFps5XwPqBbjeg==
X-Google-Smtp-Source: AGHT+IFtHeSvVkCtn71Pltz22+B3XXbVehd9dRSgERAG1nzKmLf6LI5y+e2b+aubXvaM0+d5aZhmiw==
X-Received: by 2002:a05:6402:510b:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5ebcd519938mr12104455a12.27.1742840676351;
        Mon, 24 Mar 2025 11:24:36 -0700 (PDT)
Message-ID: <6a039bc7-429d-4473-8a92-e5693dfd3fd9@citrix.com>
Date: Mon, 24 Mar 2025 18:24:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/PVH: account for module command line length
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <110f0966-0b89-48d6-b1b3-abae93802c19@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <110f0966-0b89-48d6-b1b3-abae93802c19@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/03/2025 12:03 pm, Jan Beulich wrote:
> As per observation in practice, initrd->cmdline_pa is not normally zero.
> Hence so far we always appended at least one byte. That alone may
> already render insufficient the "allocation" made by find_memory().
> Things would be worse when there's actually a (perhaps long) command
> line.
>
> Skip setup when the command line is empty. Amend the "allocation" size
> by padding and actual size of module command line. Along these lines
> also skip initrd setup when the initrd is zero size.
>
> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Permit empty initrd with non-empty module command line again.
> v2: Use elf_round_up(). Introduce initrd_cmdline local. Re-base.

I wasn't making a request to support an empty module with a non-empty
cmdline.

That's a nonsense configuration; it's almost certainly an error
elsewhere, rather than an intended configuration.

I was simply requesting that the implications are considered, and
discussed, rather than silently dropping.

We ought to exclude such cases centrally, rather than locally in the PVH
path.

>
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -652,9 +652,10 @@ static int __init pvh_load_kernel(
>      unsigned long image_len = image->size;
>      unsigned long initrd_len = initrd ? initrd->size : 0;
>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
> +    const char *initrd_cmdline = NULL;
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
> -    size_t extra_space;
> +    size_t extra_space = 0;
>      paddr_t last_addr;
>      struct hvm_start_info start_info = { 0 };
>      struct hvm_modlist_entry mod = { 0 };
> @@ -712,10 +713,26 @@ static int __init pvh_load_kernel(
>       * split into smaller allocations, done as a single region in order to
>       * simplify it.
>       */
> -    extra_space = sizeof(start_info);
> -
>      if ( initrd )
> -        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
> +    {
> +        extra_space = elf_round_up(&elf, initrd_len);

I'm going to insist on not doing this.  For the sake of anyone (else)
trying to follow this logic.

You're trading increased cognitive complexity of the logic to avoid
using one local variable.

~Andrew

