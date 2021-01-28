Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632E30731B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 10:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76828.138782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l53vb-00078w-TB; Thu, 28 Jan 2021 09:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76828.138782; Thu, 28 Jan 2021 09:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l53vb-00078X-Q0; Thu, 28 Jan 2021 09:49:27 +0000
Received: by outflank-mailman (input) for mailman id 76828;
 Thu, 28 Jan 2021 09:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l53va-000788-Oz
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 09:49:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1cfc26c-ba20-4c18-97c5-1c7b0f372867;
 Thu, 28 Jan 2021 09:49:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CC33ACF5;
 Thu, 28 Jan 2021 09:49:24 +0000 (UTC)
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
X-Inumbo-ID: d1cfc26c-ba20-4c18-97c5-1c7b0f372867
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611827364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R54io76u7oxvFiBE/vZUZtKWQAwmkEGG86X15absmFE=;
	b=Df3YKdbgV/F9o7c7uv0tAA9+dOGUAmKlW48m+SDGiiNmWCgDrZAZE0jhuoP7SCYcAHfxrO
	MH7QaMfkjzVJYtsjh4Zk+qt8xxYseH9DVspbrtOIBnVHIEn0FbxjihclcrF4hT29s0evqK
	4rE8jsvp4Qdczpl2fjalO8gmFq6hsqA=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
From: Jan Beulich <jbeulich@suse.com>
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com>
 <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
 <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
 <CANyqHYeDR_NUKzPtbfLiUzxAUzerKepbU4B-_6=U-7Y6uy8gpQ@mail.gmail.com>
 <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com>
Message-ID: <8cf69fb3-5b8c-60ea-bd1c-39a0cbd5cb5c@suse.com>
Date: Thu, 28 Jan 2021 10:49:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.01.2021 10:47, Jan Beulich wrote:
> On 26.01.2021 14:03, Claudemir Todo Bom wrote:
>> If this information is good for more tests, please send the patch and
>> I will test it!
> 
> Here you go. For simplifying analysis it may be helpful if you
> could limit the number of CPUs in use, e.g. by "maxcpus=4" or
> at least "smt=0". Provided the problem still reproduces with
> such options, of course.

Speaking of command line options - it doesn't look like you have
told us what else you have on the Xen command line, and without
a serial log this isn't visible (e.g. in your video).

Jan

