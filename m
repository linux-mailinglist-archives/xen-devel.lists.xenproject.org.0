Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0595866E7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 11:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378621.611911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRqW-00020E-Iz; Mon, 01 Aug 2022 09:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378621.611911; Mon, 01 Aug 2022 09:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIRqW-0001wv-Ex; Mon, 01 Aug 2022 09:36:20 +0000
Received: by outflank-mailman (input) for mailman id 378621;
 Mon, 01 Aug 2022 09:36:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+uOD=YF=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1oIRqU-0001wp-9M
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 09:36:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63b69c2b-117d-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 11:36:17 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-RVpR-IIdOt-v2lRj7-Wl8g-1; Mon, 01 Aug 2022 05:36:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22200185A794;
 Mon,  1 Aug 2022 09:36:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07BA4140EBE3;
 Mon,  1 Aug 2022 09:36:10 +0000 (UTC)
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
X-Inumbo-ID: 63b69c2b-117d-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659346575;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fT1/66XxC5JMrsVsNAbAxmVxnCB+UfRqO9wwOaAvlmw=;
	b=h2bzkkCBnRTcN3J18M9YD2MF74HYrT9v9nlVTqlGDKtKO82E6ItZmHAlrUyJf4ULI0h7E8
	IRov/w9bIK00sXQYHmo+enHzdvWS7zPNOfqksk/I7rS+w6GNP8oxDIDaJ+YhiUPpFmkQSa
	uUlASl1HNJV8uFfdgFKmuS/bdcJnX30=
X-MC-Unique: RVpR-IIdOt-v2lRj7-Wl8g-1
Date: Mon, 1 Aug 2022 10:36:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Julien Grall <julien@xen.org>
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xenproject.org, libvir-list@redhat.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Message-ID: <Yueeh9w1EiY2sNEK@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
 <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
MIME-Version: 1.0
In-Reply-To: <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 01, 2022 at 09:51:11AM +0100, Julien Grall wrote:
> Hi Michal,
> 
> On 01/08/2022 09:23, Michal Prívozník wrote:
> > On 7/29/22 17:50, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > Xen toolstack has gained basic Virtio support recently which becides
> > > adding various virtio related stuff introduces new disk backend type
> > > LIBXL_DISK_BACKEND_STANDALONE [1].
> > > 
> > > Unfortunately, this caused a regression in libvirt build with Xen support
> > > enabled, reported by the osstest today [2]:
> > > 
> > > CC       libxl/libvirt_driver_libxl_impl_la-xen_xl.lo
> > > ../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
> > > ../../src/libxl/xen_xl.c:779:17: error: enumeration value 'LIBXL_DISK_BACKEND_STANDALONE'
> > >     not handled in switch [-Werror=switch-enum]
> > >                   switch (libxldisk->backend) {
> > >                   ^~~~~~
> > > cc1: all warnings being treated as errors
> > > 
> > > The interesting fact is that switch already has a default branch (which ought
> > > to cover such new addition), but the error is triggered as -Wswitch-enum
> > > gives a warning about an omitted enumeration code even if there is a default
> > > label.
> > 
> > This is expected and in fact working correctly. We want compiler to warn
> > us about enum members that are not handled in a switch() statement.
> 
> For us this is treated as an error. Is it intended?

Yes & no, but mostly yes.

You can choose to build with -Werror or not. If building from .git
then it defaults to enabled, but can be disabled if desired.

Generally we want to see errors triggered from new enums arriving,
as it can be a sign that libvirt code needs a semantic change in
order to continue operating correctly.  It isn't always correct
to assume that the 'default' case gives the correct behaviour.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


