Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A399B7F337
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125171.1467196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uys8y-0008F0-AV; Wed, 17 Sep 2025 13:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125171.1467196; Wed, 17 Sep 2025 13:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uys8y-0008DW-7f; Wed, 17 Sep 2025 13:24:20 +0000
Received: by outflank-mailman (input) for mailman id 1125171;
 Wed, 17 Sep 2025 13:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WYKi=34=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1uys8x-0008DQ-9H
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 13:24:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 979e214b-93c9-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 15:24:09 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-PodyvTI3NAK437XH95VlJw-1; Wed,
 17 Sep 2025 09:24:07 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 774A11800562; Wed, 17 Sep 2025 13:23:58 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.195])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 716B33002D26; Wed, 17 Sep 2025 13:23:39 +0000 (UTC)
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
X-Inumbo-ID: 979e214b-93c9-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758115448;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLRV015Povt+VNSvSRUbgvoZOhQwts5tuReFT3LIL+Q=;
	b=imINsUi1zaoak+U84XPEaMPtZMuQ08EdlbY0HlnOPKyR9BRjquPi6pSkK+YtjfaHGLJcFU
	6awexKLxEfZlSyXdH7lRyXT4cB3Fgu/LTjg5nlugq0wlM5s/t2N8kYx4a3v+yMHA0CWCZU
	6gNyx5g1lNES/maSblLlCUE8wBgtZvk=
X-MC-Unique: PodyvTI3NAK437XH95VlJw-1
X-Mimecast-MFC-AGG-ID: PodyvTI3NAK437XH95VlJw_1758115441
Date: Wed, 17 Sep 2025 14:23:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
	John Levon <john.levon@nutanix.com>,
	Thanos Makatos <thanos.makatos@nutanix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
Message-ID: <aMq2V0rD2Q27VXOg@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <aMqiK5SaeBJlSa_h@redhat.com>
 <a1ad2a8f-8a69-4d25-bffd-482aec2fe9db@rsg.ci.i.u-tokyo.ac.jp>
 <aMq073aYphuFO2En@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMq073aYphuFO2En@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Wed, Sep 17, 2025 at 02:17:35PM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 17, 2025 at 09:24:04PM +0900, Akihiko Odaki wrote:
> > On 2025/09/17 20:57, Daniel P. Berrangé wrote:
> > > On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
> > > > Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
> > > > ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
> > > > 
> > > > Supersedes: <20240829-memory-v1-1-ac07af2f4fa5@daynix.com>
> > > > ("[PATCH] docs/devel: Prohibit calling object_unparent() for memory region")
> > > > 
> > > > Children are automatically unparented so manually unparenting is
> > > > unnecessary.
> > > 
> > > Where is automatic unparenting you're referring to being done ?
> > > 
> > > > Worse, automatic unparenting happens before the instance_finalize()
> > > > callback of the parent gets called, so object_unparent() calls in
> > > > the callback will refer to objects that are already unparented, which
> > > > is semantically incorrect.
> > > 
> > > IIUC, object_property_add_child will acquire a reference on
> > > the child, and object_property_del_child (and thus
> > > object_unparent) will release that reference.
> > > 
> > > The 'object_finalize' method, and thus 'instance_finalize'
> > > callback, won't be invoked until the last reference is
> > > dropped on the object in question.
> > > 
> > > IOW, it should be impossible for 'object_finalize' to ever
> > > run, as long as the child has a parent set.
> > > 
> > > So if we're in the 'finalize' then 'object_unparent' must
> > > be a no-op as the child must already have no references
> > > held and thus no parent.
> > > 
> > > IOW, the reason to remove 'object_unparent' calls from
> > > finalize is surely because they do nothing at all,
> > > rather than this talk about callbacks being run at the
> > > wrong time ?
> > 
> > This patch series deals with the situation where the parent calls
> > object_unparent() in its instance_finalize() callback. The process of
> > finalization looks like as follows:
> > 
> > 1. The parent's reference count reaches to zero. Please note that there can
> > be remaining children that are referenced by the parent at this point.
> > 
> > 2. object_finalize() is called.
> > 
> > 2a. object_property_del_all() is called and the parent releases references
> > to its children. This is what I referred as "automatic unparenting". The
> > children without any other references will be finalized here.
> > 
> > 2b. instance_finalize() is called. Past children may be already finalized,
> > and calling object_unparent() here will cause dereferencing finalized
> > objects in that case, which should be avoided.
> 
> Oh, so these object_unparent calls run by the parent, against the child
> in fact use-after-free flaws.

Oh actually not a use-after-free since memory regions aren't directly
freed by object_finalize.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


