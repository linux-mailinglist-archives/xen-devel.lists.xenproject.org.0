Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBED327CEB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 12:17:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91435.172890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGgX0-0002Zs-DW; Mon, 01 Mar 2021 11:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91435.172890; Mon, 01 Mar 2021 11:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGgX0-0002ZR-AD; Mon, 01 Mar 2021 11:16:06 +0000
Received: by outflank-mailman (input) for mailman id 91435;
 Mon, 01 Mar 2021 11:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1nAz=H7=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1lGgWy-0002ZL-1d
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 11:16:04 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d1bdd6d5-dbb7-4621-8083-47171dc20600;
 Mon, 01 Mar 2021 11:16:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-ODy2Ef9OM0WM6VBrQGnVAA-1; Mon, 01 Mar 2021 06:15:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589AA106BB23;
 Mon,  1 Mar 2021 11:15:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-165.ams2.redhat.com [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4DCB60BFA;
 Mon,  1 Mar 2021 11:15:35 +0000 (UTC)
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
X-Inumbo-ID: d1bdd6d5-dbb7-4621-8083-47171dc20600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614597360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UW5EAhRq01zAlhshGr6Cj14eUZMgDl5l2wepDZBjdqk=;
	b=Mq38vOakwCAA9ufqoSCEW/o6psBIIBqrO1XIwMmVYZg7o4cT7pTABX+VFagCMMSgwT4Dc3
	f1n5jNyiEoFoqAfmg4RrHZcPuTOhocmHQhMJRckfVmBPDpEhS3FwszdtdtLMNdL0YYat7A
	yqlZr9ziv/wHkpCUsQdNFxPZ0eihTDg=
X-MC-Unique: ODy2Ef9OM0WM6VBrQGnVAA-1
Date: Mon, 1 Mar 2021 12:15:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Jim Fehlig <jfehlig@suse.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 00/14] deprecations: remove many old deprecations
Message-ID: <20210301111534.GD7698@merkur.fritz.box>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <de4a241c-3cca-203e-62c2-bf2c19f9e7ce@suse.com>
MIME-Version: 1.0
In-Reply-To: <de4a241c-3cca-203e-62c2-bf2c19f9e7ce@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Am 25.02.2021 um 18:32 hat Jim Fehlig geschrieben:
> Adding xen-devel and Ian to cc.
> 
> On 2/24/21 6:11 AM, Daniel P. Berrangé wrote:
> > The following features have been deprecated for well over the 2
> > release cycle we promise
> 
> This reminded me of a bug report we received late last year when updating to
> 5.2.0. 'virsh setvcpus' suddenly stopped working for Xen HVM guests. Turns
> out libxl uses cpu-add under the covers.
> 
> > 
> >    ``-usbdevice`` (since 2.10.0)
> >    ``-drive file=3Djson:{...{'driver':'file'}}`` (since 3.0)
> >    ``-vnc acl`` (since 4.0.0)
> >    ``-mon ...,control=3Dreadline,pretty=3Don|off`` (since 4.1)
> >    ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
> >    ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
> >    ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
> >    ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
> >    ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].sta=
> > tus (ince 4.0)
> >    ``query-cpus`` (since 2.12.0)
> >    ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
> >    ``query-events`` (since 4.0)
> >    chardev client socket with ``wait`` option (since 4.0)
> >    ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` (s=
> > ince 4.0.0)
> >    ``ide-drive`` (since 4.2)
> >    ``scsi-disk`` (since 4.2)
> > 
> > AFAICT, libvirt has ceased to use all of these too.
> 
> A quick grep of the libxl code shows it uses -usbdevice, query-cpus, and scsi-disk.
> 
> > There are many more similarly old deprecations not (yet) tackled.
> 
> The Xen tools maintainers will need to be more vigilant of the deprecations.
> I don't follow Xen development close enough to know if this topic has
> already been discussed.

MAINTAINERS has a section for "Incompatible changes" that covers
docs/system/deprecated.rst. Maybe if the Xen maintainers are interested
in that, we could add another list or individual people there so they
would see patches that deprecate something?

But either way, it would probably be useful to check the full
deprecation list rather than just what we're going to remove right now.

Kevin


