Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86094976D11
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797614.1207603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solRF-0000z8-Jf; Thu, 12 Sep 2024 15:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797614.1207603; Thu, 12 Sep 2024 15:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solRF-0000wx-Fq; Thu, 12 Sep 2024 15:08:53 +0000
Received: by outflank-mailman (input) for mailman id 797614;
 Thu, 12 Sep 2024 15:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1solRE-0000wl-2V
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:08:52 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb12973f-7118-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:08:51 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so1338913a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:08:51 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41d3bsm6682311a12.8.2024.09.12.08.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 08:08:49 -0700 (PDT)
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
X-Inumbo-ID: eb12973f-7118-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726153730; x=1726758530; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eln1X/qcdtfS+SGi0t9Q6BC8AJC3JNGifFVna1feH60=;
        b=bhkS0eeCeGlTr3HhXH8mSs0XElCbvxuWJjDGBbkcSVbBJzXrGkYJRz6SFljE4C+ynq
         2IjJaRsho6WCVxdE72UCSv+5fKi+lGMqH6IOKZrN1Y5my2qynCuE8pWaUDN3UBFACDlO
         zD+XnJdYbRuJihxtg4jfUYOOSLQhU+fZNC0io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153730; x=1726758530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eln1X/qcdtfS+SGi0t9Q6BC8AJC3JNGifFVna1feH60=;
        b=nec5eC861CjqwmeDV8GuKUYf0JAblSc77uFE1ZayguTyLIBbvFj83UMVnNkGXMjTjI
         jATTyu5Iwf23cRyqeqCWVvhnDx0Y+oMoVovWcC4jKbUgdey+tuGmBISgDspb15GuFtNu
         QiMPBcADu+xuzoqxOswrft3WHcn3xtEMS6kMCljdbNrbFmrxUx7jreXiDdtjJYVhHMn8
         S8V8jNoFKVVlaeG1dTbcQjZ7YTsX0fqX6mtnQYqguoNqtgvY03Aclgpkqh4pHKkSL3Rv
         3PsjqZMdRVTWyjNAlNOJqqMrADuPKGq8BazUttUFSHo/NCZAll0ojtCJ3fOS+kBofJ/M
         sh0Q==
X-Gm-Message-State: AOJu0Yz83eTnEoei2mm3Rk6oa9vMgbh5JM8zO/msLqcfuIQEzYK/BbtT
	cDEuObtCcRL8NCOlvj3+t/C25K1J+TC+cGoGnEDxjG6qrcpH6vccafpjeMgGlY29CSVVAVy3d9q
	R
X-Google-Smtp-Source: AGHT+IHfGcUYS7zJeNxYvP24+z+U8wme0t0LtocYcbjFUT/9dY0Z3K5Wo4qYC3hYGb/yqBVaA5zaDQ==
X-Received: by 2002:a05:6402:520e:b0:5c2:4cbe:abfc with SMTP id 4fb4d7f45d1cf-5c413e094e0mr3138725a12.2.1726153729735;
        Thu, 12 Sep 2024 08:08:49 -0700 (PDT)
Date: Thu, 12 Sep 2024 17:08:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen | Failed pipeline for staging | 221f2748
Message-ID: <ZuMEAMpg-Pi_n6v2@macbook.local>
References: <66e2e41b9f8da_2ec0c1018481a@gitlab-sidekiq-catchall-v2-85fcd868d7-x8qhw.mail>
 <efdda482-3fea-476b-b911-15a63a188e50@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efdda482-3fea-476b-b911-15a63a188e50@suse.com>

On Thu, Sep 12, 2024 at 04:30:29PM +0200, Jan Beulich wrote:
> On 12.09.2024 14:52, GitLab wrote:
> > 
> > 
> > Pipeline #1450753094 has failed!
> > 
> > Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> > Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> > 
> > Commit: 221f2748 ( https://gitlab.com/xen-project/hardware/xen/-/commit/221f2748e8dabe8361b8cdfcffbeab9102c4c899 )
> > Commit Message: blkif: reconcile protocol specification with in...
> > Commit Author: Roger Pau Monné
> > Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> > 
> > 
> > Pipeline #1450753094 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450753094 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> > had 13 failed jobs.
> > 
> > Job #7809027717 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027717/raw )
> > 
> > Stage: build
> > Name: ubuntu-24.04-x86_64-clang
> > Job #7809027747 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027747/raw )
> > 
> > Stage: build
> > Name: opensuse-tumbleweed-clang
> > Job #7809027539 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027539/raw )
> > 
> > Stage: build
> > Name: debian-bookworm-clang-debug
> 
> I picked this one as example - Clang dislikes the switch to bool in
> 
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -286,8 +286,8 @@ struct page_info
>          struct {
>              u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
>              u16 :16 - PAGETABLE_ORDER - 1 - 1;
> -            u16 partial_flags:1;
> -            s16 linear_pt_count;
> +            bool partial_flags:1;
> +            int16_t linear_pt_count;
>          };
>  
>          /*
> 
> for places where that field's set using PTF_partial_set:
> 
> arch/x86/mm.c:1582:35: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
>             page->partial_flags = PTF_partial_set;
>                                   ^
> I wonder why we're not using plain "true" there. Alternatively the change to
> bool would need undoing.

I'm hitting this locally when building with clang.

I find it confusing that the partial_flags field cannot possibly be a
flags field, for it having a width of 1 bit.

I think my proposal would be to rename to partially_validated (or
similar) and set it using `true`, but that would also imply re-writing
part of the comment in struct page_info definition.

I can prepare a patch if this is deemed appropriate.

Thanks, Roger.

