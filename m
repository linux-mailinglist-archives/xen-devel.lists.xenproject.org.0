Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B78222F6502
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67268.119952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04sW-0005l4-NV; Thu, 14 Jan 2021 15:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67268.119952; Thu, 14 Jan 2021 15:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04sW-0005kf-H3; Thu, 14 Jan 2021 15:49:40 +0000
Received: by outflank-mailman (input) for mailman id 67268;
 Thu, 14 Jan 2021 15:49:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04iu-0002Sh-La
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:39:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b10f933e-20d4-4214-b2bd-0791d0c6b377;
 Thu, 14 Jan 2021 15:38:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66A63AEAB;
 Thu, 14 Jan 2021 15:38:27 +0000 (UTC)
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
X-Inumbo-ID: b10f933e-20d4-4214-b2bd-0791d0c6b377
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLfI5O1odNAJ2FlprWdwHJpbz3Zme4dt/wvDbg3b8jM=;
	b=RGKIGsIHwurRRLEgvM6Cm1e6HrGnR082hNzZ1BtOaqBmqIwegQtSjm6IjPmmSEKWytd4yy
	nnssj4qqzBSwCkdYyCA5ApC27fLFVjJWinOPcrQRpdEFoZ3vS+hwn8RpIb8L77QVC5gwnl
	R4hw/8f3oqtYJlQLbZ8bEpjpgFhmYw0=
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
 <3c0ebca6-a5e9-36a8-cfeb-6abc0fc7c2af@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6a6c3e5-ef52-51f6-261c-06ae2d477b43@suse.com>
Date: Thu, 14 Jan 2021 16:38:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3c0ebca6-a5e9-36a8-cfeb-6abc0fc7c2af@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 16:01, Andrew Cooper wrote:
> On 14/01/2021 14:02, Jan Beulich wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -2776,15 +2776,19 @@ struct gnttab_copy_buf {
>>  static int gnttab_copy_lock_domain(domid_t domid, bool is_gref,
>>                                     struct gnttab_copy_buf *buf)
>>  {
>> -    /* Only DOMID_SELF may reference via frame. */
>> -    if ( domid != DOMID_SELF && !is_gref )
>> -        return GNTST_permission_denied;
>> -
>>      buf->domain = rcu_lock_domain_by_any_id(domid);
>>  
>>      if ( !buf->domain )
>>          return GNTST_bad_domain;
>>  
>> +    /* Only the local domain may reference via frame. */
>> +    if ( buf->domain != current->domain && !is_gref )
>> +    {
>> +        rcu_unlock_domain(buf->domain);
>> +        buf->domain = NULL;
>> +        return GNTST_permission_denied;
>> +    }
> 
> In this case, it's also a weird asymmetry where this is one grant table
> operation which a privileged domain can't issue on behalf of an
> unprivileged one.

Well, in a way, perhaps. If it was useful, perhaps it would have
been made work and allowed, so I wonder whether there simply is
no good use for it?

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

No, I don't think so. Prior to a625c335593e ("common: don't (kind
of) open-code rcu_lock_domain_by_any_id()") DOMID_SELF was explicitly
permitted. As of that change, it's implicitly permitted. I don't see
how using DOMID_SELF would be okay when using the numeric ID isn't.
(I'm not going to exclude there may be missing checks in some of the
callers, but from prior audits I don't recall recognizing any.)

Jan

