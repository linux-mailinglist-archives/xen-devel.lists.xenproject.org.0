Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C004026AD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180715.327482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXuv-0008Cr-8K; Tue, 07 Sep 2021 10:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180715.327482; Tue, 07 Sep 2021 10:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXuv-0008Ao-55; Tue, 07 Sep 2021 10:01:25 +0000
Received: by outflank-mailman (input) for mailman id 180715;
 Tue, 07 Sep 2021 10:01:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNXuu-0008Ai-0M
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:01:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNXul-00019S-DD; Tue, 07 Sep 2021 10:01:15 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNXul-0000A5-6A; Tue, 07 Sep 2021 10:01:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=PkCgRNrbFPgPtKA37oxT20cFd+oz/vvNiad1HjOCvq0=; b=GV/ghNPTj7NjTiTquDGTwIIuK3
	wHp+5s0AAtFICUwV6aX8CXeqpg8pNsNqw6jSWj0C248h9LtaaLOHaGk6rA11l5GW2uzkdB7kYFADy
	W6efVik1PCy1enFFxYA1QfdowzGGbOLUXpvl8qFaauFHQVxeJq1w2IcaRE35MvORsOTo=;
Subject: Re: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
 <9022cf38-532f-05bd-d78d-50f46cdbd8f5@xen.org>
 <4909CE53-15AE-4A6D-A32D-69B5E6AC6DDD@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <10505763-238a-1a9b-88cc-b19312a16e44@xen.org>
Date: Tue, 7 Sep 2021 11:01:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4909CE53-15AE-4A6D-A32D-69B5E6AC6DDD@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 19/08/2021 15:16, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

Sorry for the late reply.

>> On 19 Aug 2021, at 1:18 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 19/08/2021 13:02, Rahul Singh wrote:
>>> MSI code that implements MSI functionality to support MSI within XEN is
>>> not usable on ARM. Move the code under CONFIG_HAS_PCI_MSI flag to gate
>>
>> Can you clarify what you mean by not usable? Is it because we lack of support or we have no plan to use it?
> 
> We have no plan to use it. Code moved to CONFIG_HAS_PCI_MSI will only be required for ARM if we
I read "not usable", as the code doesn't yet work on Arm. This is quite 
possible, but from you wrote the main reason is that the code is not 
necessary yet (see below) on Arm.

> decide to support PCI device access (PCI MSI interrupt support) within XEN. As of now, we are planning
> to add support for PCI device access for DOM0/DOMU guests not for XEN.

This is probably going to happen sooner rather than later as, AFAICT, 
there are SMMUs out which signals using MSIs.

But, AFAICT, this code would also be used if we need to manage the MSIs 
in Xen on behalf of the guest (such as if the platform is using GICv2m).

That said, I would be fine with gating the MSI code behind a new config. 
However, I think the commit message wants to be clarified into why we 
don't need the option. Maybe something like:

"On Arm, the inital plan is to only support GICv3 ITS which doesn't 
require us to manage the MSIs because the HW will protect against 
spoofing. Introduce a new option XXXX to protect the MSI code.
"

Cheers,

-- 
Julien Grall

