Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DAD387A63
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 15:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129216.242570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj05J-0004nc-H5; Tue, 18 May 2021 13:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129216.242570; Tue, 18 May 2021 13:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj05J-0004l2-E6; Tue, 18 May 2021 13:48:33 +0000
Received: by outflank-mailman (input) for mailman id 129216;
 Tue, 18 May 2021 13:48:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj05H-0004kw-RA
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 13:48:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj05G-0003ne-4p; Tue, 18 May 2021 13:48:30 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj05F-0000bX-Uw; Tue, 18 May 2021 13:48:30 +0000
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
	bh=jdEWK8AR8gSujYRxvxOsyvAMbhgjBsHtSjPLjmUTNY8=; b=tcCH8FKlk732owMuRgXfdORONR
	rA92Ajze3EjFCZSi9+D99aJCfsUY0jcQFy1gct4JEtdrSRJxpYo5xfeeaTMBFFETrJ4nklI5LukRJ
	YL5+RxStE1JOKE5pKYv8HI8YJs5enrbcbusLCpVx02yS22gvb7HmYXHCIfhSeiRjUK7k=;
Subject: Re: [PATCH 09/14] tools/console: Use const whenever we point to
 literal strings
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-10-julien@xen.org> <YJqgXz1s8N3T4+Fo@perard>
From: Julien Grall <julien@xen.org>
Message-ID: <87662d43-82a9-d0ac-8aaf-c42e19647961@xen.org>
Date: Tue, 18 May 2021 14:48:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJqgXz1s8N3T4+Fo@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 11/05/2021 16:18, Anthony PERARD wrote:
> On Mon, Apr 05, 2021 at 04:57:08PM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> literal strings are not meant to be modified. So we should use const
>> char * rather than char * when we want to store a pointer to them.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>> diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
>> index 4af27ffc5d02..6a8a94e31b65 100644
>> --- a/tools/console/daemon/io.c
>> +++ b/tools/console/daemon/io.c
>> @@ -109,9 +109,9 @@ struct console {
>>   };
>>   
>>   struct console_type {
>> -	char *xsname;
>> -	char *ttyname;
>> -	char *log_suffix;
>> +	const char *xsname;
> 
> I think that const of `xsname` is lost in console_init() in the same
> file.
> We have:
> 
>      static int console_init(.. )
>      {
>          struct console_type **con_type = (struct console_type **)data;
>          char *xsname, *xspath;
>          xsname = (char *)(*con_type)->xsname;
>      }
> 
> So constify "xsname" in console_init() should be part of the patch, I
> think.

Good point. I am not entirely sure why the cast has been added because 
the field has always been a char *.

Anyway, I will remove it.

Cheers,

-- 
Julien Grall

