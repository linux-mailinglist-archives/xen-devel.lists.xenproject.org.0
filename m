Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC34466207
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 12:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236477.410217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjuM-000567-PX; Thu, 02 Dec 2021 11:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236477.410217; Thu, 02 Dec 2021 11:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msjuM-00053q-Li; Thu, 02 Dec 2021 11:05:46 +0000
Received: by outflank-mailman (input) for mailman id 236477;
 Thu, 02 Dec 2021 11:05:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msjuK-00053k-Ps
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 11:05:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msjuE-0007db-W3; Thu, 02 Dec 2021 11:05:38 +0000
Received: from [54.239.6.189] (helo=[10.7.236.17])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msjuE-0004T8-Pk; Thu, 02 Dec 2021 11:05:38 +0000
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
	bh=s7sTD8TxLfHKHlZjLn8Pk2IGql0axUbDITPRbB1SkeA=; b=kLp7ylgHZmusa2B5VuH72Awb3b
	gF0FzOKQ9VoTghs22YPXEWs4x1F7d3Ohdm3XN5LIunWGYZ3yOLHZFpfnxarI5YKWKw5Rs8WSPUOKM
	jJs83Er/w3YnVvj8qHKghJy2tHCLan8TKPTtMyMS2Pk/vu984jONDpS5hZ0C9Rs+CRrA=;
Message-ID: <0a99add9-da28-a116-e859-5a713a7c7f43@xen.org>
Date: Thu, 2 Dec 2021 11:05:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <b6eeab97-90ed-85f8-79ea-ac86e912dc43@xen.org>
 <09847780-10b4-5b14-b15f-d82597fa8b3e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <09847780-10b4-5b14-b15f-d82597fa8b3e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/12/2021 10:12, Jan Beulich wrote:
> On 02.12.2021 10:09, Julien Grall wrote:
>> Hi Jan,
>>
>> On 13/09/2021 07:41, Jan Beulich wrote:
>>> Without holding appropriate locks, attempting to remove a prior mapping
>>> of the underlying page is pointless, as the same (or another) mapping
>>> could be re-established by a parallel request on another vCPU. Move the
>>> code to Arm's gnttab_set_frame_gfn(). Of course this new placement
>>> doesn't improve things in any way as far as the security of grant status
>>> frame mappings goes (see XSA-379). Proper locking would be needed here
>>> to allow status frames to be mapped securely.
>>>
>>> In turn this then requires replacing the other use in
>>> gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
>>> x86's gnttab_set_frame_gfn(). Note that with proper locking inside
>>> guest_physmap_remove_page() combined with checking the GFN's mapping
>>> there against the passed in MFN, there then is no issue with the
>>> involved multiple gnttab_set_frame_gfn()-s potentially returning varying
>>> values (due to a racing XENMAPSPACE_grant_table request).
>>>
>>> This, as a side effect, does away with gnttab_map_frame() having a local
>>> variable "gfn" which shadows a function parameter of the same name.
>>>
>>> Together with XSA-379 this points out that XSA-255's addition to
>>> gnttab_map_frame() was really useless.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> As discussed in the thread, I expect the Arm part to be simplified after
>> Oleksandr's series. So for the Arm part:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks, but let me ask for a clarification: Explicitly just the Arm part,
> or also the common code change? I ask because from the x86 side I already
> have an ack by Roger, but strictly speaking that doesn't cover common
> code.

Ah, I thought Roger gave a reviewed-by and therefore from the check-in 
policy be sufficient. The common parts look also fine to me. So feel 
free to extend my acked-by to include the common code.

Cheers,

-- 
Julien Grall

