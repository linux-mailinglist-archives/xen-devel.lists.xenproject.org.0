Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67EB36D49D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119120.225478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgHT-0008MN-SA; Wed, 28 Apr 2021 09:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119120.225478; Wed, 28 Apr 2021 09:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgHT-0008Ly-On; Wed, 28 Apr 2021 09:14:51 +0000
Received: by outflank-mailman (input) for mailman id 119120;
 Wed, 28 Apr 2021 09:14:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbgHS-0008Lt-MU
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:14:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ff1838f-8620-43ce-8348-a1ed51a8e037;
 Wed, 28 Apr 2021 09:14:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 465B1AC38;
 Wed, 28 Apr 2021 09:14:49 +0000 (UTC)
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
X-Inumbo-ID: 8ff1838f-8620-43ce-8348-a1ed51a8e037
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619601289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlW2cejnmqsgFc6rvuekdCqxwXni4EEycvzeQ0FUllw=;
	b=ImBUOGVnUR2eByjdCnl9xdwdF0MnrrcjyVS4kvL0pDmCGTyjL4Pi1E4/hD6g4t9MJDTgB5
	iPrPJs0YuTxn1WUZ99otLY2ON/vkZYp9UD4t42AMEe/TxR9ML4aKTR2yduIIaDykh0K/lu
	WxidbiQDE4oNICrJ67C461DYcXmd/P4=
Subject: Re: [PATCH 2/3] x86/svm: Enumeration for CET
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-3-andrew.cooper3@citrix.com>
 <a5d73b34-8200-ae0c-6c91-252ad2812f3d@suse.com>
 <f50d2a46-ef8b-d867-4773-aa291586e26c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <55c50b27-e8cc-873e-e768-7e9dec6f06a0@suse.com>
Date: Wed, 28 Apr 2021 11:14:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f50d2a46-ef8b-d867-4773-aa291586e26c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.04.2021 19:47, Andrew Cooper wrote:
> On 27/04/2021 16:53, Jan Beulich wrote:
>> On 26.04.2021 19:54, Andrew Cooper wrote:
>>> @@ -497,7 +501,9 @@ struct vmcb_struct {
>>>      u64 rip;
>>>      u64 res14[11];
>>>      u64 rsp;
>>> -    u64 res15[3];
>>> +    u64 _msr_s_cet;             /* offset 0x400 + 0x1E0 - cleanbit 12 */
>>> +    u64 _ssp;                   /* offset 0x400 + 0x1E8   | */
>>> +    u64 _msr_isst;              /* offset 0x400 + 0x1F0   v */
>>>      u64 rax;
>>>      u64 star;
>>>      u64 lstar;
>> Any reason for the leading underscores, when none of the neighboring
>> fields have such?
> 
> Yes - they're covered by a cleanbit, and for better or worse, this is
> our style.

The underscore prefixes are, to my understanding, there only to
emphasize that the fields shouldn't be accessed directly, but ...

>> Did you perhaps mean to add VMCB_ACCESSORS()
>> instances for them?
> 
> TBH, I opencoded the cleanbit handling because I thoroughly hate that
> entire infrastructure.

... via this (or something with similar abstracting effect). So
for any fields you mean to access directly they imo shouldn't be
there. I particularly don't view them as indicators of being
covered by cleanbits (if the respective accessors aren't used).

Jan

