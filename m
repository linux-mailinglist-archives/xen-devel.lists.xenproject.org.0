Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B4341EF0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 15:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99314.188826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFiS-0004WA-9e; Fri, 19 Mar 2021 14:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99314.188826; Fri, 19 Mar 2021 14:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFiS-0004Vk-5Q; Fri, 19 Mar 2021 14:03:04 +0000
Received: by outflank-mailman (input) for mailman id 99314;
 Fri, 19 Mar 2021 14:03:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai2o=IR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lNFiQ-0004Vf-Hz
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 14:03:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3c768c4-b6d7-473e-b4ce-7714ab5c9ee8;
 Fri, 19 Mar 2021 14:03:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DE1EAC82;
 Fri, 19 Mar 2021 14:03:00 +0000 (UTC)
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
X-Inumbo-ID: f3c768c4-b6d7-473e-b4ce-7714ab5c9ee8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616162580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kxRpz34eIfKrBnmxFIyqyhHx/CTSSR6OFZGUuhBmH58=;
	b=oSJU2wyw5db8L8FWtooshWlH7dZFHsnr0/CJc5nJ2894Wd/iPs3dvr2F4joxwl9omsIJm3
	c+I028cD+kiM9+QsBZKdMO6YHBWrxw43SNy8L7IRgH0pbPalhisBJnvCvUPFliLifKr5Yl
	a5Z+Z81GH3kFrgzProeXJKRCi66r4S4=
Subject: Re: preparations for 4.13.3
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <7b3a06af-103a-db05-b494-94f5a1081bc7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0446475-d9ca-bade-49e1-bd34d921e131@suse.com>
Date: Fri, 19 Mar 2021 15:02:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7b3a06af-103a-db05-b494-94f5a1081bc7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.03.2021 12:44, Andrew Cooper wrote:
> On 08/03/2021 09:49, Jan Beulich wrote:
>> the release is overdue (my apologies). Please point out backports
>> you find missing from the respective staging branches, but which
>> you consider relevant.
>>
>> Ones that I have queued already, but which hadn't passed the push
>> gate to master yet when doing a swipe late last week, are
>>
>> c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
>> 9318fdf757ec x86/shadow: suppress "fast fault path" optimization without reserved bits
>> 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when running virtualized
> 
> fe36a173d110 - x86/amd: Initial support for Fam19h processors
> 90b014a6e6ec - x86/ucode/amd: Fix microcode payload size for Fam19
> processors

For the latter one, didn't you indicate to me elsewhere that there
was still some uncertainty about the value?

Jan

