Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733852B9012
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 11:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30580.60703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfhAH-00005l-Cz; Thu, 19 Nov 2020 10:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30580.60703; Thu, 19 Nov 2020 10:27:45 +0000
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
	id 1kfhAH-00005K-8t; Thu, 19 Nov 2020 10:27:45 +0000
Received: by outflank-mailman (input) for mailman id 30580;
 Thu, 19 Nov 2020 10:27:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfhAF-00005E-Nk
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:27:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1369d29-50cc-4b2b-949a-99cf57d0f96d;
 Thu, 19 Nov 2020 10:27:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30D30AC23;
 Thu, 19 Nov 2020 10:27:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfhAF-00005E-Nk
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:27:43 +0000
X-Inumbo-ID: f1369d29-50cc-4b2b-949a-99cf57d0f96d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f1369d29-50cc-4b2b-949a-99cf57d0f96d;
	Thu, 19 Nov 2020 10:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605781662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7DdDUqSN/Mt0PYfsKOzA7Gon8VVTAb4tK0/kzwQR4k=;
	b=uMyecMQBwY0E58dZzVhzAySSlBpBdGJOYXUTfEA6wWUtLp0HMdrikC6lSDUgPJXDrPjac0
	NQQdGmwxRqniMcHxj59kdP5e/mh0u9Bgapf6VeS02GQudCiWu1dDpzTFYqXMGD+j7yQPPT
	ES8r79WEd06grNTFoF8APYsAuHjZShk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 30D30AC23;
	Thu, 19 Nov 2020 10:27:42 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
Date: Thu, 19 Nov 2020 11:27:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 19:09, Julien Grall wrote:
> On 23/10/2020 11:19, Jan Beulich wrote:
>> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -12,6 +12,7 @@
>>   
>>   #define inline        __inline__
>>   #define always_inline __inline__ __attribute__ ((__always_inline__))
>> +#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
> 
> bsearch() is only used by Arm and I haven't seen anyone so far 
> complaining about the perf of I/O emulation.
> 
> Therefore, I am not convinced that there is enough justification to 
> introduce a GNU attribute just for this patch.

Please settle this with Andrew: He had asked for the function to
become inline. I don't view making it static inline in the header
as an option here - if the compiler decides to not inline it, we
should not end up with multiple instances in different CUs. And
without making it static inline the attribute needs adding; at
least I'm unaware of an alternative which works with the various
compiler versions.

Jan

