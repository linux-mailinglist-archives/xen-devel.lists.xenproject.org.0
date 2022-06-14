Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B893654AF1E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 13:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348820.575004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14UG-0008A7-KO; Tue, 14 Jun 2022 11:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348820.575004; Tue, 14 Jun 2022 11:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14UG-00087C-Hc; Tue, 14 Jun 2022 11:13:32 +0000
Received: by outflank-mailman (input) for mailman id 348820;
 Tue, 14 Jun 2022 11:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5YSJ=WV=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o14UF-000876-0u
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 11:13:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 000b2569-ebd3-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 13:13:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94231424;
 Tue, 14 Jun 2022 04:13:20 -0700 (PDT)
Received: from [10.57.11.30] (unknown [10.57.11.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 708563F73B;
 Tue, 14 Jun 2022 04:13:19 -0700 (PDT)
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
X-Inumbo-ID: 000b2569-ebd3-11ec-bd2c-47488cf2e6aa
Message-ID: <55f45337-2da1-fe8f-b7a5-272577ed4d50@arm.com>
Date: Tue, 14 Jun 2022 13:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: smpboot: Allocate the CPU sibling/core maps
 while preparing the CPU
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094119.94720-1-julien@xen.org>
 <f60bd88a-90bc-60a9-be72-aa533315c55f@arm.com>
 <3ed8e44f-293d-958f-c144-466e16d034e2@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <3ed8e44f-293d-958f-c144-466e16d034e2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14.06.2022 13:08, Julien Grall wrote:
>>> +    unsigned int rc = 0;
>> ... here you are setting rc to 0 even though it will be reassigned.
>> Furthermore, if rc is used only in case of CPU_UP_PREPARE, why not moving the definition there?
> 
> Because I forgot to replace "return NOTIFY_DONE;" with :
> 
> return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
That is what I thought.
With these fixes you can add my Rb.

> 
> In this case, we would need to initialize rc to 0 so it doesn't get used initialized.
> 
> Cheers,
> 

Cheers,
Michal

