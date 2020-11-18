Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289C2B8221
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 17:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30126.59892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQbi-00041r-AK; Wed, 18 Nov 2020 16:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30126.59892; Wed, 18 Nov 2020 16:46:58 +0000
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
	id 1kfQbi-00041S-72; Wed, 18 Nov 2020 16:46:58 +0000
Received: by outflank-mailman (input) for mailman id 30126;
 Wed, 18 Nov 2020 16:46:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfQbh-00041N-2U
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:46:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfQbg-0005yC-7e; Wed, 18 Nov 2020 16:46:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfQbg-0006Xf-0h; Wed, 18 Nov 2020 16:46:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQbh-00041N-2U
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=782+a74npD7n9sMy3z9W+cUZeDuA7R91709ruM3+gfA=; b=f8ILJmigIoa9dJhwSJXWsRHOb/
	GftHAUaf9J2H+fKZVf9+9P7PmefitwNQTgIcXqemQP65+wmt559JIUbg98fy7/GLsJOJ4MRVCpKtx
	K1Ct/yVXgJsWi/kHeH4xhlf5OjWVSXlnZRocNa6obEGiAaj/PvADn0QeT/e6QF7HSoLY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQbg-0005yC-7e; Wed, 18 Nov 2020 16:46:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQbg-0006Xf-0h; Wed, 18 Nov 2020 16:46:56 +0000
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201022143905.11032-1-jgross@suse.com>
 <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com>
 <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com>
 <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>
 <8c77ff71-a14e-7cf7-5f27-c7c152ace240@suse.com>
 <3e2132c9-2ab3-7bfb-656b-2cab58a53342@suse.com>
 <alpine.DEB.2.21.2011121332250.20906@sstabellini-ThinkPad-T480s>
 <383f2f1f-96c1-1634-519f-3526019f4f48@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4dda402d-62de-cce5-c205-12f4d13ec623@xen.org>
Date: Wed, 18 Nov 2020 16:46:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <383f2f1f-96c1-1634-519f-3526019f4f48@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 13/11/2020 05:18, Jürgen Groß wrote:
> On 12.11.20 22:38, Stefano Stabellini wrote:
>> On Thu, 12 Nov 2020, Jan Beulich wrote:
>>> On 12.11.2020 13:50, Jürgen Groß wrote:
>>>> Any further comments, or even better, Acks?
>>>
>>> To be honest I'd prefer to have at least one of the people Cc-ed
>>> minimally indicate they consider this a good idea. No need for a
>>> close review or such, just a basic opinion. Anyone?
>>
>> I see Jan's point that it is not clear how much this is going to help in
>> production. However, it is not going to hurt either, and I have been
>> told a few times recently that debugging Xen is not easy. Anything that
>> helps in that regard would be good. So I think this patch would be an
>> improvement.
>>
> 
> This patch is an effort to get better diagnostic data in case of
> Xen crashes from our largest customer, so clearly intended for
> production use.
>

I agree with this statement. When you get a crash from Xen in 
production, it can be useful to get as much information as possible 
dumped. Some of the information printed by the debugkeys cannot be 
retrieved from a crashkernel.

Cheers,

-- 
Julien Grall

