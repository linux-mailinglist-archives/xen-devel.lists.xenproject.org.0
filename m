Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10567BFA54
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 13:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614695.955939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBGe-00036h-Rv; Tue, 10 Oct 2023 11:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614695.955939; Tue, 10 Oct 2023 11:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBGe-00034x-PF; Tue, 10 Oct 2023 11:51:16 +0000
Received: by outflank-mailman (input) for mailman id 614695;
 Tue, 10 Oct 2023 11:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hNPq=FY=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1qqBGd-00034n-9U
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 11:51:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f0c3e45-6763-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 13:51:13 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-688-_Z6j7pO0OdGQzsJlpV6pmg-1; Tue, 10 Oct 2023 07:51:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 815681C0651E;
 Tue, 10 Oct 2023 11:51:07 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1828F15C39;
 Tue, 10 Oct 2023 11:51:04 +0000 (UTC)
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
X-Inumbo-ID: 4f0c3e45-6763-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696938671;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ZOhCdUZSoyDy7RW411TpTrHbpiHeI9FVoha0+mNGq/8=;
	b=eZrkIBQPEMAodMyvZFwadL1uuL8SELPCUbOrPS1isKKRxe5N3pSE3q1CNWWRx8PO+omHB6
	RBdlOK8zgVjlqX7Wq2Pate+ekoeYCSq1ZjQJypEhF9eLE0ZoCKkTxprFxxGdQkmtY6AJLw
	KBM4EwWiYyAC9xLZAa6vWpOl1wZKzG8=
X-MC-Unique: _Z6j7pO0OdGQzsJlpV6pmg-1
Date: Tue, 10 Oct 2023 12:51:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alyssa Ross <hi@alyssa.is>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v5 05/13] virtio-gpu: Configure context init for
 virglrenderer
Message-ID: <ZSU6pqcyBxTPTcwc@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-6-ray.huang@amd.com>
 <16520a76-7177-f97c-049b-302d8baea616@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16520a76-7177-f97c-049b-302d8baea616@collabora.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

On Tue, Oct 10, 2023 at 02:41:22PM +0300, Dmitry Osipenko wrote:
> On 9/15/23 14:11, Huang Rui wrote:
> > Configure context init feature flag for virglrenderer.
> > 
> > Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> > 
> > V4 -> V5:
> >     - Inverted patch 5 and 6 because we should configure
> >       HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> > 
> >  meson.build | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/meson.build b/meson.build
> > index 98e68ef0b1..ff20d3c249 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
> >                                         prefix: '#include <virglrenderer.h>',
> >                                         dependencies: virgl))
> >    endif
> > +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
> > +                       cc.has_function('virgl_renderer_context_create_with_flags',
> > +                                       prefix: '#include <virglrenderer.h>',
> > +                                       dependencies: virgl))
> The "cc.has_function" doesn't work properly with PKG_CONFIG_PATH. It ignores the the given pkg and uses system includes. Antonio was aware about that problem [1].
> 
> [1] https://gitlab.freedesktop.org/Fahien/qemu/-/commit/ea1c252a707940983ccce71e92a292b49496bfcd
> 
> Given that virglrenderer 1.0 has been released couple weeks ago,
> can we make the v1.0 a mandatory requirement for qemu and remove
> all the ifdefs? I doubt that anyone is going to test newer qemu
> using older libviglrenderer, all that ifdef code will be bitrotting.

We cannot do that. If is is only weeks old, no distro will
have virglrenderer 1.0 present. QEMU has a defined set of
platforms that it targets compatibility with:

  https://www.qemu.org/docs/master/about/build-platforms.html

For newly added functionality we can set the min version to
something newer than the oldest QEMU target platform.

For existing functionality though, we must not regress wrt
the currently supported set of target platforms. So we can
only bump the min version to that present in the oldest
platform we target.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


