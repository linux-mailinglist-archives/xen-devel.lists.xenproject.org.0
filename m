Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CA406D3E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 16:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184461.333111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOh4S-0006E9-OI; Fri, 10 Sep 2021 14:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184461.333111; Fri, 10 Sep 2021 14:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOh4S-0006Bo-KI; Fri, 10 Sep 2021 14:00:00 +0000
Received: by outflank-mailman (input) for mailman id 184461;
 Fri, 10 Sep 2021 13:59:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mOh4R-0006Bi-Gq
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:59:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOh4R-0008AB-9J; Fri, 10 Sep 2021 13:59:59 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mOh4R-00088J-2q; Fri, 10 Sep 2021 13:59:59 +0000
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
	MIME-Version:Date:Message-ID:From:Cc:References:To:Subject;
	bh=bpXAA5w1/r3kp0w3tt0UH+H9P70TI+xto0sCug+OWW4=; b=nIjnIBrp8Wgxvi+08Jr3STiWwn
	EcxQf9j9GOzM52pJR5d0Y+czG+HB3mvZM6hbZyQaCCg0LW8c0mHkxHiTT1iauGSdSqc3Y+6JgU8t+
	DPpp1EgdwrAZJQJwe3LbAZpDzYKvoiQsvlFYeD/+qizD33jpaQ0PtbszBb9zvKfFjrDs=;
Subject: Re: Xen Booting Problem on ARM Machine
To: Sai Kiran <ysaikiran1997@gmail.com>
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Julien Grall <julien@xen.org>
Message-ID: <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org>
Date: Fri, 10 Sep 2021 14:59:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 08/09/2021 11:43, Sai Kiran wrote:
> Hello,

Hi,

Thank you for the report. Moving the discussion back to xen-devel 
because this looks like a potential issue in the UEFI stub in Xen.

> I have Xen-4.15.0 on an ARM Machine, with Debian 11 installed on it.

Would you be able to give more details on the Arm machine you are using? 
Also, are you using ACPI or DT to boot?

>  I 
> am able to do “make world” and “make install”, after “./configure”, as 
> specified in README file. When I reboot the system, I get the following 
> message:
> 
> Warning: All 128 bootinfo mem banks exhausted.
> 
> Warning: All 128 bootinfo mem banks exhausted.

Hmmm... This means that you have more than 128 memory regions described 
in the EFI memory map. That's quite a lot.

Although, this should be harmless as it means Xen will not use the extra 
memory banks.

> 
> Cannot exit boot services: ErrCode: 0x8000000000000002

This means EFI_INVALID_PARAMETER. We have code to retry because AFAICT 
ExitBootServices() may sometime fails (I have CCed Jan may have more 
idea what's happening).

Would you be able to provide more details on the UEFI firmware you are 
using? Is it EDK2 or U-boot?

Also, do you know if Linux is boot on the same system?

However, AFAICT, the error message would not prevent Xen to continue 
booting. So you may get stuck later in the boot process.

My suggestion would be to enable earlyprintk for your platform. You can 
setup it up from the menuconfig in "Debugging Options".

> 
> Here is the snapshot of the error.

Please avoid posting image on the ML. Instead, if you need to do it, you 
can upload on a web server and provide the URL.

Best regards,

-- 
Julien Grall

