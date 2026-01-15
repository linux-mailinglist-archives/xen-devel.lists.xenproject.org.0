Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91ECD23537
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204361.1519052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJEv-0000av-KT; Thu, 15 Jan 2026 09:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204361.1519052; Thu, 15 Jan 2026 09:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJEv-0000Yd-HQ; Thu, 15 Jan 2026 09:02:01 +0000
Received: by outflank-mailman (input) for mailman id 1204361;
 Thu, 15 Jan 2026 09:02:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vgJEu-0000YX-8Q
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:02:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgJEm-004jDg-0a;
 Thu, 15 Jan 2026 09:01:51 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgJEl-004KR1-1L;
 Thu, 15 Jan 2026 09:01:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=GGMrPRFB+xHLzHgb8fqcJuD0KTFzCPZv4Y+fcJ5KC+A=; b=
	GlkDmHWZ7m+QsQbWjbF7AUUXt0YYgSGtJVpQd4l4MOw+1vy+h1WJmmKLpA0l/AZXa3E9jtxwWPoQ9
	rbPsK4mmfgiDRZrLw4tBHDVQRJScY3Q0H8K7f02nz9ENeWbEON4P3zpEshOLgudSTsquZSU+sK/eP
	q1cICu1dHGzaf+WK8=;
From: dmukhin@xen.org
Date: Thu, 15 Jan 2026 01:01:50 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] tests: fixup domid make fragment
Message-ID: <aWis/n2yse0A59+A@kraken>
References: <20260111041145.553673-1-dmukhin@ford.com>
 <20260111041145.553673-2-dmukhin@ford.com>
 <2badbc33-f78c-47d9-acef-9383a5aa3387@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2badbc33-f78c-47d9-acef-9383a5aa3387@suse.com>

On Mon, Jan 12, 2026 at 12:16:46PM +0100, Jan Beulich wrote:
> On 11.01.2026 05:11, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > There can be multiple test harnesses per one test target (e.g. harness.h
> > and harness2.h). Account for that by further parametrizing existing
> > emit-harness-nested-rule().
> 
> Multiple harnesses within a single dir imo likely would share headers, but
> use different .c files. Also, why would dependencies on headers need
> recording at all? The Makefile includes $(DEPS_INCLUDE), so all dependency
> concerns should be covered (or else the generic machinery would need
> fixing). Imo all of this wants simplifying (dropping?) rather than further
> complicating.

Whoops, I forgot to drop that multi-harness stuff.
Thanks!

> 
> Jan

