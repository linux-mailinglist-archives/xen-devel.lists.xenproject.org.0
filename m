Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031427AAB74
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 10:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606749.944765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjb9q-0001VQ-S2; Fri, 22 Sep 2023 08:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606749.944765; Fri, 22 Sep 2023 08:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjb9q-0001T5-PE; Fri, 22 Sep 2023 08:05:02 +0000
Received: by outflank-mailman (input) for mailman id 606749;
 Fri, 22 Sep 2023 08:05:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qjb9p-0001Sz-GT
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 08:05:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qjb9n-0002Od-88; Fri, 22 Sep 2023 08:04:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qjb9n-0004AI-3N; Fri, 22 Sep 2023 08:04:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=zLuQZvBCceaDQGq+PCwg7/GgVwpTwHgAXBHZTSeZsyk=; b=Cx8X2BJQj6rEZ5ZnQ8PZs/iP0g
	ZHx3mD7QbnSG6YlhDvKwgwaEjljbw6+Pzmeqltp+6+Rqe2wvZK6p+YiOeS9+3LF2gU/Flpa52Qf06
	6iuuWU0MgOA+QGjX0wfEsmYUZMt3eM+EqW+YEZeUqDGqFjUNZz448646tqUkQZarvqSE=;
Message-ID: <b44e2c2b-d4e3-4c04-90f6-b32a0d96920e@xen.org>
Date: Fri, 22 Sep 2023 09:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] console/serial: bump buffer from 16K to 128K
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230919125118.12657-1-roger.pau@citrix.com>
 <46b0b9e0-29b2-d526-d32f-d03415e621fb@suse.com>
 <ZQms01Wq62yMzGDg@MacBookPdeRoger>
 <3d5d4e74-5e3e-bdd5-a37f-c4dc9f418ab3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3d5d4e74-5e3e-bdd5-a37f-c4dc9f418ab3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 19/09/2023 15:26, Jan Beulich wrote:
> On 19.09.2023 16:14, Roger Pau Monné wrote:
>> On Tue, Sep 19, 2023 at 03:06:45PM +0200, Jan Beulich wrote:
>>> On 19.09.2023 14:51, Roger Pau Monne wrote:
>>>> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
>>>> being filled halfway during dom0 boot, and thus a non-trivial chunk of
>>>> Linux boot messages are dropped.
>>>>
>>>> Increasing the buffer to 128K does fix the issue and Linux boot
>>>> messages are no longer dropped.  There's no justification either on
>>>> why 16K was chosen, and hence bumping to 128K in order to cope with
>>>> current systems generating output faster does seem appropriate to have
>>>> a better user experience with the provided defaults.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> --
>>>> Changes since v2:
>>>>   - Bump to 128K.
>>>
>>> Wow, I was hesitant about 32k, and now we're going all the way up to 128?
>>> Even the recent report indicated 24k would be fine there ...
>>
>> 24k would be rounded to 32k anyway.
>>
>> I don't think 32k vs 128k makes that much difference, it's still an
>> infinitesimal part of the memory on any modern computer.  Simply the
>> risk of loosing output is IMO not worth us being conservative with
>> the amount here, specially if we are speaking about KiB, not even MiB.
> 
> Well, I've voiced my view on the underlying principle of this before. I
> don't mean to block the increase, but I wanted to express that when I
> was halfway okay with 32k, I find 128k excessive.

As discussed in [1], I have changed back the size fo 32K and committed 
patch.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/55d92655-6fd8-430a-8b16-3f56693def9c@xen.org/ 


> 
> Jan

-- 
Julien Grall

