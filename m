Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE8544B2C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 14:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345146.570791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGrl-0004aH-T1; Thu, 09 Jun 2022 12:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345146.570791; Thu, 09 Jun 2022 12:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGrl-0004YI-Pp; Thu, 09 Jun 2022 12:02:21 +0000
Received: by outflank-mailman (input) for mailman id 345146;
 Thu, 09 Jun 2022 12:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nuio=WQ=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzGrk-0004YC-Ba
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 12:02:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd6a9197-e7eb-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 14:02:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-FrWQox30OgKOk83Mxg-NUA-1; Thu, 09 Jun 2022 08:02:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 029381C0F690;
 Thu,  9 Jun 2022 12:02:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF44E2166B26;
 Thu,  9 Jun 2022 12:02:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7C2601800094; Thu,  9 Jun 2022 14:02:14 +0200 (CEST)
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
X-Inumbo-ID: fd6a9197-e7eb-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654776138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KvQTvntB7sQwEjW9N35sI+wAlKg3Uf86xvIHaIVGPP0=;
	b=azRx1xJe8XBkBcE2Bqo0+3eOe0WcgoLmer+2bExYRw8p/yII5A5tpX2sm1fC8GPcl0ZZNN
	LwsoU9bqpm6dRSikLxI6oPFie+ZAuMZl70eevSISfE+hnIi9vA/wS/+8oz+bVS/fn3d+sK
	8FBsk4RB7nfxPeg+QF6ZOtIkGkPVHUY=
X-MC-Unique: FrWQox30OgKOk83Mxg-NUA-1
Date: Thu, 9 Jun 2022 14:02:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Message-ID: <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
 <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

On Thu, Jun 09, 2022 at 08:45:41PM +0900, Akihiko Odaki wrote:
> On 2022/06/09 19:28, Gerd Hoffmann wrote:
> > > --- a/include/ui/console.h
> > > +++ b/include/ui/console.h
> > > @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
> > >       int       yoff;
> > >       uint32_t  width;
> > >       uint32_t  height;
> > > +    uint32_t  refresh_rate;
> > >   } QemuUIInfo;
> > >   /* cursor data format is 32bit RGBA */
> > > @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
> > >       void (*gfx_update)(void *opaque);
> > >       bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
> > >       void (*text_update)(void *opaque, console_ch_t *text);
> > > -    void (*update_interval)(void *opaque, uint64_t interval);
> > >       void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
> > >       void (*gl_block)(void *opaque, bool block);
> > >   } GraphicHwOps;
> > 
> > So you are dropping update_interval, which isn't mentioned in the commit
> > message at all.  Also this patch is rather big.  I'd suggest:
> > 
> > (1) add refresh_rate
> > (2) update users one by one
> > (3) finally drop update_interval when no user is left.
> > 
> > thanks,
> >    Gerd
> > 
> 
> I think 1 and 3 should have to be done once since refresh_rate and
> update_interval would interfere with each other otherwise.

Well, between 1 and 3 both old and new API are active.  Shouldn't be
much of a problem because the GraphicHwOps implementations are using
only the one or the other.

take care,
  Gerd


