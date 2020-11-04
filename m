Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00DE2A60C5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18952.44088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFIQ-0001l4-DR; Wed, 04 Nov 2020 09:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18952.44088; Wed, 04 Nov 2020 09:41:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFIQ-0001kf-9v; Wed, 04 Nov 2020 09:41:38 +0000
Received: by outflank-mailman (input) for mailman id 18952;
 Wed, 04 Nov 2020 09:41:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaFIO-0001ka-Oq
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:41:36 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ee8b392-d115-4846-a83a-b0ce7d78eafd;
 Wed, 04 Nov 2020 09:41:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFIL-00016n-77; Wed, 04 Nov 2020 09:41:33 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFIK-0001v5-VW; Wed, 04 Nov 2020 09:41:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaFIO-0001ka-Oq
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:41:36 +0000
X-Inumbo-ID: 6ee8b392-d115-4846-a83a-b0ce7d78eafd
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6ee8b392-d115-4846-a83a-b0ce7d78eafd;
	Wed, 04 Nov 2020 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=oRZqLVzfa8OX9cgLHLYxyBKVPo00g63SSB3CDWmcECI=; b=cKDPuyTT1xMGtBE0c+0WfgPAsC
	imSiK49oyBSkY1c+Dgq3hgGed946XzDKGarLghPrsPesb1dQb1Wzlm5ITvRseKMX2qa/+A72NpHnU
	PRB8TL6AZ0HTYzvKgnEeHKu79jRUt6UMbK3fqW1X728ulmi9jXshnk9M6wnN7Zdm5/BQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFIL-00016n-77; Wed, 04 Nov 2020 09:41:33 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFIK-0001v5-VW; Wed, 04 Nov 2020 09:41:33 +0000
Subject: Re: [PATCH v3 3/3] xen/rwlock: add check_lock() handling to rwlocks
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201104081549.3712-1-jgross@suse.com>
 <20201104081549.3712-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <253f82a7-8c7c-0351-9edd-664c421c33fc@xen.org>
Date: Wed, 4 Nov 2020 09:41:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104081549.3712-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/11/2020 08:15, Juergen Gross wrote:
> Checking whether a lock is consistently used regarding interrupts on
> or off is beneficial for rwlocks, too.
> 
> So add check_lock() calls to rwlock functions. For this purpose make
> check_lock() globally accessible.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

