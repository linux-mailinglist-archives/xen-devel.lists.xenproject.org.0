Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1DB7BAEE6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 00:41:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613153.953490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoX0n-00051v-96; Thu, 05 Oct 2023 22:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613153.953490; Thu, 05 Oct 2023 22:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoX0n-0004xJ-5H; Thu, 05 Oct 2023 22:40:05 +0000
Received: by outflank-mailman (input) for mailman id 613153;
 Thu, 05 Oct 2023 22:40:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qoX0k-0004ZY-Tx
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 22:40:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoX0k-0002fB-Jd; Thu, 05 Oct 2023 22:40:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoX0k-0000XW-DK; Thu, 05 Oct 2023 22:40:02 +0000
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
	bh=xNt4ozIYVFlYuKF5+xHEsfk7b0quVeu/DFk+/QXrhgY=; b=PANIW9L4MqCwQesyS0cSrdQZpQ
	jy7w6oLKSt0NpN0GzipIT864u3E1+XKWMO/GdzFrv3d/qyssBQpUuYobRCHr3iV+SXhhBFGTsABes
	F2xilkbdnsjaZPJ2RBIMKdzjlo9vxKkMJYTtRtwDQB0wyqxSmkdTKkD5hKsNmwNi0RaM=;
Message-ID: <d388b32b-af07-279b-82af-a961c60f8c50@xen.org>
Date: Thu, 5 Oct 2023 23:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 henry.wang@arm.com
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [CRITICAL for 4.18] Re: [PATCH v5 00/10] runstate/time area
 registration by (guest) physical address
In-Reply-To: <ff8994eb-968d-4bbb-a960-e5ca78ef658e@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 05/10/2023 19:58, Andrew Cooper wrote:
> I see this series has been committed.  But it's broken in a really
> fundamental way.

Thanks for pointing out. But I'd like to understand how I come to only 
hear about those concerns on the series after committing. Did I miss any 
thread? Even if this series has been pending for over 6 months, should 
have I waited longer before committing?

Furthermore, Jan pointed out that this series was discussed recently 
during the x86 meeting. Did you raise any concern during the call and 
they were not carried on the ML?

> This is a new extension with persistent side effects to an existing part
> of the guest ABI.
> 
> Yet there doesn't appear to be any enumeration that the interface is
> available to begin with.  Requiring the guest to probe subops, and
> having no way to disable it on a per-domain basis is unacceptable, and
> has exploded on us more times than I care to count in security fixes
> alone, and that doesn't even cover the issues Amazon have reported over
> the years.

Indeed. But, AFAIR, all those patches got stuck because of diverging 
opinions between you and you. Can we finally come to an agreement on how 
to disable/expose a new hypercall/feature so we can move on?

> 
> Henry: Blocker for 4.18.   The absolutely bare minimum necessary to
> avoid reversion is some kind of positive enumeration that the two new
> hypercalls are available.

So to clarify, you would like both an interface for the guest and the 
toolstack for 4.18. Is this correct?

> 
> Otherwise I will be #if 0'ing out the new hypercalls before this ABI
> mistake gets set in stone.
> 
> 
> If this were x86-only it would need to be a CPUID flag, but it will need
> to be something arch-agnostic in this case. 

I think we can add two new flags in XENVER_get_features to indicate to 
the guest that the feature is supported. What do you think?

> The series should not have
> come without a proper per-domain control and toolstack integration,

I think this requirement should be written down in a document we can use 
for future reference and not expect people to remember what may have 
been said on the ML for previous hypercall addition.

Cheers,

-- 
Julien Grall

