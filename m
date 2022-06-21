Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD8552D5B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 10:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353083.579986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZWa-00066s-Bc; Tue, 21 Jun 2022 08:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353083.579986; Tue, 21 Jun 2022 08:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZWa-00063s-8s; Tue, 21 Jun 2022 08:46:16 +0000
Received: by outflank-mailman (input) for mailman id 353083;
 Tue, 21 Jun 2022 08:46:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3ZWY-00063R-2n
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 08:46:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3ZWX-00008w-9l; Tue, 21 Jun 2022 08:46:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.3.84])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3ZWX-0005MX-2D; Tue, 21 Jun 2022 08:46:13 +0000
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
	bh=HlOat/p4kwftn399ugNMIQWLcsVVBpfn74a44hAsaAw=; b=BVR4enZeTKbdXSDYtX+kyUdRKF
	fFnGHpMfOPjzRyvdXBKD1cXlacSxihIV5148dAccgZ4NqhsFNDsuA1Cbnn+W4sR5idvL5u33GrfXz
	HIFWmMZBTdxCCEJo1AtB8zvECBo5TZWDvI3XkB9MMUvFcftczQtxppgHgontYwcCRUBA=;
Message-ID: <ddf91f3f-74d7-b21d-de40-679d786c137a@xen.org>
Date: Tue, 21 Jun 2022 09:46:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 5/9] include/public: Use explicitly specified types
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-6-michal.orzel@arm.com>
 <e91f6bd2-271c-12c1-ee7e-bea3d74c8beb@xen.org>
 <44179ffe-e3c4-d9ea-80fe-67cf7d946a34@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <44179ffe-e3c4-d9ea-80fe-67cf7d946a34@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/06/2022 09:43, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 20.06.2022 11:54, Julien Grall wrote:
>> Hi Michal,
>>
>> On 20/06/2022 08:02, Michal Orzel wrote:
>>> According to MISRA C 2012 Rule 8.1, types shall be explicitly
>>> specified. Fix all the findings reported by cppcheck with misra addon
>>> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
>>>
>>> Bump sysctl interface version.
>>
>> The sysctl version should only be bumped if the ABI has changed. AFAICT switching from "unsigned" to "unsigned" will not modify it, so I don't think this is necessary.
> 
> Sure, I can remove that in v2 but first I'd like to wait at least for xsm patch to be reviewed.
> Also as these patches are not dependent from each other, do you think it is worth respinning the reviewed ones?

I would suggest to wait until you get input on all the patches before 
respinning.

Cheers,

-- 
Julien Grall

