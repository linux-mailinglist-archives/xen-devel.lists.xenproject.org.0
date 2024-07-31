Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BC94287C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 09:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768287.1179057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4Dk-0008OJ-MP; Wed, 31 Jul 2024 07:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768287.1179057; Wed, 31 Jul 2024 07:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ4Dk-0008MN-Jl; Wed, 31 Jul 2024 07:58:04 +0000
Received: by outflank-mailman (input) for mailman id 768287;
 Wed, 31 Jul 2024 07:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ4Di-0008Ly-Uz
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 07:58:02 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b491229-4f12-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 09:58:01 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7a1d436c95fso328619385a.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 00:58:01 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73ef379sm710828085a.62.2024.07.31.00.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 00:57:59 -0700 (PDT)
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
X-Inumbo-ID: 9b491229-4f12-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722412680; x=1723017480; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yqmKcKoW4Us5c+lnaqQaHWzQFFIntAsQwx6O25/I1KE=;
        b=VH+OWtXnniFx2cNqna6/RMSrXbL1Rcc9BRj+nGa0xOA8tbPo8DAB0BGilZFoF1cKjA
         JpQp0YeP02YMC9YLfD86CBBlo+UKQuPEJMnDfcphKGMQsqYiB1cJNGI1OgwMYlQS8wBZ
         m5JSQzw/LV+u+aS3vFARln7IClJY+zp2e+Rhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412680; x=1723017480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqmKcKoW4Us5c+lnaqQaHWzQFFIntAsQwx6O25/I1KE=;
        b=HB5ID9566FLr5bF3gFTw/OGVCiPuS5R7u/Hi5lDEZQOeE6PwYF+MU930GzTQESxrU1
         xjyAK0BpJcDto8KcdGIkJG5BOmiPdfi4k86wY5GbGxCeS0Ghxx04j9Y5xY0pruvAVrKi
         mtPbZe2PzwfRuwM806n6f3jXxYFZZ42n8y7Uk2WfyUQocAj8xPc5aNFaZyiXdGZ9XaQL
         6I9geZNf/7Kk+qtKVof9+kOcqWLlfAd9A5bz8dA2juAqSKrS5ka1BKp4KL+fY0dK6ykT
         3Yagmr7dSoXCfKAzo2YcTe6wi73r04Ss2EQBpiX26gAn9m+iC4yE8N8JCOwafcccFLZP
         Y7/w==
X-Forwarded-Encrypted: i=1; AJvYcCWJJzQLlzJOu+YpnQI+hMY8ddex6l+oLoxYlajGVCRFIdSE8kpZZaN4jLHqtd5v6jzfepC6PyZEd2JnEKPDKH6wgpkt+D68+dEfU3Eb2l4=
X-Gm-Message-State: AOJu0YyJf8rgjBrtYpYH8Hld5RPqrfeClUCUHbzq2ECP9X5RHlKGJewv
	n+vGPxJAMxVfasg4hn7w8anA/dw2urdJoaAMHFEuLI16vykm176yks9Gu2sXDT7tTdzCFWToYKZ
	j
X-Google-Smtp-Source: AGHT+IGsaWuMQvHs6e5UKZuVpI23gICyhl5CDawMXyHObB/KFk/VtPdimb4QPX5eirwr7GiJXywNrw==
X-Received: by 2002:a05:620a:244c:b0:79e:f932:7ca8 with SMTP id af79cd13be357-7a1e52fccccmr1661056185a.64.1722412679900;
        Wed, 31 Jul 2024 00:57:59 -0700 (PDT)
Date: Wed, 31 Jul 2024 09:57:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/dom0: fix restoring %cr3 and the mapcache
 override on PV build error
Message-ID: <ZqnuhBkM9hpSbSw1@macbook>
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-2-roger.pau@citrix.com>
 <5e5cc6b2-cdf3-4670-a2dc-2e23dc22d520@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e5cc6b2-cdf3-4670-a2dc-2e23dc22d520@suse.com>

On Wed, Jul 31, 2024 at 08:32:03AM +0200, Jan Beulich wrote:
> On 30.07.2024 17:28, Roger Pau Monne wrote:
> > One of the error paths in the PV dom0 builder section that runs on the guest
> > page-tables wasn't restoring the Xen value of %cr3, neither removing the
> > mapcache override.
> 
> s/neither/nor/ ?
> 
> > --- a/xen/arch/x86/pv/dom0_build.c
> > +++ b/xen/arch/x86/pv/dom0_build.c
> > @@ -825,6 +825,8 @@ int __init dom0_construct_pv(struct domain *d,
> >      rc = elf_load_binary(&elf);
> >      if ( rc < 0 )
> >      {
> > +        mapcache_override_current(NULL);
> > +        switch_cr3_cr4(current->arch.cr3, read_cr4());
> >          printk("Failed to load the kernel binary\n");
> >          goto out;
> >      }
> 
> Just below here we have
> 
>     bootstrap_map(NULL);
> 
> This too is wanted in the error case aiui. Happy to move it up immediately
> ahead of the if() while committing, so long as you agree. Then:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm happy with this, but note there are further instances of error
paths above this one that already don't remove the bootstrap mappings.

Thanks, Roger.

