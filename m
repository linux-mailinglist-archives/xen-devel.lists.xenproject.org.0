Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3C286AD7E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686488.1068608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIEL-0004En-0U; Wed, 28 Feb 2024 11:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686488.1068608; Wed, 28 Feb 2024 11:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfIEK-0004DH-Tu; Wed, 28 Feb 2024 11:36:08 +0000
Received: by outflank-mailman (input) for mailman id 686488;
 Wed, 28 Feb 2024 11:36:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfIEJ-0004DB-6y
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:36:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfIEF-0000rW-Qh; Wed, 28 Feb 2024 11:36:03 +0000
Received: from [15.248.2.225] (helo=[10.45.19.69])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfIEF-0006pc-2X; Wed, 28 Feb 2024 11:36:03 +0000
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
	bh=CJg+MwqUmZhwkaRKDSIwjIPui01t1mOwbNVFxzVp/Ao=; b=KzWXJDAUcX/8jwgkiFAoVGRcBI
	LFKPNPvjP01jceFIPRFlNX2mVJMbQH9wCQ0YAddDvGJmfzLP4cByDg3gY7mkJI1n7fnv3hK9uc4FY
	ewy7o358Q1YleZq3EkhcKt1gZG7Sr2wxNMp0FQxU+RldPFMbMUwlWck+QBu1PihwAM1M=;
Message-ID: <bcae31fb-856d-4737-b780-f41b3e24cfa7@xen.org>
Date: Wed, 28 Feb 2024 11:36:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
 <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
 <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
 <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org>
 <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
 <alpine.DEB.2.22.394.2402271808410.575685@ubuntu-linux-20-04-desktop>
 <6af04933659178b3ccabc5caf646273c@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6af04933659178b3ccabc5caf646273c@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 28/02/2024 11:09, Nicola Vetrini wrote:
>> I asked Roberto if void casts are an option for compliance.
>>
> 
> void casts are an option for sure. The rationale for the rule explicitly 
> lists them as a compliance mechanism. An interesting aspect is what 
> would be the consensus around void casts on functions whose return value 
> is always ignored vs. functions whose return value is sometimes ignored.

If a return is always ignored, then the function should return void. For 
the second case, I think it will be on the case by case basis.

> 
>> In any case, I don't think we should use void casts in the specific
>> cases this patch is dealing with. Void casts (if anything) should be a
>> last resort while this patch fixes the issue in a better way.

+1.

Cheers,

-- 
Julien Grall

