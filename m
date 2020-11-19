Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5F2B8FA4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 11:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30539.60629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgj7-00050g-OW; Thu, 19 Nov 2020 09:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30539.60629; Thu, 19 Nov 2020 09:59:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgj7-00050H-LP; Thu, 19 Nov 2020 09:59:41 +0000
Received: by outflank-mailman (input) for mailman id 30539;
 Thu, 19 Nov 2020 09:59:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfgj5-0004zf-TV
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:59:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f672350a-6ef8-49f5-bbf2-cb3d094f02ce;
 Thu, 19 Nov 2020 09:59:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 779B6AC22;
 Thu, 19 Nov 2020 09:59:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfgj5-0004zf-TV
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:59:39 +0000
X-Inumbo-ID: f672350a-6ef8-49f5-bbf2-cb3d094f02ce
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f672350a-6ef8-49f5-bbf2-cb3d094f02ce;
	Thu, 19 Nov 2020 09:59:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605779977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zGxGRRS5LRoHwz+VuxMJXFTK1Rm1o8gu0of3w4kqWYo=;
	b=KGaCh5obVLj4E7wCP1ldlHW52amRpgB/ipA/T3yKkVx92O1vGzDYtWhsek9DWBywlU7zZe
	9hs3GeH8eL0/gq1V2TWG2Wnmp2t2++CnfYz8DmJRHWmHLLmSaq4w9TulrJqWtsurF1fAyQ
	bIPm0FnMMz9EJ4nrqytxeSa94FltM/U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 779B6AC22;
	Thu, 19 Nov 2020 09:59:37 +0000 (UTC)
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201022143905.11032-1-jgross@suse.com>
 <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com>
 <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com>
 <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>
 <8c77ff71-a14e-7cf7-5f27-c7c152ace240@suse.com>
 <3e2132c9-2ab3-7bfb-656b-2cab58a53342@suse.com>
 <alpine.DEB.2.21.2011121332250.20906@sstabellini-ThinkPad-T480s>
 <383f2f1f-96c1-1634-519f-3526019f4f48@suse.com>
 <4dda402d-62de-cce5-c205-12f4d13ec623@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc917a93-a7d8-ba6e-091d-1ea4faac4173@suse.com>
Date: Thu, 19 Nov 2020 10:59:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <4dda402d-62de-cce5-c205-12f4d13ec623@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.11.2020 17:46, Julien Grall wrote:
> On 13/11/2020 05:18, Jürgen Groß wrote:
>> On 12.11.20 22:38, Stefano Stabellini wrote:
>>> On Thu, 12 Nov 2020, Jan Beulich wrote:
>>>> On 12.11.2020 13:50, Jürgen Groß wrote:
>>>>> Any further comments, or even better, Acks?
>>>>
>>>> To be honest I'd prefer to have at least one of the people Cc-ed
>>>> minimally indicate they consider this a good idea. No need for a
>>>> close review or such, just a basic opinion. Anyone?
>>>
>>> I see Jan's point that it is not clear how much this is going to help in
>>> production. However, it is not going to hurt either, and I have been
>>> told a few times recently that debugging Xen is not easy. Anything that
>>> helps in that regard would be good. So I think this patch would be an
>>> improvement.
>>>
>>
>> This patch is an effort to get better diagnostic data in case of
>> Xen crashes from our largest customer, so clearly intended for
>> production use.
>>
> 
> I agree with this statement. When you get a crash from Xen in 
> production, it can be useful to get as much information as possible 
> dumped. Some of the information printed by the debugkeys cannot be 
> retrieved from a crashkernel.

So, Jürgen, my request was satisfied, so all that's needed is, I
suppose, a re-submission with the few smaller items addressed.

Jan

