Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7A305849
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 11:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75928.136910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hzx-0003gE-GD; Wed, 27 Jan 2021 10:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75928.136910; Wed, 27 Jan 2021 10:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hzx-0003fp-Cy; Wed, 27 Jan 2021 10:24:29 +0000
Received: by outflank-mailman (input) for mailman id 75928;
 Wed, 27 Jan 2021 10:24:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4hzv-0003fi-Tu
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 10:24:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e114bc2-0dfc-49aa-8c75-7f1aaca29598;
 Wed, 27 Jan 2021 10:24:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4875AD57;
 Wed, 27 Jan 2021 10:24:25 +0000 (UTC)
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
X-Inumbo-ID: 5e114bc2-0dfc-49aa-8c75-7f1aaca29598
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611743066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ideyUUArALBzZ67ty25RBwS2F+y82steAoSwTM9Fs/g=;
	b=GjkcDecLgdz4edXR8iSVBvfBVtkfITL5DzWcKxCMhIxCFNUa6bR0OkLcps65iKN14tqIxL
	YsDwSURguLuFQrrDP5e/NcQd/KjZ/RNSU+cXxJWnAtvR/1qudjkoNiG5jJclMsXxrS1gP9
	WoSBYCWLSKEJwYFMzQIDIQ7dW3j2Vrs=
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
 <57d95c18-5215-03e7-7849-73c9fe968e75@xen.org>
 <e0bc7f80-974e-945d-4605-173bd05302af@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9aa563c1-de53-cafc-f7e7-c3da49b6ef6e@suse.com>
Date: Wed, 27 Jan 2021 11:24:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e0bc7f80-974e-945d-4605-173bd05302af@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 09:50, Oleksandr wrote:
> On 20.01.21 17:50, Julien Grall wrote:
>> On 17/01/2021 18:52, Oleksandr wrote:
>>> error2.txt - when add #include <public/hvm/dm_op.h> to xen/ioreq.h
>>
>> It looks like the error is happening in dm.c rather than xen/dm.h. Any 
>> reason to not include <public/hvm/dm_op.h> in dm.c directly?
> Including it directly doesn't solve build issue.
> If I am not mistaken in order to follow requirements how to include 
> headers (alphabetic order, public* should be included after xen* and 
> asm* ones, etc)
> the dm.h gets included the first in dm.c, and dm_op.h gets included the 
> last. We can avoid build issue if we change inclusion order a bit,
> what I mean is to include dm.h after hypercall.h at least (because 
> hypercall.h already includes dm_op.h). But this breaks the requirements 
> and is not way to go.
> Now I am in doubt how to overcome this.

First, violating the alphabetic ordering rule is perhaps less
of a problem than putting seemingly stray #include-s anywhere.
However, as soon as ordering starts mattering, this is
indicative of problems with the headers: Either the (seemingly)
too early included one lacks some #include-s, or you've run
into a circular dependency. In the former case the needed
#include-s should be added, and all ought to be fine. In the
latter case, however, disentangling may be a significant
effort, and hence it may be sensible and acceptable to instead
use unusual ordering of #include-s in the one place where it
matters (suitably justified in the description). Ideally such
would come with a promise to try to sort this later on, when
time is less constrained.

Jan

