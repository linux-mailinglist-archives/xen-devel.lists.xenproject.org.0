Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88316527BE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 21:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467331.726387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7j4B-0007Ht-FT; Tue, 20 Dec 2022 20:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467331.726387; Tue, 20 Dec 2022 20:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7j4B-0007Fc-Bg; Tue, 20 Dec 2022 20:18:23 +0000
Received: by outflank-mailman (input) for mailman id 467331;
 Tue, 20 Dec 2022 20:18:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7j4A-0007FT-6E
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 20:18:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7j49-0003L9-Jb; Tue, 20 Dec 2022 20:18:21 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7j49-0008WL-Dw; Tue, 20 Dec 2022 20:18:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=v2DKSz3yXwz9alXcu44eL6Xf5YiWmMK5e6Ek9Cvg7bA=; b=syTL++CnpdNHnEdav69WDVXFRR
	ZkXfiGK6LWmReOjDfe/LAK5ViB/I0QnMWTcOR1JMoXNam6tRsMVOMzZCVmksT76c1He5Qkau2wE4u
	s2aPGwxuQUNkLhKUYtC4l910emdb5qEGaBzs+Zi5oCr8ClNU+jXnp9bs4IiyhGgSgkeQ=;
Message-ID: <04658e96-ec81-1dba-6829-3a52c69a27bb@xen.org>
Date: Tue, 20 Dec 2022 20:18:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 11/19] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-12-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221213160045.28170-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/12/2022 16:00, Juergen Gross wrote:
> The accounting for the number of nodes of a domain in an active
> transaction is not working correctly, as it allows to create arbitrary
> number of nodes. The transaction will finally fail due to exceeding
> the number of nodes quota, but before closing the transaction an
> unprivileged guest could cause Xenstore to use a lot of memory.

As per the discussion in v1, the commit message needs to be reworded.

I will look at this patch in more details once I have reached the 2nd 
series.

Cheers,

-- 
Julien Grall

