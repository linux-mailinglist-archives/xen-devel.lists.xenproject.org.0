Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 857536A5504
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:02:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503151.775327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvs0-0005n2-To; Tue, 28 Feb 2023 09:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503151.775327; Tue, 28 Feb 2023 09:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvs0-0005lG-Qw; Tue, 28 Feb 2023 09:02:00 +0000
Received: by outflank-mailman (input) for mailman id 503151;
 Tue, 28 Feb 2023 09:01:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTHW=6Y=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pWvrz-0005lA-F6
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:01:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d1d61c8-b746-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 10:01:57 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-g2TUK-noP6SPVJBc0lV8-g-1; Tue, 28 Feb 2023 04:01:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5BD4877CA3;
 Tue, 28 Feb 2023 09:01:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D219E2026D4B;
 Tue, 28 Feb 2023 09:01:48 +0000 (UTC)
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
X-Inumbo-ID: 8d1d61c8-b746-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574915;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6vrEM3/+CLVFY3tVeIf9d5TLFCA708VKaeYPHG45Hc=;
	b=GKQ0xxxiOzBZJ+bS6NrM1f1lxJ0fulkjOGoO6Rh8ZvWY5B25XsowCpF6zDThG0N+Frpa9J
	/AibhNjp1UkSKpDdQs5Wr6p9g3Bukoa3GvDnli8GweGwZmWyPlSC1xg1wejhblwyiHsXgb
	HkAStYuSaELYQpDdFex43Gdohkq9nYE=
X-MC-Unique: g2TUK-noP6SPVJBc0lV8-g-1
Date: Tue, 28 Feb 2023 09:01:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/2] Deprecate support for 32-bit x86 and arm hosts
Message-ID: <Y/3C+jC3Lk5MJxfu@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <Y/z4rwv09Ckhbtfp@redhat.com>
 <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001bedba-b12f-4dd8-0866-7ccb9ce877d0@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Tue, Feb 28, 2023 at 08:39:49AM +0100, Thomas Huth wrote:
> On 27/02/2023 19.38, Daniel P. Berrangé wrote:
> > On Mon, Feb 27, 2023 at 12:10:48PM +0100, Thomas Huth wrote:
> > > We're struggling quite badly with our CI minutes on the shared
> > > gitlab runners, so we urgently need to think of ways to cut down
> > > our supported build and target environments. qemu-system-i386 and
> > > qemu-system-arm are not really required anymore, since nobody uses
> > > KVM on the corresponding systems for production anymore, and the
> > > -x86_64 and -arch64 variants are a proper superset of those binaries.
> > > So it's time to deprecate them and the corresponding 32-bit host
> > > environments now.
> > > 
> > > This is a follow-up patch series from the previous discussion here:
> > > 
> > >   https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
> > > 
> > > where people still mentioned that there is still interest in certain
> > > support for 32-bit host hardware. But as far as I could see, there is
> > > no real need for 32-bit host support for system emulation on x86 and
> > > arm anymore, so it should be fine if we drop these host environments
> > > now (these are also the two architectures that contribute the most to
> > > the long test times in our CI, so we would benefit a lot by dropping
> > > those).
> > 
> > Your description here is a little ambiguous about what's being
> > proposed. When you say dropping 32-bit host support do you mean
> > just for the system emulator binaries, or for QEMU entirely ?
> 
> Just for system emulation. Some people said that user emulation still might
> be useful for some 32-bit environments.
> 
> > And when the deprecation period is passed, are you proposing
> > to actively prevent 32-bit builds, or merely stopping CI testing
> > and leave 32-bit builds still working if people want them ?
> 
> CI is the main pain point, so that's the most important thing. So whether we
> throw a warning or a hard error while configuring the build, I don't care
> too much.

If we're merely wanting to drop CI support, we can do that any time and
deprecation is not required/expected.  We should only be using deprecation
where we're explicitly intending that the code will cease to work.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


