Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D76A550F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503155.775336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvto-0006Os-9N; Tue, 28 Feb 2023 09:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503155.775336; Tue, 28 Feb 2023 09:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvto-0006N1-6Q; Tue, 28 Feb 2023 09:03:52 +0000
Received: by outflank-mailman (input) for mailman id 503155;
 Tue, 28 Feb 2023 09:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWvtm-0006Mv-Lf
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:03:50 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d069d368-b746-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 10:03:50 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-GS236xGyNei3cmJAoFzW3A-1; Tue, 28 Feb 2023 04:03:45 -0500
Received: by mail-wm1-f71.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso3368550wmm.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 01:03:45 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003e204fdb160sm15217479wmb.3.2023.02.28.01.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:03:43 -0800 (PST)
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
X-Inumbo-ID: d069d368-b746-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677575028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mo3Ix7HhvRTB/uL9iGxje7SInRQ3/WqLFw5P2OgDP1c=;
	b=GbRvBvRbHmX6Pu2QNFfZu4BkPIKoUF4RTBBtHXjPJ8YtuZwOovQJyh4mhAT+GHkOxO7Q03
	6FkGw2PhzJ43mbo7eazEgnfmkHiKVihpHOeImc+ELj+nrb7W7Wmz67JdDIfiv00+inmckm
	BFwGaQ0oFAiICGslOQVXKnuDA1Li60Q=
X-MC-Unique: GS236xGyNei3cmJAoFzW3A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677575024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mo3Ix7HhvRTB/uL9iGxje7SInRQ3/WqLFw5P2OgDP1c=;
        b=jr6uaKnTPW0MJ4BvSBIFpWPxYqr5LJjHY3zqa8HiWqZnVWpRjWDOPO615V1z7VB0u/
         u+KdxtQofU7wOPTywywPz/OxSwR2HROnisbWDdHeqdrYDozwsRb03dTE2oHjMY1q98Vb
         zjNQDcVKiGYWEipBgT9qaTv4+pF7iPhCCSTEH08CXMxxx8VY/gdvkWxnqn63OnsVCEQb
         YX+S9OJcwUsV0yQTmzqNhPC6Qt5fBvaeZleWqKqz2Je0kEeLVONDhYPDYvnt4Lu9uRBn
         cTQcwKKLnNjjXdmsy41a/LkbWXgV6343djYUqegJYShjc7d5OvU4MjV3xLNOXGzpDO8r
         045A==
X-Gm-Message-State: AO0yUKVKBCrEWOQ5D+y688tkVJ92n3yn6fgUIIP4tdl1AIuOgy9td1Eb
	iBig+dFsYxUwSFaqhxGRxNlYPrgpdUGxVtBaKwBvBqInXuKjm/nAnvygC1LdFsBRz4Y7Zyqx+Dh
	Eggqo7tjnnjLU+sK4KKNYZpJwXJs=
X-Received: by 2002:a05:600c:4aa8:b0:3eb:3947:41ea with SMTP id b40-20020a05600c4aa800b003eb394741eamr1323189wmp.37.1677575024176;
        Tue, 28 Feb 2023 01:03:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+8SxD5nvNj4eV/WkOWGobg8EUZ1L7PKKhyad8zHqSvg6kV07EAi8Li74NHX7YpKP3bxvWK1g==
X-Received: by 2002:a05:600c:4aa8:b0:3eb:3947:41ea with SMTP id b40-20020a05600c4aa800b003eb394741eamr1323163wmp.37.1677575023825;
        Tue, 28 Feb 2023 01:03:43 -0800 (PST)
Date: Tue, 28 Feb 2023 04:03:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228040115-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/3CiEKKoG06t9rr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > I feel like we should have separate deprecation entries for the
> > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > although they're related they are independant features with
> > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > can explain the impact more clearly if we separate them.
> > > > 
> > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > a superset.
> > > > 
> > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > and the maintainance overhead is quite small.
> > > 
> > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > someone is still using QEMU usermode emulation
> > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > 
> > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > I think 32 bit x86 environments are just more common in the cloud.
> 
> Can you point to anything that backs up that assertion. Clouds I've
> seen always give you a 64-bit environment, and many OS no longer
> even ship 32-bit installable media.


Sorry about being unclear. I meant that it seems easier to run CI in the
cloud in a 32 bit x64 environment than get a 32 bit ARM environment.

> I would be surprised if 32-bit
> is above very very low single digits usage compared to x86_64.

Absolutely.

> > > > In fact, keeping this support around forces correct use of
> > > > posix APIs such as e.g. PRIx64 which makes the code base
> > > > more future-proof.
> > > 
> > > If you're concerned about PRIx64 and friends: We still continue to do
> > > compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> > > cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> > > run in the CI.
> > > 
> > >  Thomas
> > 
> > Yes - fundamentally 32 bit does not seem that different from e.g.
> > windows builds - we presumably support these but AFAIK CI does not
> > test these.
> 
> We do compile test windows in CI via mingw, and we also do build
> and unit tests via msys.
> 
> Even Windows has dropped 32-bit support though, and so the only
> reason we keep 32-bit Windows around is because of Windows 10.
> Once a Windows 12 comes along, we'll not need to support 32-bit
> Windows either.
> 
> With regards,
> Daniel

Or maybe we'll just rely on WSL.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


