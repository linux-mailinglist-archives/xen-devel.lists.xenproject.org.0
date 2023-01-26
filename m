Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BCE67C957
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 12:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484938.751833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL00K-0006Jn-0J; Thu, 26 Jan 2023 11:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484938.751833; Thu, 26 Jan 2023 11:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL00J-0006HF-TP; Thu, 26 Jan 2023 11:01:15 +0000
Received: by outflank-mailman (input) for mailman id 484938;
 Thu, 26 Jan 2023 11:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9FD=5X=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pL00I-0006H3-Hy
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 11:01:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb935eee-9d68-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 12:01:06 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id y11so1508531edd.6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 03:01:06 -0800 (PST)
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
X-Inumbo-ID: bb935eee-9d68-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=673vAa67vWT2HXWDufxt2zxk3AW8Lvgl9CbqmU9Xjsk=;
        b=5fx9N+womgJAmOzVdR2OZVKfr7pSlkVI+GlUdaGJ0lGt73i5XQ8khE/66sbNlm07xp
         ZeCu2mwONMF1eLrxKOWTYs9x8YykCmZ9GudGjR55LwzodjwstnHCdVk4+Oxp6zSnfbTf
         F6bSqIfE2/p4mLo/Z7mpvSR046B2O/JQ8wSOFbFktKf4t3PEGAPPHleIWHdkC96G7B6K
         0rbAHNT2UjHUpbqGMP/5FVYD+PvGCpfrMEiaBBYojtVGtCIEApWRpBbyKzZBu4Zs+4uL
         Y6LeulWx98Ksqwosvb7LvUdH6uD0+dvc8Ny5pLYOc4dIy83sw5/tRKzGZANeJdydOG3b
         121w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=673vAa67vWT2HXWDufxt2zxk3AW8Lvgl9CbqmU9Xjsk=;
        b=7vD+gBng+yXzIBtl+Wwz+/Ioq1C5646eGOFLnqX76njNCATtRzzTVXXlwy0148eBHC
         Wwue54r6bNK6eU3EXvhyesBp68rBDFFuRv/B/sj1By/zOkvbhQIRrEksUxem7qbNftgR
         R2Gh2DZccD1PJXEJYdu4djMX1bL4JrS+1UOxFG5YD0MGsqOBVixlKEyhPd4NIIla+56s
         l45FF3QsPSiXhvDMYfVdo7jcDUT95Pw8ZffGMtwyas04hHdxfI8whS7p6O6lSo6owlkg
         TVsXfluReg6yXm1+4Gb1iTatUW2PogT5f7DhFztM47Js6qfUq/qnb/u/4wJd5dsC9b3u
         E2KA==
X-Gm-Message-State: AFqh2ko0WMcPPO/1cUTqewqtBvPGZA4bb4zjzjgRmw0oHf+SWQ+mYhjZ
	z+IpJWm2EBi/W9E2QrcnOwfpWWHX54js4xFycUIklA==
X-Google-Smtp-Source: AMrXdXshVQ8ydHOeU84+dezm9ho09eDhfc6+4l3RnUjgKXX0IGWjs8INqyyBBZEOdhU+ioX9KwdaJ7TK5INglsAS53Y=
X-Received: by 2002:a05:6402:221a:b0:49d:836e:21f9 with SMTP id
 cq26-20020a056402221a00b0049d836e21f9mr5476199edb.36.1674730866340; Thu, 26
 Jan 2023 03:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-8-carlo.nonato@minervasys.tech> <a74381ce-d204-1f40-7ccc-2be3bbc3ebd1@suse.com>
In-Reply-To: <a74381ce-d204-1f40-7ccc-2be3bbc3ebd1@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 26 Jan 2023 12:00:55 +0100
Message-ID: <CAG+AhRUKWfJBf5C0uqfzePMvxN-gc2gYup+oBRBA2DXnNW-txw@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca Miccio <lucmiccio@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Tue, Jan 24, 2023 at 5:50 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.01.2023 16:47, Carlo Nonato wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> >
> > This commit adds a new memory page allocator that implements the cache
> > coloring mechanism. The allocation algorithm follows the given domain color
> > configuration and maximizes contiguity in the page selection of multiple
> > subsequent requests.
> >
> > Pages are stored in a color-indexed array of lists, each one sorted by
> > machine address, that is referred to as "colored heap". Those lists are
> > filled by a simple init function which computes the color of each page.
> > When a domain requests a page, the allocator takes one from those lists
> > whose colors equals the domain configuration. It chooses the page with the
> > lowest machine address such that contiguous pages are sequentially
> > allocated if this is made possible by a color assignment which includes
> > adjacent colors.
>
> What use is this with ...
>
> > The allocator can handle only requests with order equal to 0 since the
> > single color granularity is represented in memory by one page.
>
> ... this restriction? Plus aiui there's no guarantee of contiguous pages
> coming back in any event (because things depend on what may have been
> allocated / freed earlier on), so why even give the impression of there
> being a way to obtain contiguous pages?

I really need us to be on the same "page" (no pun intended) here cause we
discussed the subject multiple times and I'm probably missing important
details.

First, is physical memory contiguity important? I'm assuming this is good
because then some hardware optimization can occur when accessing memory.
I'm taking it for granted because it's what the original author of the series
thought, but I don't have an objective view of this.

Then, let's state what contiguity means with coloring:
*if* there are contiguous free pages and *if* subsequent requests are made
and *if* the coloring configuration allows it, the allocator guarantees
contiguity because it serves pages *in order*.

From the fragmentation perspective (first prerequisite), this is somewhat
similar to the buddy case where only if contiguous pages are freed they can
be allocated after. So order of operation is always important for
fragmentation in dynamic allocation. The main difference is speed
(I'm not comparing them on this aspect).

The second prerequisite requires that users of the allocator have exclusive
access to it until the request is carried out. If interleaved requests happen,
contiguity is practically impossible. How often does this happen? I view
allocation as something that happens mainly at domain creation time, one
domain at a time which results in a lot of subsequent requests, and then
contiguity (if other prerequisites hold) isn't an impression.

Obviously fragmentation is inherently higher with coloring because it actually
needs to partition memory, so the third prerequisite actually limits contiguity
a lot.

> Jan

