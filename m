Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56FB325BC5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 03:55:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90029.170214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTGa-0008S7-Cb; Fri, 26 Feb 2021 02:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90029.170214; Fri, 26 Feb 2021 02:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTGa-0008Rn-5u; Fri, 26 Feb 2021 02:54:08 +0000
Received: by outflank-mailman (input) for mailman id 90029;
 Fri, 26 Feb 2021 02:54:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwhq=H4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFTGY-0008Ri-AC
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 02:54:06 +0000
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ece3d12b-4cb2-4ea1-9927-50937eb35806;
 Fri, 26 Feb 2021 02:54:05 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id a13so8380764oid.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 18:54:05 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l18sm1398983oii.56.2021.02.25.18.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 18:54:04 -0800 (PST)
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
X-Inumbo-ID: ece3d12b-4cb2-4ea1-9927-50937eb35806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P4OdgG6z7Av8k6lGMJPzVygrES10A/qyrnU/AHVrDFs=;
        b=ADg5Nv/HDtjmdlnzW3eVmOFKXZBbFKXd0UCM5nzSH3inqR6VHvGlzX5nMnMObZT83H
         mJiDxU83hdXzVMb/4hLi8Pwv+AmrCgt4hQ61qp1aZ0TDlsMm7jHa6uvT6RN1tt+xHh8V
         ulRmah5nI/ODKbX3ivcegDCPNLjaDWD9bhK0woky/puvClKwsdlGczTg7ofbVlfM9LEI
         KQFyLpxJQ+5I81A4RLRhZIsUyVGzku+lZ4gDqidrE4JKKWndu3CaaCfX6e+XEQEXM8Co
         1ZcirJDcSgUS7gZPPZ1FSFqd0XqgoqSftQeGh/YPpOAft1Vtx/4cKSnFHS8vKlPJfIM9
         IBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P4OdgG6z7Av8k6lGMJPzVygrES10A/qyrnU/AHVrDFs=;
        b=cMEIrhaFnMBuA4DlctG6925m1I5ldp8I9Vb1dLYcsGg/Ig7i1YbJTVOpkohp3PbHdK
         ZOYYEZBi+pHkpwmvZtXKNxlWQNX/D+YQ2jUb4g+Q6vrglXXdkbdwwfuu2luuM9n4hd3b
         Wo0qsY/EpGHOYjhYM6XyEcQjCewlP0+PujEp89amzGZ3NmbEEdBBNbOHXStS63E85H9E
         1tMsl4dd5O0X9BGbhvCDOMo9t48Hw+QjqETae7BIh+7rRFS+0iH0uohuiabSYhvEdYIc
         plll5a40s7BHNPAwcKTfhLUiz83s1xW9pqdX9ltw3jXeh+ycK356vYw/JYB4dvXlSiaX
         GS0Q==
X-Gm-Message-State: AOAM531dFsxmDM7McK0Yqh5gyKhwixbYrbuENw2mu3arPwu+WqxbVKty
	z2OU6YQxQ2zolj/QQEA9lEg=
X-Google-Smtp-Source: ABdhPJw1hbw6xPP+wGBy3hN2q6gzdFJTscKcKI0DmTEj2zIcLcy0TjcKpnS1HVtSJR2V68/pJNPNWw==
X-Received: by 2002:a05:6808:341:: with SMTP id j1mr629180oie.19.1614308044693;
        Thu, 25 Feb 2021 18:54:04 -0800 (PST)
Date: Thu, 25 Feb 2021 19:54:02 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-next 2/6] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
Message-ID: <20210226025402.ryuxpicaqujmfxbu@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <444658f690c81b9e93c2c709fa1032c049646763.1614265718.git.connojdavis@gmail.com>
 <02f32a31-1c23-46af-54a7-7d44b5ffb613@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02f32a31-1c23-46af-54a7-7d44b5ffb613@suse.com>

On Thu, Feb 25, 2021 at 04:45:15PM +0100, Jan Beulich wrote:
> On 25.02.2021 16:24, Connor Davis wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -501,7 +501,9 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
> >              return -EINVAL;
> >          }
> >  
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> >          if ( !iommu_enabled )
> > +#endif
> >          {
> >              dprintk(XENLOG_INFO, "IOMMU requested but not available\n");
> >              return -EINVAL;
> 
> Where possible - to avoid such #ifdef-ary - the symbol instead should
> get #define-d to a sensible value ("false" in this case) in the header.
> The other cases here may indeed need to remain as you have them.
> 
Do you prefer the #define in the same function near the if or
somwhere near the top of the file?

Connor

