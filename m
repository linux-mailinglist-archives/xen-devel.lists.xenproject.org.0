Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9724FB09E48
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 10:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048182.1418455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucgj6-0000Ke-Nx; Fri, 18 Jul 2025 08:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048182.1418455; Fri, 18 Jul 2025 08:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucgj6-0000Is-LL; Fri, 18 Jul 2025 08:45:56 +0000
Received: by outflank-mailman (input) for mailman id 1048182;
 Fri, 18 Jul 2025 08:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJeD=Z7=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1ucgj4-0000Im-WA
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 08:45:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4b797d-63b3-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 10:45:49 +0200 (CEST)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-QIND2cwsNTeGLF-4jyt3vw-1; Fri,
 18 Jul 2025 04:45:46 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DFA261956046; Fri, 18 Jul 2025 08:45:44 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.137])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DFAC7195609D; Fri, 18 Jul 2025 08:45:41 +0000 (UTC)
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
X-Inumbo-ID: 9a4b797d-63b3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752828348;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=rIemI2KVaNURwfWRd9/jEnvo0MJBmEvJjQvDPv0Yglo=;
	b=AAHoY7hFeUE0Sqvkzb/OcmO/QQbfzkuiusQ3Y4V5J7KwlxanZa/bV00pn+Kw7S8Yz0mYRG
	303EdZL1K0PCz2WtYSe4KAioaFCMNyDQ0dOrNJFY/iss1LUla0wB6oUgf1Pw9vhdwtm/mF
	uUMkg6B/TUwZQPss3i0Bc4j5FWERxzw=
X-MC-Unique: QIND2cwsNTeGLF-4jyt3vw-1
X-Mimecast-MFC-AGG-ID: QIND2cwsNTeGLF-4jyt3vw_1752828345
Date: Fri, 18 Jul 2025 09:45:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Adam Williamson <awilliam@redhat.com>, qemu-devel@nongnu.org,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
Message-ID: <aHoJsmB6BT86sdv3@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250717220207.171040-1-awilliam@redhat.com>
 <87v7nqgk21.fsf@pond.sub.org>
 <87ikjqght5.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ikjqght5.fsf@pond.sub.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Fri, Jul 18, 2025 at 07:59:50AM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Adam Williamson <awilliam@redhat.com> writes:
> >
> >> In cfcacba an `error_report` was added to this file, but the
> >> corresponding include of `qemu/error-report.h` was missed. This
> >> only becomes apparent when building against Xen 4.20+.
> >>
> >> Signed-off-by: Adam Williamson <awilliam@redhat.com>
> >> ---
> >>  hw/xen/xen_pt.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> >> index 9d16644d82..006b5b55f2 100644
> >> --- a/hw/xen/xen_pt.c
> >> +++ b/hw/xen/xen_pt.c
> >> @@ -54,6 +54,7 @@
> >>  
> >>  #include "qemu/osdep.h"
> >>  #include "qapi/error.h"
> >> +#include "qemu/error-report.h"
> >>  #include <sys/ioctl.h>
> >>  
> >>  #include "hw/pci/pci.h"
> >
> > Uh, error-report.h is included without this for me.  To see, build with
> > -H:
> >
> > . /work/armbru/qemu/hw/xen/xen_pt.h
> > .. /work/armbru/qemu/include/hw/xen/xen_native.h
> > ... /work/armbru/qemu/hw/xen/trace.h
> > .... ./trace/trace-hw_xen.h
> > ..... /work/armbru/qemu/include/qemu/error-report.h
> 
> Just remembered: the generated trace header includes error-report.h only
> when trace's log backend is enabled.

Hmm, that's rather an unfortunate trap-door :-( Given that 'log' is enabled
by default when building from git we'll never see missing error-report.h
problems in daily work.

Looking at the log backend it appears that originally it would
unconditionally include the timestamp when calling qemu_log, but
then changed that to opt-in with

  commit 418ed14268f797a5142b60cd557cd598eb548c66
  Author: Stefan Hajnoczi <stefanha@redhat.com>
  Date:   Mon Jan 25 11:35:07 2021 +0000

    trace: make the 'log' backend timestamp configurable

requiring -msg timestamp=on, which was a pre-existing flag that already
did a similar toggle for the 'error_report' function. The goal makes
sense, but it introduced the error-report.h trap door

When I see that I also question why the 'log' backend should be a
special case user of qemu_log() ?  Why shouldn't we emit timestamps
for all usage of qemu_log() ?

If we changed the qemu_log impl to honour the timestamp toggle, then
all users of qemu_log benefit. We then eliminate error-report.h usage
in trace.h headers, and also cut the code size for trace points
significantly


static inline void _nocheck__trace_object_dynamic_cast_assert(const char * type, const char * target, const char * file, int line, const char * func)
{
    if (trace_event_get_state(TRACE_OBJECT_DYNAMIC_CAST_ASSERT) && qemu_loglevel_mask(LOG_TRACE)) {
        if (message_with_timestamp) {
            struct timeval _now;
            gettimeofday(&_now, NULL);
            qemu_log("%d@%zu.%06zu:object_dynamic_cast_assert " "%s->%s (%s:%d:%s)" "\n",
                     qemu_get_thread_id(),
                     (size_t)_now.tv_sec, (size_t)_now.tv_usec
                     , type, target, file, line, func);
        } else {
            qemu_log("object_dynamic_cast_assert " "%s->%s (%s:%d:%s)" "\n", type, target, file, line, func);
        }
    }
}

down to


static inline void _nocheck__trace_object_dynamic_cast_assert(const char * type, const char * target, const char * file, int line, const char * func)
{
    if (trace_event_get_state(TRACE_OBJECT_DYNAMIC_CAST_ASSERT) && qemu_loglevel_mask(LOG_TRACE)) {
            qemu_log("object_dynamic_cast_assert " "%s->%s (%s:%d:%s)" "\n", type, target, file, line, func);
    }
}

which feels more in keeping with the kind of level of complexity you should
want to be inlined in trace callers.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


