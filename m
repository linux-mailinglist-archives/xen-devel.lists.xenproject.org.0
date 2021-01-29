Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A13087E6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77951.141558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RFj-00005a-Qn; Fri, 29 Jan 2021 10:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77951.141558; Fri, 29 Jan 2021 10:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RFj-00005E-NU; Fri, 29 Jan 2021 10:43:47 +0000
Received: by outflank-mailman (input) for mailman id 77951;
 Fri, 29 Jan 2021 10:43:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs4s=HA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5RFh-000055-UH
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:43:45 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab0acd39-356b-46b7-a99d-dda4bbdd9a45;
 Fri, 29 Jan 2021 10:43:44 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10TAhcPT008404;
 Fri, 29 Jan 2021 11:43:38 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 5132F281D; Fri, 29 Jan 2021 11:43:38 +0100 (CET)
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
X-Inumbo-ID: ab0acd39-356b-46b7-a99d-dda4bbdd9a45
Date: Fri, 29 Jan 2021 11:43:38 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] libs/store: make build without PTHREAD_STACK_MIN
Message-ID: <20210129104338.GF2015@antioche.eu.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-13-bouyer@netbsd.org>
 <YBKYkXSMSAGnUXZh@Air-de-Roger>
 <5006fc16-6806-28db-197c-330e131ccb8c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5006fc16-6806-28db-197c-330e131ccb8c@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Fri, 29 Jan 2021 11:43:38 +0100 (MET)

On Thu, Jan 28, 2021 at 11:08:08AM +0000, Andrew Cooper wrote:
> On 28/01/2021 10:57, Roger Pau Monné wrote:
> > On Tue, Jan 26, 2021 at 11:47:59PM +0100, Manuel Bouyer wrote:
> >> On NetBSD, PTHREAD_STACK_MIN is not available.
> >> If PTHREAD_STACK_MIN is not defined, define it to 0 so that we fallback to
> >> DEFAULT_THREAD_STACKSIZE
> >>
> > I would add:
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >
> >> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> >
> >> ---
> >>  tools/libs/store/xs.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> >> index 4ac73ec317..b6ecbd787e 100644
> >> --- a/tools/libs/store/xs.c
> >> +++ b/tools/libs/store/xs.c
> >> @@ -811,6 +811,11 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
> >>  
> >>  #ifdef USE_PTHREAD
> >>  #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
> >> +/* NetBSD doesn't have PTHREAD_STACK_MIN. */
> >> +#ifndef PTHREAD_STACK_MIN
> >> +# define PTHREAD_STACK_MIN 0
> >> +#endif
> >> +
> >>  #define READ_THREAD_STACKSIZE 					\
> >>  	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
> >>  	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
> > There was also a suggestion to use MAX(PTHREAD_STACK_MIN,
> > DEFAULT_THREAD_STACKSIZE). Is maybe MAX not defied here?
> 
> TBH, I was planning to submit an incremental cleanup doing this
> separately.  It would be cleaner than putting cleanup into the "fix
> NetBSD" patch.

yes, that was my idea too

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

