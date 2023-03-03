Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6F6A968B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505911.778914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3kw-0005BE-DI; Fri, 03 Mar 2023 11:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505911.778914; Fri, 03 Mar 2023 11:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3kw-00058s-AX; Fri, 03 Mar 2023 11:39:22 +0000
Received: by outflank-mailman (input) for mailman id 505911;
 Fri, 03 Mar 2023 11:39:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0SY=63=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pY3ku-00056c-Qo
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:39:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07ca3766-b9b8-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 12:39:18 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-7_OlWQwlO0GNqGzgpw94mw-1; Fri, 03 Mar 2023 06:39:15 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BA9B29AA3B0;
 Fri,  3 Mar 2023 11:39:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E45B6140EBF4;
 Fri,  3 Mar 2023 11:39:11 +0000 (UTC)
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
X-Inumbo-ID: 07ca3766-b9b8-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677843557;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Sexof3CaldIYpbgHhQFfPYuNh/PjDrWj3k12Gp1hVDo=;
	b=gfnbDeFS/1h7xrKmbd7CdcCsbxZwXVvujI8mcjHXvfHTPf05x4gvLOYJr9u6iwdl9rme2n
	y4H+JqDEazLxMF6mKEl8cBPWAuDTXrsFH17dc6+0Q1nu8SgTIjAnbcfjfyXvn3sdZ0pqvA
	UdJOZeLNJEn/wErEynup7KMEU0IlkU0=
X-MC-Unique: 7_OlWQwlO0GNqGzgpw94mw-1
Date: Fri, 3 Mar 2023 11:39:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Message-ID: <ZAHcXUvAKFHeJiM7@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
 <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

On Fri, Mar 03, 2023 at 12:31:42PM +0100, Thomas Huth wrote:
> On 03/03/2023 12.16, Peter Maydell wrote:
> > On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > qemu-system-aarch64 is a proper superset of qemu-system-arm,
> > > and the latter was mainly still required for 32-bit KVM support.
> > > But this 32-bit KVM arm support has been dropped in the Linux
> > > kernel a couple of years ago already, so we don't really need
> > > qemu-system-arm anymore, thus deprecated it now.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   docs/about/deprecated.rst | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index a30aa8dfdf..21ce70b5c9 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
> > >   on x86_64 hosts. Thus users are recommended to reconfigure their systems
> > >   to use the ``qemu-system-x86_64`` binary instead.
> > > 
> > > +``qemu-system-arm`` binary (since 8.0)
> > > +''''''''''''''''''''''''''''''''''''''
> > > +
> > > +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.
> > 
> > I think this is not quite true -- at the moment if you want
> > "every feature we implement, 32-bit" the only way to get
> > that is 'qemu-system-arm -cpu max'. The '-cpu max' on
> > qemu-system-aarch64 is 64-bit, and we don't implement for TCG
> > the "-cpu max,aarch64=off" syntax that we do for KVM that would
> > let the user say "no 64-bit support".
> 
> Ok ... so what does that mean now? ... can we continue with this patch, e.g.
> after rephrasing the text a little bit, or do we need to implement "-cpu
> max,aarch64=off" for TCG first?

I think we need to have a way to request the max 32-bit CPU before we
deprecate, because deprecation has to tell people what they should use
instead.

For qemu-system-i686 -cpu max, I guess we have lm=off to hide the 64-bit
support, so that's OK from QEMU POV, but will need libvirt enhancement
as I don't think we've taken that into account.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


