Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54026B0CAE6
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 21:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051715.1420110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udvwg-0002JB-G5; Mon, 21 Jul 2025 19:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051715.1420110; Mon, 21 Jul 2025 19:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udvwg-0002Hh-D1; Mon, 21 Jul 2025 19:13:06 +0000
Received: by outflank-mailman (input) for mailman id 1051715;
 Mon, 21 Jul 2025 19:13:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SNAI=2C=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1udvwe-0002Hb-LO
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 19:13:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4cf2471-6666-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 21:12:58 +0200 (CEST)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258--bsPeuNQNXaHKz-4bNPm4A-1; Mon,
 21 Jul 2025 15:12:52 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EE9ED19560AA; Mon, 21 Jul 2025 19:12:50 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.213])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 804FB18002B6; Mon, 21 Jul 2025 19:12:48 +0000 (UTC)
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
X-Inumbo-ID: b4cf2471-6666-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753125175;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kD5paCBxuxM0phd+/BHQE4ippvE1L6iKwBl0fAE28+g=;
	b=UcpddbYu9Fm0AnO1dvWVh4iademdB3j2dxaA6yqOwM2XouESlBaPfEPFb38Y85JtE94B36
	do68TJ48ZWqGLVt/1wckZFsj2OMvYRZk01fyow9JmfGCyNoDPF/RPq3yKZYNyCnxwD/VdQ
	UNWtGZtKowylWml7bvQDmhL3OCbUOHs=
X-MC-Unique: -bsPeuNQNXaHKz-4bNPm4A-1
X-Mimecast-MFC-AGG-ID: -bsPeuNQNXaHKz-4bNPm4A_1753125171
Date: Mon, 21 Jul 2025 20:12:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Adam Williamson <awilliam@redhat.com>, qemu-devel@nongnu.org,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
Message-ID: <aH6RLYKcGcQM6n6_@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250717220207.171040-1-awilliam@redhat.com>
 <87v7nqgk21.fsf@pond.sub.org>
 <87ikjqght5.fsf@pond.sub.org>
 <aHoJsmB6BT86sdv3@redhat.com>
 <87h5z9eiu4.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5z9eiu4.fsf@pond.sub.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Fri, Jul 18, 2025 at 03:20:35PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Jul 18, 2025 at 07:59:50AM +0200, Markus Armbruster wrote:
> >> Markus Armbruster <armbru@redhat.com> writes:
> >> 
> >> > Adam Williamson <awilliam@redhat.com> writes:
> >> >
> >> >> In cfcacba an `error_report` was added to this file, but the
> >> >> corresponding include of `qemu/error-report.h` was missed. This
> >> >> only becomes apparent when building against Xen 4.20+.
> >> >>
> >> >> Signed-off-by: Adam Williamson <awilliam@redhat.com>
> >> >> ---
> >> >>  hw/xen/xen_pt.c | 1 +
> >> >>  1 file changed, 1 insertion(+)
> >> >>
> >> >> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> >> >> index 9d16644d82..006b5b55f2 100644
> >> >> --- a/hw/xen/xen_pt.c
> >> >> +++ b/hw/xen/xen_pt.c
> >> >> @@ -54,6 +54,7 @@
> >> >>  
> >> >>  #include "qemu/osdep.h"
> >> >>  #include "qapi/error.h"
> >> >> +#include "qemu/error-report.h"
> >> >>  #include <sys/ioctl.h>
> >> >>  
> >> >>  #include "hw/pci/pci.h"
> >> >
> >> > Uh, error-report.h is included without this for me.  To see, build with
> >> > -H:
> >> >
> >> > . /work/armbru/qemu/hw/xen/xen_pt.h
> >> > .. /work/armbru/qemu/include/hw/xen/xen_native.h
> >> > ... /work/armbru/qemu/hw/xen/trace.h
> >> > .... ./trace/trace-hw_xen.h
> >> > ..... /work/armbru/qemu/include/qemu/error-report.h
> >> 
> >> Just remembered: the generated trace header includes error-report.h only
> >> when trace's log backend is enabled.
> >
> > Hmm, that's rather an unfortunate trap-door :-( Given that 'log' is enabled
> > by default when building from git we'll never see missing error-report.h
> > problems in daily work.
> 
> Correct.
> 
> > Looking at the log backend it appears that originally it would
> > unconditionally include the timestamp when calling qemu_log, but
> > then changed that to opt-in with
> >
> >   commit 418ed14268f797a5142b60cd557cd598eb548c66
> >   Author: Stefan Hajnoczi <stefanha@redhat.com>
> >   Date:   Mon Jan 25 11:35:07 2021 +0000
> >
> >     trace: make the 'log' backend timestamp configurable
> >
> > requiring -msg timestamp=on, which was a pre-existing flag that already
> > did a similar toggle for the 'error_report' function. The goal makes
> > sense, but it introduced the error-report.h trap door
> >
> > When I see that I also question why the 'log' backend should be a
> > special case user of qemu_log() ?  Why shouldn't we emit timestamps
> > for all usage of qemu_log() ?
> >
> > If we changed the qemu_log impl to honour the timestamp toggle, then
> > all users of qemu_log benefit. We then eliminate error-report.h usage
> > in trace.h headers, and also cut the code size for trace points
> > significantly
> >
> >
> > static inline void _nocheck__trace_object_dynamic_cast_assert(const char * type, const char * target, const char * file, int line, const char * func)
> > {
> >     if (trace_event_get_state(TRACE_OBJECT_DYNAMIC_CAST_ASSERT) && qemu_loglevel_mask(LOG_TRACE)) {
> >         if (message_with_timestamp) {
> >             struct timeval _now;
> >             gettimeofday(&_now, NULL);
> >             qemu_log("%d@%zu.%06zu:object_dynamic_cast_assert " "%s->%s (%s:%d:%s)" "\n",
> >                      qemu_get_thread_id(),
> >                      (size_t)_now.tv_sec, (size_t)_now.tv_usec
> >                      , type, target, file, line, func);
> >         } else {
> >             qemu_log("object_dynamic_cast_assert " "%s->%s (%s:%d:%s)" "\n", type, target, file, line, func);
> >         }
> >     }
> > }
> >
> > down to
> >
> >
> > static inline void _nocheck__trace_object_dynamic_cast_assert(const char * type, const char * target, const char * file, int line, const char * func)
> > {
> >     if (trace_event_get_state(TRACE_OBJECT_DYNAMIC_CAST_ASSERT) && qemu_loglevel_mask(LOG_TRACE)) {
> >             qemu_log("object_dynamic_cast_assert " "%s->%s (%s:%d:%s)" "\n", type, target, file, line, func);
> >     }
> > }
> >
> > which feels more in keeping with the kind of level of complexity you should
> > want to be inlined in trace callers.
> 
> Oh yes.  We should do this even if we find a reason for keeping
> qemu_log() as it is.  The obvious way would be a new function
> qemu_log_with_timestamp().

Now proposed at:

  https://lists.nongnu.org/archive/html/qemu-devel/2025-07/msg05234.html

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


