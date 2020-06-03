Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC31ECDB2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 12:37:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQm3-0003P4-7w; Wed, 03 Jun 2020 10:37:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKEY=7Q=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1jgQm2-0003Oz-4H
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 10:37:30 +0000
X-Inumbo-ID: 37c91613-a586-11ea-acd8-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 37c91613-a586-11ea-acd8-12813bfff9fa;
 Wed, 03 Jun 2020 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591180647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VkqhYSS98jc06kx+9BWIV21Ktmm8jMwWjON+J/rxSC8=;
 b=HAdVywNyLHVP2z5YCamBFxusoBz5/6QS8hCprgIxucMzBuAbxsXqqKRn4U60s5z2Pprv5V
 8dljF5pxl0lTw7h0qQeA3obk5/2IZt2lk5JdOsYoEtUGrzJauQG2pfbqiNZ+/bfJjj97G7
 8FSc5zNWtxlKvJa3pNGsYer/hikXQH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-r3Mbu2wOMXmbVxnWXY9FCg-1; Wed, 03 Jun 2020 06:37:16 -0400
X-MC-Unique: r3Mbu2wOMXmbVxnWXY9FCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4213835B46;
 Wed,  3 Jun 2020 10:37:15 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AC195117E;
 Wed,  3 Jun 2020 10:37:11 +0000 (UTC)
Date: Wed, 3 Jun 2020 11:37:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pavel Hrdina <phrdina@redhat.com>
Subject: Re: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
Message-ID: <20200603103708.GB2892653@redhat.com>
References: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
 <20200603103109.GA11390@antique-laptop>
MIME-Version: 1.0
In-Reply-To: <20200603103109.GA11390@antique-laptop>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: libvir-list@redhat.com, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 12:31:09PM +0200, Pavel Hrdina wrote:
> On Tue, Jun 02, 2020 at 04:47:45PM +0100, Ian Jackson wrote:
> > Prior to 2621d48f005a "gnulib: delete all gnulib integration",
> > one could pass ./autogen.sh --no-git to prevent the libvirt build
> > system from running git submodule update.
> > 
> > This feature is needed by systems like the Xen Project CI which want
> > to explicitly control the revisions of every tree.  These will
> > typically arrange to initialise the submodules check out the right
> > version of everything, and then expect the build system not to mess
> > with it any more.
> 
> To be honest I don't understand why would anyone want to keep track of
> all submodules of all projects for any CI and update it manually every
> time the upstream project changes these submodules. Sounds like a lot
> of unnecessary work but maybe I'm missing something.

Two possible scenarios that I think are valid

 - The CI job script does not have network access
 - The CI job script sees the source dir as read-only

In both cases the CI harness would have to initialize the submodule
before runing the CI job.

I don't know if this is what Xen CI is hitting, but I think the
request is reasonable none the less.

Both Jenkins and GitLab CI have option to make the harness init
submodules prior to the job running.

> > Despite to the old documentation comments referring only to gnulib,
> > the --no-git feature is required not only because of gnulib but also
> > because of the other submodule, src/keycodemapdb.
> > 
> > (And in any case, even if it were no longer required because all the
> > submodules were removed, it ought ideally to have been retained as a
> > no-op for compaibility reasons.)
> 
> Well, we will break a lot more by switching to Meson build system where
> everyone building libvirt will have to change their scripts as it will
> not be compatible at all.

Yes, but I think that's tangential, as the two above reasons will
still apply, and Meson will cope with having submodules pre-initialized.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


