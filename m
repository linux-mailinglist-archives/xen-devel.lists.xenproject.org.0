Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38E325F86
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 09:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90136.170517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYwF-0006IG-TZ; Fri, 26 Feb 2021 08:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90136.170517; Fri, 26 Feb 2021 08:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYwF-0006Hu-QT; Fri, 26 Feb 2021 08:57:31 +0000
Received: by outflank-mailman (input) for mailman id 90136;
 Fri, 26 Feb 2021 08:57:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFYwE-0006Hp-Eq
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 08:57:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFYwC-0007nx-3p; Fri, 26 Feb 2021 08:57:28 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFYwB-0007tI-Ow; Fri, 26 Feb 2021 08:57:27 +0000
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
	bh=bfSRLRQrbGKnSidBkvM8jJR/POW5DzFBzZ5BkdttpWg=; b=cI29TdAIqO++Gz3Ro4q4Nsr658
	wXvmSacLrROH6ueKMU0JjiaPbL7AIH7TMtKM00LfHF6IPiYOb7/UMYkz9KvzBD2ZD6a9yMBRCLbbP
	TcRwMG+W1jc/6Yyv7f2+X1IzwRam9+1+M7bgDGqsF2bkVLN0Sls5rIaAB3Vt2STy79p0=;
Subject: Re: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using
 xs_state_* structures
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 "Manthey, Norbert" <nmanthey@amazon.de>
References: <20210225174131.10115-1-julien@xen.org>
 <20210225174131.10115-6-julien@xen.org>
 <0aa89914-8fae-3731-a5a0-ccf4316ce96b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <37e219e6-a66b-383d-2a60-b61fdd1d66a8@xen.org>
Date: Fri, 26 Feb 2021 08:57:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0aa89914-8fae-3731-a5a0-ccf4316ce96b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 26/02/2021 07:10, Jürgen Groß wrote:
> On 25.02.21 18:41, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Coverity will report unitialized values for every use of xs_state_*
>> structures in the save part. This can be prevented by using the [0]
>> rather than [] to define variable length array.
>>
>> Coverity-ID: 1472398
>> Coverity-ID: 1472397
>> Coverity-ID: 1472396
>> Coverity-ID: 1472395
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Sorry, but Coverity is clearly wrong here.
I saw what Andrew wrote but neither of you really provided enough 
information to infer the same. Care to provide more details?

> 
> Should we really modify our code to work around bugs in external
> static code analyzers?

I don't think it is OK to have 866 issues (and counting) and keep 
ignoring them because Coverity may be wrong. We should fix them one way 
or another. If this means telling Coverity they are reporting false 
positive, then fine.

But for that, I first needs a bit more details why they are clearly wrong.

Cheers,

-- 
Julien Grall

