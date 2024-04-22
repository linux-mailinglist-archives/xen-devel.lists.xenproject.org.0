Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EC8AD34D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 19:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710173.1109265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxUf-0008LJ-Ex; Mon, 22 Apr 2024 17:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710173.1109265; Mon, 22 Apr 2024 17:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryxUf-0008I7-Bc; Mon, 22 Apr 2024 17:30:17 +0000
Received: by outflank-mailman (input) for mailman id 710173;
 Mon, 22 Apr 2024 17:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ryxUe-0008I1-FK
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 17:30:16 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa342a2b-00cd-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 19:30:13 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34665dd7744so3565276f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 10:30:13 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b00419f7b73c55sm8929813wmq.0.2024.04.22.10.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:30:12 -0700 (PDT)
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
X-Inumbo-ID: fa342a2b-00cd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713807013; x=1714411813; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ5alHH1hHZ3pF+Rs1b70jFUh/Wnv5VU4OREt5OFcLM=;
        b=G5BlRKV8lpoLsyOGBKla1DFASty4RqgFE9U0TNF3xpvGTMwOrCHFPlK6bCvgdN2xOF
         wH7uqS7S2RMOy6Wm6IwDbeKj/sij/rHQyDcN0G0Nh4MIK2Ht3I81JHhcIX8TAJeT4rXc
         eDE2ilxUoLzRQ7UrL95daN0+22x/1DLM3K574=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713807013; x=1714411813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ5alHH1hHZ3pF+Rs1b70jFUh/Wnv5VU4OREt5OFcLM=;
        b=HgNzgIgWECbcfu3zq1TpSWHuVqERFnv37oRebp61AtYdHNpV6H59sjjM82GEJjlolQ
         fr8IhOe8HWodGw0zrf/uxGcq4ro7ZkUpdH6UJwoZ3DDsHIW+uGw2wG2Fl0MVkxArP4tM
         +IRSxGKJs8BKcVKDFtbGa7fqo6/4uC1WoxctF+jiIKRkIJuxfyy4x0jKKThjUQIjVuqS
         KJXnRScqJaJ7NB0J6qXsPhl3Tw08Gb7yjNBYXQIYWz6yGRfnUlaW/rgE9uQn+XILQ/lY
         esTRxbY/2WmiCJAddnS2J/6fzhpbCHg9ioGcIQE0WSnGRL46HQ/2QBy2bdw2mGaAqCaq
         0N1w==
X-Gm-Message-State: AOJu0YwoPp144m+aulnEOETkWyEhm/Af/sNHoYLhlI3MSN7McIAP7Fch
	wGqbXFLwE1V6e6HeL8tskSYj+PWoXd9uUmTRKngZfmXOnTvWxfYlBLuxZa5PDKVssOHetTbeURG
	K
X-Google-Smtp-Source: AGHT+IFmq+qXW0VFqFjfqLZsNc5yY/rabr5J/2FZRgq+Zs+rmYtpAxk8sYC+Gojny5DRvc+Lp2stOA==
X-Received: by 2002:a5d:404c:0:b0:34b:640e:ad0e with SMTP id w12-20020a5d404c000000b0034b640ead0emr64709wrp.31.1713807013196;
        Mon, 22 Apr 2024 10:30:13 -0700 (PDT)
Date: Mon, 22 Apr 2024 18:30:11 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/5] x86: Add usage() to print out usage message
Message-ID: <4b0a2abe-8bc8-42cd-9e18-4d654bdb4249@perard>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
 <20240416091546.11622-4-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416091546.11622-4-fouad.hilly@cloud.com>

On Tue, Apr 16, 2024 at 10:15:44AM +0100, Fouad Hilly wrote:
> Refactor xen-ucode tool by adding usage() to handle usage\help messages
> As we add more command options this will keep help\usage messages in common block
> 
> [v2]
> 1- Improved message description.
> 2- Fixed formatting and indentation.
> 3- Error message to print to stderr.
> 
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---
>  tools/misc/xen-ucode.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index c6ae6498d659..0c0b2337b4ea 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -17,6 +17,15 @@ static xc_interface *xch;
>  static const char intel_id[] = "GenuineIntel";
>  static const char   amd_id[] = "AuthenticAMD";
>  
> +static void usage(const char *name)
> +{
> +    printf("%s: Xen microcode updating tool\n"
> +           "Usage: %s [microcode file] [options]\n"
> +           "Options:\n"
> +           "show-cou-info   show CPU information and exit\n",

Don't change the usage message just yet. It still is
    "Usage: %s [<microcode file> | show-cpu-info]"

The current one mean we can run one of:
    ./xen-ucode ucode.bin
    ./xen-ucode show-cpu-info

The proposed help message in this patch mean we could have one of:
    ./xen-ucode ucode.bin
    ./xen-ucode show-cpu-info
    ./xen-ucode ucode.bin show-cpu-info
But that last one is an error.

Thanks,

-- 
Anthony PERARD

