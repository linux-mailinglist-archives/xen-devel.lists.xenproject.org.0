Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE096B89A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790078.1199777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnIc-0008W2-5L; Wed, 04 Sep 2024 10:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790078.1199777; Wed, 04 Sep 2024 10:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnIc-0008Tu-2l; Wed, 04 Sep 2024 10:31:42 +0000
Received: by outflank-mailman (input) for mailman id 790078;
 Wed, 04 Sep 2024 10:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slnIb-0008TN-F6
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:31:41 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df74cd48-6aa8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 12:31:40 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso108384366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:31:40 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89890229b5sm797547766b.51.2024.09.04.03.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:31:39 -0700 (PDT)
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
X-Inumbo-ID: df74cd48-6aa8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725445900; x=1726050700; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x3cAREL8sL5kXal76qRnHb4VobjRBA/BBFICcvL2jk=;
        b=AubS7CUsckV1jumdOicur51pzuEmrEv46SNnJQ+ae8/uFO7thBTjK3D1uJnTt9bUA4
         R2VCc9/ocZNXpmGmK6pGZYU+eA0T3j0IVBCRUoLciIoBTDNr07RyDCeXWTLmfBEmtssW
         YAcB5+zZ3BG1bsLFsJLaMweyfVmb0dlTo8dKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445900; x=1726050700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2x3cAREL8sL5kXal76qRnHb4VobjRBA/BBFICcvL2jk=;
        b=hF7Y0X5k+qTcxedqJzAV5KWZc0qkFpGtnfdtCcMm3Kywk9eiUNH9QbZVqd/PXj4+oF
         7R91On/rj07NlYevDk8t6blRVpF0/qEcvn+KoTqedMlU7e01RCuO6LJlwHMAnH8de2Ax
         jEXxpbevFu5ucy2tPexn1L33iXv9J1sWoPRt+BLIeMQea6pGrBPmCAMzFAmkwGOg4BFM
         3E/Y6htg/VE9lCrqUEOFy/XLIzCW5CkxLtw11IemLnbNc2J5bxCEEZ12VmIN4MZXP3HN
         9dW440DkQkc8FIlTSbDG3Ob8t3U8WEhK2SO98LMLnggYyUr/2pNmfG8tyvjDk1VGm6iK
         pCVg==
X-Forwarded-Encrypted: i=1; AJvYcCWNmIkgWw/sOSAJ4wohEClvTavNw7h0iumBUJLmnvedCXSbDYziYBM4LlqI5KfVtoVd/i7Az8C4efg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK+zy7XDJ4IiupmMSfUD7/i/V17Ez1XY2UGdnjaRIY/OyFtSEs
	slylTlBEh2qn20xS4dGURL3WzxTq183kaaOBJhc2cleWNdoIVUK9OTpfJ4c0wuM=
X-Google-Smtp-Source: AGHT+IEuo5hFHW76J2byOAoTGv2cJTvnApGd/SMlpKSU4ivOHLmg6stWFBd0nbUTH/cPtxCz6tMZVg==
X-Received: by 2002:a17:907:970b:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a8a42fb1226mr188377766b.7.1725445899846;
        Wed, 04 Sep 2024 03:31:39 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:31:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: paul@xen.org, Jan Beulich <jbeulich@suse.com>,
	Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <Ztg3Cu1EYDqChqUy@macbook.local>
References: <20240903141923.72241-1-roger.pau@citrix.com>
 <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>
 <ZtgYnAeXSamlGKgC@macbook.local>
 <c3f6df7e-780e-4c00-9d09-95d690166878@xen.org>
 <ZtgkVzByhyXjaIqY@macbook.local>
 <Ztgp6j571lKZFam5@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ztgp6j571lKZFam5@l14>

On Wed, Sep 04, 2024 at 09:35:40AM +0000, Anthony PERARD wrote:
> On Wed, Sep 04, 2024 at 11:11:51AM +0200, Roger Pau Monné wrote:
> > On Wed, Sep 04, 2024 at 09:39:17AM +0100, Paul Durrant wrote:
> > > On 04/09/2024 09:21, Roger Pau Monné wrote:
> > > > > In the absence of that I'm afraid it is a little harder to
> > > > > judge whether the proposal here is the best we can do at this point.
> > > >
> > > > While I don't mind looking at what we can do to better handle 4K
> > > > sector disks, we need IMO to revert to the specification before
> > > > 67e1c050e36b, as that change switched the hardcoded sector based units
> > > > from 512 to 'sector-size', thus breaking the existing ABI.
> > > >
> > >
> > > But that's the crux of the problem. What *is* is the ABI? We apparently
> > > don't have one that all OS subscribe to.
> >
> > At least prior to 67e1c050e36b the specification in blkif.h and (what
> > I consider) the reference implementation in Linux blk{front,back}
> > matched.  Previous to 67e1c050e36b blkif.h stated:
> >
> > /*
> >  * NB. first_sect and last_sect in blkif_request_segment, as well as
> >  * sector_number in blkif_request, are always expressed in 512-byte units.
> >  * However they must be properly aligned to the real sector size of the
> >  * physical disk, which is reported in the "physical-sector-size" node in
> >  * the backend xenbus info. Also the xenbus "sectors" node is expressed in
> >  * 512-byte units.
> >  */
> >
> > I think it was quite clear, and does in fact match the implementation
> > in Linux.
> 
> That's wrong, Linux doesn't match the specification before 67e1c050e36b,
> in particular for "sectors":
> 
>     sectors
>          Values:         <uint64_t>
> 
>          The size of the backend device, expressed in units of its logical
>          sector size ("sector-size").

This was a bug introduced in 2fa701e5346d.  The 'random' comment that
you mention notes that 'sectors' is unconditionally expressed in
512-byte units was added way before, in d05ae13188231.  The improved
documentation added by 2fa701e5346d missed to correctly reflect the
units of the 'sectors' node.

> 
> The only implementation that matches this specification is MiniOS (and
> OMVF).
> 
> Oh, I didn't notice that that random comment you quoted that comes from
> the middle of the header have a different definition for "sectors" ...
> 
> Well, the specification doesn't match with the specification ... and the
> only possible way to implement the specification is to only ever set
> "sector-size" to 512...
> 
> No wonder that they are so many different interpretation of the
> protocol.

My opinion is that there was a bug introduced in the specification in
2fa701e5346d, and that bug was extended by 67e1c050e36b to even more
fields.

Implementations should be fixed to adhere to the specification as it
was pre 2fa701e5346d, because that works correctly with 'sector-size'
!= 512, and is the one implemented in Linux blkfront and blkback.

There's no need to make this more complicated than it is.  We
introduced bugs in blkif.h, and those need to be fixed.  It's sad that
those bugs propagated into implementations, or that bugs from
implementations propagated into blkif.h.

I don't see an option where we get to keep our current diverging
implementations and still support 4K logical sector disks without
specification and code changes.  We could introduce a new way to
signal 4K logical sector sizes, but as that will require modifications
to every frontends and backend we might as well just fix the existing
mess and modify the implementations as required.

Thanks, Roger.

