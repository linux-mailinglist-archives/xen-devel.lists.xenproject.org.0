Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2735C30D9A7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 13:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80906.148374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7H6M-0006xk-6D; Wed, 03 Feb 2021 12:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80906.148374; Wed, 03 Feb 2021 12:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7H6M-0006xO-2l; Wed, 03 Feb 2021 12:17:42 +0000
Received: by outflank-mailman (input) for mailman id 80906;
 Wed, 03 Feb 2021 12:17:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7H6K-0006xJ-En
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 12:17:40 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b047a686-7b42-404c-b8fe-557aded63f29;
 Wed, 03 Feb 2021 12:17:39 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 113CHcQ2026559;
 Wed, 3 Feb 2021 13:17:38 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 23DC9281D; Wed,  3 Feb 2021 13:17:38 +0100 (CET)
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
X-Inumbo-ID: b047a686-7b42-404c-b8fe-557aded63f29
Date: Wed, 3 Feb 2021 13:17:38 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: xenstored file descriptor leak
Message-ID: <20210203121738.GA2610@antioche.eu.org>
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
 <20210203075721.GB445@antioche.eu.org>
 <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
 <20210203081621.GD445@antioche.eu.org>
 <89ddaac0-eb05-8ddb-465a-60d78e4009eb@suse.com>
 <20210203114832.GA1549@antioche.eu.org>
 <73c0dd26-d3a5-221f-84b8-06055ee62889@suse.com>
 <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 03 Feb 2021 13:17:38 +0100 (MET)

On Wed, Feb 03, 2021 at 01:13:53PM +0100, Jürgen Groß wrote:
> On 03.02.21 13:03, Manuel Bouyer wrote:
> > On Wed, Feb 03, 2021 at 12:54:23PM +0100, Jürgen Groß wrote:
> > > On 03.02.21 12:48, Manuel Bouyer wrote:
> > > > On Wed, Feb 03, 2021 at 09:21:32AM +0100, Jürgen Groß wrote:
> > > > > [...]
> > > > > This shouldn't happen in case we are closing the socket actively.
> > > > > 
> > > > > In the end we should just do a talloc_free(conn) in
> > > > > ignore_connection() if it is a socket based one. This should revert
> > > > > the critical modification of the XSA-115 fixes for sockets while
> > > > > keeping the desired effect for domain connections.
> > > > 
> > > > Hello
> > > > here's an updated patch which works for me. Does anyone see a problem
> > > > with it ? If not I will submit it for commit.
> > > > 
> > > 
> > > Do you really need the first hunk? I would have thought just freeing
> > > conn in ignore_connection() is enough.
> > > 
> > > In case you are seeing problems without the first hunk, please say so
> > > in a comment added to this hunk in order to avoid it being removed
> > > sometimes in the future.
> > 
> > No I don't need it. From your previous comments I though it was a good idea
> > to keep it, but I can remove it if you think it's better.
> 
> Yes, please remove it.

Will do

In the patch I'm going to submit, may I add

Reviewed-by: Jürgen Groß <jgross@suse.com>
?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

