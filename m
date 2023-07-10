Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FF74DACB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 18:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561274.877718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItV9-0007ah-Jk; Mon, 10 Jul 2023 16:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561274.877718; Mon, 10 Jul 2023 16:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItV9-0007Y1-Gq; Mon, 10 Jul 2023 16:12:39 +0000
Received: by outflank-mailman (input) for mailman id 561274;
 Mon, 10 Jul 2023 16:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BpzE=C4=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qItV7-0007Xt-PI
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 16:12:37 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95081cdb-1f3c-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 18:12:35 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98de21518fbso617750566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 09:12:35 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u23-20020a1709063b9700b009928b4e3b9fsm6316203ejf.114.2023.07.10.09.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 09:12:34 -0700 (PDT)
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
X-Inumbo-ID: 95081cdb-1f3c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689005555; x=1691597555;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xvrS+NlRYiI1/TssB4upQewQ7NHaAJZxe0HLhNdDpPU=;
        b=k56f4YHifztlTTRopeQ9BswevtpJ9n5PNQWvWVHyDfjmZq6tz7BnWJ9ywyYDDac0na
         0VW7mnEg9T7Ef38Lq/vLttCwi5DE9cMyK6T7fw0SjWIdqEPI95Os/vV3SbEC/x2JCbM3
         w3Dg/QEdZk9gFVKoICi2Ibxw0lZBDYhEBp4Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689005555; x=1691597555;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvrS+NlRYiI1/TssB4upQewQ7NHaAJZxe0HLhNdDpPU=;
        b=ZZMJmNUUoB6cpEadWmHD0+r73pHIIQdpdrXJIYc+gCdwYWXZ5U1fKg4Dd8kvOOTN31
         1t0hnQwOjf9NMdzrvKKyooQINSbs2cys1RDs/bDEAfWlerquP1ZYKqif8sI8XdDP71vR
         bYbUr2msoQltW/gUBy2os0xjjXhgRmktmQqGRjaQP7r+1DnB/0m1Umbyxs2i0NTfdTE6
         dMh0gnobqPJIHKv0c3RwqYHkcqCC9gc0cU3dHNDUtYfEnpf/mU4DRFs6pwTH417BRLjn
         4dj+Z1UHzpcTpQqPLI7m9vG0jXzgnUVQtzCg/PYVdn3htfiSb3HjtsdaOwtp6wLvU5ib
         8Odw==
X-Gm-Message-State: ABy/qLYqafJ49lMtB4aVEtsi0V14giaW0RpA6m4sYO39cqN5tFnm7uSK
	gmb4vDlkcSvsTpGhlZs9mSTU8Q==
X-Google-Smtp-Source: APBJJlEKLYxeiK1UDZdZO5Cx0p604K5h9SLw8bWRK5HiCVta85xVE3Nw8/Rhmq1/xGvbtEGrz3Vk+w==
X-Received: by 2002:a17:907:2a08:b0:993:22a2:8158 with SMTP id fd8-20020a1709072a0800b0099322a28158mr12964280ejc.61.1689005555009;
        Mon, 10 Jul 2023 09:12:35 -0700 (PDT)
Message-ID: <64ac2df2.170a0220.87102.74de@mx.google.com>
X-Google-Original-Message-ID: <ZKwt78kQAMcyXTO8@EMEAENGAAD19049.>
Date: Mon, 10 Jul 2023 17:12:31 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] mm/pdx: Add comments throughout the codebase for pdx
References: <20230622140237.8996-1-alejandro.vallejo@cloud.com>
 <e7d3daa3-7d5b-1c36-51f1-453bf11b55d2@suse.com>
 <64a83575.170a0220.2c96.8158@mx.google.com>
 <03e5e1a7-2c04-c991-e3b7-cea6916ec59b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03e5e1a7-2c04-c991-e3b7-cea6916ec59b@suse.com>

On Mon, Jul 10, 2023 at 09:43:34AM +0200, Jan Beulich wrote:
> This is ...
> >>> [snip]
> >>> + * This is where compression becomes useful. The idea is to note that if
> >>> + * you have several big chunks of memory sufficiently far apart you can
> >>> + * ignore the middle part of the address because it will always contain
> >>> + * zeroes as long as the base address is sufficiently well aligned and the
> >>> + * length of the region is much smaller than the base address.
> >>
> >> As per above alignment of the base address doesn't really matter.
> > Where above?
> 
> ... what "above" here meant.
> 
> > As far as I understand you need enough alignment to cover the
> > hole or you won't have zeroes to compress. Point in case:
> > 
> >   * region1: [0x0000000000000000 -
> >               0x00000000FFFFFFFF]
> > 
> >   * region2: [0x0001FFFFFFFFF000 -
> >               0x00020000FFFFFFFF]
> > 
> > I can agree this configuration is beyond dumb and statistically unlikely to
> > exist in the wild, but it should (IMO) still be covered by that comment.
> 
> Right, but this isn't relevant here - in such a case no compression
> can occur, yes, but not (just) because of missing alignment. See the
> example I gave above (in the earlier reply) for where alignment
> clearly doesn't matter for compression to be possible.
> 
> Jan
Fair enough. Then I think we can simply drop the last sentence and be done
with it.

So the paragraph becomes:
```
   * This is where compression becomes useful. The idea is to note that if
   * you have several big chunks of memory sufficiently far apart you can
   * ignore the middle part of the address because it will always contain
   * zeroes.
```
The details on when or how compression is possible are implicit in the
following example anyway.

Would that, combined with v3, take care of everything? If not, I'll just
merge further patches with the pdx series I have on hold and send
everything together.

Thanks,

Alejandro

