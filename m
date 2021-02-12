Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0931A26B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 17:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84376.158252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAb5B-00062n-BH; Fri, 12 Feb 2021 16:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84376.158252; Fri, 12 Feb 2021 16:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAb5B-00062O-7F; Fri, 12 Feb 2021 16:14:13 +0000
Received: by outflank-mailman (input) for mailman id 84376;
 Fri, 12 Feb 2021 16:14:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aDps=HO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAb59-00062I-VH
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 16:14:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 454d563a-17ee-4427-adcc-17180619b9a5;
 Fri, 12 Feb 2021 16:14:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76266AD29;
 Fri, 12 Feb 2021 16:14:10 +0000 (UTC)
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
X-Inumbo-ID: 454d563a-17ee-4427-adcc-17180619b9a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613146450; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vgi+fK7GsoYWXBXPeO1U9BYDDEMJnP3aT/KwQLfoC7Q=;
	b=ghSsOf0SZw+g89EeBlVhhRR8axpMIhqkDFHS4g8EgjCwwb2AnJ6pceuar6QhS/k2JmdnjY
	UqXB+l8wuB/FBm6FWjob5WEofEIR1EVELPVzIKm0OrHkLhfyCUeYXE1P6bJBoaEw5sLb53
	yD9uVU7OxLzafqxEc5qvDFLEPhecC40=
Subject: Re: [PATCH 07/10] tools: Use -Og for debug builds when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-8-andrew.cooper3@citrix.com>
 <04c93a14-ee95-e4a6-33b9-f80fcd03a010@suse.com>
 <3b02dfa7-923b-9bf7-a349-68bbba0590ad@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da48c866-68cb-1655-2887-434d38e50b21@suse.com>
Date: Fri, 12 Feb 2021 17:14:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3b02dfa7-923b-9bf7-a349-68bbba0590ad@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.02.2021 17:09, Andrew Cooper wrote:
> On 12/02/2021 16:04, Jan Beulich wrote:
>> On 12.02.2021 16:39, Andrew Cooper wrote:
>>> --- a/tools/Rules.mk
>>> +++ b/tools/Rules.mk
>>> @@ -106,8 +106,9 @@ endif
>>>  CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
>>>  
>>>  ifeq ($(debug),y)
>>> -# Disable optimizations
>>> -CFLAGS += -O0 -fno-omit-frame-pointer
>>> +# Use -Og if available, -O0 otherwise
>>> +dbg_opt_level := $(call cc-option,$(CC),-Og,-O0)
>>> +CFLAGS += $(dbg_opt_level) -fno-omit-frame-pointer
>> I wonder if we shouldn't do something similar for the hypervisor,
>> where we use -O1 for debug builds right now. At least when
>> DEBUG_INFO is also enabled, -Og may be better.
> 
> I also made that work... its rather more invasive in terms of changes -
> all for "maybe uninitialised" warnings.
> 
> $ git diff e2bab84984^ --stat
>  xen/Makefile                    | 3 ++-
>  xen/arch/arm/domain_build.c     | 2 +-
>  xen/arch/x86/irq.c              | 2 +-
>  xen/arch/x86/mm/shadow/common.c | 2 +-
>  xen/arch/x86/pv/shim.c          | 6 +++---
>  xen/arch/x86/sysctl.c           | 4 ++--
>  xen/common/efi/boot.c           | 2 +-
>  7 files changed, 11 insertions(+), 10 deletions(-)
> 
> is what is required to make Gitlab happy.

Oh, good to know. Thanks!

>  I was planning to defer it to 4.16 at this point.

Of course.

Jan

