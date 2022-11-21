Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC966328FC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 17:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446749.702531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9KN-0007Lr-QU; Mon, 21 Nov 2022 16:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446749.702531; Mon, 21 Nov 2022 16:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9KN-0007Io-NI; Mon, 21 Nov 2022 16:07:23 +0000
Received: by outflank-mailman (input) for mailman id 446749;
 Mon, 21 Nov 2022 16:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZuz=3V=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ox9KL-0007Ii-Te
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 16:07:21 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92579f7c-69b6-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 17:07:19 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 166904682378198.6141457560326;
 Mon, 21 Nov 2022 08:07:03 -0800 (PST)
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
X-Inumbo-ID: 92579f7c-69b6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; t=1669046824; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XsxlZuBDXKq5xx8vLfdfl6bkLpNqINiuxC6ig7fHm8Bd5MkobXYpivv0CIGtsud89sMFTZRX2VOqz2H3DCN0mG8Tfi4Ed4TYQfmvJcfJrtX0FIvymUjWTDo0TzLv/n2PFOfK3800H/S5DjXbtQPq0LBB/jdcn8a9MMpC9jlORaE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669046824; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=tZyRZ/fk8LIzCTdf9SXGL+KC5e8X2bBuohDXP+YgN18=; 
	b=bWH8E4vdpfPDKKmzu+w4UgpMHjfjfyhFQTuk0gga7i6ZkGKrWD8zu6UgHdlediyebzSmFuHcz/FI64Nhhe2huFouqILUIxueeQfMUlo8RNNWQFtKuq2LtTJ6TVpYiWnBNL+mVbIm7cAXGOPZZAfy+3+js0zUIXu3wUIsK2v1SlM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669046824;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tZyRZ/fk8LIzCTdf9SXGL+KC5e8X2bBuohDXP+YgN18=;
	b=j+P9Lli+ZmJKfVvbIBNCXhgH0SpReiIXZQytUD9k1Hxgv1OCKzxWNJBBblmoQOl+
	h0+9O4wRTtc4tCfZniIXyrILi3uOIRLQk/iNlB4TbTb5isMaE5hcMvUJgCQ8v+ouG5u
	11ws6c3ZQ8EyGssoy0rb6bHTbPgNYgLhbd1aVEvU=
Message-ID: <b319d765-13de-e0ac-9ca6-d28047e9d191@apertussolutions.com>
Date: Mon, 21 Nov 2022 11:07:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] xen/flask: Wire up
 XEN_DOMCTL_{get,set}_paging_mempool_size
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Jason Andryuk <jandryuk@gmail.com>, Henry Wang <Henry.Wang@arm.com>
References: <20221121143731.27545-1-andrew.cooper3@citrix.com>
 <20221121143731.27545-3-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20221121143731.27545-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 11/21/22 09:37, Andrew Cooper wrote:
> These were overlooked in the original patch, and noticed by OSSTest which does
> run some Flask tests.
> 
> Fixes: 22b20bd98c02 ("xen: Introduce non-broken hypercalls for the paging mempool size")
> Suggested-by: Daniel Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Jason Andryuk <jandryuk@gmail.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> 
> It should be noted that the original XSA-409 fix broke Flask on ARM but no
> testing noticed.  c/s 7c3bbd940dd8 ("xen/arm, libxl: Revert
> XEN_DOMCTL_shadow_op; use p2m mempool hypercalls") "fixes" the original
> breakage and introduced this breakage instead.
> 
> For 4.17.  It's a fix for an issue that OSSTest is currently blocking as a
> regression.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

