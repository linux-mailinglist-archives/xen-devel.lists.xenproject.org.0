Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37736E290
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 02:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119679.226301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuU4-0000co-QQ; Thu, 29 Apr 2021 00:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119679.226301; Thu, 29 Apr 2021 00:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuU4-0000cH-My; Thu, 29 Apr 2021 00:24:48 +0000
Received: by outflank-mailman (input) for mailman id 119679;
 Thu, 29 Apr 2021 00:24:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuLC-00072A-VU
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:15:39 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7791350c-8fd4-4740-ba4f-cc1d7a80a2d8;
 Thu, 29 Apr 2021 00:14:50 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id q136so44605762qka.7
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:48 -0700 (PDT)
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
X-Inumbo-ID: 7791350c-8fd4-4740-ba4f-cc1d7a80a2d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=qZQxVcviBuvDjUeKOepu8YHqa+eGuG2DXDt5FNQL7LQ=;
        b=Wmm7rj/vyt50koaS67R5V5VtQ04AK9utAPe54iBby3oY7Cy+nLzkYQ1rwyKaigciEN
         0RT4FZX6lVOgNpi9JtuICBw+qRFZbU/KRgXiHbEn8+vqGBEhtj+LqEqba/AU1fHfwW1m
         eaYltcHWDFyLDU5Ob2Z87zERdA6lkDZX6VcV+YVGq9cMbHOyD7FY71qg9oTScdipxcGV
         KRXlBdc8QoPG8euVyHhq/7lmFBKuFC+GQTmf45ukF8/dg3+z8EGtvhZ+uZod6L4Zu9+Y
         B7sWhTKdiBsdqxuL0FwhjbBy9KOrXIat+bE1P/NqqJeFfCabyBDRKFZpjvkWt6K3QsIt
         i95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=qZQxVcviBuvDjUeKOepu8YHqa+eGuG2DXDt5FNQL7LQ=;
        b=jWgPym+CFm4Oh1PclF7l2zhJObbDKVBIaHYff9BpaMVgEV3KfUEdT7fZU2ixbV94dF
         tdo3RIWXbof7UDGlM1h8cdwMkplyZS+uaFgcOVJpE09hCgzSDSbuiBEx/p9jF9t66Kju
         QHN2zklln4A8TYt984VJ+ofcGRfV+5cF6bkgMbh6sYoG4kx38fZJp+TK91rQBfbqxRCo
         QmOUWF/MIRK5sSBWpIxgaRaWRjkBaI5R+8oQ2NJg6ZszOFZ4LnNkGDfsnoIbKNDPbJG+
         rCFoBJ/Edluml2nTwFNKWa0lzpzWfqFMKmKfNijUBNq+F/z1WTMeAvo/fiUIhtlauCZd
         lPww==
X-Gm-Message-State: AOAM533zaWkMvT3246Os3Jp9WvoZHLpVnoruNvvzMxalhUpK5pTWKHWV
	y7WaiAxzULJjwsne/QiPMwhvTbUR6EA=
X-Google-Smtp-Source: ABdhPJwqF5FqnlBcGP5vzfDZED1P0vTiFUV/Etl+1E4/OMgfLzLyiP/fs3umjbOR+C2uVj88o022Mg==
X-Received: by 2002:a37:a1d5:: with SMTP id k204mr32185392qke.164.1619655289437;
        Wed, 28 Apr 2021 17:14:49 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 12/12] golang/xenlight: add NotifyDomainDeath method to Context
Date: Wed, 28 Apr 2021 20:14:34 -0400
Message-Id: <e415b0e26954cfc6689fbd3ba7d79fe664f3bb50.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

Add a helper function to wait for domain death events, and then write
the events to a provided channel. This handles the enabling/disabling of
the event type, freeing the event, and converting it to a Go type. The
caller can then handle the event however they need to. This function
will run until a provided context.Context is cancelled.

NotifyDomainDeath spawns two goroutines that return when the
context.Context is done. The first will make sure that the domain death
event is disabled, and that the corresponding event queue is cleared.
The second calls libxl_event_wait, and writes the event to the provided
channel.

With this, callers should be able to manage a full domain life cycle.
Add to the comment of DomainCreateNew so that package uses know they
should use this method in conjunction with DomainCreateNew.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 83 ++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 6fb22665cc..8406883433 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -53,6 +53,7 @@ import "C"
  */
 
 import (
+	"context"
 	"fmt"
 	"os"
 	"os/signal"
@@ -1340,7 +1341,9 @@ func (ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error
 	return nil
 }
 
-// DomainCreateNew creates a new domain.
+// DomainCreateNew creates a new domain. Callers of DomainCreateNew are
+// responsible for handling the death of the resulting domain. This should be
+// done using NotifyDomainDeath.
 func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 	var cdomid C.uint32_t
 	var cconfig C.libxl_domain_config
@@ -1358,6 +1361,84 @@ func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 	return Domid(cdomid), nil
 }
 
+// NotifyDomainDeath registers an event handler for domain death events for a
+// given domnid, and writes events received to ec. NotifyDomainDeath returns an
+// error if it cannot register the event handler, but other errors encountered
+// are just logged. The goroutine spawned by calling NotifyDomainDeath runs
+// until the provided context.Context's Done channel is closed.
+func (ctx *Context) NotifyDomainDeath(c context.Context, domid Domid, ec chan<- Event) error {
+	var deathw *C.libxl_evgen_domain_death
+
+	ret := C.libxl_evenable_domain_death(ctx.ctx, C.uint32_t(domid), 0, &deathw)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	// Spawn a goroutine that is responsible for cleaning up when the
+	// passed context.Context's Done channel is closed.
+	go func() {
+		<-c.Done()
+
+		ctx.logd("cleaning up domain death event handler for domain %d", domid)
+
+		// Disable the event generation.
+		C.libxl_evdisable_domain_death(ctx.ctx, deathw)
+
+		// Make sure any events that were generated get cleaned up so they
+		// do not linger in the libxl event queue.
+		var evc *C.libxl_event
+		for {
+			ret := C.libxl_event_check(ctx.ctx, &evc, C.LIBXL_EVENTMASK_ALL, nil, nil)
+			if ret != 0 {
+				return
+			}
+			C.libxl_event_free(ctx.ctx, evc)
+		}
+	}()
+
+	go func() {
+		var (
+			ev  Event
+			evc *C.libxl_event
+		)
+
+		for {
+			select {
+			case <-c.Done():
+				return
+			default:
+				// Go on and check for an event...
+			}
+
+			ret := C.libxl_event_wait(ctx.ctx, &evc, C.LIBXL_EVENTMASK_ALL, nil, nil)
+			if ret != 0 {
+				ctx.logw("unexpected error waiting for event: %s", Error(ret))
+				continue
+			}
+
+			// Try to convert the event to Go, and then free the
+			// C.libxl_event no matter what.
+			err := ev.fromC(evc)
+			C.libxl_event_free(ctx.ctx, evc)
+			if err != nil {
+				ctx.logw("error converting event from C: %v", err)
+				continue
+			}
+
+			ctx.logd("received domain death event (domid=%v, type=%v)", ev.Domid, ev.Type)
+
+			// Write the event to the channel
+			select {
+			case ec <- ev:
+			case <-c.Done():
+				return
+			}
+		}
+	}()
+
+	return nil
+}
+
 // DomainDestroy destroys a domain given a domid.
 func (ctx *Context) DomainDestroy(domid Domid) error {
 	ret := C.libxl_domain_destroy(ctx.ctx, C.uint32_t(domid), nil)
-- 
2.17.1


