Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED4EBB4377
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135996.1472890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Kh2-0004nv-H7; Thu, 02 Oct 2025 14:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135996.1472890; Thu, 02 Oct 2025 14:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Kh2-0004kr-EP; Thu, 02 Oct 2025 14:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1135996;
 Thu, 02 Oct 2025 14:54:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v4Kh1-0004kl-Ha
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:54:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v4Kgz-0056Ip-2G;
 Thu, 02 Oct 2025 14:54:01 +0000
Received: from [2a01:cb15:80df:da00:c70a:43d:5717:e951] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v4Kgz-00CTAt-1v;
 Thu, 02 Oct 2025 14:54:01 +0000
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
	bh=wdXbw+k/KfsBUn1X9MRelUYw6cnOzO8mb9bzn+NHXXc=; b=tRDmnKj4DRZFWVQ6sNy3qQatb5
	jEK+TmGMZFETnv875KGQTEqdOdIFdHqWE+hwGyU69vHvVe8ndm5kFIK8wLk+zJYHMulaWGhLOovBo
	o6YNDc9DKSJjVfPL6/pVAtAGsAiqXfc9fkQpJN53e6mWOJ/hQAf4w4s/cOYo5nQaLaiw=;
Date: Thu, 2 Oct 2025 16:53:58 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: [XEN PATCH v2 0/8] Allow to build libxl and other tools with
 json-c instead of yajl
Message-ID: <aN6SBgHtefnwPZ9n@l14>
References: <20250929120756.46075-1-anthony@xenproject.org>
 <a9f5969b-c9b8-4384-b4df-58c7951766ec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9f5969b-c9b8-4384-b4df-58c7951766ec@gmail.com>

On Mon, Sep 29, 2025 at 05:35:01PM +0200, Oleksii Kurochko wrote:
> 
> On 9/29/25 2:07 PM, Anthony PERARD wrote:
> > The library YAJL has been unmaintained for several years, without an obvious
> > fork to pick.
> > 
> > On the other and the library json-c is been maintained and use by several other
> > project, it's probably already installed on your machine. So this patch series
> > intend to allow to build the Xen toolstack again json-c, and forgo yajl.
> 
> Do we have any plans to drop fallback to yajl in the next release? Or because of
> this ...

Do we need a plan? We still have to support ancient version of several
dependencies, and json-c is a fairly recent project. In any case, usage
of yajl is quite contained, so I don't think it's a problem to let it
rot, and remove it when it get broken for long enough, but that's
unlikely to happen.

> > 
> > Just in case, YAJL is can still be used.
> > 
> > There's bit of libxl API that exposes YAJL, mainly so it can be used by `xl` to
> > call libxl_domain_config_gen_json(). It was exposed via the "libxl_json.h"
> > headers. This functions and others won't be available when libxl is build
> > against json-c.
> 
> ... that some API trying to use API exposed by YAJL we just can't drop support
> of yajl?

Well, I'm hopping those API are only used by `xl` and nothing else. And
to be fair, I've seen few project dropping support for YAJL and use
json-c instead (libvirt, to name one), so they can't use those API.

Cheers,

-- 
Anthony PERARD

