Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACCBB85F62
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 18:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126348.1467956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzHNz-0002HJ-4T; Thu, 18 Sep 2025 16:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126348.1467956; Thu, 18 Sep 2025 16:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzHNz-0002Ff-1i; Thu, 18 Sep 2025 16:21:31 +0000
Received: by outflank-mailman (input) for mailman id 1126348;
 Thu, 18 Sep 2025 16:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j8y1=35=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1uzHNy-0002FZ-GH
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 16:21:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c112ec3-94ab-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 18:21:10 +0200 (CEST)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-zBUp8XwaMNS781BSQpwriw-1; Thu, 18 Sep 2025 12:21:07 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-78f6250f0cdso18023466d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 09:21:07 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-793472c35c4sm15248966d6.24.2025.09.18.09.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 09:21:05 -0700 (PDT)
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
X-Inumbo-ID: 7c112ec3-94ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758212468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2pPot1YgRDZE6hCh7mQ2pocPU2SLwI5BRF837EyaCck=;
	b=ERsDXc+qh4uLQ5tLZzl1D2ZEIYX6w/zv2ZmWleD5eqx6AjE3kQLF6fIY9/GTl++Pljif0+
	lsNolM4iPC2mneLedyre9jjIivrF5SThRAfsOjvzsgtytfNS9rQF6tuYoCvUxTLdTLyMKf
	nmaFzIx9veQCqADD+L7BNSjsUFNFi0E=
X-MC-Unique: zBUp8XwaMNS781BSQpwriw-1
X-Mimecast-MFC-AGG-ID: zBUp8XwaMNS781BSQpwriw_1758212467
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758212467; x=1758817267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pPot1YgRDZE6hCh7mQ2pocPU2SLwI5BRF837EyaCck=;
        b=n9CwN6cat+D5YUbT9NgoxztDVWbCVGyZV7HDVRsnXdOeR6WejHgfJjz0DpakpbgWU+
         5v6tnu2RUOXBP5oB+zCZEJs1u+IpuBWBRZ1NLC/sweO0JdBHr50tJ2EnIZ+Jum8eiKKA
         Ty/JT6v37egKYhZ6myPMEnf7N0RvlhkVmqNw3sSTOoclEbpY8CmOoGG9ikFkDreP+sc1
         I1jQ1m5f10y4riYB58TyLTeuCR0JaiExRYTwSPwkoCImrmbc9Hczg8bDlaLvme82Dq+S
         6REzqZJvfWAZMd8keg0o+kVAHVLalmUNv96EIjhYjDWeZzzg2sbRxKXBHWUR1GDrb4Hi
         ISmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUole/Df6SChedF6tojFjcEEjIc4JeyTB/2qk4qEAMOmyMgDy69wzXc9qzmQ/w6beYrSTeoc+bIXuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbJGxTfvySa9oTMdnydM4DtYJhlg4vbePr+98E3hczdadhfTiR
	2r9QahQoKoPiEzLxRs+BDtcQcW9tWgE0Hl/3kEIOFtVKiL1KO20wRd4FGJtYYsJileaADWyC3p8
	Nf4iH/LaUK8squo/eejBBW8kj4+PAujrQGHIVZaeSS3QOF5hqnkUcvg7qCIRTjusmXwll
X-Gm-Gg: ASbGnctLQB1AVprJ7z8ls4QGGMvRUb3g9RN+eimu+SnzZ6IaJS/ddVi8ZU1pvdqwZip
	M9z8Y/nvj/L1iNU5lVhHr7uy6W4oMmRnpxDqhKz/Wx3jnwKMRMuJcwAwidoBWumoHmslstX3OSJ
	0qUhk3bl5Ipg4CeUhH+2oBb+wcQrRhfKJAX5Gj7ePx8YiBKTb3WbcXImdDqk1q36iL4GHySIYMq
	AzwKx2hoeHeiUJeaoup43l5XVV2QadCaaV48ZP0pdvlW91IXrzpNZELDhEtmp0E3FtUYQ3Zykvc
	s/cQrlLdPP5WRpwRjCopmSTUh9wrq+Zo
X-Received: by 2002:a05:6214:5010:b0:722:970:3af1 with SMTP id 6a1803df08f44-79912981a94mr326636d6.22.1758212466530;
        Thu, 18 Sep 2025 09:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5SggIi+tiry2DFo3y6iLI5iQBDlENMAhmnoVxB3dUWtLTqu/Fo+l7vs/qxtYyCGU32KLXQg==
X-Received: by 2002:a05:6214:5010:b0:722:970:3af1 with SMTP id 6a1803df08f44-79912981a94mr325736d6.22.1758212465766;
        Thu, 18 Sep 2025 09:21:05 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:20:49 -0400
From: Peter Xu <peterx@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
	Klaus Jensen <its@irrelevant.dk>,
	Jesper Devantier <foss@defmacro.it>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
	John Levon <john.levon@nutanix.com>,
	Thanos Makatos <thanos.makatos@nutanix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
Message-ID: <aMwxYY9E3QghD10K@x1.local>
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <aMwRSpezxmIwIHrU@x1.local>
 <f536fc18-73ab-676c-bdec-59e94a3e5408@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <f536fc18-73ab-676c-bdec-59e94a3e5408@eik.bme.hu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mSY1T-UE47bh85U87x2aElxIq2n-WKK9Kn_JDQ0wMzY_1758212467
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 18, 2025 at 05:29:34PM +0200, BALATON Zoltan wrote:
> On Thu, 18 Sep 2025, Peter Xu wrote:
> > On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
> > > Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
> > > ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
> > 
> > Could I ask why this is a dependency?
> 
> It removes an address_space usage from raven so this series does not have to
> change that and I don't have to rebase that series. Otherwise these are not
> related. I'll check the problem reported about my series and send an updated
> one.

This series should be a split of a previous mixed up series that may
contain address space changes while this one doesn't.  It also doesn't
touch raven.c and ppc/.

Can I then understand it as the dependency is simply not needed?

Thanks,

-- 
Peter Xu


