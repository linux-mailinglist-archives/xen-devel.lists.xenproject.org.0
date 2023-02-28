Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76276A55FE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503184.775377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWwTt-0005Ub-T1; Tue, 28 Feb 2023 09:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503184.775377; Tue, 28 Feb 2023 09:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWwTt-0005S8-QC; Tue, 28 Feb 2023 09:41:09 +0000
Received: by outflank-mailman (input) for mailman id 503184;
 Tue, 28 Feb 2023 09:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTHW=6Y=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pWwTs-0005S2-Sl
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:41:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 055e84d4-b74c-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 10:41:06 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-IJDVr2aTPt6RuBqSL0DiIA-1; Tue, 28 Feb 2023 04:41:01 -0500
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF4002805588;
 Tue, 28 Feb 2023 09:41:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0344F492B12;
 Tue, 28 Feb 2023 09:40:57 +0000 (UTC)
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
X-Inumbo-ID: 055e84d4-b74c-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677577265;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPwT6LbI6vnTr+kaV/WT6dv1nv2LsgKfksaLe2/+5Co=;
	b=hsLTtTQAhDQy1yu5BfbfJzpv7Om1OXzeumCgK/F2Eph4VHixwnbf8koc9A9QPQ8WLw7k2+
	dApqrzGcERJZgFIrVGBNpa5MDoG7p8CdvW7npwPUe5n2dIdVKmLxbczDvlsat8iqRPmyEQ
	HOdERHQsPZZME8AWYOhEOrauDE/qiXE=
X-MC-Unique: IJDVr2aTPt6RuBqSL0DiIA-1
Date: Tue, 28 Feb 2023 09:40:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/3MIUDRBUSNg6C5@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

On Tue, Feb 28, 2023 at 10:14:52AM +0100, Thomas Huth wrote:
> On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > > > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > > > I feel like we should have separate deprecation entries for the
> > > > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > > > although they're related they are independant features with
> > > > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > > > can explain the impact more clearly if we separate them.
> > > > > > 
> > > > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > > > a superset.
> > > > > > 
> > > > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > > > and the maintainance overhead is quite small.
> > > > > 
> > > > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > > > someone is still using QEMU usermode emulation
> > > > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > > > 
> > > > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > > > I think 32 bit x86 environments are just more common in the cloud.
> > > 
> > > Can you point to anything that backs up that assertion. Clouds I've
> > > seen always give you a 64-bit environment, and many OS no longer
> > > even ship 32-bit installable media.
> > 
> > Sorry about being unclear. I meant that it seems easier to run CI in the
> > cloud in a 32 bit x64 environment than get a 32 bit ARM environment.
> 
> It's still doable ... but for how much longer? We're currently depending on
> Fedora, but they also slowly drop more and more support for this
> environment, see e.g.:

FWIW, we should cull our fedora-i386-cross.docker dockerfile and
replace it with a debian i686 dockerfile generated by lcitool.
There's no compelling reason why i686 should be different from
all our other cross builds which are based on Debian. The Debian
lcitool generated container would have access to a wider range
of deps than our hand written Fedora one.

>  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


