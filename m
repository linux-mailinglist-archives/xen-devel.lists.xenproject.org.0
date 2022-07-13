Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2050573664
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 14:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366574.597492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBbUi-0002LG-Py; Wed, 13 Jul 2022 12:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366574.597492; Wed, 13 Jul 2022 12:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBbUi-0002Hr-NL; Wed, 13 Jul 2022 12:29:32 +0000
Received: by outflank-mailman (input) for mailman id 366574;
 Wed, 13 Jul 2022 12:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oBbUh-0002Hl-LE
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 12:29:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBbUg-0003AF-Pv; Wed, 13 Jul 2022 12:29:30 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oBbUg-0000oj-K3; Wed, 13 Jul 2022 12:29:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=YQWbpS5tu8eob4m1aMRegt7MkvEPU2ktawzD6XDmZuM=; b=xnwq13Z+xDbJWwrxCRAtrZurgp
	opyE3YkTzG/e3bZKeRwhvc8l67DKB/JmFe0rIbFiCyv21w+3IGH4rckduB7E86tNDXqFoaR5Ezka2
	z/o0XtGJN8SqM7Tcg0do9SWWy5zLTvjhOqW5YBe9hFmX1XCmSpQsgCnEVZeYnKkFhmik=;
Message-ID: <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
Date: Wed, 13 Jul 2022 13:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
In-Reply-To: <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/07/2022 13:12, Bertrand Marquis wrote:
>> On 13 Jul 2022, at 12:31, Julien Grall <julien@xen.org> wrote:
>>> I can't
>>> see why it would be wrong to have a more tight limit on static ports
>>> than on traditional ("dynamic") ones. Even if only to make sure so
>>> many dynamic ones are left.
>>
>> This is similar to Xen forbidding to close a static port: it is not the hypervisor business to check that there are enough event channel ports freed for dynamic allocation.
> 
> On other side we need to be cautious not to add too much complexity in the code by trying to make things always magically work.
> If you want Xen to be accessible to non expert by magically working all the time, there would be a lot of work to do.

It is not clear to me whether you are referring to a developper or admin 
here.

On the admin side, we need to make sure they have an easy way to 
configure event channels. One knob is always going to easier than two knobs.

On the developper side, this could be resolved by better documentation 
in the code/interface.

Cheers,

-- 
Julien Grall

