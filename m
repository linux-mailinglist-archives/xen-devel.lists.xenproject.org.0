Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAA726615A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 16:40:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGkD5-0001oA-OS; Fri, 11 Sep 2020 14:39:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGkD4-0001o5-HB
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 14:39:30 +0000
X-Inumbo-ID: 442c0642-2260-425f-8ca6-09d8e6fcbb19
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 442c0642-2260-425f-8ca6-09d8e6fcbb19;
 Fri, 11 Sep 2020 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=VwMy7Wt0P7om0eIeXGy4hp3Gy4vICGy3kVRxv+ssNWQ=; b=0nCW0+2QvCDnhYuwOXQt3fVugo
 ip++ccmb/MkluwlIfDyToohN28PP7weJr34TCs1uTeS4fTOdOc3nqJlgC1ed86qpVYaxDWd+SHFf+
 HcSo1NjSH8lDRUdpAEVnYj/cjdrmUTIL3nZQKzw6o/qW40H0ejQLAb1/vXKW+RdyKVlY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGkD2-0002cc-1C; Fri, 11 Sep 2020 14:39:28 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGkD1-0003a0-Ov; Fri, 11 Sep 2020 14:39:27 +0000
Subject: Re: preparations for 4.13.2 and 4.12.4
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c4e43118-38e6-19d4-c91b-4a7ed45853b5@xen.org>
Date: Fri, 11 Sep 2020 15:39:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 11/09/2020 14:11, Jan Beulich wrote:
> All,
> 
> the releases are about due, but will of course want to wait for the
> XSA fixes going public on the 22nd. Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant. (Ian, Julien, Stefano: I notice there once
> again haven't been any tools or Arm side backports at all so far
> since the most recent stable releases from these branches. But
> maybe there simply aren't any.)
> 
> One that I have queued already, but which first need to at least
> pass the push gate to master, are
> 
> 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in e820
> e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
> b4e41b1750d5 b4e41b1750d5 [4.14 only]
> 
> On the Arm side I'd also like to ask for
> 
> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers

Sounds good to me.

I would also add:

d501ef90ae7f xen/arm: cmpxchg: Add missing memory barriers in 
__cmpxchg_mb_timeout() [4.12+]

Cheers,

-- 
Julien Grall

