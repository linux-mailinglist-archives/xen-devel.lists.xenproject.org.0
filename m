Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A29360BAF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111249.212745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2pg-00072B-Ar; Thu, 15 Apr 2021 14:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111249.212745; Thu, 15 Apr 2021 14:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2pg-00071m-7i; Thu, 15 Apr 2021 14:19:00 +0000
Received: by outflank-mailman (input) for mailman id 111249;
 Thu, 15 Apr 2021 14:18:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX2pe-00071g-UM
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:18:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX2pd-0001LK-JK; Thu, 15 Apr 2021 14:18:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX2pd-00065b-CY; Thu, 15 Apr 2021 14:18:57 +0000
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
	bh=LQ3C8SV37WgeSukHdHPFX7tGilymL5AjEM/hlxsdtC8=; b=5DqDs0sVjK3MO5VsjShgsH9MAZ
	VsAOBVPkcxrPz1gOsK3L5eJhGWqML/ZP4yFWPecR4MDQGgQFlaMrKdgQsqxk1Js8aRrV8m2umkudr
	6rHLH3lhmLQeigOTXPHkLdMZlG+Xq0lGHJ4AXI0VOenDpnJgEFoD3pIt4nqigr9OfLdw=;
Subject: Re: [PATCH v3 12/15] unxz: replace INIT{,DATA} and STATIC
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <4e0a0db2-db34-a738-2f5e-1d5cd2c37e19@suse.com>
 <c52c9670-d87e-79f9-0104-e6e074419c31@xen.org>
 <a9adf993-0f2d-acb1-b671-7b8c3b15b4d8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eaf819a8-985f-d33f-902d-58320c99a8d8@xen.org>
Date: Thu, 15 Apr 2021 15:18:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <a9adf993-0f2d-acb1-b671-7b8c3b15b4d8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/04/2021 15:16, Jan Beulich wrote:
> On 15.04.2021 13:58, Julien Grall wrote:
>> On 26/01/2021 09:52, Jan Beulich wrote:
>>> --- a/xen/common/decompress.h
>>> +++ b/xen/common/decompress.h
>>> @@ -9,7 +9,6 @@
>>>    
>>>    #define STATIC static
>>>    #define INIT __init
>>> -#define INITDATA __initdata
>>>    
>>>    #define malloc xmalloc_bytes
>>>    #define free xfree
>>> @@ -21,7 +20,6 @@
>>>    
>>>    #define STATIC static
>>>    #define INIT
>>> -#define INITDATA
>>
>> Shouldn't the two changes be part of patch #14?
> 
> One could do it that way, sure, but the last uses are gone here,
> and hence I wanted to get rid of this one item right away.

AFAICT, the same is true for STATIC and INIT. So it doesn't sense to not 
be consistent in the way you treat them.

Cheers,

-- 
Julien Grall

