Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F341E7C31
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:46:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedSD-0005Wp-IC; Fri, 29 May 2020 11:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhMB=7L=amazon.com=prvs=411b2c4a0=jgrall@srs-us1.protection.inumbo.net>)
 id 1jedSC-0005Wk-1I
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:45:36 +0000
X-Inumbo-ID: e869ef98-a1a1-11ea-81bc-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e869ef98-a1a1-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 11:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1590752736; x=1622288736;
 h=to:cc:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding:subject;
 bh=YJW69XafmmZdb2y56tFRAS9Yp2quo8eccmETTgI+Pu4=;
 b=sF0wmP5OKtNasd/kxOebYzMxb8lvy+F5aiCvq4e+HNVWqUMSmhR9v3bO
 76Vn72ftWtmoBJ2Exx4FrdJYblBBk8N9Tr8Rh5yRrZSLB94gqJnNvP6MY
 OpRVola4HqX8LLxBqb1KX2Xuqo2Zsy/GeR5wJp6A3fQBadgG7hZS6EWRO I=;
IronPort-SDR: JO5/Nhh+pXWLYX2voKxgysP1m9Z6Vrk3Fd8Qabv3wa99V+nPeLMkikaoMAm21TMHmH6G7BFRHA
 5ZFLaEg7r7IQ==
X-IronPort-AV: E=Sophos;i="5.73,448,1583193600"; d="scan'208";a="39166308"
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 May 2020 11:45:34 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6B622C0830; Fri, 29 May 2020 11:45:32 +0000 (UTC)
Received: from EX13D03UEA001.ant.amazon.com (10.43.61.200) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 29 May 2020 11:45:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D03UEA001.ant.amazon.com (10.43.61.200) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 29 May 2020 11:45:31 +0000
Received: from a483e7b01a66.ant.amazon.com (10.1.212.33) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 29 May 2020 11:45:30 +0000
To: Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
 <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
 <f02f09ec-b643-8321-e235-ce0ee5526ab3@suse.com>
 <69deb8f4-bafe-734c-f6fa-de41ecf539d2@xen.org>
 <c38f4581-42a6-bb4a-1f84-066528edd3ee@xen.org>
 <aa209d94-2b39-7932-919b-9842f376e0dc@xen.org>
 <24259.62913.259268.987283@mariner.uk.xensource.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <2850386c-7669-5487-00ae-2f84794cd562@amazon.com>
Date: Fri, 29 May 2020 12:45:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <24259.62913.259268.987283@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

On 19/05/2020 16:05, Ian Jackson wrote:
> Hi.  My attention was drawn to this thread.
> 
> As I understand it, everyone is agreed that deduplicating the
> implementation is good (I also agree).  The debate is only between:

Thank you for stepping in!

> 
> 1. Put it in xen/ until an arch comes along that needs something
>    different, at which point maybe introduce an asm-generic-style
>    thing with default implementations.
> 
> 2. Say, now, that this is a default implementation and it should go in
>     asm-generic.
> 
> My starting point is that Julien, as the primary author of this
> cleanup, should be given leeway on a matter of taste like this.
> (There are as I understand it no wider implications.)
> 
> Also, ISTM that it can be argued that introducing a new abstraction is
> an additional piece of work.  Doing that is certainly not hampered by
> Julien's change.  So that would be another reason to take Julien's
> patch as-is.
> 
> On the merits, I don't have anything to add to the arguments already
> presented.  I am considerably more persuaded by Julien's arguments
> than Jan's.
> 
> So on all levels I think this commit should go in, unless there are
> other concerns that have not been discussed here ?
The major blocker is where the common header lives. The rest are small 
comments I should address in the next version.

I will send a new version (probably post freeze) to address those comments.

Cheers,

-- 
Julien Grall

