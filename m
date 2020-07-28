Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2A23078F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 12:22:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0MkG-0008R5-Cb; Tue, 28 Jul 2020 10:22:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSwU=BH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k0MkF-0008R0-5g
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 10:22:03 +0000
X-Inumbo-ID: 2d462e76-d0bc-11ea-a891-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d462e76-d0bc-11ea-a891-12813bfff9fa;
 Tue, 28 Jul 2020 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SyFuU7+M8MVwPeAkKMNBGwL2tvYp7N5iAJ2NgFRHDPo=; b=gJ3h4Z26GKcwX1YndiawYvz7gL
 vAtfb5oJmFNfw3y/x78SKY3W0qX7tVjHCIpT+wi5czZCnyNnt9jLCLzTZP4gK+uLz4aE81NLcTilx
 ORkeHg7rXgUFbKqeS/f7gMLMyq4Y4pQERb8Jc3Z/H2p+zkk0SS11Jab1oHSmuvK7fSwI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0Mk9-00057a-8g; Tue, 28 Jul 2020 10:21:57 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0Mk9-0002gt-0D; Tue, 28 Jul 2020 10:21:57 +0000
Subject: Re: [PATCH] public/domctl: Fix the struct xen_domctl ABI in 32bit
 builds
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200728101529.13753-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7ecab0e1-b218-cff0-f2dd-a5f81c5afaeb@xen.org>
Date: Tue, 28 Jul 2020 11:21:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728101529.13753-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 28/07/2020 11:15, Andrew Cooper wrote:
> The Xen domctl ABI currently relies on the union containing a field with
> alignment of 8.
> 
> 32bit projects which only copy the used subset of functionality end up with an
> ABI breakage if they don't have at least one uint64_aligned_t field copied.
> 
> Insert explicit padding, and some build assertions to ensure it never changes
> moving forwards.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

