Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C12355B4F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 20:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106211.203138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqQ8-0006aH-No; Tue, 06 Apr 2021 18:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106211.203138; Tue, 06 Apr 2021 18:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqQ8-0006Zu-KF; Tue, 06 Apr 2021 18:27:24 +0000
Received: by outflank-mailman (input) for mailman id 106211;
 Tue, 06 Apr 2021 18:27:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTqQ6-0006Zk-Se
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 18:27:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqQ5-0004gq-TG; Tue, 06 Apr 2021 18:27:21 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqQ5-0004H5-Nl; Tue, 06 Apr 2021 18:27:21 +0000
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
	bh=b9sStZe9oaWvHMZkS1aownxhId3agh50xFGtjThqHD4=; b=D9YafEGzG/XqVjuxOh6ybBon5I
	jSnjSHud3ws31bY/9LCSQ3v+Kqi6pmZs9S3iQ0Jcca6uIM0fWKzscMxFcPE1V6qKWtvIOe+tR07T1
	jkh9c9A2f9xsijqpwPeGHk4QdurFv6YbgpG/eHeHmy7J1PcYlaCaiGe7jPiIc11o4VPo=;
Subject: Re: [PATCH 04/14] xen/char: console: Use const whenever we point to
 literal strings
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-5-julien@xen.org>
 <507452bf-9a9c-a48c-d8f5-cba99ac2e646@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <276b3557-c79e-60bc-ad5b-3cf8ebe58429@xen.org>
Date: Tue, 6 Apr 2021 19:27:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <507452bf-9a9c-a48c-d8f5-cba99ac2e646@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/04/2021 09:10, Jan Beulich wrote:
> On 05.04.2021 17:57, Julien Grall wrote:
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -168,7 +168,7 @@ static int parse_guest_loglvl(const char *s);
>>   static char xenlog_val[LOGLVL_VAL_SZ];
>>   static char xenlog_guest_val[LOGLVL_VAL_SZ];
>>   
>> -static char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
>> +static const char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
> 
> If you add any const here, then I think you should go to full way
> and also add the second missing one. Then
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Arguably the array should also be local to xenlog_update_val().

I will look at it and send a new version.

Cheers,

-- 
Julien Grall

