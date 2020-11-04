Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8E2A60C8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18957.44112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFJk-0001xK-0g; Wed, 04 Nov 2020 09:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18957.44112; Wed, 04 Nov 2020 09:42:59 +0000
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
	id 1kaFJj-0001wr-T2; Wed, 04 Nov 2020 09:42:59 +0000
Received: by outflank-mailman (input) for mailman id 18957;
 Wed, 04 Nov 2020 09:42:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaFJi-0001wS-HD
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:42:58 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c61fc5e4-7ce4-490b-a2b1-cf0f6d58ca53;
 Wed, 04 Nov 2020 09:42:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFJf-00019f-Pn; Wed, 04 Nov 2020 09:42:55 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFJf-000222-Gr; Wed, 04 Nov 2020 09:42:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaFJi-0001wS-HD
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:42:58 +0000
X-Inumbo-ID: c61fc5e4-7ce4-490b-a2b1-cf0f6d58ca53
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c61fc5e4-7ce4-490b-a2b1-cf0f6d58ca53;
	Wed, 04 Nov 2020 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DwXucumgulRseoaPBalUKOCJ3rL802vPK8B20iCXu/M=; b=dhYQJ5+Fbdf8AJn9TKfEuUSIMy
	UvMcv3FYKUgm4UWJ27FFWtX7bGvWNsOJ+l+THfTu8iOl77RnVNt0moAQ8LgSq1oeXaX89BW3r13a4
	kF25bkeEhmLkFUNGSIKyQSC9HgEHNcz2fitvXSGUBFRBTPhXa4FWzqFM9u0Qe9jmtNH0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFJf-00019f-Pn; Wed, 04 Nov 2020 09:42:55 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFJf-000222-Gr; Wed, 04 Nov 2020 09:42:55 +0000
Subject: Re: [PATCH v3 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201016105839.14796-1-jgross@suse.com>
 <20201016105839.14796-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ddd0454f-700e-c0cc-fb5d-ed44befa3f37@xen.org>
Date: Wed, 4 Nov 2020 09:42:52 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201016105839.14796-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 16/10/2020 11:58, Juergen Gross wrote:
> The queue for a fifo event is depending on the vcpu_id and the
> priority of the event. When sending an event it might happen the
> event needs to change queues and the old queue needs to be kept for
> keeping the links between queue elements intact. For this purpose
> the event channel contains last_priority and last_vcpu_id values
> elements for being able to identify the old queue.
> 
> In order to avoid races always access last_priority and last_vcpu_id
> with a single atomic operation avoiding any inconsistencies.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

