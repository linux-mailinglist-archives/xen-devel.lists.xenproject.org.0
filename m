Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D180E8E1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 11:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652921.1019079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzma-0000fm-76; Tue, 12 Dec 2023 10:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652921.1019079; Tue, 12 Dec 2023 10:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzma-0000dR-3o; Tue, 12 Dec 2023 10:14:32 +0000
Received: by outflank-mailman (input) for mailman id 652921;
 Tue, 12 Dec 2023 10:14:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCzmZ-0000dJ-0v
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 10:14:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCzmY-0003sc-8X; Tue, 12 Dec 2023 10:14:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCzmY-0002Jo-3g; Tue, 12 Dec 2023 10:14:30 +0000
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
	bh=29YVA4/Km6ptBVNj9ZU3gF6r9P1oD6VIxLk0PU38pg4=; b=Kdl+BUshBUS52atQGfxHpAuOJw
	+jAFtsTpKvjTRTWGZ8AyGccYarTNDLzmU5Lu7jzj735gl2sFdnDVamw8pUGniAwJtyPx1aoja5zJS
	8OUn7nJ/M8WXE1YN1Vk5bfxwdOVf9g9/uABCRChjmyyvMrvOUTDH39Zi5ZgWV80m+QbY=;
Message-ID: <b16c7e30-25ee-4dee-8928-45e8d2f9127e@xen.org>
Date: Tue, 12 Dec 2023 10:14:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenstored: potentially split trace_io() out message
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231123160834.17674-1-jgross@suse.com>
 <c5a72070-fb63-4c05-a34e-e5abcb781ea2@xen.org>
 <b300f3ac-cf83-4ba7-9c93-c78bec0b38d2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b300f3ac-cf83-4ba7-9c93-c78bec0b38d2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/12/2023 06:26, Juergen Gross wrote:
> On 11.12.23 20:11, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 23/11/2023 16:08, Juergen Gross wrote:
>>> Today write_messages() will call trace_io() after having written the
>>> complete message to the ring buffer or socket.
>>>
>>> In case the message can't be written in one go, split it by writing
>>> one trace entry when starting the write and one when finishing it.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> With one remark below:
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
>>> ---
>>> This patch is meant to go on top of the patch "tools/xenstored: remove
>>> \"-V\" command line option" in order to not lose any possible debug
>>> information.
>>> ---
>>>   tools/xenstored/core.c | 30 ++++++++++++++++++++----------
>>>   1 file changed, 20 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
>>> index 9046b200bc..a14b240ed9 100644
>>> --- a/tools/xenstored/core.c
>>> +++ b/tools/xenstored/core.c
>>> @@ -121,7 +121,7 @@ void trace(const char *fmt, ...)
>>>   static void trace_io(const struct connection *conn,
>>>                const struct buffered_data *data,
>>> -             int out)
>>> +             const char *type)
>>
>> This change seems somewhat unrelated. It would be worth mentioning it 
>> in the commit message.
>>
>> If you propose a new wording, I can update it while committing.
> 
> What about:
> 
> In order to distinguish a complete OUT message from a split one, let the
> caller of trace_io specify the prefix string ("IN", "OUT", "OUT(START)",
> "OUT(END)") directly instead via an int.

Ah... I spotted the "OUT(END)" but somehow I didn't make the connection 
with the update of trace_io() prototype.

It is now committed.

Cheers,

-- 
Julien Grall

