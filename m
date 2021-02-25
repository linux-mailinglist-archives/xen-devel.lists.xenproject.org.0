Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B63252C4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:53:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89846.169647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIxC-0001wu-O0; Thu, 25 Feb 2021 15:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89846.169647; Thu, 25 Feb 2021 15:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIxC-0001wV-Kn; Thu, 25 Feb 2021 15:53:26 +0000
Received: by outflank-mailman (input) for mailman id 89846;
 Thu, 25 Feb 2021 15:53:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFIxB-0001wQ-Hu
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:53:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e1cf085-90d3-4dd1-b0de-652e0e76078c;
 Thu, 25 Feb 2021 15:53:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D322CADCD;
 Thu, 25 Feb 2021 15:53:23 +0000 (UTC)
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
X-Inumbo-ID: 3e1cf085-90d3-4dd1-b0de-652e0e76078c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614268404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTGI60kHpdbuznPYGpuBP4+R0awiYyVENxBUCin95sk=;
	b=RLwgYbitg3pHkmgDELMn2tH0JPrZt8STqA5WBBlN+UR9baxQp6+Gg5cFQ5e9tx0ps6KJAU
	sG6J8wAh8oBVtDfBscdIEzJYbpApRDB+lvxpWg8JomVJeopfZJfxFKAc2GCU9ftBxY1JKJ
	FoiKh8JM+9hRlyd7YZypvwGRFnp2Vgk=
Subject: Re: [PATCH for-next 4/6] xen: Fix build when !CONFIG_GRANT_TABLE
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1614265718.git.connojdavis@gmail.com>
 <eb2d1e911870f1662acfbc073447af2d29455750.1614265718.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <259e6dce-7fc4-1f2e-49b6-61a047012953@suse.com>
Date: Thu, 25 Feb 2021 16:53:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <eb2d1e911870f1662acfbc073447af2d29455750.1614265718.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 16:24, Connor Davis wrote:
> --- a/xen/include/xen/grant_table.h
> +++ b/xen/include/xen/grant_table.h
> @@ -66,6 +66,8 @@ int gnttab_acquire_resource(
>  
>  #define opt_max_grant_frames 0
>  
> +struct grant_table {};
> +
>  static inline int grant_table_init(struct domain *d,
>                                     int max_grant_frames,
>                                     int max_maptrack_frames)

You shouldn't actually declare a struct, all you need is to
move the forward decl further up in the file ahead of the
#ifdef.

Jan


