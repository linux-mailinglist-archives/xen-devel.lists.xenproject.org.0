Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0E27595E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 16:05:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL5Oc-0004eM-SP; Wed, 23 Sep 2020 14:05:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL5Ob-0004eH-FZ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 14:05:21 +0000
X-Inumbo-ID: c5b8d3d9-db49-4e4e-85b0-34efc39e43b9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5b8d3d9-db49-4e4e-85b0-34efc39e43b9;
 Wed, 23 Sep 2020 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=jbyWqSUZO/2nKH1ZSR1a+C4Ou9j4V3urIEwohGu9MqU=; b=H24vrYO/aDQZ9DCrLgBH1VU+m7
 WFz+62kUn7ZDZI3rCLpdstpJqLJxkL6BKn9GmbHs459Z9NAVW5jiTWkbC08fx8L33Bp7EtYq5BXiZ
 NHTUs3fHIlw1xT+VCXB+rhE3AaIQb3gUhbzoq5gEQ4uRh4DvPCbjdxTQ8QwOh0O/d2VE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL5OV-0003bm-MR; Wed, 23 Sep 2020 14:05:15 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL5OV-0005U1-DP; Wed, 23 Sep 2020 14:05:15 +0000
Subject: Re: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200923082832.20038-1-julien@xen.org>
 <1D6392F2-F4EC-4025-A793-22EABF85AA0E@arm.com>
 <3c64f36f-6b43-6f73-e344-70b084f1f505@xen.org>
 <C14129BD-09F3-4297-BBD6-9F3C5AA82FA7@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <734db015-bbde-bb4a-7826-32ca0744f4e9@xen.org>
Date: Wed, 23 Sep 2020 15:05:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <C14129BD-09F3-4297-BBD6-9F3C5AA82FA7@arm.com>
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



On 23/09/2020 14:55, Bertrand Marquis wrote:
>> On 23 Sep 2020, at 12:17, Julien Grall <julien@xen.org> wrote:
> More that it make more sense in general to have SMMUv3 with 2 level of page table supporting this then old SMMU versions.

Both driver are equally important. I wouldn't discard SMMUv2 just 
because there is a new shiny version.

I also have some concerns with the SMMUv3. They are pretty similar to 
the GICv3 ITS as both use a shared ring for the commands.

Cheers,

-- 
Julien Grall

