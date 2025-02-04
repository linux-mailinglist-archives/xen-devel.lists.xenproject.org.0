Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA950A26D0B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 09:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881147.1291268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfE3H-0003Yz-Qd; Tue, 04 Feb 2025 08:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881147.1291268; Tue, 04 Feb 2025 08:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfE3H-0003X2-Nw; Tue, 04 Feb 2025 08:12:59 +0000
Received: by outflank-mailman (input) for mailman id 881147;
 Tue, 04 Feb 2025 08:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PJrr=U3=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1tfE3F-0003Ww-Lu
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 08:12:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5525c11-e2cf-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 09:12:54 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-ZPsErN4rPwqlB70V-6Egrg-1; Tue,
 04 Feb 2025 03:12:50 -0500
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A4EC819560B8; Tue,  4 Feb 2025 08:12:47 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.60])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 394E019560BC; Tue,  4 Feb 2025 08:12:43 +0000 (UTC)
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
X-Inumbo-ID: d5525c11-e2cf-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738656773;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T+l//LIVHDCsF3HWAH0IiwFCI2Gb8nvC5mYrbRnLnfI=;
	b=auS84j9QDJbpeom1jNikdxr5KMREUI+XBO5dUljsRDJ8BAUoX7SZtQsevODh0ZmIPl+wBh
	myFU+qJNEga726bSQM9Sg/Cm3nsSvXnG0TsYDzrrlSNZBaHgu5W/+SJ2og9JCWZdwQKSQF
	nD5/GbkzkXqxRbDu2uf8V4kGe5gAerA=
X-MC-Unique: ZPsErN4rPwqlB70V-6Egrg-1
X-Mimecast-MFC-AGG-ID: ZPsErN4rPwqlB70V-6Egrg
Date: Tue, 4 Feb 2025 08:12:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	mark.cave-ayland@ilande.co.uk, philmd@linaro.org, thuth@redhat.com,
	andrew.cooper3@citrix.com, anthony.perard@vates.tech,
	michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
	roger.pau@citrix.com, xen-devel@lists.xenproject.org,
	bertrand.marquis@arm.com
Subject: Re: [PATCH v2 00/14] meson: Deprecate 32-bit host support
Message-ID: <Z6HL5PHL3JzTQBpr@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250203031821.741477-1-richard.henderson@linaro.org>
 <467a5a58-952e-4930-8e91-744eda6d87d9@redhat.com>
 <e40c39d4-425c-4566-af41-373941894045@linaro.org>
 <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Mon, Feb 03, 2025 at 02:43:05PM -0800, Stefano Stabellini wrote:
> +Xen maintainers
> 
> 
> On Mon, 3 Feb 2025, Richard Henderson wrote:
> > On 2/3/25 04:54, Paolo Bonzini wrote:
> > > On 2/3/25 04:18, Richard Henderson wrote:
> > > > v1: 20250128004254.33442-1-richard.henderson@linaro.org
> > > > 
> > > > For v2, immediately disable 64-on-32 TCG.
> > > > 
> > > > I *suspect* that we should disable 64-on-32 for *all* accelerators.
> > > > The idea that an i686 binary on an x86_64 host may be used to spawn
> > > > an x86_64 guest via kvm is silly and a bit more than niche.
> > > 
> > > At least Xen used to be commonly used with 32-bit dom0, because it saved
> > > memory and dom0 would map in guest buffers as needed.  I'm not sure how
> > > common that is these days, perhaps Stefano knows.
> > 
> > As a data-point, debian does not ship libxen-dev for i686.
> > We cannot build-test this configuration at all.
> > 
> > I can build-test Xen for armhf, and I guess it would use i386-softmmu; it's
> > unclear whether x86_64-softmmu and aarch64-softmmu are relevant or useful for
> > an armhf host, or as an armhf binary running on an aarch64 host.
> 
> 
> On the Xen side, there are two different use cases: x86 32-bit and ARM
> 32-bit.  
> 
> For x86 32-bit, while it was a very important use case in the past, I
> believe it is far less so now. I will let the x86 maintainers comment on
> how important it is today.

If the Xen project needs an excuse to justify stopping 32-bit host
support, QEMU would be happy to act as the excuse :-)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


