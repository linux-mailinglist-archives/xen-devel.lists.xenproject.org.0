Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82BE36220E
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 16:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111784.213769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPLG-0006VP-IJ; Fri, 16 Apr 2021 14:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111784.213769; Fri, 16 Apr 2021 14:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPLG-0006V0-F1; Fri, 16 Apr 2021 14:21:06 +0000
Received: by outflank-mailman (input) for mailman id 111784;
 Fri, 16 Apr 2021 14:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXPLE-0006Uv-Te
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 14:21:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73bc7459-4586-439d-bb99-7c6addd46744;
 Fri, 16 Apr 2021 14:21:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E013AB2EC;
 Fri, 16 Apr 2021 14:20:59 +0000 (UTC)
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
X-Inumbo-ID: 73bc7459-4586-439d-bb99-7c6addd46744
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618582860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CO6+K32az/5ynCNoY8dlOJq1QiDtv0BWjVq2zi18FrE=;
	b=oRfOIAIzJcCr2JVcboadkfv3DVj0kfDN+jUOGKs9gJzcm53BwITdqxDLarPYF5FOMKZMgS
	i35QGdSyhdzO/Ev7Q6tGDMr4SNFAKrJobvHGXmJgvRNDTjpl/RWuptOrp9SCydJvQDPKZ7
	YNQue8bDcp/nkzmeW/dMO79zK3CGXhw=
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
 <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
Date: Fri, 16 Apr 2021 16:20:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16.04.2021 15:41, Andrew Cooper wrote:
> On 16/04/2021 09:16, Jan Beulich wrote:
>> clang, at the very least, doesn't like unused inline functions, unless
>> their definitions live in a header.
>>
>> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I agree this will fix the build.  However, looking at the code, I'm not
> sure the original CONFIG_COMPAT was correct.  In particular, ...
> 
>>
>> --- a/xen/arch/x86/oprofile/backtrace.c
>> +++ b/xen/arch/x86/oprofile/backtrace.c
>> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
>>      return head->ebp;
>>  }
>>  
>> +#ifdef CONFIG_COMPAT
>>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>>  {
>>      if (is_hvm_vcpu(vcpu))
> 
> ... this chunk of logic demonstrates that what oprofile is doing isn't
> related to the Xen ABI in the slightest.
> 
> I think OProfile is misusing the guest handle infrastructure, and
> shouldn't be using it for this task.

I'm afraid I consider this something for another day. Both the
original #ifdef and the one getting added here are merely
measures to get things to build.

Jan

