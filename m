Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A872FB3BCF0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101422.1454506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzaJ-0000oP-H7; Fri, 29 Aug 2025 13:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101422.1454506; Fri, 29 Aug 2025 13:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzaJ-0000mc-EA; Fri, 29 Aug 2025 13:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1101422;
 Fri, 29 Aug 2025 13:56:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1urzaI-0000mW-1e
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:56:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urzaH-00CdP3-20;
 Fri, 29 Aug 2025 13:56:05 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urzaH-007dfa-1l;
 Fri, 29 Aug 2025 13:56:05 +0000
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
	bh=tsyPz5lnK+JfcWaYVgf+X6ZxcHKl+UA04xxsOJaeMGQ=; b=PwRaUOCWCjHM+E7CAVLpZ8Vw4Z
	L4OABvWcGoElT0JLzR2RKj+TtEwRn0AfFyzm8FDlomehDnpffy7vGLKGUzKhsR34u4YUHLMANO73M
	cc2MzsESFYG/vphxI4B/22Xe7daLdCqKEHuqFUleFyD3Rg2JV9NWJJJ3h5C+6W62RCQQ=;
Date: Fri, 29 Aug 2025 15:56:03 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 06/11] libxl: convert libxl__json_object_to_yajl_gen
 to libxl__json_object_to_libjsonc_object
Message-ID: <aLGxc2d5rZspn9wj@l14>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-7-anthony@xenproject.org>
 <10a60455-a4d2-4c58-8a80-d8b264d27efd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a60455-a4d2-4c58-8a80-d8b264d27efd@amd.com>

On Wed, Aug 27, 2025 at 11:37:07AM -0400, Jason Andryuk wrote:
> On 2025-08-08 10:55, Anthony PERARD wrote:
> > +    case JSON_NUMBER:
> > +        *jso_out = json_object_new_string(obj->u.string);
> 
> Is JSON_NUMBER calling json_object_new_string() correct?  It looks like the
> yajl code falls back to a string, so that is okay but surprising.

Yeah, I think that's correct.
:-( maybe not. Even if we have these too comments:

    In libxl_internal.h, enum libxl__json_node_type:
        /* number is store in string, it's too big to be a long long or a double */
        JSON_NUMBER  = (1 << 4),

    In json_callback_number():
        /* If the conversion fail, we just store the original string. */

With yajl, we call yajl_gen_number(), which probably write 2^128 as:

    340282366920938463463374607431768211456

but this new json-c generator would write instead:

    "340282366920938463463374607431768211456"

I guess we might be able to replicate the same behavior by using
json_object_set_serializer() or json_object_new_double_s() (which use
the former). But I don't know if it is worth the effort. I hope we won't
have int bigger than 64 bits.

And there's probably no tests for JSON_NUMBERs. So I guess first step
would be to write a test that have numbers that can't be converted to
`long long` and see what happens.

Thanks,

-- 
Anthony PERARD

