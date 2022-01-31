Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CED4A4E50
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 19:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263256.455910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEbRM-0002wY-PU; Mon, 31 Jan 2022 18:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263256.455910; Mon, 31 Jan 2022 18:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEbRM-0002uj-LU; Mon, 31 Jan 2022 18:30:12 +0000
Received: by outflank-mailman (input) for mailman id 263256;
 Mon, 31 Jan 2022 18:30:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEbRL-0002ud-Ps
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 18:30:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEbRK-0000hM-6B; Mon, 31 Jan 2022 18:30:10 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[10.95.141.2])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEbRJ-0006kg-Uf; Mon, 31 Jan 2022 18:30:10 +0000
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
	bh=sksAk/8gB6pxP8Hg9jRA+DqFl9OPxKg4z+czB94uqig=; b=Jzqqdsyq70Hih28B/T1uosQe/A
	5TW/d8Q9fbH5FpgfUEpOuL5pCc/BWDWAF0q0UmxngBJqluIzwlrHqWq52V3rkro4l69oKvo9Yj4Fq
	xS8CnNcfBmcVG+xHb0T/dZ2heNwcN4uxvqfsV4wctd6k3HLD2o//HGWAZuMHim5/Qbbk=;
Message-ID: <425e042d-780e-e2eb-36e3-b30540f567e0@xen.org>
Date: Mon, 31 Jan 2022 18:30:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3] memory: XENMEM_add_to_physmap (almost) wrapping checks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <9725c93e-c227-f29f-07a4-65e383bb7858@suse.com>
 <c2606525-5d1b-c410-d750-1372334c4c7b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c2606525-5d1b-c410-d750-1372334c4c7b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/01/2022 14:53, Jan Beulich wrote:
> Determining that behavior is correct (i.e. results in failure) for a
> passed in GFN equaling INVALID_GFN is non-trivial. Make this quite a bit
> more obvious by checking input in generic code - both for singular
> requests to not match the value and for range ones to not pass / wrap
> through it.
> 
> For Arm similarly make more obvious that no wrapping of MFNs passed
> for XENMAPSPACE_dev_mmio and thus to map_dev_mmio_region() can occur:
> Drop the "nr" parameter of the function to avoid future callers
> appearing which might not themselves check for wrapping. Otherwise
> the respective ASSERT() in rangeset_contains_range() could trigger.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

