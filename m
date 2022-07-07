Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11356A243
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 14:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362977.593282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QtN-0002c3-1U; Thu, 07 Jul 2022 12:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362977.593282; Thu, 07 Jul 2022 12:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9QtM-0002ZS-Ut; Thu, 07 Jul 2022 12:46:00 +0000
Received: by outflank-mailman (input) for mailman id 362977;
 Thu, 07 Jul 2022 12:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K3vi=XM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1o9QtL-0002ZM-HX
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 12:45:59 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6295969-fdf2-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 14:45:42 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id e12so30901656lfr.6
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jul 2022 05:45:58 -0700 (PDT)
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
X-Inumbo-ID: b6295969-fdf2-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FLcfrXYjK2fwrrDKdqGjcVMFG48UBdYQu2HVE7B/VAI=;
        b=IEjOMTXrJwNeqUA6s5mVpo4ZKCU936JfTqmXA1uWFc2yQFcG5eLJuLMLFIlDkwHYfD
         rjShJtrqPrcp+zuVj5aaTUk86TGljPaM+nnnEjGo4MA5ld6l8tj7sYRETVZAA2/DDFp4
         9DNXEBnM/YOSvD2IMSvYNfWDgEtd5IjOUxENhVDuC2yZ6BIjOX2xlBheFVy7/40zRkJH
         8DIQkGvdHtKf8Qjr8spRH8MT3pd4KLFRX7c/RVLijADkHTqM1BorCmfLDiSLzYAGOV9f
         B8sPJkvyU7daYXwaPrF6NxOc7cGlt/Si50jU7L/wVBZRtSXV9IpmKZMAcGTv9lN5x3sA
         4x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FLcfrXYjK2fwrrDKdqGjcVMFG48UBdYQu2HVE7B/VAI=;
        b=LH7QU95Fz2QOujRx5uftFGQJQvR0h9poBcdosIlxTsPyqVXLzN9rbK150gEGLX2wxc
         qtWdWWn/VHrLnB+98r8cmMWEU35HrMjKN8ZniVJ+y7tNT8gqIde9lXPx3Y1jW5xPGJZF
         ckdiHPeKsPevhN6KVRlJ3QiNT4ozKVr3loitLSHGUeFp5Ea3ZQCc86DcYGL73VerBfl6
         LIDmEVB2KUnSMl2OVSyCEKYmo7Jn09DgU9HeaILEQkeoJbxvu3OPyzEluj/AZL+wP7DL
         7FMMppYPLiAagzFcriyd/lgdg/g9XpgdGCp2WOTylxRG9KMYFnKNSkeSHw2PfoO4hqh9
         v37g==
X-Gm-Message-State: AJIora/gpHB4Jg5vn/et+8GsjnRx3sZW7+kQdc8HthvkvakcwZBuGN9w
	mW9LE0utN4bXtfWOBc71Ss4Jf6VAaMAkP6USc6M=
X-Google-Smtp-Source: AGRyM1sntLAsGaKOHwMlrBARRF0dPEHb0dl2oRaVtuqPaCXTMNgajhqz8jZIxhDDUgoSgxO3zWS/kfcoWP/MDDjN4s8=
X-Received: by 2002:a05:6512:2508:b0:480:f1cb:64ad with SMTP id
 be8-20020a056512250800b00480f1cb64admr32019790lfb.359.1657197957688; Thu, 07
 Jul 2022 05:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <92644952-48be-d25b-4471-121cfa14a5c0@apertussolutions.com>
 <20220706191325.440538-1-jandryuk@gmail.com> <b689b39e-581d-01fe-c473-b585dca880eb@apertussolutions.com>
In-Reply-To: <b689b39e-581d-01fe-c473-b585dca880eb@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 7 Jul 2022 08:45:46 -0400
Message-ID: <CAKf6xpubT9GNTO-nY1WZXhAFSArrfNqJ9Da+pG06Ye3cTzo1CA@mail.gmail.com>
Subject: Re: [RFC PATCH] flask: Remove magic SID setting
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, christopher.clark@starlab.io, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Scott Davis <scott.davis@starlab.io>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 7, 2022 at 6:14 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 7/6/22 15:13, Jason Andryuk wrote:
> > flask_domain_alloc_security and flask_domain_create has special code to
> > magically label dom0 as dom0_t.  This can all be streamlined by making
> > create_dom0 set ssidref before creating dom0.
>
> Hmm, I wouldn't call it magical, it is the initialization policy for a
> domain labeling, which is specific to each policy module. I considered
> this approach already and my concern here is two fold. First, it now
> hard codes the concept of dom0 vs domU into the XSM API. There is an
> ever growing desire by solution providers to not have a dom0 and at most
> have a hardware domain if at all and this is a step backwards from that
> movement. Second, and related, is this now pushes the initial label
> policy up into the domain builder code away from the policy module and
> spreads it out. Hopefully Xen will evolve to have a richer set of
> initial domains and an appropriate initial label policy will be needed
> for this case. This approach will result in having to continually expand
> the XSM API for each new initial domain type.

Yeah, adding dom0 vs. domU into the XSM API isn't nice.  My original
idea was just for dom0, but I added the domU hook after you basically
said in your other email that dom0less had to work.  There should not
be any more of these since they are just to provide backwards
compatibility.

A dom0/domU flask policy is not interesting for dom0less/hyperlaunch.
So I don't see why xen/flask needs support for determining sids for
domains.  If you have dom0less/hyperlaunch + flask, every domain
should have a ssidref defined in its config when building.  If you
require ssidrefs for dom0less/hyperlaunch + flask, then there is less
initial label policy.  An unspecified ssidref defaulting to
unlabeled_t is fine.

I saw your other patch as adding more "initial label policy" since it
adds more special cases.  I see requiring an explicit ssidref or
getting unlabeled_t as a feature.  Automatic labeling seems like a
misfeature to me.

Regards,
Jason

