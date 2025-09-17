Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF0B7EED7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125124.1467166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyqnb-0005ED-QP; Wed, 17 Sep 2025 11:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125124.1467166; Wed, 17 Sep 2025 11:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyqnb-0005B4-NY; Wed, 17 Sep 2025 11:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1125124;
 Wed, 17 Sep 2025 11:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WYKi=34=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1uyqna-0005Ay-46
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 11:58:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9253347b-93bd-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 13:58:08 +0200 (CEST)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-vfRmwMIKMIKOyYB0nkQjsQ-1; Wed,
 17 Sep 2025 07:58:02 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D6588195608B; Wed, 17 Sep 2025 11:57:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.195])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8976C19560B8; Wed, 17 Sep 2025 11:57:35 +0000 (UTC)
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
X-Inumbo-ID: 9253347b-93bd-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758110285;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=GLbcYhOmZLOkQI2riqXN1sQU5QUildnLa02awuxxLvA=;
	b=Wc+VemoZm8DujJyN0e1pjtIgYpNY4gBcZDYETIrsyT+PvVrKbLU+JoanWiud4oieNnKBZL
	pu+EGrOK22tCtlGd/8e6pAqImkBHRqYjlucHJrl2pt7ACEoe2ZbsdBAgdLjnWXo+71+FKE
	FxgPdsIMcgEj794AJzvnfYydL+WDJMg=
X-MC-Unique: vfRmwMIKMIKOyYB0nkQjsQ-1
X-Mimecast-MFC-AGG-ID: vfRmwMIKMIKOyYB0nkQjsQ_1758110277
Date: Wed, 17 Sep 2025 12:57:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
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
Message-ID: <aMqiK5SaeBJlSa_h@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
> Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
> ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
> 
> Supersedes: <20240829-memory-v1-1-ac07af2f4fa5@daynix.com>
> ("[PATCH] docs/devel: Prohibit calling object_unparent() for memory region")
> 
> Children are automatically unparented so manually unparenting is
> unnecessary.

Where is automatic unparenting you're referring to being done ?

> Worse, automatic unparenting happens before the instance_finalize()
> callback of the parent gets called, so object_unparent() calls in
> the callback will refer to objects that are already unparented, which
> is semantically incorrect.

IIUC, object_property_add_child will acquire a reference on
the child, and object_property_del_child (and thus
object_unparent) will release that reference.

The 'object_finalize' method, and thus 'instance_finalize'
callback, won't be invoked until the last reference is
dropped on the object in question.

IOW, it should be impossible for 'object_finalize' to ever
run, as long as the child has a parent set.

So if we're in the 'finalize' then 'object_unparent' must
be a no-op as the child must already have no references
held and thus no parent.

IOW, the reason to remove 'object_unparent' calls from
finalize is surely because they do nothing at all,
rather than this talk about callbacks being run at the
wrong time ?

> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
> Changes in v3:
> - Added patches to remove other object_unparent() calls in
>   instance_finalize().
> - Dropped patch "qdev: Automatically delete memory subregions" and the
>   succeeding patches to avoid Ccing many.
> - Link to v2: https://lore.kernel.org/qemu-devel/20250915-use-v2-0-f4c7ff13bfe9@rsg.ci.i.u-tokyo.ac.jp
> 
> Changes in v2:
> - Added a reference to "[PATCH] docs/devel: Prohibit calling
>   object_unparent() for memory region", which does something similar to
>   patch "docs/devel: Do not unparent in instance_finalize()" but I
>   forgot I sent it in the past.
> - Fixed a typo in patch
>   "docs/devel: Do not unparent in instance_finalize()" and
>   "[PATCH 02/22] vfio/pci: Do not unparent in instance_finalize()".
> - Dropped patches to move address_space_init() calls; I intend to
>   QOM-ify to fix memory leaks automatically as discussed in the
>   following thread:
>   https://lore.kernel.org/qemu-devel/cd21698f-db77-eb75-6966-d559fdcab835@eik.bme.hu/
>   But the QOM-ification will be big so I'll send it as a separate
>   series.
> - Rebased on top of "[PATCH v2 00/14] hw/pci-host/raven clean ups".
>   https://lore.kernel.org/qemu-devel/cover.1751493467.git.balaton@eik.bme.hu/
> - Link to v1: https://lore.kernel.org/qemu-devel/20250906-use-v1-0-c51caafd1eb7@rsg.ci.i.u-tokyo.ac.jp
> 
> ---
> Akihiko Odaki (7):
>       docs/devel: Do not unparent in instance_finalize()
>       vfio/pci: Do not unparent in instance_finalize()
>       hw/core/register: Do not unparent in instance_finalize()
>       hv-balloon: hw/core/register: Do not unparent in instance_finalize()
>       hw/sd/sdhci: Do not unparent in instance_finalize()
>       vfio: Do not unparent in instance_finalize()
>       hw/xen: Do not unparent in instance_finalize()
> 
>  docs/devel/memory.rst  | 19 ++++++-------------
>  hw/core/register.c     |  1 -
>  hw/hyperv/hv-balloon.c | 12 +-----------
>  hw/sd/sdhci.c          |  4 ----
>  hw/vfio/pci-quirks.c   |  9 +--------
>  hw/vfio/pci.c          |  4 ----
>  hw/vfio/region.c       |  3 ---
>  hw/xen/xen_pt_msi.c    | 11 +----------
>  8 files changed, 9 insertions(+), 54 deletions(-)
> ---
> base-commit: e101d33792530093fa0b0a6e5f43e4d8cfe4581e
> change-id: 20250906-use-37ecc903a9e0
> 
> Best regards,
> --  
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


