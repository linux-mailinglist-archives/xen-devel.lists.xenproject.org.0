Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9A3669FE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 13:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114436.218088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZBCs-0008Cm-Uq; Wed, 21 Apr 2021 11:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114436.218088; Wed, 21 Apr 2021 11:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZBCs-0008CN-Ra; Wed, 21 Apr 2021 11:39:46 +0000
Received: by outflank-mailman (input) for mailman id 114436;
 Wed, 21 Apr 2021 11:39:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZBCr-0008CI-7g
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 11:39:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40a5b561-d373-4336-bebb-401d93ce0d82;
 Wed, 21 Apr 2021 11:39:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5AC3AF1E;
 Wed, 21 Apr 2021 11:39:42 +0000 (UTC)
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
X-Inumbo-ID: 40a5b561-d373-4336-bebb-401d93ce0d82
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619005182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImvxREUdGnlNVdtXxxEQIaXxRab3C6iMtTwjV8onVq4=;
	b=l/PSTZRygk6DVwGCBA/JWQkdBnCt1TSyNjeBUOe+zNvFUJPfJwE3UtsTSJ6yERsDevS+ce
	8DMCsU/XZUL9pVoVe2EA7hZ+i0ASAy6naNOTRFy4FeBw3d7wCf6e7TcS7jPfzuW5VMVFxJ
	Q71G0JypEmBL+oIl80zMPHCLKFKRkB4=
Subject: Re: [PATCH v9 01/13] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1617706782.git.hongyxia@amazon.com>
 <b70cc7c0854a6a25b00624b5fa83684a20916ca3.1617706782.git.hongyxia@amazon.com>
 <fbc4a42f-549b-515f-279f-92466f89af79@suse.com>
 <2ceae314e9e634ef7e9bebf7f64653f25fa97dd6.camel@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd5ccad0-d0ec-ccfc-eced-1a7b05071643@suse.com>
Date: Wed, 21 Apr 2021 13:39:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2ceae314e9e634ef7e9bebf7f64653f25fa97dd6.camel@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 13:33, Hongyan Xia wrote:
> On Tue, 2021-04-20 at 14:17 +0200, Jan Beulich wrote:
>> On 06.04.2021 13:05, Hongyan Xia wrote:
>>> @@ -5305,6 +5339,8 @@ int map_pages_to_xen(
>>>                  pl1e = virt_to_xen_l1e(virt);
>>>                  if ( pl1e == NULL )
>>>                      goto out;
>>> +
>>> +                UNMAP_DOMAIN_PAGE(pl1e);
>>>              }
>>
>> Unmapping the page right after mapping it looks suspicious. I see
>> that
>> further down we have
>>
>>             pl1e  = l2e_to_l1e(*pl2e) + l1_table_offset(virt);
>>
>> but don't you need to also change that? Actually, you do in patch 2,
>> but the latest then the double mapping should imo be avoided.
> 
> I would say the code was already suspicious to begin with, since pl1e
> would be overwritten immediately below even before this patch. The
> purpose of the virt_to_xen_l1e() is only to populate the L1 table.
> 
> Performance-wise the double map should be pretty harmless since the
> mapping is in the cache, so I actually prefer it as is. Alternatively,
> I can initialise pl1e to NULL at the beginning of the block and only do
> the
> 
> pl1e  = l2e_to_l1e(*pl2e) + l1_table_offset(virt);
> 
> when the pl1e is still NULL. If you are okay I will go with this.

I'd prefer this alternative, indeed, as it'll make the overall
code look less odd. Albeit maybe not here, but in the subsequent
patch.

Jan

