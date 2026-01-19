Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA2AD3BBBA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 00:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208347.1520532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhyb4-0001WE-GY; Mon, 19 Jan 2026 23:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208347.1520532; Mon, 19 Jan 2026 23:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhyb4-0001V9-CG; Mon, 19 Jan 2026 23:23:46 +0000
Received: by outflank-mailman (input) for mailman id 1208347;
 Mon, 19 Jan 2026 23:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIhq=7Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vhyb3-0001V3-7R
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 23:23:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e209b5b3-f58d-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 00:23:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 244CE600CB;
 Mon, 19 Jan 2026 23:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7953CC116C6;
 Mon, 19 Jan 2026 23:23:35 +0000 (UTC)
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
X-Inumbo-ID: e209b5b3-f58d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768865016;
	bh=h70xqgpSOHh35QgijNb0CKzSa9qCNWudRuvTsZ7KzFQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ttv69XRgbXMJ9OV9pCR5TV8bdG4l77DR5qKNlJK+6CoRWIYGVXqX0GZPgI+IxCxUu
	 PUw4CN6nlZqw8RGEep+HGgyJUKOSEgkezlGTAeVXoHYBClmXkmWmrTLDUlgIxK2Cg8
	 qNR0bA2y7LFqBzqT1DqzefFkA47YSC3xh6Ng+RuFQdsKfEVSMXb03B5+tqMiGTDSWB
	 3nRcfBUUy1NsOKASdTzggz23X0oUv0D239GQD7VQDwZxPUUGlJo5lgH6spcGBvnLdm
	 dkkLn8tOfZ/XGDcQTI/pxq4AKvtZX9bTkSMkBf3UqvFkb/3ok3p/HAqaPd+maSp467
	 fCVgclEEmHaKA==
Date: Mon, 19 Jan 2026 15:23:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, grygorii_strashko@epam.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
In-Reply-To: <63c35c5e-577b-4346-b600-03808306177f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601191522450.7192@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop> <63c35c5e-577b-4346-b600-03808306177f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Jan 2026, Jan Beulich wrote:
> On 14.01.2026 01:39, Stefano Stabellini wrote:
> > @@ -815,6 +831,11 @@ long do_console_io(
> >          if ( count > INT_MAX )
> >              break;
> >  
> > +        d = console_get_domain();
> > +        console_put_domain(d);
> > +        if ( d != current->domain )
> > +            return 0;
> 
> This isn't atomic (as in: in a suitably locked region) with ...
> 
> > @@ -830,7 +851,10 @@ long do_console_io(
> >                  break;
> >              }
> >              rc += len;
> > -            serial_rx_cons += len;
> > +            nrspin_lock_irq(&console_lock);
> > +            if ( serial_rx_cons != serial_rx_prod )
> > +                serial_rx_cons += len;
> > +            nrspin_unlock_irq(&console_lock);
> >          }
> >          break;
> 
> ... this. If the focus domain changes after the check in the earlier hunk,
> I think you need to also return with no input here. Or you need to acquire
> the lock earlier (and then similarly in console_switch_input()), albeit
> that would then mean holding it across a copy-to-guest. Which technically
> is perhaps not a problem, but it leaves an uneasy feeling.

I thought about it when writing this patch and I had the same feeling as
you. However, especially considering the other feedback, I don't see
another viable solution.

I'll extend the locking.


> In no case may you continue the loop if the focus domain changed, or else
> you potentially hand the old one input targeted at the new one.
> 
> For context: What caught my attention is the conditional inside the locked
> region. This, imo, shouldn't be necessary when everything else is properly
> structured.
> 
> Actually, the lock strictly needs holding now across all accesses to
> serial_rx_{cons,prod}. That'll then naturally make the conditional
> unnecessary.


