Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CA19D810
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 15:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKMo9-0001fH-Iy; Fri, 03 Apr 2020 13:56:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fKXS=5T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKMo7-0001fA-Hw
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 13:56:27 +0000
X-Inumbo-ID: e97ecc5c-75b2-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e97ecc5c-75b2-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w84CXMC3FKYEcCVHoyoaUvM9qcB1pc+leYSMRQEjsUE=; b=mcyL48QgRsa0BAlyz/2mAYGIRJ
 6s8Cia7z914aGUYQYRvXmaz5Sqy/uOHH8pOSOBzMmG49NaQ2NVOd9D1s+xp6JfaXXSdTnZ/iZqU8K
 VtV2g/JjMYVvJIWlPY7QyZ3BpLpmAFjCgdPmoH5AEqPjYN3aIEmYG3s3h4ay846Z2/Pg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKMo5-00083y-Va; Fri, 03 Apr 2020 13:56:25 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKMo5-0002ar-P1; Fri, 03 Apr 2020 13:56:25 +0000
Subject: Re: [PATCH v2] tools/xenstore: fix a use after free problem in
 xenstored
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200403120340.13406-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4a934636-3441-42eb-744a-3421eebb6c86@xen.org>
Date: Fri, 3 Apr 2020 14:56:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403120340.13406-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

On 03/04/2020 13:03, Juergen Gross wrote:
> Commit 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object
> twice") introduced a potential use after free problem in
> domain_cleanup(): after calling talloc_unlink() for domain->conn
> domain->conn is set to NULL. The problem is that domain is registered
> as talloc child of domain->conn, so it might be freed by the
> talloc_unlink() call.
> 
> With Xenstore being single threaded there are normally no concurrent
> memory allocations running and freeing a virtual memory area normally
> doesn't result in that area no longer being accessible. A problem
> could occur only in case either a signal received results in some
> memory allocation done in the signal handler (SIGHUP is a primary
> candidate leading to reopening the log file), or in case the talloc
> framework would do some internal memory allocation during freeing of
> the memory (which would lead to clobbering of the freed domain
> structure).

Thank you for writing more context!

> 
> Fixes: 562a1c0f7ef3fb ("tools/xenstore: dont unlink connection object twice")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

