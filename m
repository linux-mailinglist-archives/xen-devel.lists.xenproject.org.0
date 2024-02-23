Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF87C8614F0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 15:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684870.1065055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdWy3-00021t-Od; Fri, 23 Feb 2024 14:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684870.1065055; Fri, 23 Feb 2024 14:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdWy3-0001yi-Ll; Fri, 23 Feb 2024 14:56:03 +0000
Received: by outflank-mailman (input) for mailman id 684870;
 Fri, 23 Feb 2024 14:56:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdWy2-0001yc-AH
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 14:56:02 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8db7696-d25b-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 15:56:01 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d0a4e1789cso11754261fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 06:56:01 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bi9-20020a05620a318900b00787af8b5c02sm881863qkb.39.2024.02.23.06.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 06:56:00 -0800 (PST)
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
X-Inumbo-ID: a8db7696-d25b-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708700161; x=1709304961; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eZS4hr9rfgbLObhuwrrnLB/QJjAbInDizKuJeP1mGJo=;
        b=NEfWTrv7zjugtuoFIBx2penBjVSBGO02uEebsJWqf5hiWTYLTgCdUe3qRCQOGDtzaF
         WR3+lmXLIM6en4rU5MWeeMPHDEEhYjMed5/X3MxmvYnpr5aatxHYUQmXThQwOgGbNzPE
         dQzf/WlrveaVhW53ZOidfxeM0Ts1mEc5zFT7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708700161; x=1709304961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZS4hr9rfgbLObhuwrrnLB/QJjAbInDizKuJeP1mGJo=;
        b=XOrivJj1dm1O5p6m5zyl5DKweVFmH3fNE7g6ISRuMbt3XcxJdyzIzmsUgpp4cZvMDG
         KGlgYCPYGJ/mutYD8Kg49qtM4aeVJOhuMb1ZrHX75i+oEtXKpg7k+A/1MXFd4NTq6ZDB
         HaP7WwwhU0pmKK/SENjdQe/8iu5ISrN/egP1cssmpDYyANiyTAIYHStfojufbYMhI/Fq
         32esm7QAQq9jHnM+/pDrc3Rx8iNs9R+Y0eQFt1c/wK5Jg7Yo1eN5LjVx9iVJPlTv/V6l
         SSgj6QLcjD54OyxcplhttKelKdRGWi4TDyjRXmrTfqpHcSOWsuMpmaFquDtYECRqRhRu
         JjOA==
X-Gm-Message-State: AOJu0YwNFO9MabobRwQmG1/lWgnNLyqoFvLsKI/c/sNB3v6Fdm3UmijQ
	gBHN/ErrQu7GL0kEGZzRxJkuGG8QNEAUGw3QwEKl7LxWCmri+U6bFc/AqPML5sQ=
X-Google-Smtp-Source: AGHT+IHEm3daiiwXU0yFlknywEAOBblajlB571JAVqKO5xxWi0iOK2dyC+4t7C+MNa3oDhOeXk++iA==
X-Received: by 2002:a2e:9d0a:0:b0:2d2:4ce4:bf4a with SMTP id t10-20020a2e9d0a000000b002d24ce4bf4amr37564lji.39.1708700160744;
        Fri, 23 Feb 2024 06:56:00 -0800 (PST)
Date: Fri, 23 Feb 2024 15:55:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] xen/livepatch: register livepatch regions when loaded
Message-ID: <Zdix_iZFYnvweQuR@macbook>
References: <20231130142944.46322-1-roger.pau@citrix.com>
 <20231130142944.46322-2-roger.pau@citrix.com>
 <CAG7k0Eq+G7w8M2JFTnikv10SNocfCBGwvbEwz-pbR9v99uStGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0Eq+G7w8M2JFTnikv10SNocfCBGwvbEwz-pbR9v99uStGg@mail.gmail.com>

On Fri, Feb 23, 2024 at 09:45:15AM +0000, Ross Lagerwall wrote:
> On Thu, Nov 30, 2023 at 2:30 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > Currently livepatch regions are registered as virtual regions only after the
> > livepatch has been applied.
> >
> > This can lead to issues when using the pre-apply or post-revert hooks, as at
> > the point the livepatch is not in the virtual regions list.  If a livepatch
> > pre-apply hook contains a WARN() it would trigger an hypervisor crash, as the
> > code to handle the bug frame won't be able to find the instruction pointer that
> > triggered the #UD in any of the registered virtual regions, and hence crash.
> >
> > Fix this by adding the livepatch payloads as virtual regions as soon as loaded,
> > and only remove them once the payload is unloaded.  This requires some changes
> > to the virtual regions code, as the removal of the virtual regions is no longer
> > done in stop machine context, and hence an RCU barrier is added in order to
> > make sure there are no users of the virtual region after it's been removed from
> > the list.
> >
> > Fixes: 8313c864fa95 ('livepatch: Implement pre-|post- apply|revert hooks')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/common/livepatch.c      |  5 +++--
> >  xen/common/virtual_region.c | 40 +++++++++++--------------------------
> >  2 files changed, 15 insertions(+), 30 deletions(-)
> >
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index 1209fea2566c..3199432f11f5 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -942,6 +942,8 @@ static int prepare_payload(struct payload *payload,
> >          }
> >      }
> >
> > +    register_virtual_region(region);
> > +
> >      return 0;
> >  }
> >
> 
> The region is registered in prepare_payload() but if e.g. the build id
> check in load_payload_data() fails, it won't unregister the region
> since the failure path calls free_payload_data(), not free_payload().
> Perhaps the call to register_virtual_region() could be done as the last
> thing in load_payload_data()?

I've moved it to livepatch_upload(), as I think it's more natural to
be done together with the addition to the list of livepatches.  Thanks
for spotting it, I guess I got confused between free_payload_data()
free_payload().

Roger.

