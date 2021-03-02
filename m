Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D6A32991C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 11:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92238.174037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1sy-000834-Qw; Tue, 02 Mar 2021 10:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92238.174037; Tue, 02 Mar 2021 10:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1sy-00082i-NR; Tue, 02 Mar 2021 10:04:12 +0000
Received: by outflank-mailman (input) for mailman id 92238;
 Tue, 02 Mar 2021 10:04:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lH1sx-00082c-3s
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 10:04:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lH1sv-00026P-GI; Tue, 02 Mar 2021 10:04:09 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lH1sv-0000s8-49; Tue, 02 Mar 2021 10:04:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=eMlQRcsvHQkCMZvlA+s3Z/ToSY7JnS2YblrzhoWsYk0=; b=FzPSEG1HmvHrRFmBnPCqSMbYpR
	uIqHBdKqW90WgMw48rPpGKUpFpSPTF2bUCqQoJbYj6CB34CUNqoWhZ9T6jQ1xxFJwA8lbVsJGFSzX
	r5wYvs5PIDUpo19f5yGLUSFnCBVOuCZLyEkud5jAe0wTLoSOZcuP0ckOrAsbA2ZRdmYA=;
Subject: Re: [for-4.15] Re: [PATCH XENSTORE v1 00/10] Code analysis fixes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>,
 Michael Kurth <mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <759336de-727b-db67-b082-709d5ee735f8@xen.org>
 <144f2b06-d563-a699-8481-48b6787d502a@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ef77f63-85d1-c4cf-be45-828668ae272e@xen.org>
Date: Tue, 2 Mar 2021 10:04:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <144f2b06-d563-a699-8481-48b6787d502a@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 01/03/2021 19:39, Andrew Cooper wrote:
> On 01/03/2021 18:01, Julien Grall wrote:
>> Hi,
>>
>> I have tagged the e-mail with 4.15 as I think we likely want some of
>> the patches to be in the next release.
>>
>> As a minimum, we get the following:
>>    - patch #7: xenstore: handle do_mkdir and do_rm failure
>>    - patch #8: xenstore: add missing NULL check
>>    - patch #10: xs: add error handling
>>
>> The first two add missing NULL check in runtime code in XenStored. The
>> 3rd one adds a missing NULL check in xs_is_domain_introduced() in
>> libxenstore (can be used at runtime by xenpaging at least).
>>
>> In addition to that, I would like to consider patch #3: xenstore:
>> check formats of trace. It is allowing the compiler to check the
>> format printf for trace(). This should be low-risk.
>>
>> For the rest is a mix of silencing coverity and potential errors
>> either at init or in a standalone binaries.
>>
>> The init ones would be useful (patch #1, #5, #9) for Xenstored
>> LiveUpdate as they would be potential triggered when upgrading the
>> binary. But I am not sure whether we consider LiveUpdate supported.
>>
>> Any thoughts?
> 
> Live Update is a headline feature, even if only tech preview.

I thought it was a tech preview but I couldn't find the statement in 
SUPPORT.MD. I guess we should update it before 4.15 is released.

> 
> I'd say that all bugfixes are fair game, and low risk.  All these fixes
> (other than the evtchn one which has an outstanding question) look to be
> reasonable to take.  They're all simple and obvious fixes pointed out by
> static analysis.

That's a fair point. I wanted to set an order as I know the rules are 
getting tighter. So this gives an opportunity to Ian to have enough data 
to decide what's the best.

Cheers,

-- 
Julien Grall

