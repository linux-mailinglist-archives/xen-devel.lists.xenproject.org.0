Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEF03088A0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78083.141888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SLo-0001hI-Co; Fri, 29 Jan 2021 11:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78083.141888; Fri, 29 Jan 2021 11:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SLo-0001gt-9P; Fri, 29 Jan 2021 11:54:08 +0000
Received: by outflank-mailman (input) for mailman id 78083;
 Fri, 29 Jan 2021 11:54:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5SLn-0001gn-7a
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:54:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c5f0266-0665-4e04-b72c-962b9ed9bc33;
 Fri, 29 Jan 2021 11:54:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B9CEAC41;
 Fri, 29 Jan 2021 11:54:05 +0000 (UTC)
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
X-Inumbo-ID: 1c5f0266-0665-4e04-b72c-962b9ed9bc33
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611921245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ec1DMNHbmhVwXoayVlB/pPxRh33E9OT78ty0+eZTnDY=;
	b=HFOJcy/k5OB7J1ERiHqfrerbYZxl9SxVh9E5DIAL6WTr9gIZxhNN9y58zSHNT9GHoESYTl
	OU1tgCPLfVS5wW2Qr8RwUJ3ama1Teio0QiyFZZheqmQ1Dsia5gSFVFZEaGz6ecv9++5xlM
	5XQh+ZvPtC+T5QFX8wb1LctzYKsdutc=
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
 <2d98fd45-a88a-a198-a42d-393a713e1d54@xen.org>
 <433f8d5c-f66f-874e-e08e-83427f9f2a29@suse.com>
 <3fb55faa-8d05-cb8f-f567-4e099347b3e6@gmail.com>
 <e9e9eabc-3925-c402-b7e2-1412b5b6ca8a@suse.com>
 <63d005ce-0993-e604-7b06-fc6603995152@xen.org>
 <4da02c52-1866-6eaa-415b-ddd374edc9d9@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <645c998c-8a63-7f65-1de1-2c9000da4d69@suse.com>
Date: Fri, 29 Jan 2021 12:54:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4da02c52-1866-6eaa-415b-ddd374edc9d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 12:37, Oleksandr wrote:
> I am wondering do we need to update support.md in the context of IOREQ 
> status on Arm right now or this could be postponed?

I think so, yes. I have to admit I didn't even realize the whole
series doesn't make an addition there. I think this wants to be
part of this patch here, as without it the code can't be enabled
(and hence can't be used, and hence its support status really
doesn't matter [yet]).

Jan

