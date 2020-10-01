Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026DD280346
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 17:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1409.4508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0ut-00064p-Pd; Thu, 01 Oct 2020 15:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409.4508; Thu, 01 Oct 2020 15:54:47 +0000
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
	id 1kO0ut-00064Q-MP; Thu, 01 Oct 2020 15:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1409;
 Thu, 01 Oct 2020 15:54:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kO0ur-00064L-UZ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:54:46 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13d237b5-5c42-4429-a738-e4aa19e51ad4;
 Thu, 01 Oct 2020 15:54:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0uo-0001Jt-Hc; Thu, 01 Oct 2020 15:54:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0uo-0006LT-94; Thu, 01 Oct 2020 15:54:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kO0ur-00064L-UZ
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:54:46 +0000
X-Inumbo-ID: 13d237b5-5c42-4429-a738-e4aa19e51ad4
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13d237b5-5c42-4429-a738-e4aa19e51ad4;
	Thu, 01 Oct 2020 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=RvZLGIdlQx8nb7ju7Dv24vnrsKcJyJjpVl7Cr0kXq/U=; b=VjMLVqR5fkW7kaOGTf8Hz9Nz2A
	5v/GyWT6bmrCiAumbJvWMlG7D/deg/6/rreBEdp9F68rjlqnL4mjsqxhBynU76tnH0ldXyIHZrP4W
	J5+cIcraRyuOuiTWcvWRMaSDtEqL4LU3kfQDblSZ046LPsHDXxArodcKD1ZafckHM2Ks=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0uo-0001Jt-Hc; Thu, 01 Oct 2020 15:54:42 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0uo-0006LT-94; Thu, 01 Oct 2020 15:54:42 +0000
Subject: Re: [PATCH 07/12] evtchn: cut short evtchn_reset()'s loop in the
 common case
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <0577c62d-b349-6a60-d8bc-5b23a74342e0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fd15073b-d9e6-541e-d4fa-2ae2f249f7cb@xen.org>
Date: Thu, 1 Oct 2020 16:54:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <0577c62d-b349-6a60-d8bc-5b23a74342e0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 28/09/2020 12:00, Jan Beulich wrote:
> The general expectation is that there are only a few open ports left
> when a domain asks its event channel configuration to be reset.
> Similarly on average half a bucket worth of event channels can be
> expected to be inactive. Try to avoid iterating over all channels, by
> utilizing usage data we're maintaining anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

