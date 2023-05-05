Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2CD6F802A
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 11:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530274.825795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1purth-0004X1-IF; Fri, 05 May 2023 09:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530274.825795; Fri, 05 May 2023 09:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1purth-0004UO-FN; Fri, 05 May 2023 09:38:41 +0000
Received: by outflank-mailman (input) for mailman id 530274;
 Fri, 05 May 2023 09:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psjd=A2=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1purtg-0004UI-IO
 for xen-devel@lists.xen.org; Fri, 05 May 2023 09:38:40 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cf5b330-eb28-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 11:38:39 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1aae46e62e9so10933755ad.2
 for <xen-devel@lists.xen.org>; Fri, 05 May 2023 02:38:39 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 j3-20020a63fc03000000b005140ce70582sm1225493pgi.44.2023.05.05.02.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 02:38:37 -0700 (PDT)
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
X-Inumbo-ID: 9cf5b330-eb28-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683279518; x=1685871518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WaG+8ofRnnd64SI0wvpySFG9n+vU2w5MynZBpHLEkRw=;
        b=AgxI2FxlRg1mgszxPM93IGao7P+5a85jLdYesRgNPJ4Uk5ie5AM06VZszJaN91M+Xr
         le0HRmV+YUrfkE8h/LsxoE8Rk6HNh6+dJ+AaJCqg9JIm1g1I8BXNu/2PK8C0aYz1c/xY
         rdn5JdW99zMW/OgIpQgcsI0/hYa1oLAf20FJZmvjD+ncA3u8+y8UC79ph6yvF1/I3W6+
         Z9bFhUfud89AQd3b2wVqG0rLGXFXQZ+wU3V+oTD4bDPAvJrNdHBB+kw0pbcxUoRLgW94
         7//4r8LQLnG4jPF1+HOuQjcNwxs1WOkv5dKNJm+0IcKpOmWi0tWaxfkkaCg5/qWjV2Nu
         z6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683279518; x=1685871518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaG+8ofRnnd64SI0wvpySFG9n+vU2w5MynZBpHLEkRw=;
        b=icUp3N0FKsw7dQViFinsbM24BhbQsosW32zMDcbig2Tst0y0/xvyiAc1JI/++QVYJh
         s2r5FtNGToxbCFNIe6qh3OljQCPAM4zYKHN/QqakJisyPtd4dCPD4j7yoSujQZz2yprH
         HGAmgj/yRsyV7uzOu7rhjhvBDncu+JltjTxZ98I9eKPoD36ZsjMIl67j0zcz0i0D/SvL
         NzuiSjNPDK8d94GSY5T+Dy+HI29Os4vJoJOEW/cGR7psajWI/gmCJckF/MILZvXXDZu5
         zGBh9S602LI5Pk1IXooaO3ABeZwkfXbaVAqWnclUQw1Zpqhh92sPpJA7wNJG8FLd0bCt
         ccZw==
X-Gm-Message-State: AC+VfDy9b8ZmxfWT5utcF5g3rmwz8+44cEzD2LWARqrquTaKk+d9XITs
	0v6lSdVilbETOzqDLpx0F22Twg==
X-Google-Smtp-Source: ACHHUZ4hkv3ImU5k++gFOf4/s2vPNYkPVZABtqaSq1SwoIqfgDQ4FUodHC/24r9E5PzsZRunFUo2LQ==
X-Received: by 2002:a17:903:120d:b0:1a5:2993:8aa6 with SMTP id l13-20020a170903120d00b001a529938aa6mr889555plh.63.1683279517711;
        Fri, 05 May 2023 02:38:37 -0700 (PDT)
Date: Fri, 5 May 2023 15:08:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Message-ID: <20230505093835.jcbwo6zjk5hcjvsm@vireshk-i7>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <92c7f972-f617-40fc-bc5d-582c8154d03c@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92c7f972-f617-40fc-bc5d-582c8154d03c@perard>

Hi Anthony,

On 02-05-23, 15:44, Anthony PERARD wrote:
> > diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> > index faada49e184e..e1f15344ef97 100644
> > --- a/tools/libs/light/libxl_virtio.c
> > +++ b/tools/libs/light/libxl_virtio.c
> > @@ -48,11 +48,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
> >      flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
> >      flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
> >      flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
> > +    flexarray_append_pair(back, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
> >  
> >      flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
> >      flexarray_append_pair(front, "base", GCSPRINTF("%#"PRIx64, virtio->base));
> >      flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
> >      flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
> > +    flexarray_append_pair(front, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
> 
> This "forced_grant" feels weird to me in the protocol, I feel like this
> use of grant or not could be handled by the backend. For example in
> "blkif" protocol, there's plenty of "feature-*" which allows both
> front-end and back-end to advertise which feature they can or want to
> use.
> But maybe the fact that the device tree needs to be modified to be able
> to accommodate grant mapping means that libxl needs to ask the backend to
> use grant or not, and the frontend needs to now if it needs to use
> grant.

I am not sure if I fully understand what you are suggesting here.

The eventual fronend drivers (like drivers/i2c/busses/i2c-virtio.c)
aren't Xen aware and the respective virtio protocol doesn't talk about
how memory is mapped for the guest. The guest kernel allows both
memory mapping models and the decision is made based on the presence
or absence of the iommu node in the DT.

The backends in our case are hypervisor agnostic and aren't part of
Xen or any other hypervisor. I am not sure how the backend can provide
the mapping information to Xen, with which the creation of the iommu
DT node can be controlled.

Also, as I communicated in another email, the currently suggested
option in this patch, "forced_grant", isn't enough for us. We also
need a way to disable grant mappings. Right now we are creating iommu
nodes by default all the time, if the backend domain isn't Dom0.

What I need probably is something like: "use_grant", where setting it
to 1 will always create the iommu node and setting it to 0 will not,
irrespective of the backend domain, and this overrides the current
model of defaulting to create the node when not mapped by Dom0.

-- 
viresh

