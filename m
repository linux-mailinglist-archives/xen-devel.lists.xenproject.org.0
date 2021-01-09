Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26102F016B
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 17:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64221.113616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGvJ-000883-E8; Sat, 09 Jan 2021 16:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64221.113616; Sat, 09 Jan 2021 16:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGvJ-00087d-Ay; Sat, 09 Jan 2021 16:17:05 +0000
Received: by outflank-mailman (input) for mailman id 64221;
 Sat, 09 Jan 2021 16:17:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyGvH-00087W-QV
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 16:17:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGvG-0003eL-4n; Sat, 09 Jan 2021 16:17:02 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGvF-0003GS-Tk; Sat, 09 Jan 2021 16:17:02 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NMpP9CAN0uGWOhm41jNbmCqGarL21I1xkQlk7qCKRSI=; b=yUBjqhXCwEJNAnYILetcaE+Clz
	+oOUeLa1jwHvxcR3HnlTfUCU5m7+ODN2U7P9lcvJMcy5WWgQVCZB1hCYCTyBfaRQCbacH2ApwwggO
	fMcqsOWI3v0pwVsGdOd79w53pF8cSbG/Ab4x9zuVsjQsqUUCJ16xK+CgXx0iIjZzvOks=;
Subject: Re: [PATCH v4 05/10] evtchn: closing of vIRQ-s doesn't require
 looping over all vCPU-s
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <ec877ae4-508e-6734-eae6-f3590021b712@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <479149f8-f372-0b0e-18bb-213dee7fad56@xen.org>
Date: Sat, 9 Jan 2021 16:17:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ec877ae4-508e-6734-eae6-f3590021b712@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 13:10, Jan Beulich wrote:
> Global vIRQ-s have their event channel association tracked on vCPU 0.
> Per-vCPU vIRQ-s can't have their notify_vcpu_id changed. Hence it is
> well-known which vCPU's virq_to_evtchn[] needs updating.

I went through the history and couldn't find a reason for looping the vCPUs.

I have also looked at the code and agree with the analysis provided in 
the commit message.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

