Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36123C211C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153482.283567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mMY-0003Tr-Qf; Fri, 09 Jul 2021 08:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153482.283567; Fri, 09 Jul 2021 08:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mMY-0003R9-NX; Fri, 09 Jul 2021 08:59:58 +0000
Received: by outflank-mailman (input) for mailman id 153482;
 Fri, 09 Jul 2021 08:59:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e3y7=MB=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1m1mMX-0003R3-Gq
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 08:59:57 +0000
Received: from mx.upb.ro (unknown [141.85.13.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cd5a921-af71-4d8d-8cda-5be73a2e1182;
 Fri, 09 Jul 2021 08:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 1A243B560106;
 Fri,  9 Jul 2021 11:59:53 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id l7e-VKF1PcMi; Fri,  9 Jul 2021 11:59:51 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id E8B69B56010F;
 Fri,  9 Jul 2021 11:59:50 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wmBlERRNqV0L; Fri,  9 Jul 2021 11:59:50 +0300 (EEST)
Received: from [192.168.0.104] (unknown [86.124.207.155])
 by mx.upb.ro (Postfix) with ESMTPSA id 69562B560108;
 Fri,  9 Jul 2021 11:59:50 +0300 (EEST)
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
X-Inumbo-ID: 3cd5a921-af71-4d8d-8cda-5be73a2e1182
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH v4 4/5] tools/libs/gnttab: Fix PAGE_SIZE redefinition
 error
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
 <84d03c4595428e4ff857dcacc72f6b9c04476849.1623155575.git.costin.lupu@cs.pub.ro>
 <90974b14-4a8d-d9dd-f8e9-65eef692d28a@xen.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <f888c8ed-4b5d-6ca1-326e-a3ab5b5f0c94@cs.pub.ro>
Date: Fri, 9 Jul 2021 11:59:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <90974b14-4a8d-d9dd-f8e9-65eef692d28a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 7/8/21 8:33 PM, Julien Grall wrote:
> Hi Costin,
> 
> On 08/06/2021 13:35, Costin Lupu wrote:
>> If PAGE_SIZE is already defined in the system (e.g. in
>> /usr/include/limits.h
>> header) then gcc will trigger a redefinition error because of -Werror.
>> This
>> patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order
>> to avoid
>> confusion between control domain page granularity (PAGE_* definitions)
>> and
>> guest domain page granularity.
>>
>> The exception is in osdep_xenforeignmemory_map() where we need the
>> system page
> 
> Did you mean osdep_gnttab_grant_map?
> 

Argh, yes, sorry about that. Can we fix this on upstreaming or should I
send a new version?

>> size to check whether the PFN array should be allocated with mmap() or
>> with
>> dynamic allocation.
>>
>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
> 
> Other than the question above:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 

Cheers,
Costin

