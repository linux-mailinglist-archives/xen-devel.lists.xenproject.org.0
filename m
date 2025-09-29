Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614ACBA8C45
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 11:53:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132707.1470960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3AYj-0000OD-Gd; Mon, 29 Sep 2025 09:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132707.1470960; Mon, 29 Sep 2025 09:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3AYj-0000Md-Dr; Mon, 29 Sep 2025 09:52:41 +0000
Received: by outflank-mailman (input) for mailman id 1132707;
 Mon, 29 Sep 2025 09:52:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v3AYh-0000MX-Sk
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 09:52:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3AYh-00GUPl-1g;
 Mon, 29 Sep 2025 09:52:39 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v3AYh-0048hk-1J;
 Mon, 29 Sep 2025 09:52:39 +0000
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
	bh=iMuyQZPdTH+a8RmxJeht35K4zZ8tC1oTItv0gz2XNoM=; b=CBcR0JCQc2lemgtVmLf3m/e6aS
	hD6j60gtJ4Pp7hf2g4oCWNjeTdW2EgK7fAmikIK21uZOEJ4uQdsGEukVse8l6/4MzQeJ8lKL/dP0Y
	Bup+rz3tw+om6VvN9IUvEw2qGI9daGod7Z2HfR7KwtBfck1/uY+KnfitGWGj9pbO2SRo=;
Date: Mon, 29 Sep 2025 11:52:37 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 06/11] libxl: convert libxl__json_object_to_yajl_gen
 to libxl__json_object_to_libjsonc_object
Message-ID: <aNpW5YWgB9jN-_lO@l14>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-7-anthony@xenproject.org>
 <10a60455-a4d2-4c58-8a80-d8b264d27efd@amd.com>
 <aLGxc2d5rZspn9wj@l14>
 <16e4818f-685c-4c5c-81a8-2dbac86ba0e2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e4818f-685c-4c5c-81a8-2dbac86ba0e2@amd.com>

On Sun, Aug 31, 2025 at 10:51:53AM -0400, Jason Andryuk wrote:
> On 2025-08-29 09:56, Anthony PERARD wrote:
> > On Wed, Aug 27, 2025 at 11:37:07AM -0400, Jason Andryuk wrote:
> > > On 2025-08-08 10:55, Anthony PERARD wrote:
> > > > +    case JSON_NUMBER:
> > > > +        *jso_out = json_object_new_string(obj->u.string);
> > > 
> > > Is JSON_NUMBER calling json_object_new_string() correct?  It looks like the
> > > yajl code falls back to a string, so that is okay but surprising.
> > 
> > Yeah, I think that's correct.
> > :-( maybe not. Even if we have these too comments:
> > 
> >      In libxl_internal.h, enum libxl__json_node_type:
> >          /* number is store in string, it's too big to be a long long or a double */
> >          JSON_NUMBER  = (1 << 4),
> > 
> >      In json_callback_number():
> >          /* If the conversion fail, we just store the original string. */
> > 
> > With yajl, we call yajl_gen_number(), which probably write 2^128 as:
> > 
> >      340282366920938463463374607431768211456
> > 
> > but this new json-c generator would write instead:
> > 
> >      "340282366920938463463374607431768211456"
> > 
> > I guess we might be able to replicate the same behavior by using
> > json_object_set_serializer() or json_object_new_double_s() (which use
> > the former). But I don't know if it is worth the effort. I hope we won't
> > have int bigger than 64 bits.
> 
> I didn't check, but I thought uint64_t is the biggest size libxl uses.

Yes, but we also parse json that are produce else where. (could be file
saved by libxl, but also json produced by QEMU)

Anywhy, I investitaged this a bit, and it's very unlikely that a
`JSON_NUMBER` would be created, so it's even less likely that this
`case` would happen. But I've change the call to
`json_object_new_string` by:

    /*
     * Use json_object_new_double_s() to rewrite the number exactly as
     * we parsed it. When generating the JSON string the value `0` will
     * be ignored and `obj->u.string` will be written instead.
     */
    *jso_out = json_object_new_double_s(0, obj->u.string);

That way, we get the same json blob, with both library.

Cheers,

-- 
Anthony PERARD

