Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288667824FE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587325.918674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzoo-0002pP-M9; Mon, 21 Aug 2023 07:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587325.918674; Mon, 21 Aug 2023 07:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzoo-0002nd-JP; Mon, 21 Aug 2023 07:59:22 +0000
Received: by outflank-mailman (input) for mailman id 587325;
 Mon, 21 Aug 2023 07:59:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qXzom-0002nX-Ux
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 07:59:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qXzom-0007JR-HY; Mon, 21 Aug 2023 07:59:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qXzom-00018f-AI; Mon, 21 Aug 2023 07:59:20 +0000
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
	bh=sxyctZh337MYOgO8yucM3tPZPoExPa1vHb1KHvgi7ls=; b=siD1zhWs6eqAtHqSvxKlm7n+Qb
	9CseGZ3ckNAttNeqYcoGMDQLqE9eATxEWkhELnMftVm3aSGfdGuvSFovuuL1Iax8DkSA0fhHWzWSE
	ywdc8q9vN8XdkIxnQumhMH3/VgL4c7iQvH3dECygCf/cSzmWvGSqfB78GQuS95Ca36PQ=;
Message-ID: <e20b26b5-1422-46d1-a03c-54424bc864cd@xen.org>
Date: Mon, 21 Aug 2023 08:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] tools/xenstore: move xenstored sources into dedicated
 directory
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230818140848.20220-1-jgross@suse.com>
 <53982682-c49c-6f3e-87c1-f4bd0ab385ce@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <53982682-c49c-6f3e-87c1-f4bd0ab385ce@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 18/08/2023 15:20, Andrew Cooper wrote:
> On 18/08/2023 3:08 pm, Juergen Gross wrote:
>> diff --git a/.gitignore b/.gitignore
>> index c1b73b0968..c6489c4e70 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -237,22 +237,22 @@ tools/xenmon/xentrace_setmask
>>   tools/xenmon/xenbaked
>>   tools/xenpaging/xenpaging
>>   tools/xenpmd/xenpmd
>> -tools/xenstore/xenstore
>> -tools/xenstore/xenstore-chmod
>> -tools/xenstore/xenstore-control
>> -tools/xenstore/xenstore-exists
>> -tools/xenstore/xenstore-list
>> -tools/xenstore/xenstore-ls
>> -tools/xenstore/xenstore-read
>> -tools/xenstore/xenstore-rm
>> -tools/xenstore/xenstore-watch
>> -tools/xenstore/xenstore-write
>> -tools/xenstore/xenstored
>> +tools/xenstored/xenstored
>>   tools/xentop/xentop
>>   tools/xentrace/xentrace_setsize
>>   tools/xentrace/tbctl
>>   tools/xentrace/xenctx
>>   tools/xentrace/xentrace
>> +tools/xs-clients/xenstore
>> +tools/xs-clients/xenstore-chmod
>> +tools/xs-clients/xenstore-control
>> +tools/xs-clients/xenstore-exists
>> +tools/xs-clients/xenstore-list
>> +tools/xs-clients/xenstore-ls
>> +tools/xs-clients/xenstore-read
>> +tools/xs-clients/xenstore-rm
>> +tools/xs-clients/xenstore-watch
>> +tools/xs-clients/xenstore-write
>>   xen/**/*.i
>>   xen/**/*.s
>>   xen/.banner
> 
> Please take the opportunity to move these into local .gitignore files.
> One less area of churn in future renaming.  Probably can be fixed on
> commit as its only mechanical.
If you end up to the be committer then sure. I would prefer not doing it 
while committing.

Cheers,

-- 
Julien Grall

