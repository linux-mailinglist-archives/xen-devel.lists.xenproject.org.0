Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB5525EAB
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 11:24:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328320.551321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npRWw-0001RE-7R; Fri, 13 May 2022 09:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328320.551321; Fri, 13 May 2022 09:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npRWw-0001Nx-4M; Fri, 13 May 2022 09:24:14 +0000
Received: by outflank-mailman (input) for mailman id 328320;
 Fri, 13 May 2022 09:24:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npRWu-0001Nr-4T
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 09:24:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npRWr-0004E9-Iz; Fri, 13 May 2022 09:24:09 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.8.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npRWr-0001wD-Cz; Fri, 13 May 2022 09:24:09 +0000
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
	bh=99W2h36Q0Kwvylfm3MqROP61WcB89pjN9hPAnx0yvDQ=; b=Apuqg4Fh/5ofrojk4SWb/kup6s
	sRI/xGhUFBGymSxA75hid3yuuhYm75hzVWojqXseteHPS5C+jQUPLNCbJ9oeh0EkAMpiSDBIkOLNy
	iESbSG9SnqOcyOGxyulxIs/g4iuyBGdHWL/lfDe3cySVtwmvwRbVMXisP1CpmnknzcQg=;
Message-ID: <7f89af03-66d2-9c59-a761-4c8a188570d9@xen.org>
Date: Fri, 13 May 2022 10:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
 <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
 <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org>
 <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com>
 <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
 <alpine.DEB.2.22.394.2205121823320.3842@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2205121823320.3842@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/05/2022 02:23, Stefano Stabellini wrote:
> On Wed, 11 May 2022, Julien Grall wrote:
>>> If dom0 is mandatory yes, we should still make sure that this code cannot be
>>> reached so an ASSERT would be nice here at least in case someone tries to
>>> activate this code without dom0 (which might happen when we will push the
>>> serie for static event channels).
>>
>> I am fine with an ASSERT().
> 
> I added an ASSERT(hardware_domain).

Just to clarify and avoid a round trip. The ASSERT() is not sufficient 
here. We also need to forbid the user to set xen,enhanced when the HW 
domain is not NULL, at least until Rahul's pre-allocated event channel 
series.

This check would have to be done when parsing the configuration. The 
ASSERT() would be here to ensure that if someone is reworking the 
parsing, it would get caught nicely rather than a NULL dereference.

Cheers,

-- 
Julien Grall

