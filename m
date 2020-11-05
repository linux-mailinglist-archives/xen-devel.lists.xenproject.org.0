Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0032A75C1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 03:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19608.44825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaVJz-0000wh-TL; Thu, 05 Nov 2020 02:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19608.44825; Thu, 05 Nov 2020 02:48:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaVJz-0000wO-NX; Thu, 05 Nov 2020 02:48:19 +0000
Received: by outflank-mailman (input) for mailman id 19608;
 Thu, 05 Nov 2020 02:48:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kaVJx-0000wJ-PX
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 02:48:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20a2e41c-6409-4831-b65d-ee97d36f04f1;
 Thu, 05 Nov 2020 02:48:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 245DF207BB;
 Thu,  5 Nov 2020 02:48:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=f69X=EL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kaVJx-0000wJ-PX
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 02:48:17 +0000
X-Inumbo-ID: 20a2e41c-6409-4831-b65d-ee97d36f04f1
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 20a2e41c-6409-4831-b65d-ee97d36f04f1;
	Thu, 05 Nov 2020 02:48:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 245DF207BB;
	Thu,  5 Nov 2020 02:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604544496;
	bh=ZRX03WWp+HodhW70KtyU3AosnroCscAI79TzzbsHGMo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tX/bB4ieWI//QTQJIe7Jp/rxTkdd79TjF1ezfVgEucOxk+jnx/1r2TP3B0IVG0RSU
	 vgsI8Upx66YuO5sZAqFhAA66ilyYACmbv5aCJpzXkLqmmZz+RmEhQHHJh0Uptxw/Pa
	 /EYtXuZou0pV3xIkPO6c9mBLKIFzqwWVm/u/KIgw=
Date: Wed, 4 Nov 2020 18:48:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Paolo Bonzini <pbonzini@redhat.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
    =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>, 
    qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, 
    Fam Zheng <fam@euphon.net>, Richard Henderson <rth@twiddle.net>, 
    Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
    Thomas Huth <thuth@redhat.com>, 
    Wainer dos Santos Moschetta <wainersm@redhat.com>, 
    Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
In-Reply-To: <CABgObfaAH1fty0y0Z10GALnhy4kL_FqSxPZc2-=PwJgtSrOX0g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2011041742580.3264@sstabellini-ThinkPad-T480s>
References: <20201103164604.2692357-1-philmd@redhat.com> <20201103164604.2692357-3-philmd@redhat.com> <20201103165247.GT205187@redhat.com> <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com> <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com>
 <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s> <CABgObfaAH1fty0y0Z10GALnhy4kL_FqSxPZc2-=PwJgtSrOX0g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1067490152-1604540899=:3264"
Content-ID: <alpine.DEB.2.21.2011041755170.3264@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1067490152-1604540899=:3264
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2011041755171.3264@sstabellini-ThinkPad-T480s>

On Wed, 4 Nov 2020, Paolo Bonzini wrote:
> Il mer 4 nov 2020, 03:27 Stefano Stabellini <sstabellini@kernel.org> ha scritto:
>       FYI I tried to build the latest QEMU on Alpine Linux 3.12 ARM64 and I
>       get:
> 
>         ninja: unknown tool 'query'
> 
>       Even after rebuilding ninja master by hand. Any ideas? I don't know much
>       about ninja.
> 
> 
> Are you sure you have ninja installed and not its clone samurai (yes, I am serious)? I have contributed query support to samurai but it
> hasn't made it to a release yet.
> 
> What is the output of "ninja -t list"?

I repeated all the steps to make sure. The first time I was using
Samurai because Alpine Linux comes with it and not Ninja. Then, I
removed Samurai and built and installed Ninja by hand from
https://github.com/ninja-build/ninja and that actually works. Yesterday
it was late and I was distracted by global events -- I must have failed
to update Ninja appropriately. Sorry for the confusion.
--8323329-1067490152-1604540899=:3264--

