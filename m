Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED94644E6D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 23:14:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455630.713158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gCx-0007J0-P6; Tue, 06 Dec 2022 22:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455630.713158; Tue, 06 Dec 2022 22:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gCx-0007Gj-MS; Tue, 06 Dec 2022 22:14:35 +0000
Received: by outflank-mailman (input) for mailman id 455630;
 Tue, 06 Dec 2022 22:14:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2gCw-0007Gb-5I
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 22:14:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gCv-00044O-KN; Tue, 06 Dec 2022 22:14:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gCv-0004ep-Ed; Tue, 06 Dec 2022 22:14:33 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=QPmQ7GaqsWWa3z7cgsWzMFnnaYSMse4NZTaoqnPMEpw=; b=oKzh9EYr+migoVODrJtJGaFMgU
	XttYtgrzpppZiTG4cZLyk3SilBQdw1KfxH7J8gmAdnVKycpJ0jiv7BdjsFSHxmZQOpqSdWRJYReDD
	aDMeAgN3figsQ1g/5Nx5GeZECgTyIWM1yFcLgYP+sUk0XUFNAw2s2AxNi/y13tW0UemM=;
Message-ID: <c1d22063-2953-f5cb-366a-eb2d04206a33@xen.org>
Date: Tue, 6 Dec 2022 22:14:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 16/19] xen/arm: Suspend/resume console on Xen
 suspend/resume
From: Julien Grall <julien@xen.org>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <a3dc2fe24f8f474a3976f4b307a693e359e910d5.1665137247.git.mykyta_poturai@epam.com>
 <1f9f127c-12de-fe4f-6280-8bd77c5da04e@xen.org>
In-Reply-To: <1f9f127c-12de-fe4f-6280-8bd77c5da04e@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2022 22:12, Julien Grall wrote:
> Hi,
> 
> On 07/10/2022 11:32, Mykyta Poturai wrote:
>> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>>
>> This is done using generic console_suspend/resume functions that cause
>> uart driver specific suspend/resume handlers to be called for each
>> initialized port (if the port has suspend/resume driver handlers
>> implemented).
> 
> Looking at the UART driver for Arm, most of them (if not all) implement 
> suspend/resume with BUG(). So don't you need to properly implement them?

I forgot to clarify. No need to implement for every driver. I am just 
puzzled how this was actually tested. What UART are you using on your 
platform?

Cheers,

-- 
Julien Grall

