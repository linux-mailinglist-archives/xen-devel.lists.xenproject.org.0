Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8AE1E7899
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeadc-0005ri-MK; Fri, 29 May 2020 08:45:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeadb-0005rd-3x
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:45:11 +0000
X-Inumbo-ID: b4430056-a188-11ea-a881-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4430056-a188-11ea-a881-12813bfff9fa;
 Fri, 29 May 2020 08:45:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6429AB3D;
 Fri, 29 May 2020 08:45:08 +0000 (UTC)
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52e26c9d-b662-2597-b521-dacf4f8acfc8@suse.com>
Date: Fri, 29 May 2020 10:45:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3B88C76B-6972-4A66-AFDC-0B5C27FBA740@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 10:13, Bertrand Marquis wrote:
>> On 28 May 2020, at 19:54, Julien Grall <julien@xen.org> wrote:
>> AFAICT, there is no restriction on when the runstate hypercall can be called. So this can even be called before the vCPU is brought up.
> 
> I understand the remark but it still feels very weird to allow an invalid address in an hypercall.
> Wouldn’t we have a lot of potential issues accepting an address that we cannot check ?

I don't think so: The hypervisor uses copy_to_guest() to protect
itself from the addresses to be invalid at the time of copying.
If the guest doesn't make sure they're valid at that time, it
simply won't get the information (perhaps until Xen's next
attempt to copy it out).

You may want to take a look at the x86 side of this (also the
vCPU time updating): Due to the way x86-64 PV guests work, the
address may legitimately be unmapped at the time Xen wants to
copy it, when the vCPU is currently executing guest user mode
code. In such a case the copy gets retried the next time the
guest transitions from user to kernel mode (which involves a
page table change).

Jan

