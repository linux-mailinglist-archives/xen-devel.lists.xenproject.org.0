Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6C32EC3E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93705.176826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAZ3-0007zm-0o; Fri, 05 Mar 2021 13:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93705.176826; Fri, 05 Mar 2021 13:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAZ2-0007zN-U4; Fri, 05 Mar 2021 13:32:20 +0000
Received: by outflank-mailman (input) for mailman id 93705;
 Fri, 05 Mar 2021 13:32:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIAZ1-0007zI-SJ
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:32:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIAZ0-0006s3-G4; Fri, 05 Mar 2021 13:32:18 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIAZ0-0002J0-6L; Fri, 05 Mar 2021 13:32:18 +0000
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
	bh=66aZ25rC7UlA+4HECzBjvALagpwec2olmCIUDyveOiw=; b=NKTpllAOaO9aOaDsXv4iSew1Gj
	aTS17Kup8tqpEQdaQ0xtVx3BseVbs1Qi5AkCMjyxdWodDq+hHNHL/W1XLprZe+6EMTODnq9Q+ydP8
	qPuhq8tnfEnik18MnamofzoaRdcCLTDTac6C9g5y5Cmg4pi2TPfIee7vHfNE7/hLXrQA=;
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
To: Ian Jackson <iwj@xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, raphning@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>
References: <20210305124003.13582-1-julien@xen.org>
 <20210305124003.13582-3-julien@xen.org>
 <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
 <24642.12747.126941.615066@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e070d0c2-a161-3c25-7d14-9decb8b01f9e@xen.org>
Date: Fri, 5 Mar 2021 13:32:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24642.12747.126941.615066@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Ian,

On 05/03/2021 13:27, Ian Jackson wrote:
> Jürgen Groß writes ("Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
>> On 05.03.21 13:40, Julien Grall wrote:
>>> -extern void (*xprintf)(const char *fmt, ...);
>>> +void barf(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>>> +void barf_perror(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>>> +
>>> +extern void (*xprintf)(const char *fmt, ...) PRINTF_ATTRIBUTE(1, 2);
>>
>> ... the extern here would be dropped.
> 
> With my RM hat on I don't have an opinion on that and my R-A can
> stand.
> 
> With my maintainer hat on I agree with Jürgen's style opinion - it's
> nicer without the "extern", but I'm also happy with the patch as is.
I agree with Juergen's style opinion. I will do the modification on 
commit. I will also update the last sentence of the commit to:

"
Take the opportunity to:
    * remove extern from the function prototype for consistency
    * define __noreturn to make the prototype for
barf{,_perror})() easier to read.
"

Cheers,

> Ian.
> 

-- 
Julien Grall

