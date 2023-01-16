Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A166C6FC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 17:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478854.742304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSK6-0006gQ-6C; Mon, 16 Jan 2023 16:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478854.742304; Mon, 16 Jan 2023 16:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHSK6-0006e8-3R; Mon, 16 Jan 2023 16:27:02 +0000
Received: by outflank-mailman (input) for mailman id 478854;
 Mon, 16 Jan 2023 16:27:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHSK5-0006dr-3k
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 16:27:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHSJk-0003W7-Cw; Mon, 16 Jan 2023 16:26:40 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.9.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHSJk-0004M5-4d; Mon, 16 Jan 2023 16:26:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=q3K9ndZ8QJO7+PVyn77l3AM2xxpKYRfzapTlesiVvrg=; b=KtrBgE4tVLcmHI9PJUYt4kfh7L
	KUVWltyn4+AYUUbVVEiOoJRVWYtE2TTiaCV7ubtGdqSBdWWr8s9Ia+Yk7lz0ozlAvaFtM1kAWh1V9
	W1yG9R1aWNMdH0RotDJdxvp1FdL+YspqzreCJcciIh8WqZfwpunE3wXCVFQjy7njxaIc=;
Message-ID: <b2dd000f-ca63-58f8-94eb-ce200e8ba30b@xen.org>
Date: Mon, 16 Jan 2023 16:26:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_*
 subops
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-4-andrew.cooper3@citrix.com>
 <5ebe5337-f84e-12a1-e8a0-92832100946d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ebe5337-f84e-12a1-e8a0-92832100946d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/01/2023 16:06, Jan Beulich wrote:
>> --- a/xen/include/public/version.h
>> +++ b/xen/include/public/version.h
>> @@ -19,12 +19,20 @@
>>   /* arg == NULL; returns major:minor (16:16). */
>>   #define XENVER_version      0
>>   
>> -/* arg == xen_extraversion_t. */
>> +/*
>> + * arg == xen_extraversion_t.
>> + *
>> + * This API/ABI is broken.  Use XENVER_extraversion2 instead.
> 
> Personally I don't like these "broken" that you're adding. These interfaces
> simply are the way they are, with certain limitations. We also won't be
> able to remove the old variants (except in the new ABI), so telling people
> to avoid them provides us about nothing.

+1. This is inline with the comment that I made in v1.

Cheers,

-- 
Julien Grall

