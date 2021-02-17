Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41A631D3DC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 02:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86093.161217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCC4r-0007nR-P7; Wed, 17 Feb 2021 01:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86093.161217; Wed, 17 Feb 2021 01:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCC4r-0007n9-LL; Wed, 17 Feb 2021 01:56:29 +0000
Received: by outflank-mailman (input) for mailman id 86093;
 Wed, 17 Feb 2021 01:56:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkg6=HT=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1lCC4p-0007n4-Na
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 01:56:28 +0000
Received: from aibo.runbox.com (unknown [91.220.196.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e26e0f9f-3e25-45d5-867e-cf79746ae4c4;
 Wed, 17 Feb 2021 01:56:25 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1lCC4k-000717-43; Wed, 17 Feb 2021 02:56:22 +0100
Received: by submission02.runbox with esmtpsa [Authenticated alias (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lCC4Q-0007xM-Ug; Wed, 17 Feb 2021 02:56:03 +0100
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
X-Inumbo-ID: e26e0f9f-3e25-45d5-867e-cf79746ae4c4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=pyYlGNUAqjEgpRSUkNyi4+J7eM7ekIrYP7jIlz2vcPk=; b=zwnVgG3RmBo4O3l+qQeQ+OmnMZ
	cpsBI+HQMNg83pJwMM4K9wL7blFsi6EiXD3y1r7bYMkqV1qLa9OBKvL2cZga51HkXFVdoE5yo9zCd
	Z9oUxgaCEMOIJzowypdLrFjcTbhUCQwyQM52cWZiE8G/Wk8Ntq9MVdkk6ENEgClXHzGLabHf6kd5h
	RCq3ZAa3oBWBbutOXIjCvL78rWSD7mkd2D+FAzb+n15fYiLEFMfNLYnNnFbTGkmRpbzQ2ReFnZif6
	1DO30YPL7VQVjcSNOdHykHM7Gc3zUT1WZ9fd1O1L/N3CKGpw6ngJ09StzM5ooZYVnGDNLXe0zdNWm
	CI30NJaw==;
Subject: Re: [PATCH 1/1] x86/ept: Fix buggy XSA-321 backport
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
 jbeulich@suse.com
References: <20210215234619.245422-1-m.v.b@runbox.com>
 <20210215234619.245422-2-m.v.b@runbox.com> <YCuOQ3qpFD6RgIld@Air-de-Roger>
 <5517e20e-c485-7016-da89-81570cc43b3b@runbox.com>
Message-ID: <aad766de-2e2a-2f64-a839-9c7a5a9e4d6f@runbox.com>
Date: Tue, 16 Feb 2021 20:55:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5517e20e-c485-7016-da89-81570cc43b3b@runbox.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 16/02/2021 07.48, M. Vefa Bicakci wrote:
> On 16/02/2021 04.20, Roger Pau Monné wrote:
>> On Mon, Feb 15, 2021 at 06:46:19PM -0500, M. Vefa Bicakci wrote:
> 
[snipped by Vefa]
> >> In any case I think this is too much change, so I would go for a
>> smaller fix like my proposal below. Can you please test it?
> 
> Thank you! I will test your patch later today, and I will report
> back by tomorrow.
> 
[snipped by Vefa]
> 
>> Here is my proposed fix, I think we could even do away with the else
>> branch, but if level is != 0 p2m_is_foreign should be false, so we
>> avoid an extra check.
>>
>> Thanks, Roger.
> 
> I will test this. Thanks again! I really appreciate that you have
> have taken the time and effort.
> 
> Vefa

Hello Roger,

I have tested your patch, and I am happy to confirm that it too resolves
the issue I have described in my original patch description. Thank you!

When I find some more time, I would like to prepare a GitHub pull request
for Qubes OS 4.0's version of Xen 4.8.5 with your patch so that other users
do not encounter the same issue. I would like to properly credit your
contribution. Would you be able to send a patch with a Signed-off-by tag
in its description?

Thanks again,

Vefa

>> ---8<---
>> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
>> index 036771f43c..086739ffdd 100644
>> --- a/xen/arch/x86/mm/p2m-ept.c
>> +++ b/xen/arch/x86/mm/p2m-ept.c
>> @@ -56,11 +56,8 @@ static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
>>       if ( level )
>>       {
>>           ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
>> -        write_atomic(&entryptr->epte, new.epte);
>> -        return 0;
>>       }
>> -
>> -    if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
>> +    else if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
>>       {
>>           rc = -EINVAL;
>>           if ( !is_epte_present(&new) )
>>

