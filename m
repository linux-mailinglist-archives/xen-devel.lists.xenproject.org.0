Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C9D49A1E4
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 02:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259997.448914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCAME-0002vg-CA; Tue, 25 Jan 2022 01:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259997.448914; Tue, 25 Jan 2022 01:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCAME-0002ta-5H; Tue, 25 Jan 2022 01:10:50 +0000
Received: by outflank-mailman (input) for mailman id 259997;
 Tue, 25 Jan 2022 01:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=npsv=SJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nCAMC-0002tU-UJ
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 01:10:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fc1fc9f-7d7b-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 02:10:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32B81B810A8;
 Tue, 25 Jan 2022 01:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F2AC340E7;
 Tue, 25 Jan 2022 01:10:43 +0000 (UTC)
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
X-Inumbo-ID: 9fc1fc9f-7d7b-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643073043;
	bh=D07unP5JvFJh6EMHwybRTsjO2bPn46z37sTvXX1HWVc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GEPTDupF7sKIP18DMiIxFhMyhBYwxbpVxt5O4PXe/9yug9jZyrjY9Kxc3TpabHYkx
	 vA54kpLQEPotDKTs+OhanF0gNUYcy5CsOH27YsVG3emvUTK69694bZe07ruO1IDWUF
	 AxcGCc1U8ZcCkBXIHEKoBKJfVJ7eFnQOnjfnlhTboV3MtVvr3S5xUQZsqBVJLERAnv
	 QduCgPGbF2JwjqLaZOlU6SWOMfksukQjplz5IsJjtEYvmGkRpZ89ogjgi9R1qCUV06
	 vp3yI5t4rm1RPbmF1nn1LMlP2mtNqcUk3KJKltlhKWiT18XTiKO9x682B8drq7+BdM
	 YMgRjbhh1ZYEQ==
Date: Mon, 24 Jan 2022 17:10:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
In-Reply-To: <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
Message-ID: <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-2-sstabellini@kernel.org> <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Jan 2022, Julien Grall wrote:
> > diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> > index da88ad141a..5b0bcaaad4 100644
> > --- a/xen/common/event_channel.c
> > +++ b/xen/common/event_channel.c
> > @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t
> > port)
> >       return 0;
> >   }
> >   -static int get_free_port(struct domain *d)
> > +int get_free_port(struct domain *d)
> 
> I dislike the idea to expose get_free_port() (or whichever name we decide)
> because this can be easily misused.
> 
> In fact looking at your next patch (#3), you are misusing it as it is meant to
> be called with d->event_lock. I know this doesn't much matter
> in your situation because this is done at boot with no other domains running
> (or potentially any event channel allocation). However, I still think we
> should get the API right.
> 
> I am also not entirely happy of open-coding the allocation in domain_build.c.
> Instead, I would prefer if we provide a new helper to allocate an unbound
> event channel. This would be similar to your v1 (I still need to review the
> patch though).

I am happy to go back to v1 and address feedback on that patch. However,
I am having difficulties with the implementation. Jan pointed out:


> > -
> > -    chn->state = ECS_UNBOUND;
> 
> This cannot be pulled ahead of the XSM check (or in general anything
> potentially resulting in an error), as check_free_port() relies on
> ->state remaining ECS_FREE until it is known that the calling function
> can't fail anymore.

This makes it difficult to reuse _evtchn_alloc_unbound for the
implementation of evtchn_alloc_unbound. In fact, I couldn't find a way
to do it.

Instead, I just create a new public function called
"evtchn_alloc_unbound" and renamed the existing funtion to
"_evtchn_alloc_unbound" (this to addresses Jan's feedback that the
static function should be the one starting with "_"). So the function
names are inverted compared to v1.

Please let me know if you have any better suggestions.


diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a..c6b7dd7fbd 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -18,6 +18,7 @@
 
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/err.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <xen/irq.h>
@@ -284,7 +285,27 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
-static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+struct evtchn *evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
+{
+    struct evtchn *chn;
+    int port;
+
+    if ( (port = get_free_port(d)) < 0 )
+        return ERR_PTR(port);
+    chn = evtchn_from_port(d, port);
+
+    evtchn_write_lock(chn);
+
+    chn->state = ECS_UNBOUND;
+    chn->u.unbound.remote_domid = remote_dom;
+    evtchn_port_init(d, chn);
+
+    evtchn_write_unlock(chn);
+
+    return chn;
+}
+
+static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 {
     struct evtchn *chn;
     struct domain *d;
@@ -1195,7 +1216,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct evtchn_alloc_unbound alloc_unbound;
         if ( copy_from_guest(&alloc_unbound, arg, 1) != 0 )
             return -EFAULT;
-        rc = evtchn_alloc_unbound(&alloc_unbound);
+        rc = _evtchn_alloc_unbound(&alloc_unbound);
         if ( !rc && __copy_to_guest(arg, &alloc_unbound, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
         break;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..85dcf1d0c4 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -68,6 +68,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest);
 /* Free an event channel. */
 void evtchn_free(struct domain *d, struct evtchn *chn);
 
+/* Create a new event channel port */
+struct evtchn *evtchn_alloc_unbound(struct domain *d, domid_t remote_dom);
+
 /* Allocate a specific event channel port. */
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 

