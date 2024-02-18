Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7376859865
	for <lists+xen-devel@lfdr.de>; Sun, 18 Feb 2024 19:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682605.1061672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblTQ-00007a-6k; Sun, 18 Feb 2024 18:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682605.1061672; Sun, 18 Feb 2024 18:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rblTQ-0008Vu-3V; Sun, 18 Feb 2024 18:01:08 +0000
Received: by outflank-mailman (input) for mailman id 682605;
 Sun, 18 Feb 2024 18:01:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rblTO-0008Vo-RF
 for xen-devel@lists.xenproject.org; Sun, 18 Feb 2024 18:01:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblTN-0007EF-KL; Sun, 18 Feb 2024 18:01:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rblTN-0003p2-Dd; Sun, 18 Feb 2024 18:01:05 +0000
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
	bh=ojsgBToOz6X3UzjRyjj+SvgeG73BehRDNrcOr2Cc43g=; b=m1i9uC3hbSSHLXu9RtBK1AB/EY
	DvMoa4r16TzKT8QqI97K1YrfrbjqJrhomhZkhrDhCF5L+OfMsCnf0A7a0BU0uy+3KNjVu6IauUG1K
	9Enq7I1OY8/8YMr5OAtI54J26KpWjv25i9j5RiOysaq94itCsOOYWq37TntUh4f4fwJE=;
Message-ID: <0374516c-b5fa-4880-a07a-0b788f491e9a@xen.org>
Date: Sun, 18 Feb 2024 18:01:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Argo: don't obtain excess page references
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <79ed633d-b0bd-4a7d-a0c6-37a034e1ee96@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <79ed633d-b0bd-4a7d-a0c6-37a034e1ee96@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/02/2024 10:12, Jan Beulich wrote:
> find_ring_mfn() already holds a page reference when trying to obtain a
> writable type reference. We shouldn't make assumptions on the general
> reference count limit being effectively "infinity". Obtain merely a type
> ref, re-using the general ref by only dropping the previously acquired
> one in the case of an error.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> I further question the log-dirty check there: The present P2M type of a
> page doesn't really matter for writing to the page (plus it's stale by
> the time it is looked at). Instead I think every write to such a page
> needs to be accompanied by a call to paging_mark_dirty().

I agree with that.

Cheers,

-- 
Julien Grall

