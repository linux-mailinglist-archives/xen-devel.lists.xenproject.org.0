Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355DE6A4127
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502442.774245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWc1P-00086w-G6; Mon, 27 Feb 2023 11:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502442.774245; Mon, 27 Feb 2023 11:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWc1P-00084f-D9; Mon, 27 Feb 2023 11:50:23 +0000
Received: by outflank-mailman (input) for mailman id 502442;
 Mon, 27 Feb 2023 11:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CxqC=6X=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1pWc1O-00084V-2i
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:50:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e90da18f-b694-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 12:50:20 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611--S0vocKJPE6OuEDYgPwYzA-1; Mon, 27 Feb 2023 06:50:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A983185CBE0;
 Mon, 27 Feb 2023 11:50:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47033140EBF4;
 Mon, 27 Feb 2023 11:50:09 +0000 (UTC)
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
X-Inumbo-ID: e90da18f-b694-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677498619;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=dygdNjOBh/f7cSHZKBYj9epAgNeJlw1ARAk1Xkm8Jpw=;
	b=BJvDBHl5jl4W0s+HI0NSbot4kwCEUIHj6X4i/7CrDZEkEiXrFHBkTgEBJIVy1iPqeN0AL5
	ajygKRH1pIeI8A86M1VYCzV5zjQ7p5ZBZ6nEYAC10zZCve7ee54vk8Tb0EIGwaGrQ6OW2x
	T1vLRf6fToDMPuUHG1jSc0ltbNmZZzI=
X-MC-Unique: -S0vocKJPE6OuEDYgPwYzA-1
Date: Mon, 27 Feb 2023 11:50:07 +0000
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
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <Y/yY72L9wyjuv3Yz@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230227111050.54083-2-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

On Mon, Feb 27, 2023 at 12:10:49PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 hosts today, so we should
> start deprecating them to finally have less test efforts.
> With regards to 32-bit KVM support in the x86 Linux kernel,
> the developers confirmed that they do not need a recent
> qemu-system-i386 binary here:
> 
>  https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 15084f7bea..98517f5187 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -196,6 +196,19 @@ CI coverage support may bitrot away before the deprecation process
>  completes. The little endian variants of MIPS (both 32 and 64 bit) are
>  still a supported host architecture.
>  
> +32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Testing 32-bit x86 host OS support takes a lot of precious time during the
> +QEMU contiguous integration tests, and considering that most OS vendors
> +stopped shipping 32-bit variants of their x86 OS distributions and most
> +x86 hardware from the past >10 years is capable of 64-bit, keeping the
> +32-bit support alive is an inadequate burden for the QEMU project. Thus
> +QEMU will soon drop the support for 32-bit x86 host systems and the
> +``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
> +superset of ``qemu-system-i386``) on a 64-bit host machine instead.

I feel like we should have separate deprecation entries for the
i686 host support, and for qemu-system-i386 emulator binary, as
although they're related they are independant features with
differing impact. eg removing qemu-system-i386 affects all
host architectures, not merely 32-bit x86 host, so I think we
can explain the impact more clearly if we separate them.

How about something like....


32-bit x86 hosts
''''''''''''''''

Support for 32-bit x86 host deployments is increasingly uncommon in
mainstream Linux distributions given the widespread availability of
64-bit x86 hardware. The QEMU project no longer considers 32-bit
x86 support to be an effective use of its limited resources, and
thus intends to discontinue it.

Current users of QEMU on 32-bit x86 hosts should either continue
using existing releases of QEMU, with the caveat that they will
no longer get security fixes, or migrate to a 64-bit platform
which remains capable of running 32-bit guests if needed.

``qemu-system-i386`` binary removal
'''''''''''''''''''''''''''''''''''

The ``qemu-system-x86_64`` binary can be used to run 32-bit guests
by selecting a 32-bit CPU model, including KVM support on x86_64
hosts. Once support for the 32-bit x86 host platform is discontinued,
the ``qemu-system-i386`` binary will be redundant. Current users are
recommended to reconfigure their systems to use the ``qemu-system-x86_64``
binary.



Same point for the next patch about 32-bit arm vs qemu-system-arm
binary.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


