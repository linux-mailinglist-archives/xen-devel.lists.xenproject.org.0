Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF3F4BAA65
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 20:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274995.470663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKms6-0004Qb-Gh; Thu, 17 Feb 2022 19:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274995.470663; Thu, 17 Feb 2022 19:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKms6-0004Nl-Db; Thu, 17 Feb 2022 19:55:22 +0000
Received: by outflank-mailman (input) for mailman id 274995;
 Thu, 17 Feb 2022 19:55:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nKms4-0004NX-To
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 19:55:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKms4-0004vC-Ju; Thu, 17 Feb 2022 19:55:20 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKms4-0001yF-Ed; Thu, 17 Feb 2022 19:55:20 +0000
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
	bh=o+x8fuWDLPE8tVuDYD0qKnOM1zogr7tYTO9oUybEp3w=; b=CbKjcm3EnpBSl1qSUn+6JrEEmF
	k5GxUs9vew7R2jxZHrwFf3DCFAGU4ugVAwhDdX3nYgeO7a/es/dkT3NqF48KxS/pT48Dk/I81h221
	DN9JrGmSbsCrhtwMqVN1ycv6cYVAiFCsjtRnTO9rRo0EQqzlHzb1O9rmVtbFrfaHxLNE=;
Message-ID: <eea83d0a-a96d-f050-c6ac-7dad731a16f0@xen.org>
Date: Thu, 17 Feb 2022 19:55:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] xen/include/public: deprecate GNTTABOP_transfer
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220203131418.1319-1-jgross@suse.com>
 <20220203131418.1319-2-jgross@suse.com>
 <a35bb9ba-e2be-f73e-9272-906bc09d9b6e@xen.org>
 <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <93e50bc4-6e53-b753-c520-7d1d0a5a5f5a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 16/02/2022 07:20, Juergen Gross wrote:
> On 15.02.22 22:13, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 03/02/2022 13:14, Juergen Gross wrote:
>>> Add a comment to include/public/grant_table.h that GNTTABOP_transfer
>>> is deprecated, in order to discourage new use cases.
>>
>>  From the commit message, it is unclear to me why we are discouraging 
>> new use cases and indirectly encouraging current users to move away 
>> from the feature.
>>
>> Patch #1 seems to imply this is because the feature is not present in 
>> Linux upstream. But I don't think this is a sufficient reason to 
>> deprecate a feature.
>>
>> A more compelling reason would be that the feature is broken and too 
>> complex to fix it.
>>
>> So can you provide more details?
> 
> It is a feature available for PV domains only, and it is very complex
> and hasn't been tested for ages.

Right. To reply to Jan's e-mail here, shouldn't we also de-support 
(either completely or security) in this case?

My concern here is you wrote this code has been untested for ages (not 
clear how long) and complex. So potentially this means there are 
security issues in it.

Cheers,

-- 
Julien Grall

