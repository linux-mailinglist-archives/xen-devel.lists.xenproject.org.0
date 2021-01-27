Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B56305FFC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76179.137343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n0n-0003Ba-MD; Wed, 27 Jan 2021 15:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76179.137343; Wed, 27 Jan 2021 15:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n0n-0003BB-Is; Wed, 27 Jan 2021 15:45:41 +0000
Received: by outflank-mailman (input) for mailman id 76179;
 Wed, 27 Jan 2021 15:45:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n0m-0003B6-Bh
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:45:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n0m-0000g3-5F
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:45:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n0m-0001oL-4P
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:45:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4n0i-0001cz-T3; Wed, 27 Jan 2021 15:45:36 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=FzTuKw0uz32m7i6qYlgpc6SRRJPU8InyBmnQAWW1sB0=; b=YVJuC61FSCVX2rwCQIvWv2G6tb
	s+TCAVPbsrfZw7IMNbEnK/TWsQ8105GbkErkAFcnpCNC1bbiAVvqMV1/ujjdGYi+5BxUhzQoYrn4Z
	2tkwXw2a4s11QxZOA40osLFwHT6vi0ZNuBtpte5WifIYPUnz3jEbNb8vJjVGfWoQOMII=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.35488.655441.334099@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 15:45:36 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] libxlutil: avoid almost-undefined behavior
In-Reply-To: <1d735cfa-d011-c8f5-ff39-81e0227e3a5d@suse.com>
References: <1d735cfa-d011-c8f5-ff39-81e0227e3a5d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] libxlutil: avoid almost-undefined behavior"):
> While only value computations of an object are disallowed in the
> presence of another unsequenced side effect, at least gcc 4.3 looks to
> extend this to taking the object's address. The resulting warning causes
> the build to fail, because of -Werror.
> 
> While there also correct an adjacent comment.
> 
> Fixes: bdc0799fe26a ("libxlu: introduce xlu_pci_parse_spec_string()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

