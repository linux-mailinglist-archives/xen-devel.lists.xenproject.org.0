Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD1F9BD5D2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 20:25:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830487.1245488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8P9w-0006cP-VW; Tue, 05 Nov 2024 19:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830487.1245488; Tue, 05 Nov 2024 19:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8P9w-0006a1-ST; Tue, 05 Nov 2024 19:24:12 +0000
Received: by outflank-mailman (input) for mailman id 830487;
 Tue, 05 Nov 2024 19:24:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lM+p=SA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8P9v-0006Zu-73
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 19:24:11 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74a8a838-9bab-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 20:23:37 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5ceb75f9631so6113087a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 11:23:37 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6ac2995sm1673422a12.50.2024.11.05.11.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 11:23:36 -0800 (PST)
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
X-Inumbo-ID: 74a8a838-9bab-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MjkiLCJoZWxvIjoibWFpbC1lZDEteDUyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc0YThhODM4LTliYWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODM0NjE3LjI4Mzk0Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730834617; x=1731439417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=96F0JaD9VZMbzS013WBIHevjhSrZ/GfnGru7KzUez3U=;
        b=OOpP1jyz/wE7jSVeKHylMOp/VwVf7r4TPXepawcUlckD1Y9j5MfEpkBrla/oPmk21M
         PdNf7IMR2XyHRcOHWQVzqfdoTcLaWTU8kU4M/7n/pKTGjhWpKWD1k6uEn0w9/qivmc3F
         xL+oKSSD6xS+WXvCq8NxEMxmslo8xvW4EcMsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730834617; x=1731439417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96F0JaD9VZMbzS013WBIHevjhSrZ/GfnGru7KzUez3U=;
        b=YRD5GWRRoEAcNPV4BFvy+mPnyc2ftSGfbUHKS9xRLbquLGg8MSDFeiOJTaymxA813V
         voBvmhOV5T9ls1zE/g+koZugcbfwt7DS8QqnjuObTqP08abnyzHS2eS5NKVfAF+DXeFH
         AOyEJHd9hFjtnW46CxBtN9HWjB1EvmDVEnDkHEH52X2VUvF1Ymohql5wFIvbFZKepCtX
         S0ioBomcDBjbVI3cMjMjAynCPLw/U6N7k+LnzSgcIh9Pufikxt7Un+WZkD9MWSijX2TN
         7O1QER2e1qB7iDEWGslQO3bqom4g8ALwg5Nh9yu0OGg0eXX8A6U7MkkMWGSEs1p4cz4X
         SEMg==
X-Forwarded-Encrypted: i=1; AJvYcCXwpm9wSGpcdwERDALvwvELqNzyvCqTHEr7kZ7PcBZ8d28TG3b4QJKKhIz4cyMWgxwXE/fIcijPm/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKam6WxM/qB73pBPom5HSTHxEqbbPcsqIhLyIXEDzotcAc/85c
	2aZL4VEEF4WLRPXqHQJ43vi9YtXZg9E+BZCkzA6c7lSz69/bURFigTRO2dt4rUELzHUgNia/0wq
	k
X-Google-Smtp-Source: AGHT+IGe7tVfgVepUhmCPXAiHRyCFH6OAlm2Gemw2/3cQtHeK6RJoNg9Fi2sAAzFySyGHJQ9DnmHUQ==
X-Received: by 2002:a05:6402:1d38:b0:5ce:df0c:9a5 with SMTP id 4fb4d7f45d1cf-5cedf0c0a26mr4250414a12.15.1730834616604;
        Tue, 05 Nov 2024 11:23:36 -0800 (PST)
Message-ID: <89022703-f814-4d81-87ec-5651f5e950c4@citrix.com>
Date: Tue, 5 Nov 2024 19:23:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241105145507.613981-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/11/2024 2:55 pm, Frediano Ziglio wrote:
> diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
> index 447c0d3bdb..79ae8900b1 100755
> --- a/xen/tools/combine_two_binaries.py
> +++ b/xen/tools/combine_two_binaries.py
> @@ -67,13 +67,22 @@ if args.exports is not None:
>  
>  # Parse mapfile, look for ther symbols we want to export.
>  if args.mapfile is not None:
> -    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> +    symbol_re_clang = \
> +        re.compile(r'\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s{15,}(\S+)\n')
> +    symbol_re_gnu = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')

These are specific to the linker, not the compiler, so really should be
_ld and _lld rather than _gnu and _clang.

The build environment does have CONFIG_LD_IS_GNU which is used for one
LD vs LLD distinction.  It seems reasonable to re-use it here (so you're
not trying both regexes in the hope that one works), although you'll
need to plumb it into the script somehow because it's not exported into
the environment currently.


But, regexes are utterly opaque, and given that neither Binutils nor
LLVM document their map format, you really need to provide at least one
example of what a relevant mapfile looks like in a comment.

Looking at built-in-32.offset.map in it's gnu form, it's presumably
looking for the lines that are just a hex address and a name with no
other punctuation.

But the lld form is clearly different.

~Andrew

