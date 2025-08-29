Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EACBB3BC3F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101346.1454452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uryyp-0001PS-Qi; Fri, 29 Aug 2025 13:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101346.1454452; Fri, 29 Aug 2025 13:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uryyp-0001NT-Nw; Fri, 29 Aug 2025 13:17:23 +0000
Received: by outflank-mailman (input) for mailman id 1101346;
 Fri, 29 Aug 2025 13:17:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uryyo-0001NJ-J1
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:17:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uryyn-00CcfN-34;
 Fri, 29 Aug 2025 13:17:22 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uryyn-007ave-2o;
 Fri, 29 Aug 2025 13:17:22 +0000
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
	bh=AVbIP80WG1ZZkCpMzOys/lXW3a8nw6wxFZTzFvnofyE=; b=fuquXZcvVP32WdKV0jAEv+1rFo
	+3fUfnihJEfX8qk8ogDi3SnJ81V9HqM9Twu5d+c/JaUVxyumrewhfKqSo/4wxgLnHLn9wiRtZ2QVb
	IPZNX+fNGMccSlsv+a/gNlchW0/+6IXw6VhX5rNReMS0fqxWT6QKjZ7cSFJRkyaQBU7g=;
Date: Fri, 29 Aug 2025 15:17:20 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 04/11] tools/configure: Introduce deps on json-c lib
 for libxl
Message-ID: <aLGoYGgLHL9kLmzT@l14>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-5-anthony@xenproject.org>
 <39b2fc9e-44db-4f42-9586-1dcdac118659@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39b2fc9e-44db-4f42-9586-1dcdac118659@amd.com>

On Wed, Aug 27, 2025 at 11:01:59AM -0400, Jason Andryuk wrote:
> On 2025-08-08 10:55, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> > 
> > To replace yajl.
> > 
> > Introduce YAJL_LIBS variable, to be able to remove "-lyajl" later.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Should the two configure changes be merged and placed at the end of the
> series?  That avoids a half implemented conversion in between.

It might be half-converted, but it's fully working. Every single patch
introduce changes that can be use right away. I've actually make use of
this possibility. On every single patch, we can run ./testidl, which
will exercise both lib against each other.

./testidl does LibxlObj-to-JSONstring and back and forth. So on the next
commit, we would have JSON generated with json-c, which is then parsed
with YAJL, to finally be generated to JSON with json-c again, then both
JSON output are compared.

I've actually prepared the patch "libxl: Convert libxl__json_parse() to
use json-c' last, then put it in front and check that ./testidl was
still working.

This help me be confident enough that the conversion to json-c was
correct.

So if we squash both config change, every patch until the config change
would only introduce dead code.

Cheers,

-- 
Anthony PERARD

