Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65DA336D61
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 08:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96359.182208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGDV-0003m7-Rg; Thu, 11 Mar 2021 07:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96359.182208; Thu, 11 Mar 2021 07:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKGDV-0003li-Op; Thu, 11 Mar 2021 07:58:45 +0000
Received: by outflank-mailman (input) for mailman id 96359;
 Thu, 11 Mar 2021 07:58:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKGDU-0003lc-6G
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 07:58:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a6d6b2a-e0c6-45b0-a5bc-588d99917373;
 Thu, 11 Mar 2021 07:58:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C39A2AB8C;
 Thu, 11 Mar 2021 07:58:42 +0000 (UTC)
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
X-Inumbo-ID: 7a6d6b2a-e0c6-45b0-a5bc-588d99917373
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615449522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sM1SZv8SLDv9D8MHB1KS7Qpx2wQarvOqqTsIfJ4GZ80=;
	b=Pv1wMDwSOdbWiM0SKlB4lrvwhAVzlNsqHledva6ndISE+9/FDuJ4dGIwNOd6/3pHA60bb6
	f/10sbfCx7Jf+ULgwC0jx706I5jRGVZDvTnPhCBxZdtImjXBJ/dRTCXSEXMa62GK8rwenW
	Vp+dajAndPpY0kyTEE5Qt4KsGlwbTcI=
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d457101c-0f3b-0eb8-a99a-ff7c969b7865@suse.com>
Date: Thu, 11 Mar 2021 08:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.03.2021 18:22, Andrew Cooper wrote:
> On 10/03/2021 17:12, Jan Beulich wrote:
>> On 10.03.2021 16:07, Andrew Cooper wrote:
>>> --- a/docs/designs/dmop.pandoc
>>> +++ b/docs/designs/dmop.pandoc
>>> @@ -4,9 +4,13 @@ DMOP
>>>  Introduction
>>>  ------------
>>>  
>>> -The aim of DMOP is to prevent a compromised device model from compromising
>>> -domains other than the one it is providing emulation for (which is therefore
>>> -likely already compromised).
>>> +The DMOP hypercall has a new ABI design to solve problems in the Xen
>>> +ecosystem.  First, the ABI is fully stable, to reduce the coupling between
>>> +device models and the version of Xen.
>>> +
>>> +Secondly, for device models in userspace, the ABI is designed specifically to
>>> +allow a kernel to audit the memory ranges used, without having to know the
>>> +internal structure of sub-ops.
>> I appreciate the editing, but the cited points still don't justify ...
>>
>>> --- a/xen/include/public/hvm/dm_op.h
>>> +++ b/xen/include/public/hvm/dm_op.h
>>> @@ -25,9 +25,6 @@
>>>  #define __XEN_PUBLIC_HVM_DM_OP_H__
>>>  
>>>  #include "../xen.h"
>>> -
>>> -#if defined(__XEN__) || defined(__XEN_TOOLS__)
>>> -
>>>  #include "../event_channel.h"
>>>  
>>>  #ifndef uint64_aligned_t
>>> @@ -491,8 +488,6 @@ struct xen_dm_op {
>>>      } u;
>>>  };
>>>  
>>> -#endif /* __XEN__ || __XEN_TOOLS__ */
>>> -
>>>  struct xen_dm_op_buf {
>>>      XEN_GUEST_HANDLE(void) h;
>>>      xen_ulong_t size;
>> ... this removal: What the kernel needs for its auditing (your 2nd
>> point) is already outside of this guarded region, as you can see
>> from the context above. You said there was a design goal of allowing
>> use of this interface by (and not only through) the kernel, e.g. by
>> a kernel module (which I don't think you mean to be covered by
>> "device models"). If that was indeed a goal (Paul - can you confirm
>> this?), this would now want listing as a 3rd item. Without such a
>> statement I'd call it a bug to not have the guards there, and hence
>> might either feel tempted myself to add them back at some point, or
>> would ack a patch doing so.
> 
> Xen has absolutely no business dictating stuff like this.  It is an
> internal and opaque property of the domain if the hypercalls happen to
> originate from logic in user mode or kernel mode.  Stubdomains would
> fall into the same "kernel" category as xengt in the dom0 i915 driver.

There's imo a good reason to prevent kernel to use e.g. sysctl and
domctl. Those are unstable interfaces, yes, but still.

> However, the actual bug I'm trying to fix with this is the need for
> userspace, which doesn't link against libxc, to do
> 
> #define __XEN_TOOLS__
> #include <xendevicemodel.h>
> 
> to be able to use the libxendevicemodel stable library.
> 
> The __XEN_TOOLS__ guard is buggy even ignoring the kernel device model
> aspect.

Aiui to address this all that would be needed would be to move the
one typedef out of the guarded region.

Jan

