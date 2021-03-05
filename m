Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A220A32EC71
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93717.176862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAm2-0000rb-QI; Fri, 05 Mar 2021 13:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93717.176862; Fri, 05 Mar 2021 13:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAm2-0000rF-N3; Fri, 05 Mar 2021 13:45:46 +0000
Received: by outflank-mailman (input) for mailman id 93717;
 Fri, 05 Mar 2021 13:45:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lIAm1-0000rA-Vp
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:45:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f77f0d07-863c-4cb3-b99d-fa1791666909;
 Fri, 05 Mar 2021 13:45:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBDFDACCF;
 Fri,  5 Mar 2021 13:45:43 +0000 (UTC)
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
X-Inumbo-ID: f77f0d07-863c-4cb3-b99d-fa1791666909
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614951944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QItXiLHhbawd4RWeqUi0SmHM2kV61WO9rM9s0jqHWGQ=;
	b=WueFinaiTEwXKPPQ7GRThskgJTID8gPJuwvNjb6zyP53qxLKEZvbxeJIdZgtEV+E55Duv7
	6HTebr6D9okqtLVCTKxMQ1hfLNF5SJbTz+gzWxLbg45SlvkzfdFnRnfZk4cW65F9h4W358
	x+8ycifR8TgsCC05sF8QPAE/BqVpo/M=
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien@xen.org>
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210305124003.13582-1-julien@xen.org>
 <20210305124003.13582-3-julien@xen.org>
 <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
Date: Fri, 5 Mar 2021 14:45:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.03.2021 14:01, Jürgen Groß wrote:
> On 05.03.21 13:40, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>> --- a/tools/xenstore/utils.h
>> +++ b/tools/xenstore/utils.h
>> @@ -29,10 +29,12 @@ const char *dump_state_align(FILE *fp);
>>   
>>   #define PRINTF_ATTRIBUTE(a1, a2) __attribute__((format (printf, a1, a2)))
>>   
>> -void barf(const char *fmt, ...) __attribute__((noreturn));
>> -void barf_perror(const char *fmt, ...) __attribute__((noreturn));
>> +#define __noreturn __attribute__((noreturn))
>>   
>> -extern void (*xprintf)(const char *fmt, ...);
>> +void barf(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>> +void barf_perror(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>> +
>> +extern void (*xprintf)(const char *fmt, ...) PRINTF_ATTRIBUTE(1, 2);
> 
> ... the extern here would be dropped.

But this isn't a function declaration, but that of a data object.
With the extern dropped, a common symbol will appear in every CU.

Jan

