Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1598C283CB
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 18:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155084.1484672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFFHh-0003b9-UD; Sat, 01 Nov 2025 17:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155084.1484672; Sat, 01 Nov 2025 17:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFFHh-0003Yq-RJ; Sat, 01 Nov 2025 17:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1155084;
 Sat, 01 Nov 2025 17:21:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vFFHg-0003Yk-Hn
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 17:21:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vFFHe-00Djx9-18;
 Sat, 01 Nov 2025 17:20:58 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vFFHe-003gFL-0z;
 Sat, 01 Nov 2025 17:20:58 +0000
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
	bh=ppN5spUnByiaotRnYsiz8W6Po7g08zwtVOPW0Jfjhdw=; b=PwyZPdIWhstUE0kXJZ0NnOJYAm
	OJgXa+FFgTB7Znv5YKPDqmuyyepIAJycqomc5Jkxrrbb3Ctb8BwogMK4SAlWvmqUNSrDt1gIzqL8Y
	3xV0+qehYL7DI7HPQ5n2lQw0wL25r0gski4nxRhp8JVrO/+x+nNgCtZzkRzRG3H56QxY=;
Message-ID: <29c554de-2429-4c2e-bf87-a0e32fa461e0@xen.org>
Date: Sat, 1 Nov 2025 17:20:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Limitations for Running Xen on KVM Arm64
Content-Language: en-GB
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: haseeb.ashraf@siemens.com,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <KL1PR0601MB4588D25A95D680640A80F2CAE6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <KL1PR0601MB45885505ECBBE9262C2B25E0E6FBA@KL1PR0601MB4588.apcprd06.prod.outlook.com>
 <FC5C66FD-8554-4F46-8546-B27DE76C8EEF@unpredictable.fr>
 <2b00a98f-6fee-4341-92bd-25909ebb6e36@xen.org>
 <CA753BD2-31FA-480D-B32A-2125F0F4981D@unpredictable.fr>
 <fc181349-d743-4ef0-bcd2-01c04d2a463e@xen.org>
 <0C76C261-783D-4503-B929-4B48CDEC8841@unpredictable.fr>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0C76C261-783D-4503-B929-4B48CDEC8841@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 31/10/2025 11:54, Mohamed Mediouni wrote:
>> Per the Arm Arm each CPU have their own private TLBs. So we have to flush between vCPU of the same domains to avoid translations from vCPU 1 to "leak" to the vCPU 2 (they may have confliected page-tables).
> Hm… it varies on whether the VM uses CnP or not (and whether the HW supports it)… (Linux does…)

Skimming through the Arm Arm, it seems that CnP is a per page-table/ASID 
decision. So I think it would be difficult to take advantage of this 
knowlege in Xen unless we start trapping access to TTBRn_EL1 which is 
likely going to be expensive.

Obviously, if someone trusts and knows their VM then they could rely
on it. But that's not something I would want to accept in upstream
Xen at the moment.

>> KVM has a similar logic see "last_vcpu_ran" and "__kvm_flush_cpu_context()". That said... they are using "vmalle1" whereas we are using "vmalls12e1". So maybe we can relax it. Not sure if this would make any difference for the performance though.
> vmalle1 avoids the problem here (because it only invalidates stage-1 translations).

I saw Haseeb provided some good numbers. I think switching to vmalle1 is 
a no brainer.

Cheers,

-- 
Julien Grall


