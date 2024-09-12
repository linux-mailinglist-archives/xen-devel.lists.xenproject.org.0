Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF5976DCD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797643.1207644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solnW-0006hT-Vz; Thu, 12 Sep 2024 15:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797643.1207644; Thu, 12 Sep 2024 15:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solnW-0006fi-SO; Thu, 12 Sep 2024 15:31:54 +0000
Received: by outflank-mailman (input) for mailman id 797643;
 Thu, 12 Sep 2024 15:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1solnV-0006dq-Hf
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:31:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22b2df9e-711c-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:31:52 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so901607a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:31:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd77028sm6623256a12.62.2024.09.12.08.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 08:31:51 -0700 (PDT)
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
X-Inumbo-ID: 22b2df9e-711c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726155112; x=1726759912; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EiUVn6InG6t0YCw53UxerZ95gpf8vqdBn6I4Z+7ItCs=;
        b=o3mWv69jdZWkHyHks5cs9beOCPNeY6wDEjy8l2EYzV1VsYLMX3JWtTdZoCPUY4TnfX
         7+sYs8Wm2l7wWnzjRYiShdMJfK6bO8dMWrtjweS43dDj2FwjrwJDVUPGkuQvXP85ta8i
         tXGq8Jzp7ezAncyt3OJCpxbwJz2wN8cFDQJpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726155112; x=1726759912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiUVn6InG6t0YCw53UxerZ95gpf8vqdBn6I4Z+7ItCs=;
        b=ZjztwQvnPDd4k0wEqH27dK5N73DBAGLvk2um7TQ4vrd7JVlFoFx54O979nu1eDZLQs
         Yd4k+lqX85pka++yGXOLFhdp5kxglYI5R/Dbd+LeTWKWM2+Fd6tuawofpwNRzr8oZIOs
         zNIBLbGaDozBUuqYelQfyu/vvluuegIJu3YXbWJj2uJGsPb6Z0VdTTBrFILMI/LShmSG
         z1tUdoOOVvD59nPFE5ZsVUiImWWhCa9iB5ysTqs73O7p1L2L5MLxyIP1RJOFSQ5I1CXy
         5wtfKd/h0GlP8G1nDlOt95PyXynDIQD+Umc8/LDjCcBxXccXtVoqkjVdxKdI77mBoOKE
         oEKg==
X-Gm-Message-State: AOJu0YyPHHUGF3Nuq/wvvAmlCPV5Jdu/u3fOhZYlDDz9JYAFym7Cum4J
	U45t5Na9mb7/cMkBZER142lfwGvwvxS3B/xiMkj6F4CKoKDRRFadrkgn9CDb2r/YpK4eOoMzq9e
	n
X-Google-Smtp-Source: AGHT+IE+vBImW8CyMPwIvkMTuUhtmr7O+/zZGNdWNuIJ6YIfjC8WVPgs1ZTbkJUqULVgLLl1FLArTg==
X-Received: by 2002:a05:6402:2683:b0:5c3:f4ad:2304 with SMTP id 4fb4d7f45d1cf-5c413e10ce3mr2565554a12.10.1726155111621;
        Thu, 12 Sep 2024 08:31:51 -0700 (PDT)
Date: Thu, 12 Sep 2024 17:31:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: xen | Failed pipeline for staging | 221f2748
Message-ID: <ZuMJZsTgmLVpya-Y@macbook.local>
References: <66e2e41b9f8da_2ec0c1018481a@gitlab-sidekiq-catchall-v2-85fcd868d7-x8qhw.mail>
 <efdda482-3fea-476b-b911-15a63a188e50@suse.com>
 <ZuMEAMpg-Pi_n6v2@macbook.local>
 <54885d19-3efc-47b7-ad09-5bb99b4e3a05@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54885d19-3efc-47b7-ad09-5bb99b4e3a05@suse.com>

On Thu, Sep 12, 2024 at 05:13:04PM +0200, Jan Beulich wrote:
> On 12.09.2024 17:08, Roger Pau Monné wrote:
> > On Thu, Sep 12, 2024 at 04:30:29PM +0200, Jan Beulich wrote:
> >> On 12.09.2024 14:52, GitLab wrote:
> >>>
> >>>
> >>> Pipeline #1450753094 has failed!
> >>>
> >>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> >>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> >>>
> >>> Commit: 221f2748 ( https://gitlab.com/xen-project/hardware/xen/-/commit/221f2748e8dabe8361b8cdfcffbeab9102c4c899 )
> >>> Commit Message: blkif: reconcile protocol specification with in...
> >>> Commit Author: Roger Pau Monné
> >>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> >>>
> >>>
> >>> Pipeline #1450753094 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450753094 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> >>> had 13 failed jobs.
> >>>
> >>> Job #7809027717 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027717/raw )
> >>>
> >>> Stage: build
> >>> Name: ubuntu-24.04-x86_64-clang
> >>> Job #7809027747 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027747/raw )
> >>>
> >>> Stage: build
> >>> Name: opensuse-tumbleweed-clang
> >>> Job #7809027539 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027539/raw )
> >>>
> >>> Stage: build
> >>> Name: debian-bookworm-clang-debug
> >>
> >> I picked this one as example - Clang dislikes the switch to bool in
> >>
> >> --- a/xen/arch/x86/include/asm/mm.h
> >> +++ b/xen/arch/x86/include/asm/mm.h
> >> @@ -286,8 +286,8 @@ struct page_info
> >>          struct {
> >>              u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
> >>              u16 :16 - PAGETABLE_ORDER - 1 - 1;
> >> -            u16 partial_flags:1;
> >> -            s16 linear_pt_count;
> >> +            bool partial_flags:1;
> >> +            int16_t linear_pt_count;
> >>          };
> >>  
> >>          /*
> >>
> >> for places where that field's set using PTF_partial_set:
> >>
> >> arch/x86/mm.c:1582:35: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
> >>             page->partial_flags = PTF_partial_set;
> >>                                   ^
> >> I wonder why we're not using plain "true" there. Alternatively the change to
> >> bool would need undoing.
> > 
> > I'm hitting this locally when building with clang.
> > 
> > I find it confusing that the partial_flags field cannot possibly be a
> > flags field, for it having a width of 1 bit.
> 
> I meanwhile guess the idea may have been that the field could be widened
> if needed, and the low bit would then retain its present meaning. How
> well that would work out if a need for that arose I can't tell of course.
> 
> > I think my proposal would be to rename to partially_validated (or
> > similar) and set it using `true`, but that would also imply re-writing
> > part of the comment in struct page_info definition.
> 
> This may have been named just "partial" originally. Yet with the above
> maybe we really should switch back to uint16_t (for the time being; I'm
> unconvinced of the use of fixed-width types here, or in general when it
> comes to bitfields).

Seeing it's not straightforward how to fix this, I think it's best if
for the time being we revert this part of the change, going back to
use uint16_t for the field.

Thanks, Roger.

