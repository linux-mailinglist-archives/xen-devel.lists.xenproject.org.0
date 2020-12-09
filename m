Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0D92D3D36
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 09:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48025.84950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmuiw-0002v7-CY; Wed, 09 Dec 2020 08:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48025.84950; Wed, 09 Dec 2020 08:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmuiw-0002ui-9d; Wed, 09 Dec 2020 08:21:22 +0000
Received: by outflank-mailman (input) for mailman id 48025;
 Wed, 09 Dec 2020 08:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uDNN=FN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmuiv-0002ud-Cq
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 08:21:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a50152d-9972-4d03-8093-91d06f3869d7;
 Wed, 09 Dec 2020 08:21:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08D66AC94;
 Wed,  9 Dec 2020 08:21:19 +0000 (UTC)
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
X-Inumbo-ID: 4a50152d-9972-4d03-8093-91d06f3869d7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607502079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BR6OrlxOK2RJx/adT+RYdSKkeSPh4Laeq9svf64qL4g=;
	b=LmlvQZfMK5mvaPD0MltX3k9qTurzaUI0cza4yMWsgkB6oLg1qF39uszypauhZHBJCM+pSG
	u9HbpPyPtTmVnqzuAi2uE/ynpkFsEsKf034mWLUN3FT5Zw4V30OaxYKoTmVi01FvL8oROB
	dXTKTNL3RGni8Tubr+wKRMwqhlsKdKA=
Subject: Re: [PATCH V3 20/23] xen/ioreq: Make x86's send_invalidate_req()
 common
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-21-git-send-email-olekstysh@gmail.com>
 <acb09993-40fc-2ab0-21b9-5dbe2f061554@suse.com>
 <efbac31b-1a9d-da16-ef60-372f10451f8e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <545e71ec-7168-3a45-3c21-82d839481d03@suse.com>
Date: Wed, 9 Dec 2020 09:21:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <efbac31b-1a9d-da16-ef60-372f10451f8e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.12.2020 17:49, Oleksandr wrote:
> On 08.12.20 17:24, Jan Beulich wrote:
>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -552,6 +552,8 @@ struct domain
>>>           struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
>>>           unsigned int            nr_servers;
>>>       } ioreq_server;
>>> +
>>> +    bool mapcache_invalidate;
>>>   #endif
>>>   };
>> While I can see reasons to put this inside the #ifdef here, I
>> would suspect putting it in the hole next to the group of 5
>> bools further up would be more efficient.
> 
> ok, will put (although it will increase the number of #ifdef)

I was implying no #ifdef in this case, suitably justified by half
a sentence in the patch description.

Jan

