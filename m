Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0E2318F92
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 17:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83987.157342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAEYO-00066O-R7; Thu, 11 Feb 2021 16:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83987.157342; Thu, 11 Feb 2021 16:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAEYO-00065t-Nk; Thu, 11 Feb 2021 16:10:52 +0000
Received: by outflank-mailman (input) for mailman id 83987;
 Thu, 11 Feb 2021 16:10:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRkU=HN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lAEYN-00065f-2P
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 16:10:51 +0000
Received: from mail-wm1-f54.google.com (unknown [209.85.128.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a8cea45-0e26-4382-88aa-86ba0e95b2da;
 Thu, 11 Feb 2021 16:10:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m1so6286052wml.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Feb 2021 08:10:50 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id w12sm10165517wmi.4.2021.02.11.08.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 08:10:49 -0800 (PST)
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
X-Inumbo-ID: 1a8cea45-0e26-4382-88aa-86ba0e95b2da
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XZxsFBkQjLc1jz1XLSDQBIKkyNhmBPcRjtO5Ghx9wUI=;
        b=koWiZ6AhevW4z/QPsXaiBubsDkfbe3qIKHcz0g0XquVClE2bZWaUIfQ/FeHQDKyWqw
         oLj4FMd4oHbiEGftyCgJnABHJYtA4HP6bSyfpWgDtAHyL628B/ly6Ldr/VUQOHL8ngxu
         7YG+HbIBLioKuB/zB9+9CL9P6fwYdXPdKFCxXXqNly9ZcESiNR5LP245IyfK1GMWGTaq
         2pSECHQG7x/bg8whiPHWzDqlEFDFaViFBkBYEZ7Hinr4Xa9xmAbmGA4C8OwBHBCJl/lX
         Py9O6HF2Pxgadqc9g4rimvwGvxty5aaAhbXN7zwOhSTlSQ7o+DltkuPdcWk+7HVN4dDu
         EPCg==
X-Gm-Message-State: AOAM5315/azKfBjUKlwZay4NZNTIjyc0c3gd0pDgtyLkbYWdZmO0JbsU
	5Z0bq3y+ORjzS6+OzkqUP/s=
X-Google-Smtp-Source: ABdhPJyvRf3QWtv1mi3dgLFveNeF2PSMKuYF5nD/JnWPbgx38Cn0qS5lWpPWwSugsQnad1+PpFGDRg==
X-Received: by 2002:a05:600c:4305:: with SMTP id p5mr6000556wme.8.1613059849454;
        Thu, 11 Feb 2021 08:10:49 -0800 (PST)
Date: Thu, 11 Feb 2021 16:10:47 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.15] automation: Add Ubuntu Focal builds
Message-ID: <20210211161047.xee6cdmvbxaaks3f@liuwe-devbox-debian-v2>
References: <20210211155041.4811-1-andrew.cooper3@citrix.com>
 <3928a36c-9ef0-dd2b-a4b6-0a94092cab88@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3928a36c-9ef0-dd2b-a4b6-0a94092cab88@citrix.com>
User-Agent: NeoMutt/20180716

On Thu, Feb 11, 2021 at 03:57:06PM +0000, Andrew Cooper wrote:
> On 11/02/2021 15:50, Andrew Cooper wrote:
> > Logical continuation of c/s eb52442d7f "automation: Add Ubuntu:focal
> > container".
> >
> > No further changes required.  Everything builds fine.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Doug Goldstein <cardoe@cardoe.com>
> > CC: George Dunlap <George.Dunlap@eu.citrix.com>
> > CC: Ian Jackson <iwj@xenproject.org>
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Wei Liu <wl@xen.org>
> > CC: Julien Grall <julien@xen.org>
> 
> Forgot to say -
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/254912313
> is a pipeline run with everything green.
> 
> Also, I need to prefix the names with ubuntu- which I can do on commit.

Acked-by: Wei Liu <wl@xen.org>

