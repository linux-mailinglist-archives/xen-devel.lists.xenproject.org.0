Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D434DAF59
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 13:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291166.494015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUSRf-0004uH-IL; Wed, 16 Mar 2022 12:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291166.494015; Wed, 16 Mar 2022 12:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUSRf-0004rv-FH; Wed, 16 Mar 2022 12:08:03 +0000
Received: by outflank-mailman (input) for mailman id 291166;
 Wed, 16 Mar 2022 12:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r1vk=T3=redhat.com=rjones@srs-se1.protection.inumbo.net>)
 id 1nUSRd-0004ro-VZ
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 12:08:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8d43574-a521-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 13:08:00 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-Yzg7gNJ1OcuUqGNCspEPWA-1; Wed, 16 Mar 2022 08:07:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46F6080088A;
 Wed, 16 Mar 2022 12:07:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72BC3C33265;
 Wed, 16 Mar 2022 12:07:54 +0000 (UTC)
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
X-Inumbo-ID: b8d43574-a521-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647432479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hI9oM4T/Cw4CENK1lsjhdZP+mZpEDPOyBD7/RkxbPg=;
	b=iNpsv52f29zOUHFEcOxN0kacOu4+maPFlm2juNTLMUZDpr2PkUuGAVTlKL8JLTBYBe1R8T
	XZyzlOY5HVzoQN+DnUVP2yySxVcnIyFdj7dZGqOqw1iiJZmbearVnjwy2bXdbpe/v00jSW
	AKcWio1jF5SHMuM2s0JaFh0Cws93dR0=
X-MC-Unique: Yzg7gNJ1OcuUqGNCspEPWA-1
Date: Wed, 16 Mar 2022 12:07:53 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
	Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	"open list:blkverify" <qemu-block@nongnu.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
Message-ID: <20220316120753.GI1127@redhat.com>
References: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 16, 2022 at 01:52:48PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> One less qemu-specific macro. It also helps to make some headers/units
> only depend on glib, and thus moved in standalone projects eventually.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

I checked the replacements and couldn't spot any differences (I assume
you used a 'perl -pi.bak -e s///' or similar rather than doing it by
hand?).  Also I checked the macro definitions in
include/qemu/compiler.h vs /usr/include/glib-2.0/glib/gmacros.h and
they're pretty much identical.  I even learned about gnu_printf.  So:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Shouldn't there be a hunk which removes the definition of GCC_FMT_ATTR
from include/qemu/compiler.h?  Maybe that's in another place in the
patch series.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


