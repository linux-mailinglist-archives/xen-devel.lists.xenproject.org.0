Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCBE5794BF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 10:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370464.602248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDi94-00045c-WB; Tue, 19 Jul 2022 07:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370464.602248; Tue, 19 Jul 2022 07:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDi94-00043D-Sm; Tue, 19 Jul 2022 07:59:54 +0000
Received: by outflank-mailman (input) for mailman id 370464;
 Tue, 19 Jul 2022 07:59:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oDi93-000436-HG
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 07:59:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDi92-0002Ho-5E; Tue, 19 Jul 2022 07:59:52 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDi91-0004dB-Vz; Tue, 19 Jul 2022 07:59:52 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=6cCDpR232OZ1sdfwh/36GhVcoa66livNdqVlARtsKYo=; b=hdAa5/7SNb9y8tBtkHEfbkMXBf
	lY+bNMw88Zn9nlZXSYnxZe5KZ/ziJw8krWgkchs0FfA9QBes7XNGZxy5h0x/6Z7UxLcylUIdWWlmf
	qZoj+Ryu1fLdYEFgebwm1nnfcPHfFubpK1jwaXboVWfmyEbxLxdEw+X6mdGVHW6bxKTk=;
Message-ID: <432f285d-3d3e-5a08-e6bd-546eda523d32@xen.org>
Date: Tue, 19 Jul 2022 08:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Juergen Gross <jgross@suse.com>
References: <20220527072427.20327-1-jgross@suse.com>
 <6e12a7ee-8526-2214-8beb-f0f3d8ad3e83@suse.com>
 <456d3702-c4b8-9a59-a8f3-307517be86a8@xen.org>
 <c65af685-be43-00ad-a2ef-614044ccc69a@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
In-Reply-To: <c65af685-be43-00ad-a2ef-614044ccc69a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/07/2022 06:58, Jan Beulich wrote:
> On 18.07.2022 18:28, Julien Grall wrote:
>> On 18/07/2022 17:12, Jan Beulich wrote:
>>> On 27.05.2022 09:24, Juergen Gross wrote:
>> As you committed, I would be OK if this is addressed in a follow-up
>> series. But this *must* be addressed by the time 4.17 is released
>> because otherwise we will commit ourself to a broken interface. @Henry,
>> please add this in the blocker list.
> 
> If you hadn't answered, I would have reverted these right away this
> morning, in particular to remove the (now wrong) feature bit part
> (patches 2 and 3 have dropped their feature bit additions in v2).
> If you nevertheless think an incremental update is going to be okay,
> I'll leave things alone. But personally I think this mistake of mine
> would better be corrected immediately.

I wasn't arguing against a revert and it looks like Juergen is away for 
the next 2 weeks. So if you prefer to correct the mistake now, then 
please revert it.

Cheers,

-- 
Julien Grall

