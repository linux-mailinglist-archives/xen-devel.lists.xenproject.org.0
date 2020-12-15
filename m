Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C582DADCB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 14:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54061.93591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpA7I-0003nb-97; Tue, 15 Dec 2020 13:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54061.93591; Tue, 15 Dec 2020 13:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpA7I-0003nE-5y; Tue, 15 Dec 2020 13:11:48 +0000
Received: by outflank-mailman (input) for mailman id 54061;
 Tue, 15 Dec 2020 13:11:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpA7H-0003n9-8A
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 13:11:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpA7C-0006qH-R2; Tue, 15 Dec 2020 13:11:42 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpA7C-0004a5-Hk; Tue, 15 Dec 2020 13:11:42 +0000
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
	bh=i6MKGm0InjprrS6tvbC8BguXeQwblFTvmDLB7gs1w5I=; b=X/a0hqmF/tEDUrf/E39Xotvrtl
	fR/iySN4mWyssZOooRWzd00te3IBjr+YEzry+qQQR1DjsThbdCVRHY/NTF+G6qirHksQUNaA+PadY
	U1hWmHR6uXgUa8jmrx940mgjk8o0alBhFaxhotvMwE+ftaSdHAERU7t50WigosHmwc80=;
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201215112610.1986-1-julien@xen.org>
 <c45407e5-3173-4f0d-453b-1a01969b667c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cbae7c17-829e-f48f-3a6a-7fee489711c2@xen.org>
Date: Tue, 15 Dec 2020 13:11:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c45407e5-3173-4f0d-453b-1a01969b667c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 15/12/2020 11:31, Jürgen Groß wrote:
> On 15.12.20 12:26, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> So far, our implementation of WARN_ON() cannot be used in the following
>> situation:
>>
>> if ( WARN_ON() )
>>      ...
>>
>> This is because the WARN_ON() doesn't return whether a warning. Such
> 
> ... warning has been triggered.

I will add it.

> 
>> construction can be handy to have if you have to print more information
>> and now the stack track.
> 
> Sorry, I'm not able to parse that sentence.

Urgh :/. How about the following commit message:

"So far, our implementation of WARN_ON() cannot be used in the following 
situation:

if ( WARN_ON() )
   ...

This is because WARN_ON() doesn't return whether a warning has been 
triggered. Such construciton can be handy if you want to print more 
information and also dump the stack trace.

Therefore, rework the WARN_ON() implementation to return whether a 
warning was triggered. The idea was borrowed from Linux".

Cheers,

-- 
Julien Grall

