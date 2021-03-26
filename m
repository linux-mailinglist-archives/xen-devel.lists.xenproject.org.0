Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29C434A6F4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101761.194807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlMn-0005Ct-9i; Fri, 26 Mar 2021 12:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101761.194807; Fri, 26 Mar 2021 12:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlMn-0005CU-6M; Fri, 26 Mar 2021 12:15:05 +0000
Received: by outflank-mailman (input) for mailman id 101761;
 Fri, 26 Mar 2021 12:15:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPlMm-0005CP-2c
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:15:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPlMh-0006Jd-Um; Fri, 26 Mar 2021 12:14:59 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPlMh-0001Ya-Ky; Fri, 26 Mar 2021 12:14:59 +0000
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
	bh=7/dDvDLr/niqO0+2gQPe1FkOyq1Z3qKc2VWN3Vh8fKc=; b=v1knQatRJgew/fK6/1s791bo4F
	llk9YnqRIqSKvnoy/9ayapsrLSdUBFnQbcHh5XYiCyRr2Ypn7DtWn/RpFuWWOTzxinE8d35sIlF5I
	BSJLTRGdvCCTTDik6+n+z6s1T0uU98z5p8Sk9r9CsAE7R+IHpFvomR/+zzY7ClkuxA14=;
Subject: Re: [PATCH for-4.15?] docs/design: Update xenstore-migration.md
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 raphning@gmail.com, edvin.torok@citrix.com, jgross@suse.com
References: <20210325111255.16330-1-julien@xen.org>
 <24669.52811.830365.356741@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e2e94f0f-3012-8771-5edf-c9d02da88244@xen.org>
Date: Fri, 26 Mar 2021 12:14:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24669.52811.830365.356741@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 26/03/2021 12:06, Ian Jackson wrote:
> Julien Grall writes ("[PATCH for-4.15?] docs/design: Update xenstore-migration.md"):
>> From: Julien Grall <jgrall@amazon.com>
>>
>> It is not very clear the shared page adddress is not contained in the
>> connection record. Additionally, it is misleading to say the grant
>> will always point to the share paged as a domain is free to revoke the
>> permission. The restore code would need to make sure it doesn't
>> fail/crash if this is happening.
>>
>> The sentence is now replaced with a paragraph explaining why the GFN is
>> not preserved and that the grant is not guarantee to exist during
>> restore.
>>
>> Take the opportunity to replace "code" with "node" when description the
>> permission.
>>
>> Reported-by: Raphael Ning <raphning@amazon.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks! I have committed the patch to staging and cherry-pick in 
staging-4.15.

Cheers,

-- 
Julien Grall

