Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEAC00003
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 10:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148780.1480629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBqyq-0006cL-TW; Thu, 23 Oct 2025 08:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148780.1480629; Thu, 23 Oct 2025 08:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBqyq-0006au-QW; Thu, 23 Oct 2025 08:47:32 +0000
Received: by outflank-mailman (input) for mailman id 1148780;
 Thu, 23 Oct 2025 08:47:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBqyp-0006ao-Li
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 08:47:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBqyn-00Fns8-13;
 Thu, 23 Oct 2025 08:47:29 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBqyn-00B4TW-0R;
 Thu, 23 Oct 2025 08:47:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=7msVaFVLAOFaUAvt9ZPd4r5V/akvKxO8C2L4ouqbue8=; b=cCheWAwcFFve0Q09bIiPddwsnH
	7WvtpvTaNcfXKeaP/DcBQ9Sf/o5xzq0lMU4E+X8Sosn5e0W9WHq2CaTmTgXbIztO4ixTNgrL0YQXP
	0r54kYBHKK/Ks94LUsr0o+3jpnGvoUPv7KqE/msSj49RI6IFq2AHNJRzPjxfRs1SrxPA=;
Date: Thu, 23 Oct 2025 10:47:27 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/8] libxl: Convert libxl__json_parse() to use
 json-c
Message-ID: <aPnrn-0ZcjxZ6VHz@l14>
References: <20250929120756.46075-1-anthony@xenproject.org>
 <20250929120756.46075-3-anthony@xenproject.org>
 <5c8777cb-86c4-4600-83e2-e48700b2daab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8777cb-86c4-4600-83e2-e48700b2daab@suse.com>

On Thu, Oct 16, 2025 at 12:45:57PM +0200, Jan Beulich wrote:
> On 29.09.2025 14:07, Anthony PERARD wrote:
> > --- a/tools/libs/light/libxl_json.c
> > +++ b/tools/libs/light/libxl_json.c
> > @@ -16,7 +16,25 @@
> >  
> >  #include <math.h>
> >  
> > +#ifdef HAVE_LIBJSONC
> > +#include <json-c/json.h>
> > +#define USE_LIBJSONC_PARSER
> > +#endif
> > +
> > +#ifdef HAVE_LIBYAJL
> > +#  ifndef USE_LIBJSONC_PARSER
> > +#    define USE_LIBYAJL_PARSER
> > +#  endif
> > +#endif
> > +
> > +
> > +#ifdef USE_LIBJSONC_PARSER
> > +#include <json-c/json_visit.h>
> > +#endif
> 
> The version of json-c one of my systems is using also doesn't have this header.

Looks like this was introduced in 0.13, with json_c_visit().

> Plus (uses originating from other patches in this series)
> json_object_object_add() returns void there. Plus of course any number of further
> issues I'm going to see. The checking configure.ac is doing right now looks to be
> insufficient overall.

json_object_object_add() prototype was change in 0.13 it seems,
according to
https://github.com/json-c/json-c/blob/master/ChangeLog

Also, another patch (xenstat) was using a deprecated function
json_object_object_get(), but the deprecation seems to have been removed
in 0.13.

I've tried to build with our Ubuntu 20.04 docker image, on which we can
install json-c 0.13 and found other missing functions.

Both json_object_new_null() and json_object_new_uint64() are missing,
the first one isn't needed, but I think we need the second one. Both
were introduced in json-c 0.14.

And last one, json_object_new_array_ext() which was introduced in 0.15.
We could replace it by json_object_new_array() if needed.

Overall, is seems the current code needs json-c 0.15, so 
    -PKG_CHECK_MODULES([libjsonc], [json-c],
    +PKG_CHECK_MODULES([libjsonc], [json-c >= 0.15],

I'll prepare a patch.

Cheers,

-- 
Anthony PERARD

