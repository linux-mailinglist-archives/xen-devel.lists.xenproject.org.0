Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB9372A4C
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122270.230566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduQS-0005Vv-V2; Tue, 04 May 2021 12:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122270.230566; Tue, 04 May 2021 12:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduQS-0005VX-R1; Tue, 04 May 2021 12:45:20 +0000
Received: by outflank-mailman (input) for mailman id 122270;
 Tue, 04 May 2021 12:45:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lduQR-0005VQ-FB
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:45:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ecbd8d-6cb2-4cf1-9f43-0f0dcb8043ba;
 Tue, 04 May 2021 12:45:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D74C3AF21;
 Tue,  4 May 2021 12:45:17 +0000 (UTC)
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
X-Inumbo-ID: f8ecbd8d-6cb2-4cf1-9f43-0f0dcb8043ba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620132317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZRmz45DfhcROUIiTINUpEqr8mhThAOu9eoy8T3dNXc=;
	b=SJLZvKp+ixTW1QCIfXqbI9HSdDy+5krV6PCR2I29BNmerWAvfLZeSvSrPj59C3/3LuuOj7
	132gNIAPbCQhktWYIOv7LsApZut8a1Tv1kYEAe4RaLMQr3xTlX9s7bF52il3bcYSDN6jJz
	ZBX0YoPHPYv82nWMEr9YHFGbnnKfuJY=
Subject: Re: [PATCH 3/5] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-4-andrew.cooper3@citrix.com>
 <4deac8bb-3252-36e0-b728-b78c2132984b@suse.com>
 <0015b645-3e76-8a03-4a5f-b81edff43623@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b6e5904-eebe-b01b-119c-7dc7202d286d@suse.com>
Date: Tue, 4 May 2021 14:45:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0015b645-3e76-8a03-4a5f-b81edff43623@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 14:22, Andrew Cooper wrote:
> On 04/05/2021 13:20, Jan Beulich wrote:
>> On 03.05.2021 17:39, Andrew Cooper wrote:
>>> @@ -568,16 +568,38 @@ static unsigned int hw_uncompressed_size(uint64_t xcr0)
>>>      return size;
>>>  }
>>>  
>>> -/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
>>> -unsigned int xstate_ctxt_size(u64 xcr0)
>>> +unsigned int xstate_uncompressed_size(uint64_t xcr0)
>> Since you rewrite the function anyway, and since taking into account
>> the XSS-controlled features here is going to be necessary as well
>> (even if just down the road, but that's what your ultimate goal is
>> from all I can tell), how about renaming the parameter to "xstates"
>> or "states" at the same time?
> 
> I'm working on some cleanup of terminology, which I haven't posted yet.
> 
> For this one, I'm not sure.  For uncompressed size, we genuinely mean
> user states only.

Ah, yes - fair point.

Jan

