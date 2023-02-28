Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF86A5661
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 11:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503208.775401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWwxK-0002B9-IA; Tue, 28 Feb 2023 10:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503208.775401; Tue, 28 Feb 2023 10:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWwxK-00029B-F3; Tue, 28 Feb 2023 10:11:34 +0000
Received: by outflank-mailman (input) for mailman id 503208;
 Tue, 28 Feb 2023 10:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWwxI-000295-Jh
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 10:11:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43f663b2-b750-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 11:11:29 +0100 (CET)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-09S_Es5xONijalfTxXXmWA-1; Tue, 28 Feb 2023 05:11:26 -0500
Received: by mail-ed1-f70.google.com with SMTP id
 ck7-20020a0564021c0700b004a25d8d7593so13182481edb.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 02:11:26 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 gg4-20020a170906e28400b008b1779ba3c1sm4349246ejb.115.2023.02.28.02.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:11:24 -0800 (PST)
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
X-Inumbo-ID: 43f663b2-b750-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677579088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUsHXm3vGD11b06eHDzEiEyoV6j+i/reAk8OksRIJe4=;
	b=bA4isbCU9jAQEoDGGyJAKam3z8rsLjVp0nFnkACCRZdKUa+CAOkxeBbILHbifTpFiuEr0v
	2dLFxY3UGUKlHHxpUcQyxodio1pey6HdFIC/In55VtI/akhuVE1UVULpp5P4rzk7f9iVex
	HdhcJwz7kwxojW88KaJzu1VQX0kfDiM=
X-MC-Unique: 09S_Es5xONijalfTxXXmWA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677579085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUsHXm3vGD11b06eHDzEiEyoV6j+i/reAk8OksRIJe4=;
        b=r6ZNVv4m6I4mQzok9wlfQjQocmBQ4XDF+Axnkr6aalSTziJJfcCwZ2GKDsbZoZt2BD
         e/ry9aOrOfxoYODGakD6yd9EgHkBpkju14OpqmEqD3hfDDJVLmo56Y9RTV7XQ6T1W18e
         ju3H8xQccxVePb6JhbmLkPpfwAGDJ6HALneKdNG4folEPiZa08V40mIRq0g3gb8rDZmq
         YOsTOPxByr111cfMxY+/mIoAjMJCxEZXI0lEtU1G+MxZGGDlEShDYMuciKevInV03kAU
         3w4WwVgwIm1h7Nf+OYU0ld+SiSA2zFCPjKSIPeHZMI2GJttQL+rN46yyZdqaGtjvnTzL
         M3Gw==
X-Gm-Message-State: AO0yUKUPgbMlHu5X4mEd39O0k7xohfz5BVIk6D4MXVUuTN5e9Qt7s9y6
	nUSXrYAliVqLSmdB+uAyIXGIhxLwqebfQa+HQFAK7ck/i1FwYv/h5qjL79SC8VgSRlAzhFQ1uEX
	6B4Wqu3fX/yVBfwpY3+cXIWzgR2s=
X-Received: by 2002:a17:907:cb81:b0:8b0:fbd1:1a61 with SMTP id un1-20020a170907cb8100b008b0fbd11a61mr2776590ejc.52.1677579085708;
        Tue, 28 Feb 2023 02:11:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8xTF/bnD+AxesQL3OArWO5MlnXAcPheJM7sgj7/8nBceO+OQxCu+BpM+tstcL3jw1NyHbFqQ==
X-Received: by 2002:a17:907:cb81:b0:8b0:fbd1:1a61 with SMTP id un1-20020a170907cb8100b008b0fbd11a61mr2776557ejc.52.1677579085382;
        Tue, 28 Feb 2023 02:11:25 -0800 (PST)
Date: Tue, 28 Feb 2023 05:11:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228050908-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Y/3MIUDRBUSNg6C5@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Feb 28, 2023 at 09:40:49AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 10:14:52AM +0100, Thomas Huth wrote:
> > On 28/02/2023 10.03, Michael S. Tsirkin wrote:
> > > On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> > > > On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > > > > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > > > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > > > > I feel like we should have separate deprecation entries for the
> > > > > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > > > > although they're related they are independant features with
> > > > > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > > > > can explain the impact more clearly if we separate them.
> > > > > > > 
> > > > > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > > > > a superset.
> > > > > > > 
> > > > > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > > > > and the maintainance overhead is quite small.
> > > > > > 
> > > > > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > > > > someone is still using QEMU usermode emulation
> > > > > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > > > > 
> > > > > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > > > > I think 32 bit x86 environments are just more common in the cloud.
> > > > 
> > > > Can you point to anything that backs up that assertion. Clouds I've
> > > > seen always give you a 64-bit environment, and many OS no longer
> > > > even ship 32-bit installable media.
> > > 
> > > Sorry about being unclear. I meant that it seems easier to run CI in the
> > > cloud in a 32 bit x64 environment than get a 32 bit ARM environment.
> > 
> > It's still doable ... but for how much longer? We're currently depending on
> > Fedora, but they also slowly drop more and more support for this
> > environment, see e.g.:
> 
> FWIW, we should cull our fedora-i386-cross.docker dockerfile and
> replace it with a debian i686 dockerfile generated by lcitool.
> There's no compelling reason why i686 should be different from
> all our other cross builds which are based on Debian. The Debian
> lcitool generated container would have access to a wider range
> of deps than our hand written Fedora one.
> 
> >  https://www.theregister.com/2022/03/10/fedora_inches_closer_to_dropping/
> 
> With regards,
> Daniel

... and is closer to where 32 bit is likely to be deployed which is
systems like e.g. raspberry pi os which until recently was only
32 bit.

-- 
MST


