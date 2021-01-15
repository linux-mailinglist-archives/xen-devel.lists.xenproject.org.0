Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A12F7701
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67923.121435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Mfe-0000dC-I4; Fri, 15 Jan 2021 10:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67923.121435; Fri, 15 Jan 2021 10:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Mfe-0000cn-EV; Fri, 15 Jan 2021 10:49:34 +0000
Received: by outflank-mailman (input) for mailman id 67923;
 Fri, 15 Jan 2021 10:49:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Mfd-0000ci-Ad
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:49:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c06370fd-f475-44e6-b9af-069de3da8329;
 Fri, 15 Jan 2021 10:49:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ADAA4B7C6;
 Fri, 15 Jan 2021 10:49:31 +0000 (UTC)
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
X-Inumbo-ID: c06370fd-f475-44e6-b9af-069de3da8329
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610707771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wbW9SfgCP7l8fLzfZHftbtusH8Rh0iD+i7SWjYtVCQ=;
	b=XQh3o3urooe0vus1aQEY5jPBXEBlJlMvlAT6jiwswstbwmJ2F9VU/9jqa+UZ4gWK12e9Av
	5V0+VXI4gOBUpkWOfOyOmmyLxcCY0+MJuee1gTpOpSuorQ5BUXvvc9TfzvgweJGjI4IK4Z
	FDQR8TTn3rgHWekz2QR+wAK/pJxpiZs=
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
 <3c0ebca6-a5e9-36a8-cfeb-6abc0fc7c2af@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e714873-8fa6-269c-d6c4-806a74046ef9@suse.com>
Date: Fri, 15 Jan 2021 11:49:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3c0ebca6-a5e9-36a8-cfeb-6abc0fc7c2af@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 16:01, Andrew Cooper wrote:
> On 14/01/2021 14:02, Jan Beulich wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2566,13 +2566,7 @@ __initcall(register_heap_trigger);
>>  
>>  struct domain *get_pg_owner(domid_t domid)
>>  {
>> -    struct domain *pg_owner = NULL, *curr = current->domain;
>> -
>> -    if ( unlikely(domid == curr->domain_id) )
>> -    {
>> -        gdprintk(XENLOG_WARNING, "Cannot specify itself as foreign domain\n");
>> -        goto out;
>> -    }
>> +    struct domain *pg_owner;
> 
> I'm not sure this is correct.
> 
> It isn't a DOMID_SELF check.  It's a "confirm the nominated domid is
> remote" check, and I don't see all the callers of this interface having
> appropriate checks to prohibit trying to do a foreign operation on
> oneself, however they specify the foreign domid.

Since Julien had me look up all the call sites anyway (for adding
respective commentary in the public headers), I checked this
property as well: The only case where a foreign domain is strictly
required is the handling of XENMAPSPACE_gmfn_foreign, and there a
respective check exists.

I actually question do_mmuext_op()'s use of the function, as
neither DOMID_IO nor DOMID_XEN ought to be sensibly usable there.

Jan

