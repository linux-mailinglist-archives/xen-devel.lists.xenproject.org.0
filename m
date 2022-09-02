Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DE5AB4A7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 17:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397813.638503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU8F9-00088V-0e; Fri, 02 Sep 2022 15:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397813.638503; Fri, 02 Sep 2022 15:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU8F8-00085t-TY; Fri, 02 Sep 2022 15:06:02 +0000
Received: by outflank-mailman (input) for mailman id 397813;
 Fri, 02 Sep 2022 15:06:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oU8F7-00085k-NO
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 15:06:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU8F7-0000OV-E3; Fri, 02 Sep 2022 15:06:01 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.18.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU8F7-0005M0-7l; Fri, 02 Sep 2022 15:06:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=CMT3PrtV4pkKn9zo65fQvisjEOFSchSlF09kvmW09eQ=; b=3Uo7hhUp1h9Xpingc+riIpMvqE
	XX7et09tFcQQ1cWZ50JDHAXdB5xU/kQlQ5WfUfq7PMBQ1YeGp1XTOPpDo6c4Ti0Y/PNdAsgWjTAhq
	3b8HLUJIt0hUjOmTJQKlYpHWhvdrQGBY1XM0jxP9+hQQlpnP9ZPPubGWsAZTBcCwvTCA=;
Message-ID: <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
Date: Fri, 2 Sep 2022 16:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 02/09/2022 15:51, Bertrand Marquis wrote:
>> On 1 Sep 2022, at 19:15, Julien Grall <julien@xen.org> wrote:
>> AFAIU, it is not possible to have *_xenstore = true and *_enhanced = false. I think it would be clearer if ``dom0less_enhanced`` is turned to an enum with 3 values:
>> - None
>> - NOXENSTORE/BASIC
>> - FULLY_ENHANCED
>>
>> If we want to be future proof, I would use a field 'flags' where non-zero means enhanced. Each bit would indicate which features of Xen is exposed.
> 
> I think that could be a good solution if we do it this way:
> - define a dom0less feature field and have defines like the following:
> #define DOM0LESS_GNTTAB
> #define DOM0LESS_EVENTCHN
> #define DOM0LESS_XENSTORE >
> - define dom0less enhanced as the right combination:
> #define DOM0LESS_ENHANCED = (DOM0LESS_GNTTAB| DOM0LESS_EVENTCHN| DOM0LESS_XENSTORE)

I would rather introduce DOM0LESS_ENHANCED_BASIC (or similar) instead of 
defining a bit for gnttab and evtchn. This will avoid the question of 
why we are introducing bits for both features but not the hypercall...

As this is an internal interface, it would be easier to modify afterwards.

Cheers,

-- 
Julien Grall

