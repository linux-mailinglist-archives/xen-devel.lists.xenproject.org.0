Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64601E7B18
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:59:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecjs-0002xv-UQ; Fri, 29 May 2020 10:59:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jecjr-0002xm-NR
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:59:47 +0000
X-Inumbo-ID: 82a9e16e-a19b-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82a9e16e-a19b-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bsXupUX5CAQgLcEwi1O7VUnO+wqZMFdhDU3R/Md8S0o=; b=dOwn4Yfuko8rcl2gDNiGLd7fGg
 DiJGnSfUpT9YfAaQBFix7Qel1jNWJVTz/Y8z7QvuVSxjx5JmmsvKAMZM9YuSzwcNdjT+FTCN9aZk6
 keGQjhOxuxIVeKl/YR/Ct8E6yhzdC7XSGg3EDw5bfXz7jNiRpS/KQGazWQ+o2cjHY8X8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jecjo-0001hr-3p; Fri, 29 May 2020 10:59:44 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jecjn-0005qx-Si; Fri, 29 May 2020 10:59:44 +0000
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <43781f37-184d-3ac8-8997-0a9be1de05ce@xen.org>
Date: Fri, 29 May 2020 11:59:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
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
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 29/05/2020 08:35, Jan Beulich wrote:
> On 28.05.2020 20:54, Julien Grall wrote:
>> On 28/05/2020 16:25, Bertrand Marquis wrote:
>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>> cause the following error when a context switch happens in user mode:
>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>>
>>> This patch is modifying runstate handling to map the area given by the
>>> guest inside Xen during the hypercall.
>>> This is removing the guest virtual to physical conversion during context
>>> switches which removes the bug
>>
>> It would be good to spell out that a virtual address is not stable. So
>> relying on it is wrong.
> 
> Guests at present are permitted to change the mapping underneath the
> virtual address provided (this may not be the best idea, but the
> interface is like it is).

Well yes, it could be point to data used by the userpsace. So you could 
corrupt a program. It is not very great.

So I would be ready to accept such restriction on Arm at least because 
KPTI use case is far more concerning that a kernel trying to change the 
location of the runstate in physical memory.

Cheers,

-- 
Julien Grall

