Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58206A54FD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503138.775307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvqA-0004Fy-BK; Tue, 28 Feb 2023 09:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503138.775307; Tue, 28 Feb 2023 09:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvqA-0004CL-7e; Tue, 28 Feb 2023 09:00:06 +0000
Received: by outflank-mailman (input) for mailman id 503138;
 Tue, 28 Feb 2023 09:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTHW=6Y=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pWvq8-0003qW-3n
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:00:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 489738b9-b746-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 10:00:02 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-unzHq4k8NrGaRGqkhunq0A-1; Tue, 28 Feb 2023 03:59:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02EC9299E747;
 Tue, 28 Feb 2023 08:59:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEF2A2026D4B;
 Tue, 28 Feb 2023 08:59:54 +0000 (UTC)
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
X-Inumbo-ID: 489738b9-b746-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574800;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EF5YmrVTXup8974t3suecxHHmZbvsS2aqdc5XTi5Ek=;
	b=TFeIbr+E02sglU+6eQ+p6KSHvdM5aYW4bedHT0OcqZKOtR1hC+1NHWfE+0GjpXmVHRvjz1
	2Eb1a2h1QJVXRKEv86gGUxbxXA523Ge25/H3KfwQIpB6gPdDIXOTrtzlKOu2OVFf1jxnOM
	lqCiYcFSpX7y58/0PeQ9ybuXUywj1Jc=
X-MC-Unique: unzHq4k8NrGaRGqkhunq0A-1
Date: Tue, 28 Feb 2023 08:59:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/3CiEKKoG06t9rr@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228031026-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > I feel like we should have separate deprecation entries for the
> > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > although they're related they are independant features with
> > > > differing impact. eg removing qemu-system-i386 affects all
> > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > can explain the impact more clearly if we separate them.
> > > 
> > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > a superset.
> > > 
> > > Removing support for building on 32 bit systems seems like a pity - it's
> > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > and the maintainance overhead is quite small.
> > 
> > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > someone is still using QEMU usermode emulation
> > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> 
> I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> I think 32 bit x86 environments are just more common in the cloud.

Can you point to anything that backs up that assertion. Clouds I've
seen always give you a 64-bit environment, and many OS no longer
even ship 32-bit installable media. I would be surprised if 32-bit
is above very very low single digits usage compared to x86_64.

> > > In fact, keeping this support around forces correct use of
> > > posix APIs such as e.g. PRIx64 which makes the code base
> > > more future-proof.
> > 
> > If you're concerned about PRIx64 and friends: We still continue to do
> > compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> > cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> > run in the CI.
> > 
> >  Thomas
> 
> Yes - fundamentally 32 bit does not seem that different from e.g.
> windows builds - we presumably support these but AFAIK CI does not
> test these.

We do compile test windows in CI via mingw, and we also do build
and unit tests via msys.

Even Windows has dropped 32-bit support though, and so the only
reason we keep 32-bit Windows around is because of Windows 10.
Once a Windows 12 comes along, we'll not need to support 32-bit
Windows either.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


