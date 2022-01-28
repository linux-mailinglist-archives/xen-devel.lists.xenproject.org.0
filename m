Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B449F09C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 02:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261819.453582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDGDH-0005kr-EI; Fri, 28 Jan 2022 01:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261819.453582; Fri, 28 Jan 2022 01:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDGDH-0005jI-9o; Fri, 28 Jan 2022 01:38:07 +0000
Received: by outflank-mailman (input) for mailman id 261819;
 Fri, 28 Jan 2022 01:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nDGDF-0005jB-6e
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 01:38:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee2c6231-7fda-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 02:38:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 339FD61CFF;
 Fri, 28 Jan 2022 01:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FA2C340E4;
 Fri, 28 Jan 2022 01:38:00 +0000 (UTC)
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
X-Inumbo-ID: ee2c6231-7fda-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643333880;
	bh=rIlI9IpZgAb4gVlHvkdemDAs8GGRkUl+/s3hWXrBC5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hxJF4dTvHXiVxgFMz6jmhTUv01kByPkLX/ZTf0RM1yrGR44oP1dzHigYJrfRDo43G
	 D2vEAJRJ6+XI1THz/GTJsTA+tzbaERsd+lhhS17AjwQs1XZswqIoPKqXidiD8RnbdS
	 L7x3uo0/pVcQGyIeje61FXjbUVU2IcQZ2LBskzpJD6iga7UigpXjrx3y9wUvo57O3z
	 Mkdaq8g7Grr42KbQBDba+F8gMZt6KchmH1Or+PpxbaLcUOY6NvUuOfNIXqtXG/529v
	 wkTPVmlXgKBx1n+0CmaemLI8KHmUnmPLl9Jlx5L6HzIY5lmWeZDaLnRuQyB8JCIiuo
	 PrX5K8GSXVAgQ==
Date: Thu, 27 Jan 2022 17:38:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
In-Reply-To: <55c8e510-8b8d-ca27-f635-e2109fff9c5d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201271729410.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-2-sstabellini@kernel.org> <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org> <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com> <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop> <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org> <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
 <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com> <966ac15d-e91f-e812-1021-296ef60a9a06@xen.org> <alpine.DEB.2.22.394.2201261727550.27308@ubuntu-linux-20-04-desktop> <33d1c1eb-7d6d-21c6-8ed4-3daef5be90d3@xen.org> <b2edac13-f019-f615-0655-8510bfffedbe@suse.com>
 <55c8e510-8b8d-ca27-f635-e2109fff9c5d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jan 2022, Julien Grall wrote:
> On 27/01/2022 12:07, Jan Beulich wrote:
> > On 27.01.2022 10:51, Julien Grall wrote:
> > > On 27/01/2022 01:50, Stefano Stabellini wrote:
> > > > On Wed, 26 Jan 2022, Julien Grall wrote:
> > > > > On 26/01/2022 07:30, Jan Beulich wrote:
> > > > > > On 26.01.2022 02:03, Stefano Stabellini wrote:
> > > > > > > Are you guys OK with something like this?
> > > > > > 
> > > > > > With proper proof that this isn't going to regress anything else,
> > > > > > maybe.
> > > > > 
> > > > > That's why I sugested to also gate with system_state < SYS_STATE_boot
> > > > > so we
> > > > > reduce the potential regression (the use of hypercall should be
> > > > > limited at
> > > > > boot).
> > > > > 
> > > > > FWIW, there was a thread [1] to discuss the same issue as Stefano is
> > > > > facing
> > > > > (but in the context of Live-Update).
> > > > > 
> > > > > > But ...
> > > > > > 
> > > > > > > --- a/xen/include/xsm/dummy.h
> > > > > > > +++ b/xen/include/xsm/dummy.h
> > > > > > > @@ -92,7 +92,9 @@ static always_inline int xsm_default_action(
> > > > > > >                 return 0;
> > > > > > >             /* fall through */
> > > > > > >         case XSM_PRIV:
> > > > > > > -        if ( is_control_domain(src) )
> > > > > > > +        if ( is_control_domain(src) ||
> > > > > > > +             src->domain_id == DOMID_IDLE ||
> > > > > > > +             src->domain_id == DOMID_XEN )
> > > > > > >                 return 0;
> > > > > > 
> > > > > > ... my first question would be under what circumstances you might
> > > > > > observe
> > > > > > DOMID_XEN here and hence why this check is there.
> > > > 
> > > > For simplicity I'll answer all the points here.
> > > > 
> > > > I added both DOMID_IDLE and DOMID_XEN because I thought it "made sense",
> > > > but there is no need for DOMID_XEN. We only need DOMID_IDLE. Also adding
> > > > a system_state <= SYS_STATE_boot is fine (but it needs to be <= instead
> > > > of <). The patch appended below works without issues.
> > > > 
> > > > Alternatively, I am also quite happy with Jan's suggestion of passing an
> > > > extra parameter to evtchn_alloc_unbound, it could be:
> > > > 
> > > > int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool
> > > > disable_xsm);
> > > > 
> > > > So that XSM is enabled by default.
> > > > 
> > > > Adding the bool parameter to evtchn_alloc_unbound has the advantage of
> > > > having only a very minor impact.
> > > 
> > > We will likely need similar approach for other hypercalls in the future
> > > if we need to call them from Xen context (e.g. when restoring domain
> > > state during Live-Update).
> > > 
> > > So my preference would be to directly go with modifying the
> > > xsm_default_action().
> > 
> > How would this help when a real XSM policy is in use? Already in SILO
> > mode I think you wouldn't get past the check, as the idle domain
> > doesn't satisfy silo_mode_dom_check()'s use of is_control_domain().
> > Actually I'm not even sure you'd get that far - I was under the
> > impression that the domain at other side of the channel may not even
> > be around at that time, in which case silo_evtchn_unbound() would
> > return -ESRCH.
> 
> This would not help for real XSM policy. We would either need to bypass XSM
> completely or decide what to do depending on the mode (e.g. SILO, FLASK...).
> 
> > 
> > Additionally relaxing things at a central place like this one comes
> > with the risk of relaxing too much. As said in reply to Stefano - if
> > this is to be done, proof will need to be provided that this doesn't
> > and won't permit operations which aren't supposed to be permitted. I
> > for one would much prefer relaxation on a case-by-case basis.
> 
> The problem is you will end up to modify a lot of code. This will be quite
> tedious when the policy is likely going to be the same (e.g. if we are
> booting, then allow to use the hypercall).
> 
> So I think it makes more sense to do the modification at central place. That
> said, this is not strictly necessary for what Stefano needs. So I am OK if we
> go with local hack and deferred the debate to when a wider solution is needed.

OK, thank you. I'll go with the following then.


diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a..dde85444fe 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
-static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool disable_xsm)
 {
     struct evtchn *chn;
     struct domain *d;
@@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
         ERROR_EXIT_DOM(port, d);
     chn = evtchn_from_port(d, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
-    if ( rc )
-        goto out;
+    if ( !disable_xsm )
+    {
+        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
+        if ( rc )
+            goto out;
+    }
 
     evtchn_write_lock(chn);
 
@@ -1195,7 +1198,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_alloc_unbound alloc_unbound;
         if ( copy_from_guest(&alloc_unbound, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_alloc_unbound(&alloc_unbound);
+        rc = evtchn_alloc_unbound(&alloc_unbound, false);
         if ( !rc && __copy_to_guest(arg, &alloc_unbound, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..5ea3ac345b 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -68,6 +68,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest);
 /* Free an event channel. */
 void evtchn_free(struct domain *d, struct evtchn *chn);
 
+/* Create a new event channel port */
+int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool disable_xsm);
+
 /* Allocate a specific event channel port. */
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 

