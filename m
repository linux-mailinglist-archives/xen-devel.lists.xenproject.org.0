Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838E3AF796
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 23:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145700.267947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvRg0-00067R-Qm; Mon, 21 Jun 2021 21:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145700.267947; Mon, 21 Jun 2021 21:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvRg0-000653-NM; Mon, 21 Jun 2021 21:41:52 +0000
Received: by outflank-mailman (input) for mailman id 145700;
 Mon, 21 Jun 2021 21:41:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHMo=LP=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lvRg0-00064x-6z
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 21:41:52 +0000
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bf9ff23-bf92-4d98-9009-e72554c2db0d;
 Mon, 21 Jun 2021 21:41:51 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id j184so34342178qkd.6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jun 2021 14:41:51 -0700 (PDT)
Received: from six (c-73-89-138-5.hsd1.vt.comcast.net. [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id o15sm262880qtw.5.2021.06.21.14.41.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jun 2021 14:41:50 -0700 (PDT)
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
X-Inumbo-ID: 9bf9ff23-bf92-4d98-9009-e72554c2db0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RTDqoPWBmnNXjzYXpRN/pgg58HnV7jt084UOmjEj8vU=;
        b=U78hj7TG3nAQhorHcSFeNuv7Ayb6XjQwqHZPBegB4Pnp3RQ1VXiNbQfpZAbvA/YEAb
         h/+8VQ3WuRyY7sJPMlyeP+v+l3tXxRzL7hHf7od6ImUDY/uET4NfrJCLt61bctaaL/c7
         neZkgK1eewEXxdy1GUbNbUp+eJRpHHoUTzFa1De+zcDebqIQJHmNCanSQabgGuFOBrWz
         udfuC6cmkX4sDWv3lhwH0pXUSt5kaY+a1L5ao9se8ARoBq3PAKqc25hEyOa5ROdbyhRm
         TNYneIlX6Qj2yb4GNYs1miKs8nNNURL9Edb9sSWNZ869COppEkKy5JtwmApnD4Bwu4FM
         tbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RTDqoPWBmnNXjzYXpRN/pgg58HnV7jt084UOmjEj8vU=;
        b=ZZjqgj3T21QexsjAWNkGOC7lK8VxZXK1xSLhZYZctrowio/kgNSCAlvdg++CoxbbyC
         oWmX0djLDWacCf15PyusU91J1S9ZlCSuJzrjqRX6zwgIPJsH2SOeBM15CV01HjV08Dpd
         bGw9BJYZplFpE98ao2vHFfkWzvoSt3PjlIrpFgcmyWluCYnpjNCuNxYZ6r/pvi5zobyJ
         vFzuOPUrP4Im+G3f7KK2vn8lBvrhe2k+OfdsXG08aL9Kihr7FHshZ28XVWEp+OEwHzmF
         hNe1Anw1kdMG07EZ/O5z5AYXI+MWiryV7leRWc4hUQ+7ZyBrSnNZymEnG6tRt59pajyn
         gZ2g==
X-Gm-Message-State: AOAM532SWDd6JbID1AtIBgeMTNwy7wtvxdFMsgpDajQfYyYA02YUeWvT
	Ef+DV2xDfgNlT5ak2iU7IEY=
X-Google-Smtp-Source: ABdhPJz+fiuvOVB7/nmV1w7A5sINpvgt1TAG5gd/BAUJ0lFiT5y/dnLV3+XSd+HL+wzkTvfO9nFLnQ==
X-Received: by 2002:a37:2ec1:: with SMTP id u184mr779755qkh.500.1624311710992;
        Mon, 21 Jun 2021 14:41:50 -0700 (PDT)
Date: Mon, 21 Jun 2021 17:41:48 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 12/12] golang/xenlight: add NotifyDomainDeath
 method to Context
Message-ID: <20210621214148.GA27530@six>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <e415b0e26954cfc6689fbd3ba7d79fe664f3bb50.1621887506.git.rosbrookn@ainfosec.com>
 <56DEEBE0-88E3-4E00-A998-30FF034BCB73@citrix.com>
 <8D6E3510-754C-450C-99F6-63BE9FA6F748@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8D6E3510-754C-450C-99F6-63BE9FA6F748@citrix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Jun 18, 2021 at 07:31:46PM +0000, George Dunlap wrote:
> 
> 
> > On Jun 18, 2021, at 7:28 PM, George Dunlap <george.dunlap@citrix.com> wrote:
> > 
> > 
> > 
> >> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >> 
> >> Add a helper function to wait for domain death events, and then write
> >> the events to a provided channel. This handles the enabling/disabling of
> >> the event type, freeing the event, and converting it to a Go type. The
> >> caller can then handle the event however they need to. This function
> >> will run until a provided context.Context is cancelled.
> >> 
> >> NotifyDomainDeath spawns two goroutines that return when the
> >> context.Context is done. The first will make sure that the domain death
> >> event is disabled, and that the corresponding event queue is cleared.
> >> The second calls libxl_event_wait, and writes the event to the provided
> >> channel.
> >> 
> >> With this, callers should be able to manage a full domain life cycle.
> >> Add to the comment of DomainCreateNew so that package uses know they
> >> should use this method in conjunction with DomainCreateNew.
> >> 
> >> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> >> ---
> >> tools/golang/xenlight/xenlight.go | 83 ++++++++++++++++++++++++++++++-
> >> 1 file changed, 82 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
> >> index 6fb22665cc..8406883433 100644
> >> --- a/tools/golang/xenlight/xenlight.go
> >> +++ b/tools/golang/xenlight/xenlight.go
> >> @@ -53,6 +53,7 @@ import "C"
> >> */
> >> 
> >> import (
> >> +	"context"
> >> 	"fmt"
> >> 	"os"
> >> 	"os/signal"
> >> @@ -1340,7 +1341,9 @@ func (ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error
> >> 	return nil
> >> }
> >> 
> >> -// DomainCreateNew creates a new domain.
> >> +// DomainCreateNew creates a new domain. Callers of DomainCreateNew are
> >> +// responsible for handling the death of the resulting domain. This should be
> >> +// done using NotifyDomainDeath.
> >> func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
> >> 	var cdomid C.uint32_t
> >> 	var cconfig C.libxl_domain_config
> >> @@ -1358,6 +1361,84 @@ func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
> >> 	return Domid(cdomid), nil
> >> }
> >> 
> >> +// NotifyDomainDeath registers an event handler for domain death events for a
> >> +// given domnid, and writes events received to ec. NotifyDomainDeath returns an
> >> +// error if it cannot register the event handler, but other errors encountered
> >> +// are just logged. The goroutine spawned by calling NotifyDomainDeath runs
> >> +// until the provided context.Context's Done channel is closed.
> >> +func (ctx *Context) NotifyDomainDeath(c context.Context, domid Domid, ec chan<- Event) error {
> >> +	var deathw *C.libxl_evgen_domain_death
> >> +
> >> +	ret := C.libxl_evenable_domain_death(ctx.ctx, C.uint32_t(domid), 0, &deathw)
> >> +	if ret != 0 {
> >> +		return Error(ret)
> >> +	}
> >> +
> >> +	// Spawn a goroutine that is responsible for cleaning up when the
> >> +	// passed context.Context's Done channel is closed.
> >> +	go func() {
> >> +		<-c.Done()
> >> +
> >> +		ctx.logd("cleaning up domain death event handler for domain %d", domid)
> >> +
> >> +		// Disable the event generation.
> >> +		C.libxl_evdisable_domain_death(ctx.ctx, deathw)
> >> +
> >> +		// Make sure any events that were generated get cleaned up so they
> >> +		// do not linger in the libxl event queue.
> >> +		var evc *C.libxl_event
> >> +		for {
> >> +			ret := C.libxl_event_check(ctx.ctx, &evc, C.LIBXL_EVENTMASK_ALL, nil, nil)
> >> +			if ret != 0 {
> >> +				return
> >> +			}
> >> +			C.libxl_event_free(ctx.ctx, evc)
> > 
> > I have to admit, I don’t really understand how the libxl event stuff is supposed to work.  But it looks like this will drain all events of any type, for any domain, associated with this context?
> > 
> > So if you had two domains, and called NotifyDomainDeath() on both with different contexts, and you closed the one context, you might miss events from the other context?
> > 
> > Or, suppose you did this:
> > * ctx.NotifyDomainDeath(ctx1, dom1, ec1)
> > * ctx.NotifyDiskEject(ctx2, dom1, ec2)
> > * ctx1CancelFunc()
> > 
> > Wouldn’t there be a risk that the disk eject message would get lost?
> > 
> > Ian, any suggestions for the right way to use these functions in this scenario?
> 
> It looks like one option would be to add a “predicate” function filter, to filter by type and domid.
> 
> It looks like the other option would be to try to use libxl_event_register_callbacks().  We could have the C callback pass all the events to a goroutine which would act as a dispatcher.
> 
After a brief look at the documentation within libxl_event.h, it seems
using predicate functions would be the easiest solution given the
current layout. Though I will look closer at using
libxl_event_register_callbacks before sending a v2.

Thanks,
NR

