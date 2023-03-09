Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24F6B22F6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 12:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508233.782690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paEQX-000724-II; Thu, 09 Mar 2023 11:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508233.782690; Thu, 09 Mar 2023 11:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paEQX-0006za-FZ; Thu, 09 Mar 2023 11:27:17 +0000
Received: by outflank-mailman (input) for mailman id 508233;
 Thu, 09 Mar 2023 11:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HuKd=7B=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1paEQW-0006zQ-0g
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 11:27:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553bdfa9-be6d-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 12:27:12 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-tvoRFtBpM--OzeyhJmdd9A-1; Thu, 09 Mar 2023 06:27:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC777380610B;
 Thu,  9 Mar 2023 11:27:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 851A7440DD;
 Thu,  9 Mar 2023 11:27:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E31341800082; Thu,  9 Mar 2023 12:27:03 +0100 (CET)
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
X-Inumbo-ID: 553bdfa9-be6d-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NweXCai3D9fC7VKDrwRq6qLK3V8Z0L3HiXwrI+4REjQ=;
	b=DJ6HFDX43ycSJT4HsitozjWAA0ySpVEzEY1KdVOKKR9R2vK221jAsOHD6qxvoet3au/oQv
	m6zlPgHUuRQVQAfeyA/8Xk2vkW1Ei5T3/CnfLfZZD68hQaIvm9/LsNKIB3bbMa0VZeBnID
	/NnmfGmFGvwio6Nrv1lxyWSVNM7it7Q=
X-MC-Unique: tvoRFtBpM--OzeyhJmdd9A-1
Date: Thu, 9 Mar 2023 12:27:03 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] Re: [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <20230309112703.dht7yisk7on3sfwg@sirius.home.kraxel.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
 <Y9scWQ/ASMCrY/uM@morn>
 <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
 <20230202091031.xmnao56wziptjak2@sirius.home.kraxel.org>
 <0f25af10f21de2a36f4748f20d457dca5bce1f64.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f25af10f21de2a36f4748f20d457dca5bce1f64.camel@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

On Tue, Mar 07, 2023 at 08:42:18AM +0000, David Woodhouse wrote:
> On Thu, 2023-02-02 at 10:10 +0100, Gerd Hoffmann wrote:
> > > Thanks, Kevin.
> > > 
> > > I'd like to get the rest of the Xen platform support in to qemu 8.0
> > > if
> > > possible. Which is currently scheduled for March.
> > > 
> > > Is there likely to be a SeaBIOS release before then which Gerd
> > > would
> > > pull into qemu anyway, or should I submit a submodule update to a
> > > snapshot of today's tree? That would just pull in this commit, and
> > > the
> > > one other fix that's in the SeaBIOS tree since 1.16.1?
> > 
> > Tagging 1.16.2 in time for the qemu 8.0 should not be a problem given
> > that we have only bugfixes in master.  Roughly around soft freeze is
> > probably a good time for that.
> 
> That's, erm, at the *end* of today 2023-03-07, and the freeze happens
> only *after* Paul has reviewed the phase 2 Xen PV back end support,
> right?

Ok, we have as of today two changes:

  kraxel@sirius ~/projects/seabios (master)# git log --oneline rel-1.16.1..
  ea1b7a073390 xen: require Xen info structure at 0x1000 to detect Xen
  645a64b4911d usb: fix wrong init of keyboard/mouse's if first interface is not boot protocol

With no changes since January and no known issues.
I think we can safely tag the current state as 1.16.2.

I'll do that next monday (plus qemu pull request) unless
there are objections until then.

take care,
  Gerd


