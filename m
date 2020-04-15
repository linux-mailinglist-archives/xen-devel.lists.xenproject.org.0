Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B91AA45B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:24:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOi1Z-0003C8-59; Wed, 15 Apr 2020 13:24:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOi1X-0003C3-Ft
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:24:15 +0000
X-Inumbo-ID: 66c9ffe8-7f1c-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66c9ffe8-7f1c-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8pNF50j22WVox24Z159EB27HGmrQcEzMaNofE2TuaEA=; b=nWKrSyL/lSjBOeSmFCPDPxJB3w
 S0QxVlkr80dAwx6xVfekidJneje5edYgfS6c1CqiGtD97PyDJCnBgnT5zxqHcgUrETdPcdoQIBUp7
 EknnK5fffybbFnib9PGh5wuWfNjJR1Zv/Ubuof8jBRuYjtAYCWjDmas6oF3c0fU+BS44=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOi1R-0003jy-Vy; Wed, 15 Apr 2020 13:24:09 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOi1R-0006ZR-N5; Wed, 15 Apr 2020 13:24:09 +0000
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <a5a3f831-c15d-7503-c7fd-876b466ca87c@xen.org>
Date: Wed, 15 Apr 2020 14:24:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-5-sstabellini@kernel.org>
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
Cc: Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/04/2020 02:02, Stefano Stabellini wrote:
> Introduce a function named reserve_heap_pages (similar to
> alloc_heap_pages) that allocates a requested memory range. Call
> __alloc_heap_pages for the implementation.
> 
> Change __alloc_heap_pages so that the original page doesn't get
> modified, giving back unneeded memory top to bottom rather than bottom
> to top.
> 
> Also introduce a function named reserve_domheap_pages, similar to
> alloc_domheap_pages, that checks memflags before calling
> reserve_heap_pages. It also assign_pages to the domain on success.

Xen may have already allocated the part of region for its own purpose or 
for another domain. So this will not work reliably.

We have the same issues with LiveUpdate as memory have to be preserved. 
We need to mark the page reserved before any allocation (including early 
boot allocation) so nobody can use them. See [1].

Cheers,

[1]  Live update: boot memory management, data stream handling, record 
format <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>

-- 
Julien Grall

