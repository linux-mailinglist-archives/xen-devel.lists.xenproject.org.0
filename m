Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2896452D762
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 17:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333133.556915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhyV-0006fB-2S; Thu, 19 May 2022 15:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333133.556915; Thu, 19 May 2022 15:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhyU-0006cV-Sy; Thu, 19 May 2022 15:22:02 +0000
Received: by outflank-mailman (input) for mailman id 333133;
 Thu, 19 May 2022 15:21:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lPOh=V3=redhat.com=afaria@srs-se1.protection.inumbo.net>)
 id 1nrhxi-0006b7-Vi
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 15:21:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 518411c9-d787-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 17:21:13 +0200 (CEST)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-MEKXsXuSPRWk9CaFymr4YA-1; Thu, 19 May 2022 11:21:03 -0400
Received: by mail-io1-f69.google.com with SMTP id
 i189-20020a6bb8c6000000b0065e475f5ca9so1452782iof.15
 for <xen-devel@lists.xenproject.org>; Thu, 19 May 2022 08:21:03 -0700 (PDT)
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
X-Inumbo-ID: 518411c9-d787-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652973671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kXd/KXupdtmjxq/4SY395DYkyzm3K35XRINwHe8irxs=;
	b=MDQguJFnQM86N9dYUMv1L6Nxyy48vqiCHLCR3zi5XKTw/5yv//CE0M5rkR4n0Yt/XyoIBO
	WG1+ZJlPQ/ADG/GxIqTg1zvoLYENfiGyh+dlyWWzl0SdNIlrk7AU8VrMWc87gECChKYe9+
	Dm9I+IWJULbGygeIryzpZA4aXMKE3NU=
X-MC-Unique: MEKXsXuSPRWk9CaFymr4YA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kXd/KXupdtmjxq/4SY395DYkyzm3K35XRINwHe8irxs=;
        b=baPHkJDAZ4E+hUwv0HMS+IWNcFlR4XLCR8w8nqYYTjHXeF09IlUaWetoWQomVsHxDd
         W7Tzl1WwJ9EeNgeUXuxoyYHsK7RY6QP6wmR+RlJagfpGngEbvlh3d1VyGXJ08oKhuwLJ
         kf7GK96+WMIJVzWJI5HmzX4dtdFdTp3LNNNZmqYihWGzSfZc8cJsYVheTgUsZi8nUbMX
         zTAKPQitvVb0IW4oYiuweTRPc7AbG+rgPVVfgv21G54uOh/78l1q0wcnvVv4MAwBVWxL
         aA6A6iWIhDIirG8xdqY8WeA84gjBHVMMTAjyl7dFJvaJogLrC50m192MCMPBAQWW5z3/
         YCSA==
X-Gm-Message-State: AOAM532qQ3JVHzab+9xAWwnd+O3OSKYEDqBtEvmR/yoha2Whab7rbTAI
	APQLw2tVM/c5SqyvZDFibp9l7C78gh/pWvoCc6XNoDvKmtgh/mGhj6Dn4q9W9NOpE5h8IRhI9k/
	T6ODQa5DD4tGqG+9RgFZUe9FQZZ7oOU6J7Z3i0H0lrBs=
X-Received: by 2002:a05:6638:1392:b0:32e:51e5:13fa with SMTP id w18-20020a056638139200b0032e51e513famr3017203jad.263.1652973662691;
        Thu, 19 May 2022 08:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVEJuNBAbP7uNezP2WpklP0FvEPhmrPpG0D9hQTRzYnOAhTSZ27Q+FaJmT8AitFoKl/d1StXHk8iDG86gDIus=
X-Received: by 2002:a05:6638:1392:b0:32e:51e5:13fa with SMTP id
 w18-20020a056638139200b0032e51e513famr3017189jad.263.1652973662496; Thu, 19
 May 2022 08:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220518130945.2657905-1-stefanha@redhat.com>
In-Reply-To: <20220518130945.2657905-1-stefanha@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 19 May 2022 16:20:26 +0100
Message-ID: <CAELaAXxiBSFMnFUzGy8NxCr0GMOrop_43HAvmkj8s4dy3fy0xA@mail.gmail.com>
Subject: Re: [PATCH] block: get rid of blk->guest_block_size
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, John Snow <jsnow@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, 
	qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, 
	Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
	Xie Yongji <xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=afaria@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 2:10 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Commit 1b7fd729559c ("block: rename buffer_alignment to
> guest_block_size") noted:
>
>   At this point, the field is set by the device emulation, but completely
>   ignored by the block layer.
>
> The last time the value of buffer_alignment/guest_block_size was
> actually used was before commit 339064d50639 ("block: Don't use guest
> sector size for qemu_blockalign()").
>
> This value has not been used since 2013. Get rid of it.
>
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alberto Faria <afaria@redhat.com>


