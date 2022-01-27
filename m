Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E18149D79D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 02:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261136.451819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCtw6-0001Kk-FA; Thu, 27 Jan 2022 01:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261136.451819; Thu, 27 Jan 2022 01:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCtw6-0001Iw-9Y; Thu, 27 Jan 2022 01:50:54 +0000
Received: by outflank-mailman (input) for mailman id 261136;
 Thu, 27 Jan 2022 01:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCtw5-0001Iq-1n
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 01:50:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d8dc2c0-7f13-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 02:50:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CBB161C0C;
 Thu, 27 Jan 2022 01:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFB3C340E7;
 Thu, 27 Jan 2022 01:50:48 +0000 (UTC)
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
X-Inumbo-ID: 8d8dc2c0-7f13-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643248248;
	bh=Qhqsl+W3vAy/5QqIqLeTzxlesobF7mMU8G0hDOyYqvU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iCAZvbregHg6tY8qX5Js+Vu8TOzU2Sd04nX599QV0wtJ9NuWQ5qhAhBDI6imWbSvj
	 558dHbG0oP+7GYg5XnwgLzgUUut1x2cGx+Q/R+8CtOrKvl4gEkERD02dhK85/mrviC
	 KET1QD1wE5GSYoJ2axwGmszYHz4iZQKG8IVrhILySXsjP/2PtrGF9Ff51ThHLXMMJH
	 OFzE4SCJ9vQ7pT/FfhXblCC9ykvTsaYyDsTx7gv0uCFEqrFgqqxJyCaSPJZX1VL3X3
	 l5CfN/LPZJqM7BeI2MZ7Y6LP0dSNNQfoOaREYAQpC7hEC2l78v7EJO8oau4VdKnAo6
	 6oxrXqRkCdTqQ==
Date: Wed, 26 Jan 2022 17:50:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
In-Reply-To: <966ac15d-e91f-e812-1021-296ef60a9a06@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201261727550.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-2-sstabellini@kernel.org> <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org> <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com> <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop> <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org> <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
 <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com> <966ac15d-e91f-e812-1021-296ef60a9a06@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jan 2022, Julien Grall wrote:
> On 26/01/2022 07:30, Jan Beulich wrote:
> > On 26.01.2022 02:03, Stefano Stabellini wrote:
> > > Are you guys OK with something like this?
> > 
> > With proper proof that this isn't going to regress anything else, maybe.
> 
> That's why I sugested to also gate with system_state < SYS_STATE_boot so we
> reduce the potential regression (the use of hypercall should be limited at
> boot).
> 
> FWIW, there was a thread [1] to discuss the same issue as Stefano is facing
> (but in the context of Live-Update).
> 
> > But ...
> > 
> > > --- a/xen/include/xsm/dummy.h
> > > +++ b/xen/include/xsm/dummy.h
> > > @@ -92,7 +92,9 @@ static always_inline int xsm_default_action(
> > >               return 0;
> > >           /* fall through */
> > >       case XSM_PRIV:
> > > -        if ( is_control_domain(src) )
> > > +        if ( is_control_domain(src) ||
> > > +             src->domain_id == DOMID_IDLE ||
> > > +             src->domain_id == DOMID_XEN )
> > >               return 0;
> > 
> > ... my first question would be under what circumstances you might observe
> > DOMID_XEN here and hence why this check is there.

For simplicity I'll answer all the points here.

I added both DOMID_IDLE and DOMID_XEN because I thought it "made sense",
but there is no need for DOMID_XEN. We only need DOMID_IDLE. Also adding
a system_state <= SYS_STATE_boot is fine (but it needs to be <= instead
of <). The patch appended below works without issues.

Alternatively, I am also quite happy with Jan's suggestion of passing an
extra parameter to evtchn_alloc_unbound, it could be:

int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool disable_xsm);

So that XSM is enabled by default.

Adding the bool parameter to evtchn_alloc_unbound has the advantage of
having only a very minor impact. But either option is totally fine by
me, just let me know your preference.



diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index b024119896..01996bd9d8 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -94,6 +94,8 @@ static always_inline int xsm_default_action(
     case XSM_PRIV:
         if ( is_control_domain(src) )
             return 0;
+        if ( system_state <= SYS_STATE_boot && src->domain_id == DOMID_IDLE )
+            return 0;
         return -EPERM;
     default:
         LINKER_BUG_ON(1);

