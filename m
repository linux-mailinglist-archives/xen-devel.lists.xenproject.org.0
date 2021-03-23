Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A7345F9F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 14:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100681.191964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOh4V-0005kZ-ME; Tue, 23 Mar 2021 13:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100681.191964; Tue, 23 Mar 2021 13:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOh4V-0005kA-Ie; Tue, 23 Mar 2021 13:27:47 +0000
Received: by outflank-mailman (input) for mailman id 100681;
 Tue, 23 Mar 2021 13:27:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOh4T-0005k5-SW
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:27:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba9e8c7-9ed8-4ddb-b064-763220cd7372;
 Tue, 23 Mar 2021 13:27:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E43F1AD80;
 Tue, 23 Mar 2021 13:27:43 +0000 (UTC)
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
X-Inumbo-ID: 5ba9e8c7-9ed8-4ddb-b064-763220cd7372
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616506064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X65oIzopQz6eDf2StZGhkSyfEOhs7gyqxVPNHz+iQ70=;
	b=IBjLPjvxRVs1HEbYIMWUCRYK1PUqvKIGv9l/J3S6Nx1toY3TaCVXkw+1TtEsfLfuaNdtzx
	C4SjzJCwxRFdwsAEz39R4NLXhcoHgf7tcHlngt3nK1o9ktB4qr9rWM4EyY/2+9qAG8Ghud
	3OT7KtLnmC4hZe6P89EYM/uh5d6f8e0=
Subject: Re: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections
To: "Tian, Kevin" <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
 <MWHPR11MB1886A8DBD8B93A612A1B09958C649@MWHPR11MB1886.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <35150558-6a4a-d6bb-b51a-4e2bf37e5ae5@suse.com>
Date: Tue, 23 Mar 2021 14:27:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886A8DBD8B93A612A1B09958C649@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 09:12, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, March 18, 2021 6:12 PM
>>
>> None of these are regressions afaict, so considering how late we are
>> in the 4.15 process, I can see reasons to not take any of these. All
>> of them are backporting candidates though, imo.
>>
>> 1: correct off-by-1 in number-of-IOMMUs check
>> 2: leave FECTL write to vtd_resume()
>> 3: re-order register restoring in vtd_resume()
>> 4: restore flush hooks when disabling qinval
>>
> 
> For the series:
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks Kevin. Ian - what are your thoughts here towards 4.15?

Jan

