Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F228F6F4454
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 14:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528578.821918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpWh-0005CA-0F; Tue, 02 May 2023 12:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528578.821918; Tue, 02 May 2023 12:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpWg-00059q-Tc; Tue, 02 May 2023 12:54:38 +0000
Received: by outflank-mailman (input) for mailman id 528578;
 Tue, 02 May 2023 12:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/wp=AX=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ptpWf-00059k-OE
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 12:54:37 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c5b8517-e8e8-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 14:54:35 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1683032061497608.2626436346678;
 Tue, 2 May 2023 05:54:21 -0700 (PDT)
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
X-Inumbo-ID: 7c5b8517-e8e8-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683032063; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l2XLGY8zcqX3D8x898GT/KRbeRTOt8BCSGyucgps7mCnsDadj6hWr0CfO/hz5mK2Q/sckMfz74mskfOoD2g9H8RGYfUzV8PbOcWO7HekAUawfjwnYFUElJ6I2AtD3/bVsDLYMaMNjLy1HcsYuFEHkfWilNF7/23bhOPVwjXh47c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683032063; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xgJzjqiynfOW2SuuA1mzX5zeflmOYIFlHVIvrgPOF+E=; 
	b=YZXVPBMgHa5R5rXlJvRTvpU6EtuCJulZEHyexO3BSj0lMqMib4kWO/FuA+bJTzv5SJVLGfM9nRUYMVn3YmQT4mlShQqu3kqU9Bx5l8KRF28KFs3jzueaJTZn/NH3AA4Z2Pn3FewFZN3yiCmQtiOIAfSW/nTWTcgyDIXl/Qlv0xM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683032063;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xgJzjqiynfOW2SuuA1mzX5zeflmOYIFlHVIvrgPOF+E=;
	b=s+2EMRcww57hKhnh0PlnkU/6CiOICPQWsr7Y/OzuojHyQG7qGjIhmH8WMS/j2w4L
	vRml+47d2iEIfSscqyxqdDRrRQ7cJEvwC+6wmyHRE9oA1FWLPEN3ORjqqwfPkwQihHD
	IBbDDkdr2aD3WQoT89j5q3HZE8H22XMzGU8f31uE=
Message-ID: <c333f02e-0655-50ec-aee8-7c1449ca267f@apertussolutions.com>
Date: Tue, 2 May 2023 08:54:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
 <22b2e03c-ac5e-915a-78a2-0a632b09a53a@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
In-Reply-To: <22b2e03c-ac5e-915a-78a2-0a632b09a53a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/2/23 06:59, Jan Beulich wrote:
> On 02.05.2023 12:43, Daniel P. Smith wrote:
>> On 5/2/23 03:17, Jan Beulich wrote:
>>> Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
>>> cause the operation to fail, in the loop here it ought to merely
>>> determine whether information for the domain at hand may be reported
>>> back. Therefore if on the last iteration the hook results in denial,
>>> this should not affect the sub-op's return value.
>>>
>>> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> The hook being able to deny access to data for certain domains means
>>> that no caller can assume to have a system-wide picture when holding the
>>> results.
>>>
>>> Wouldn't it make sense to permit the function to merely "count" domains?
>>> While racy in general (including in its present, "normal" mode of
>>> operation), within a tool stack this could be used as long as creation
>>> of new domains is suppressed between obtaining the count and then using
>>> it.
>>>
>>> In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
>>> issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.
>>>
>>
>> I understand there is a larger issue at play here but neutering the
>> security control/XSM check is not the answer. This literally changes the
>> way a FLASK policy that people currently have would be enforced, as well
>> as contrary to how they understand the access control that it provides.
>> Even though the code path does not fall under XSM maintainer, I would
>> NACK this patch. IMHO, it is better to find a solution that does not
>> abuse, misuse, or invalidate the purpose of the XSM calls.
>>
>> On a side note, I am a little concern that only one person thought to
>> include the XSM maintainer, or any of the XSM reviewers, onto a patch
>> and the discussion around a patch that clearly relates to XSM for us to
>> gauge the consequences of the patch. I am not assuming intentions here,
>> only wanting to raise the concern.
> 
> Well, yes, for the discussion items I could have remembered to include
> you. The code change itself, otoh, doesn't require your ack, even if it
> is the return value of an XSM function which was used wrongly here.

I beg to disagree, not that you could have, but that you should have. 
This is now the second XSM issue, that I am aware of at least, that 
myself and the XSM reviewers have been left out of. How and where the 
XSM hooks are deployed are critical to how XSM function, regardless of 
how mundane the change may be. By your logic, as the XSM maintainer I 
can make changes to the XSM code that changes how the system behaves for 
x86 and claim you have no Ack/Nack authority since it is XSM code. These 
subsystems are symbiotic, and we owe each other the due respect to 
include to the other when these systems touch or influence each other.

>> So for what it is worth, NACK.
> 
> I'm puzzled: I hope you don't mean NACK to the patch (or effectively
> Jürgen's identical one, which I had noticed only after sending mine).
> Yet beyond that I don't see anything here which could be NACKed. I've
> merely raised a couple of points for discussion.

I will comment on Jurgen's patch.

