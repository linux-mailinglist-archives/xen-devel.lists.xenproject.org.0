Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EF81E76B9
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:35:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZY7-0006WW-KH; Fri, 29 May 2020 07:35:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeZY6-0006WR-4Y
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:35:26 +0000
X-Inumbo-ID: f52bc116-a17e-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f52bc116-a17e-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 07:35:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A12EEB032;
 Fri, 29 May 2020 07:35:22 +0000 (UTC)
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Julien Grall <julien@xen.org>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
Date: Fri, 29 May 2020 09:35:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 28.05.2020 20:54, Julien Grall wrote:
> On 28/05/2020 16:25, Bertrand Marquis wrote:
>> At the moment on Arm, a Linux guest running with KTPI enabled will
>> cause the following error when a context switch happens in user mode:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
>>
>> This patch is modifying runstate handling to map the area given by the
>> guest inside Xen during the hypercall.
>> This is removing the guest virtual to physical conversion during context
>> switches which removes the bug
> 
> It would be good to spell out that a virtual address is not stable. So 
> relying on it is wrong.

Guests at present are permitted to change the mapping underneath the
virtual address provided (this may not be the best idea, but the
interface is like it is). Therefore I don't think the present
interface can be changed like this. Instead a new interface will need
adding which takes a guest physical address instead. (Which, in the
end, will merely be one tiny step towards making the hypercall
interfaces use guest physical addresses. And it would be nice if an
overall concept was hashed out first how that conversion should
occur, such that the change here could at least be made fit that
planned model. For example, an option might be to retain all present
hypercall numbering and simply dedicate a bit in the top level
hypercall numbers indicating whether _all_ involved addresses for
that operation are physical vs virtual ones.)

Jan

