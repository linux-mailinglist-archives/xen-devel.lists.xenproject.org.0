Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E923555D4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 15:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105970.202628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmBh-00047Q-Dh; Tue, 06 Apr 2021 13:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105970.202628; Tue, 06 Apr 2021 13:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmBh-00046y-9a; Tue, 06 Apr 2021 13:56:13 +0000
Received: by outflank-mailman (input) for mailman id 105970;
 Tue, 06 Apr 2021 13:56:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTmBf-00046t-RP
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 13:56:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4deb9fa7-f933-4c72-8a44-09251b3c3e0a;
 Tue, 06 Apr 2021 13:56:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9A73B1AB;
 Tue,  6 Apr 2021 13:56:09 +0000 (UTC)
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
X-Inumbo-ID: 4deb9fa7-f933-4c72-8a44-09251b3c3e0a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617717370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3nb8UZiDBS2Ti675AS+lATMm+rwqfhCfk5q2a4UGaQ=;
	b=DXTAuZn/oD10nrXtTn+aHgzuvqPM9JvQA1qrMJup+i4Cmbqdtbh6i5VQ2XNfJDGrmfacm+
	IR6YjptdsxCF9zUZA3IX6ch39v47jzlwso/vbn98cmN48ioZhp+h7npL2UtCKGujX61cdQ
	AyddAS0kmikPQ6U8wp2RlQn4ijoqygA=
Subject: Re: [PATCH] rangeset: no need to use snprintf()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2338703b-3613-41c6-8ae6-387ba2869408@suse.com>
 <80d625d8-6812-7d02-c946-a3905cbc306d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <060c0a6a-128e-2c44-fe51-59dadbc1c5f6@suse.com>
Date: Tue, 6 Apr 2021 15:56:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <80d625d8-6812-7d02-c946-a3905cbc306d@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 15:44, Julien Grall wrote:
> On 06/04/2021 09:50, Jan Beulich wrote:
>> As of the conversion to safe_strcpy() years ago there has been no need
>> anymore to use snprintf() to prevent storing a not-nul-terminated string.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> --- a/xen/common/rangeset.c
>> +++ b/xen/common/rangeset.c
>> @@ -436,14 +436,7 @@ struct rangeset *rangeset_new(
>>       BUG_ON(flags & ~RANGESETF_prettyprint_hex);
>>       r->flags = flags;
>>   
>> -    if ( name != NULL )
>> -    {
>> -        safe_strcpy(r->name, name);
>> -    }
>> -    else
>> -    {
>> -        snprintf(r->name, sizeof(r->name), "(no name)");
>> -    }
>> +    safe_strcpy(r->name, name ?: "(no name)");
> 
> I realize the current code is not checking the return, but I wonder we 
> should rather than silently truncating the string.

The name field is used only for display purposes, so I guess truncation
wouldn't really be a problem here.

Jan

