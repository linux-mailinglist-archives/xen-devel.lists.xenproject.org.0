Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61B8B955C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 09:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715622.1117403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qyf-0001N6-O4; Thu, 02 May 2024 07:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715622.1117403; Thu, 02 May 2024 07:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qyf-0001Ju-JG; Thu, 02 May 2024 07:35:37 +0000
Received: by outflank-mailman (input) for mailman id 715622;
 Thu, 02 May 2024 07:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPCJ=MF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s2Qye-0001Jd-AT
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 07:35:36 +0000
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [2607:f8b0:4864:20::b36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 901d0bcd-0856-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 09:35:35 +0200 (CEST)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-de61424f478so2820799276.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 00:35:35 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 g22-20020ac842d6000000b0043c97f30fa7sm225305qtm.77.2024.05.02.00.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 00:35:32 -0700 (PDT)
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
X-Inumbo-ID: 901d0bcd-0856-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714635334; x=1715240134; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7NTaJf/kheUfuUyMCZYF3yIWqHiMxkIdVbpzQ+sC7Hg=;
        b=mTXyct08Jnkzy21vZOShJSUVLlXg2a3v+A4E+h1fvArOLmM8iPjqDCf4fRRhBw4pGN
         G6X0qvzsQm19mAC3Rt0Oav2gwMi+D8KsgxaEZKf6hjq8iwRGwBZyq2sbA0L+9V2TWVhT
         ssuBQEt9dytjXrbNUwhKCxRG6UEA19FoIjrfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714635334; x=1715240134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NTaJf/kheUfuUyMCZYF3yIWqHiMxkIdVbpzQ+sC7Hg=;
        b=TDZW2wPx3jMYdQcCFIk2rNJABqaZd+c/ZTZKL+CUh5xbAJmTvtmQkKp+52uobeA2wN
         3tBV/MHlS5vLDAEOcrGbAtUXiXvnrhCqUVnG1/HGXHeGkY38enTZRqOSM9scK8BCYYZ9
         ujGidHJ48okWlhK8sn03fBpS200Q1gFiWK6ILz5svSqKcVcnM6/3RYoKfd3oghDxfd8x
         avzloS9EX5O36N8lw9X71fXv7atsU7074LTw4KcRuvFE+jv7wJVN8mcGyzfA4ys8DtuH
         fPb+nrEZMufoEg2MymTHiFWydJDZHGdG6kc87/pJwmR5+IS0pd1oufI142NrkLACsZ24
         XspA==
X-Forwarded-Encrypted: i=1; AJvYcCV8hovtxqPRhQ4xYCw4dJkB2w5xreMljulUr23gPVQMToh/9c7vrpYNqGSvI7uv7MG/+qtK/74f/EAkz9u4twYiwb7nnMGFwVhi8I1t5kU=
X-Gm-Message-State: AOJu0YzjvvshZBzDfR+Sal/+bzm+2BuG7hVNHtuJfkdlgoAAOyGCxcVe
	xwaLvsEzP3wdHNMVg1xeSjAKBdCUX005rGOrCvXT8I1m4LDfD5H11mIZu9Cgzys=
X-Google-Smtp-Source: AGHT+IEUqaHnHOBWiYzK60R9TTvVOL06sVbW91eIoJi9LU/GZkBpRs44D+hAYXeEcadIwOPCC1vN/g==
X-Received: by 2002:a05:6902:4e4:b0:dd1:40cf:942b with SMTP id w4-20020a05690204e400b00dd140cf942bmr4517732ybs.48.1714635332477;
        Thu, 02 May 2024 00:35:32 -0700 (PDT)
Date: Thu, 2 May 2024 09:35:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19] ppc/riscv: fix arch_acquire_resource_check()
Message-ID: <ZjNCQiR2uUR5Iz8Q@macbook>
References: <20240430153423.80875-1-roger.pau@citrix.com>
 <0f39a067-70d2-4652-910a-5d05db6a3ebc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f39a067-70d2-4652-910a-5d05db6a3ebc@suse.com>

On Thu, May 02, 2024 at 09:23:30AM +0200, Jan Beulich wrote:
> On 30.04.2024 17:34, Roger Pau Monne wrote:
> > None of the implementations support set_foreign_p2m_entry() yet, neither they
> > have a p2m walk in domain_relinquish_resources() in order to remove the foreign
> > mappings from the p2m and thus drop the extra refcounts.
> 
> While I don't mind the cod adjustment into the more safe direction, I find
> this justification odd: RISC-V has no domain_relinquish_resources() at all
> right now, and PPC has it properly as a stub only. Judgement on what there
> is (or not) can only be made one non-stub implementations exist.

Right, hence stating that foreign mappings are properly handled
(arch_acquire_resource_check() returning true) is bogus to me because
there's no code yet.

> IOW provided PPC and RISC-V people agree, I'm fine putting this in, but
> preferably with an adjusted description. To be honest with how you put it,
> it's not even really clear to me what (practical) problem, if any, you're
> trying to address.

The current statement is at best misleading, because there's no
implementation of set_foreign_p2m_entry() or
domain_relinquish_resources(), and hence making claims that future
implementation of them will properly handle foreign mappings could
lead to the special requirements of those mappings not being taken
into account when implementing those functions just because
arch_acquire_resource_check() already returns true.

IMO arch_acquire_resource_check() can only return true once the code
is in place, and mappings are properly handled.  Making claims about
yet to be implemented code is wrong.

Thanks, Roger.

