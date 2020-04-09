Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65411A309A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 10:01:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMS7s-0004wV-0r; Thu, 09 Apr 2020 08:01:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhrS=5Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMS7q-0004wN-EM
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 08:01:26 +0000
X-Inumbo-ID: 4f5fa116-7a38-11ea-8297-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f5fa116-7a38-11ea-8297-12813bfff9fa;
 Thu, 09 Apr 2020 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c8bafAo2f3ikeNGrWsY9uPFP69WXt7upLB6rKy3D7zs=; b=wvW9OZXPJ/a+8KOzmfs6e0+fVb
 akVjaMsiXNiDbK1FOxbNl6RkACpu5R6PIusgsMNxFRtLlWcfmijUPtUKHKkvcCHoT6lzbXFkLXEOb
 ExRt7d4siEZHVh6aRHfHSqN1BN6n8XQx6OfZ0rjOQeuAO7tosG5GrFVQ56c8id5Za46I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMS7n-00082t-4a; Thu, 09 Apr 2020 08:01:23 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMS7m-00042X-Sw; Thu, 09 Apr 2020 08:01:23 +0000
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
 <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
 <041a9f9f-cc9e-eac5-cdd2-555fb1c88e6f@xen.org>
 <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c8e66108-7ac1-fb51-841f-21886b731f04@xen.org>
Date: Thu, 9 Apr 2020 09:01:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cf6c0e0b-ade0-587f-ea0e-80b02b21b1a9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 09/04/2020 07:30, Jan Beulich wrote:
> On 09.04.2020 00:05, Julien Grall wrote:
>> Hi Jan,
>>
>> On 07/04/2020 09:14, Jan Beulich wrote:
>>> On 04.04.2020 15:10, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Most of the helpers to access guest memory are implemented the same way
>>>> on Arm and x86. The only differences are:
>>>>       - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
>>>>         and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
>>>>         is still fine to use the Arm implementation on x86.
>>>>       - __clear_guest_offset(): Interestingly the prototype does not match
>>>>         between the x86 and Arm. However, the Arm one is bogus. So the x86
>>>>         implementation can be used.
>>>>       - guest_handle{,_subrange}_okay(): They are validly differing
>>>>         because Arm is only supporting auto-translated guest and therefore
>>>>         handles are always valid.
>>>
>>> While I'm fine in principle with such consolidation, I'm afraid I
>>> really need to ask for some historical background to be added
>>> here. It may very well be that there's a reason for the separation
>>> (likely to be found in the removed ia64 or ppc ports), which may
>>> then provide a hint at why future ports may want to have these
>>> separated. If such reasons exist, I'd prefer to avoid the back and
>>> forth between headers. What we could do in such a case is borrow
>>> Linux'es asm-generic/ concept, and move the "typical"
>>> implementation there. (And of course if there were no noticable
>>> reasons for the split, the change as it is would be fine in
>>> general; saying so without having looked at the details of it,
>>> yet).
>>
>> Looking at the history, ia64 and ppc used to include a common
>> header called xen/xencomm.h from asm/guest_access.h.
>>
>> This has now disappeared with the removal of the two ports.
>>
>> Regarding future arch, the fact arm and x86 gives me some confidence
>> we are unlikely going to get a new ABI for an arch. Do you see any
>> reason to?
> 
> Well, there surely had be a reason for ia64 and ppc to use a
> different approach. 

This was introduced way before my time in Xen. AFAICT, you were already 
part of the community when 'xencomm' were alive.

There are not much information about it only nor in the commits. So do 
you mind sharing a bit more what 'xencomm' meant to be and why it wasn't 
introduced on x86?

> I don't see why a new port may not also want
> to go that route instead of the x86/Arm one.
I could accept that someone would want to reinvent a new ABI from 
scratch for just an hypothetical new arch. However it would be quite an 
effort to reinvent XEN_GUEST_HANDLE(). The chance is RISC-V is only 
going to re-use what Arm did as Arm already did with x86.

I would like to avoid to introduce a new directory asm-generic with just 
one header in it. Maybe you have some other headers in mind?

Cheers,

-- 
Julien Grall

