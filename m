Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939592C5AF9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 18:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38984.71753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiLLT-0001CO-CX; Thu, 26 Nov 2020 17:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38984.71753; Thu, 26 Nov 2020 17:46:15 +0000
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
	id 1kiLLT-0001Bz-9P; Thu, 26 Nov 2020 17:46:15 +0000
Received: by outflank-mailman (input) for mailman id 38984;
 Thu, 26 Nov 2020 17:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MEn1=FA=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kiLLS-0001Bu-6s
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:46:14 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ed195e09-9a1c-42f2-9056-887e1661d8ec;
 Thu, 26 Nov 2020 17:46:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-BB1HWuiHPgCSHcsN6cw6zQ-1; Thu, 26 Nov 2020 12:46:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA43D805BFA;
 Thu, 26 Nov 2020 17:46:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF2E85C1C2;
 Thu, 26 Nov 2020 17:46:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MEn1=FA=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
	id 1kiLLS-0001Bu-6s
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:46:14 +0000
X-Inumbo-ID: ed195e09-9a1c-42f2-9056-887e1661d8ec
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id ed195e09-9a1c-42f2-9056-887e1661d8ec;
	Thu, 26 Nov 2020 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606412773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PfLv9sn75hFi4vrNX0/cdhCzTxZHr7btcEyxi0LGyNA=;
	b=hLUy6klhbkdFcfa+XpR6P1luU+zspbgqHBxTTVpiGHcINgQGyFCv6tIuvesCDZZ3gfT5rT
	ugJw0jx4oBHyzn493pqOkz2re36V8gK4glkQJr2Gd7VvCP4g6SsRG7fDB0qILgog5xoA7e
	OUs+SWaiGAGse6ArU7xxjFsQnmci/gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-BB1HWuiHPgCSHcsN6cw6zQ-1; Thu, 26 Nov 2020 12:46:09 -0500
X-MC-Unique: BB1HWuiHPgCSHcsN6cw6zQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA43D805BFA;
	Thu, 26 Nov 2020 17:46:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF2E85C1C2;
	Thu, 26 Nov 2020 17:46:00 +0000 (UTC)
Date: Thu, 26 Nov 2020 12:45:59 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Richard Henderson <rth@twiddle.net>, Fam Zheng <fam@euphon.net>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS
 7)
Message-ID: <20201126174559.GP2271382@habkost.net>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-16-philmd@redhat.com>
 <20201126173824.GB2098@perard.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <20201126173824.GB2098@perard.uk.xensource.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2020 at 05:38:24PM +0000, Anthony PERARD wrote:
> On Sun, Nov 08, 2020 at 09:45:33PM +0100, Philippe Mathieu-DaudÃ© wrote:
> > Xen packages are available in CentOS 7, but have been
> > removed from CentOS 8. Use the CentOS 7 container.
> 
> Technically Xen has never been in CentOS 8, I'm working on it, slowly.
> 
> > Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
> > ---
> > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony Perard <anthony.perard@citrix.com>
> > Cc: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org
> > ---
> >  .gitlab-ci.yml | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 2f0da7b3dc1..8e15266c277 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -557,6 +557,27 @@ check-crypto-only-gnutls:
> >      IMAGE: centos7
> >      MAKE_CHECK_ARGS: check
> >  
> > +build-xen-centos:
> > +  <<: *native_build_job_definition
> > +  variables:
> > +    IMAGE: centos7
> > +    TARGETS: i386-softmmu x86_64-softmmu
> > +    CONFIGURE_ARGS: --enable-xen
> > +    MAKE_CHECK_ARGS: check-build
> > +  artifacts:
> > +    paths:
> > +      - build
> > +
> > +check-xen-centos:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-xen-centos
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: centos7
> > +    MAKE_CHECK_ARGS: check
> 
> Is `make check` going to do something useful with the Xen support? Or is
> it going to need more work in order to test the Xen support of QEMU?
> (Like starting an actual Xen guest.)

I don't think it will test Xen support, but we still want to at
least check if --enable-xen doesn't break anything else.

Is there any public CI system anywhere where Xen support is
tested today?

-- 
Eduardo


