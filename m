Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF04503D1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225818.390058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaWT-0007vK-Hr; Mon, 15 Nov 2021 11:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225818.390058; Mon, 15 Nov 2021 11:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmaWT-0007ru-Du; Mon, 15 Nov 2021 11:51:41 +0000
Received: by outflank-mailman (input) for mailman id 225818;
 Mon, 15 Nov 2021 11:51:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mmaWR-0007ro-US
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:51:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmaWQ-0007Ke-Jc; Mon, 15 Nov 2021 11:51:38 +0000
Received: from [54.239.6.189] (helo=[192.168.10.237])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmaWQ-000402-Cu; Mon, 15 Nov 2021 11:51:38 +0000
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
	bh=bvagXgt+RcGzZyRBj7VP/vg1oI4kRlKGBqlStlYqtf4=; b=K6R1ZuCaWczmfF3Klt8C1zErJF
	Zi202Wc4CdblOuk/GfEXaZ0r1/O+JOlaEr5twpBPhMOL/eUK2i7UilZdrqNjpmcPHK1r8OmCE6TT6
	3nFrzfkqWspMwXRC8vBOAYTUknKOhJgWoa3srctG/iao+onSjxZS3yyDszeNKsOH42i8=;
Message-ID: <9bd26ab8-cfa6-264a-ee19-0dc3bc2c3e80@xen.org>
Date: Mon, 15 Nov 2021 11:51:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16 v2] Revert "domctl: improve locking during domain
 destruction"
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyxia@amazon.com>, Dmitry Isaikin
 <isaikin-dmitry@yandex.ru>, Ian Jackson <iwj@xenproject.org>
References: <20211112120208.74387-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211112120208.74387-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 12/11/2021 12:02, Roger Pau Monne wrote:
> This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
> 
> Performance analysis has shown that dropping the domctl lock during
> domain destruction greatly increases the contention in the heap_lock,
> thus making parallel destruction of domains slower.
> 
> The following lockperf data shows the difference between the current
> code and the reverted one:
> 
> lock:  3342357(2.268295505s), block:  3263853(18.556650797s)
> lock:  2788704(0.362311723s), block:   222681( 0.091152276s)
> 
> Those figures are from Dmitry Isaikin, and are gathered after
> destroying 5 2GB HVM guests in parallel:
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01515.html
> 
> Given the current point in the release, revert the commit and
> reinstate holding the domctl lock during domain destruction. Further
> work should be done in order to re-add more fine grained locking to
> the domain destruction path once a proper solution to avoid the
> heap_lock contention is found.
> 
> Reported-by: Hongyan Xia <hongyxia@amazon.com>
> Reported-by: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

