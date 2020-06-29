Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A007820CCC9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 08:34:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpnMW-00032L-DV; Mon, 29 Jun 2020 06:33:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YmWB=AK=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1jpnMU-00032C-NW
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 06:33:50 +0000
X-Inumbo-ID: 7da499da-b9d2-11ea-852f-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7da499da-b9d2-11ea-852f-12813bfff9fa;
 Mon, 29 Jun 2020 06:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593412428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iiom3LNVi9ET0XgfPNiU1I3DflByt3ZNInrS8hmdp2U=;
 b=RvTva7yvWQJRqvtjLrnc/EM+idCCJEHhG9hgfioileljWjAEPy856c65mhWJCfuOmXs9e9
 OGXr2wScFqvevQWvWrrh5xDvzlgKdMnIO/IQPEkBgNn2g9yq2yG8tMvII9ABOJLEUQn9jv
 HbblSDoldsoqs73nUBpU7Aoazs5mAQE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-b50L4kajPHCmY-RS_aIIJw-1; Mon, 29 Jun 2020 02:33:44 -0400
X-MC-Unique: b50L4kajPHCmY-RS_aIIJw-1
Received: by mail-wr1-f72.google.com with SMTP id o12so16037048wrj.23
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jun 2020 23:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Iiom3LNVi9ET0XgfPNiU1I3DflByt3ZNInrS8hmdp2U=;
 b=th7vwagxDxtzj7KAAM2SX7uduko0h6/SzmOzhmvhj3I4XyMNwtCc7Ts/eV+gFs+Ix4
 HLHol4FFjCDaTeyEk2IcdOdzo81jserP+y6Cqi8ptjTP5K8L1jPTu/R2oZ6Krqz7tkcp
 RfWXtInIjFVedooW6/EAny9U+SlCS32u2Depq6s+T1oqYjVFUnqDiWQ3aX4FGkUF43cP
 PWAGtWCDcpVuKRJXcR2QpgppO72ySdfMnxkPRLHXiQIuPU8EvosWkJvvj5tYo2M01T+N
 UKPQnPda1a7tzdVeBL4ol+2+Os8mLIKWZD2ZcYqhg/DF9KTDwngIkbkcgEfmp6SqD4HG
 V+wQ==
X-Gm-Message-State: AOAM533hH59x9BDMP9YzS/777sbRHQW7jMcHamZloZHBknk331N5mW66
 jkPWM3y9RUuy2A/gYIqdqgVxMxzd0r54Hb+hevjoPiTCaMOWeNork9YPf9Vds7QnVosI1bNBR9c
 lq0h8s4XjAbxQcVbc6b/o2SfdxBc=
X-Received: by 2002:adf:8067:: with SMTP id 94mr14821908wrk.427.1593412423678; 
 Sun, 28 Jun 2020 23:33:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfYJ1M6jIB+Bt9+iuqmCS+1/JuHYbah8AxWL9RwY6izIKRHTcVkotYUsuHjo+DZqHXAwCswQ==
X-Received: by 2002:adf:8067:: with SMTP id 94mr14821888wrk.427.1593412423531; 
 Sun, 28 Jun 2020 23:33:43 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 s8sm41059111wru.38.2020.06.28.23.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 23:33:42 -0700 (PDT)
Date: Mon, 29 Jun 2020 02:33:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200629023225-mutt-send-email-mst@kernel.org>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20200629022124-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27602AB2A9A242D79343CE48886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27602AB2A9A242D79343CE48886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 29, 2020 at 06:25:41AM +0000, Peng Fan wrote:
> > > > > Anyway, re-reading the last messages of the original thread [1],
> > > > > it looks like Peng had a clear idea on how to fix the general issue.
> > > > > Peng, what happened with that?
> > >
> > > We shrinked the rpmsg reserved area to workaround the issue.
> > > So still use the dma apis in rpmsg.
> > >
> > > But here I am going to address domu android trusty issue using virtio.
> > 
> > My suggestion is to first of all fix DMA API so it works properly.
> 
> Could you please elaborate more details?
> 
> You mean the DMA API usage of rpmsg? Or xen domu dma_ops?
> 
> Thanks,
> Peng. 

Not 100% sure but I think xen dma ops.

-- 
MST


