Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA6587D45
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379337.612707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIs7W-0005ro-B0; Tue, 02 Aug 2022 13:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379337.612707; Tue, 02 Aug 2022 13:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIs7W-0005ol-7D; Tue, 02 Aug 2022 13:39:38 +0000
Received: by outflank-mailman (input) for mailman id 379337;
 Tue, 02 Aug 2022 13:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BTa=YG=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1oIs7U-0005of-G5
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:39:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ad59a15-1268-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 15:39:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-U6IUAjxTM9uGOWNhdYZ0Aw-1; Tue, 02 Aug 2022 09:39:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54C66185A7BA;
 Tue,  2 Aug 2022 13:39:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0658918EA8;
 Tue,  2 Aug 2022 13:39:27 +0000 (UTC)
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
X-Inumbo-ID: 8ad59a15-1268-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659447573;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5WEoZygjzqMSSH7tx9J19kK8fi3fwB7HNVYvZTJSVFg=;
	b=JxmZNdMwwChtbP+zbREPKo1NIVuiToYxNgDGn0fGIXHHrptSXVDMd2TE4vltEhP8EmfcVX
	j0JFa3kBd0nOU3xonv2TLFrOK4m9cWzqIvD1o/WqqK2LFOREEkPp+xwDC0C3L/0YhUVPfU
	fF1+qJih8lhwXtd09jjGfefqKgRk3N8=
X-MC-Unique: U6IUAjxTM9uGOWNhdYZ0Aw-1
Date: Tue, 2 Aug 2022 14:39:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Julien Grall <julien@xen.org>,
	Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xenproject.org, libvir-list@redhat.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Message-ID: <YukpDR2frtExoke+@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
 <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
 <Yueeh9w1EiY2sNEK@redhat.com>
 <YukM85j+Q+w0YLCu@mail-itl>
MIME-Version: 1.0
In-Reply-To: <YukM85j+Q+w0YLCu@mail-itl>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Aug 02, 2022 at 01:39:31PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Aug 01, 2022 at 10:36:07AM +0100, Daniel P. Berrangé wrote:
> > Generally we want to see errors triggered from new enums arriving,
> > as it can be a sign that libvirt code needs a semantic change in
> > order to continue operating correctly.  It isn't always correct
> > to assume that the 'default' case gives the correct behaviour.
> 
> Isn't that the exact purpose of 'default' label? If use of 'default'
> means "any of the other 5 specific values, but lets save some characters
> to not name them explicitly", then IMHO better to name them
> explicitly...
> 
> I can see a value of -Werror=switch-enum when adding new (internal) enum
> value, to find all the cases where code needs to be adjusted, but even
> then a grep is probably sufficient enough. On the other hand, if there
> are cases where indeed all the values of (internal API) enum needs to be
> handled explicitly, maybe simply omit 'default' label and use
> -Werror=switch?
> 
> Anyway, if tracking all the enums values of all the used 3rd-party APIs
> is desirable (like, noticing when libxl adds new disk type), then it
> probably should be a separate CI job, not the default devel build.
> Otherwise breakages like this will happen from time to time, and will
> be annoyed for people on involved in specific code part at all.
> 
> As a short term fix, maybe Xen's CI can build libvirt with
> -Wno-error=switch-enum?

I think makes sense for a 3rd party CI todo that, since these warnings
are primarily targetted at libvirt upstream maintainers, so that we
catch problems before code is committed.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


