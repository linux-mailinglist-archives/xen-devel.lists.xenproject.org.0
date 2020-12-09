Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC612D44D8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:54:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48370.85524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0rb-0002ai-RE; Wed, 09 Dec 2020 14:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48370.85524; Wed, 09 Dec 2020 14:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0rb-0002aJ-NK; Wed, 09 Dec 2020 14:54:43 +0000
Received: by outflank-mailman (input) for mailman id 48370;
 Wed, 09 Dec 2020 14:54:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uDNN=FN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kn0rZ-0002aE-Jw
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:54:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81454537-124c-4819-8110-54e1814c0d24;
 Wed, 09 Dec 2020 14:54:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E93C9AC9A;
 Wed,  9 Dec 2020 14:54:39 +0000 (UTC)
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
X-Inumbo-ID: 81454537-124c-4819-8110-54e1814c0d24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607525680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54RpgZ26Znpuu9TFmjXOPDEZrFmM1w24OJPQ2n8VQos=;
	b=LOSP5q+dfr+rDc6L5FUZSFdGKYx5duJZqAwzpB6AM8hWkSQL5N0p8Jgi/uH8N6iPTndLWP
	Hs1Dk41ZaMO60tmN5+OKGbqooi+xC0XwaAxII5RrVVBCbY4fbWyCFkaJPqlrUQGpQSQCH+
	okGhttERwtCrV+rg/Ln3i31fFYTnUoY=
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
 <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
 <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
 <59a4e1c1-ea39-1846-92ae-92560db4b1fb@xen.org>
 <e0782c3b-9958-3792-eab9-d3fd6708225f@suse.com>
 <5fc44865-2115-947c-bd22-b51d7f17d39c@xen.org>
 <689373AE-AF16-429F-818C-0467485E5748@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80ee54b1-5fd1-2aa8-606f-279c4b81a7ad@suse.com>
Date: Wed, 9 Dec 2020 15:54:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <689373AE-AF16-429F-818C-0467485E5748@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 15:27, Bertrand Marquis wrote:
>> On 9 Dec 2020, at 09:41, Julien Grall <julien@xen.org> wrote:
>> On 07/12/2020 10:23, Jan Beulich wrote:
>>> On 24.11.2020 17:57, Julien Grall wrote:
>>>> On 24/11/2020 00:40, Andrew Cooper wrote:
>>>>> On a totally separate point,  I wonder if we'd be better off compiling
>>>>> with -fgnu89-inline because I can't see any case we're we'd want the C99
>>>>> inline semantics anywhere in Xen.
>>>>
>>>> This was one of my point above. It feels that if we want to use the
>>>> behavior in Xen, then it should be everywhere rather than just this helper.
>>> I'll be committing the series up to patch 6 in a minute. It remains
>>> unclear to me whether your responses on this sub-thread are meant
>>> to be an objection, or just a comment. Andrew gave his R-b despite
>>> this separate consideration, and I now also have an ack from Wei
>>> for the entire series. Please clarify.
>>
>> It still feels strange to apply to one function and not the others... But I don't have a strong objection against the idea of using C99 inlines in Xen.
>>
>> IOW, I will neither Ack nor NAck this patch.
> 
> I think as Julien here: why doing this inline thing for this function and not the others
> provided by the library ?
> Could you explain the reasons for this or the use cases you expect ?
> 
> I see 2 usage of bsearch in arm code and I do not get why you are doing this for
> bsearch and not for the other functions.

May I ask whether you read Andrew's quite exhaustive reply to Julien
asking about this? Apart from this, it was Andrew who had asked to
inline bsearch(), and I followed that request. The initial version
of this series didn't have any inlining of these library functions
(which, after all, also isn't the goal of the series).

Jan

