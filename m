Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462237D0A84
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 10:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619704.965231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtks0-0000pK-Ui; Fri, 20 Oct 2023 08:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619704.965231; Fri, 20 Oct 2023 08:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtks0-0000my-Rn; Fri, 20 Oct 2023 08:28:36 +0000
Received: by outflank-mailman (input) for mailman id 619704;
 Fri, 20 Oct 2023 08:28:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtkrz-0000mq-8R
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 08:28:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtkry-0004C5-HP; Fri, 20 Oct 2023 08:28:34 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.95.107.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtkry-0001SL-9n; Fri, 20 Oct 2023 08:28:34 +0000
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
	bh=to5RS7dbQcFB8aoAFh8r5uIcREVEtoyvAyWFcjTFZQg=; b=C2QV/YJNxcaJynbj+o4X+Gbt7C
	bmPfwLEE/gL8zvilqMfv1FkVL77ZM1wqIEWjGNppor539FTd/O1yiCLfa2wfVPq46IGwvRmSOGafJ
	vnhTshHqj5fjXyxtn3DcwgE02Sgo/JHvtThbUVp9m/QP485i0q/Zy62ujVGBfZtyjSzA=;
Message-ID: <fe61e283-93f7-4718-bc8d-d1df160f753c@xen.org>
Date: Fri, 20 Oct 2023 09:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule
 13.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
 <41d82896-5471-4eaa-8bdd-a192e28d5546@xen.org>
 <3de5e340-30bb-44aa-affd-89f343ed1fa1@bugseng.com>
 <7066a646-711c-4dce-f3c0-effb6ae91a39@xen.org>
 <67782815-7803-4ef5-80f4-db6181f7a6e2@bugseng.com>
 <15923aaf-c005-45fb-8bb4-50d2e0995f18@xen.org>
 <8734535a-0c00-44b4-8257-64155807b052@bugseng.com>
 <edc5d2b1-a3bd-44c4-83ea-6ff436fe7346@xen.org>
 <d6af702c-9945-4eea-a102-96910be334dc@bugseng.com>
 <alpine.DEB.2.22.394.2310191128560.2099202@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310191128560.2099202@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/10/2023 19:30, Stefano Stabellini wrote:
>>> We usually use this trick when 'current' is used multiple time to save
>>> process (using 'current' is not cost free). But in this case, this is
>>> renaming without any apparent benefits.
>>>
>>> If we wanted to go down this route, then this would likely want a comment.
>>> At which point we should just deviate.
>>>
>>> I will have a think if there are something else we can do. Could we consider
>>> to not address it for now?
>>>
>>
>> I totally agree.
> 
> I am wondering if we could deviate "current" because even with the
> implementation using volatile we know it doesn't have "side effects" in
> the sense of changing things for other code outside the function.

I will let Simone to confirm whether it is possible to do it from a 
technical point of view.

Leaving the technical part aside, is the only violations are the one in 
this patch? If so, I don't think it makes sense to deviate 'current' 
globally. It would be better to have local deviations.

Cheers,

-- 
Julien Grall

