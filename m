Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD136A5809
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 12:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503262.775501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWy9C-0008Tq-DX; Tue, 28 Feb 2023 11:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503262.775501; Tue, 28 Feb 2023 11:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWy9C-0008Qo-Ah; Tue, 28 Feb 2023 11:27:54 +0000
Received: by outflank-mailman (input) for mailman id 503262;
 Tue, 28 Feb 2023 11:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTHW=6Y=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pWy9B-0008Qi-G4
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 11:27:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efd90aaa-b75a-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 12:27:52 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-2t4bR2lEM160Ab5hxW9V_Q-1; Tue, 28 Feb 2023 06:27:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 370BA18A64E0;
 Tue, 28 Feb 2023 11:27:49 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5A9404BEC5;
 Tue, 28 Feb 2023 11:27:46 +0000 (UTC)
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
X-Inumbo-ID: efd90aaa-b75a-11ed-9694-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677583671;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=4suh5lAbunuzTA9D1mz35nLVNbBw0W9grJdGWlluzWI=;
	b=R1tvVJAwh0i9LsxFmfOnrVA5nU8+FNqZInNqesyUI49pJAy1xtWc8+MyfQSj0Fjrwb61Ic
	VhjV6SNsLWyNJDfWUvWbdR8Hwfrby44ECdavywer34+0MWu1QLJyrQPbc3N1+jkgzlq0VP
	9+5CNsi9rfweFNMFYX+ilmQdoeLd+/0=
X-MC-Unique: 2t4bR2lEM160Ab5hxW9V_Q-1
Date: Tue, 28 Feb 2023 11:27:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/3lMFQl94rwTAR4@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
 <20230228061853-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230228061853-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

On Tue, Feb 28, 2023 at 06:24:02AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 12:12:22PM +0100, Thomas Huth wrote:
> > On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> > > On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> > > > The question to answer: Is 32 bit x86 worth its upkeep?  Two
> > > > sub-questions: 1. Is it worth the human attention?  2. Is it worth
> > > > (scarce!) CI minutes?
> > > 
> > > 3. Is it worth arguing about?
> > 
> > You are aware of the problems we're currently struggeling with, aren't you?
> > Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out
> > of CI minutes for the second time this year, and you ask whether it's worth
> > arguing about??? You're not serious with this question, are you?
> > 
> >  Thomas
> 
> Yah just couldn't resist. How many minutes do we use per month btw?

100,000 wall clock minutes lasted about 2+1/2 weeks this month, and
similar in Jan too. Last year we were managing to get through the
whole month on 100,000, but we got backlogged with merges due to
the xmas / new year shutdown, and catching up is exhausting our
allowance too quickly, as well as natural growth in amount of stuff
we're testing per job.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


