Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B517B193B75
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:04:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOOs-0004Hi-OW; Thu, 26 Mar 2020 09:02:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHOOr-0004Hd-D0
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:02:05 +0000
X-Inumbo-ID: 763adf06-6f40-11ea-877b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 763adf06-6f40-11ea-877b-12813bfff9fa;
 Thu, 26 Mar 2020 09:02:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82019AD27;
 Thu, 26 Mar 2020 09:02:03 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-4-julien@xen.org>
 <80c98b3e-efa7-66e6-bd47-61bc0560f535@suse.com>
 <993d82aa-9f19-0b27-a562-53f4c9b2a7a4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2396098-1c65-835c-533f-dfc0cfe3fa0e@suse.com>
Date: Thu, 26 Mar 2020 10:02:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <993d82aa-9f19-0b27-a562-53f4c9b2a7a4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 03/17] xen/mm: Move the MM types in a
 separate header
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 19:09, Julien Grall wrote:
> Hi Jan,
> 
> On 25/03/2020 15:00, Jan Beulich wrote:
>> On 22.03.2020 17:14, julien@xen.org wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> It is getting incredibly difficult to use typesafe GFN/MFN/PFN in the
>>> headers because of circular dependency. For instance, asm-x86/page.h
>>> cannot include xen/mm.h.
>>>
>>> In order to convert more code to use typesafe, the types are now moved
>>> in a separate header that requires only a few dependencies.
>>
>> We definitely need to do this, so thanks for investing the
>> time. I think though that we want to settle up front (and
>> perhaps record in a comment in the new header) what is or
>> is not suitable to go into the new header. After all you're
>> moving not just type definitions, but also simple helper
>> functions.
> 
> I am expecting headers to use the typesafe helpers (such mfn_add)
> in the long term. So I would like the new header to contain the
> type definitions and any wrappers that would turn 'generic'
> operations safe.
> 
> I am not entirely sure yet how to formalize the rules in the
> header. Any ideas?

Well, if the header was just for the typesafe types, it could be
renamed (to e.g. mm-typesafe.h) and be left without any respective
comment. The issue I've mentioned arises if, with its currently
suggested name, further types get added. In such a case perhaps it
could be "type definitions and their immediate accessors,
involving no other non-trivial types"?

Jan

