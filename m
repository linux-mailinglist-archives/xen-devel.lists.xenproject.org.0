Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121F55533A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 20:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354283.581347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o44wy-0001Jr-Rh; Wed, 22 Jun 2022 18:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354283.581347; Wed, 22 Jun 2022 18:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o44wy-0001I4-Oc; Wed, 22 Jun 2022 18:19:36 +0000
Received: by outflank-mailman (input) for mailman id 354283;
 Wed, 22 Jun 2022 18:19:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o44wy-0001Hi-1V
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 18:19:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o44wx-0002QG-O1; Wed, 22 Jun 2022 18:19:35 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o44wx-0000kv-HY; Wed, 22 Jun 2022 18:19:35 +0000
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
	bh=sMmLDbagw6mTyFw2CQmeigXWnULd9umiFrBOldJUzQ0=; b=F3D43Qolmqousx6Ky4b52DQ1M1
	Zd9x8ofHU/+NNTE2sc4rcBiWSXSouBfFUSasiPb2ZPniAqJNSGrnhI9wdDklZ+aSdotRXgLwHHVph
	uAZdJMVTlRfshwKQQBJ2gxWgjMLSagVdTRqg5jgB0tLpEtrGytaFdW7krlYRjqg6cl00=;
Message-ID: <20c3fbe7-4e19-8a03-ffcf-8177e00b37cc@xen.org>
Date: Wed, 22 Jun 2022 19:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: arm: Spin-up cpu instead PSCI CPU OFF
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220622072410.87346-1-dmitry.semenets@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220622072410.87346-1-dmitry.semenets@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmytro,

Title: It seems to suggest we are completely removing PSCI CPU off. I 
would suggest to rename to:

xen/arm: Don't use stop_cpu() in halt_this_cpu()

On 22/06/2022 08:24, dmitry.semenets@gmail.com wrote:
> From: Dmytro Semenets <dmytro_semenets@epam.com>
> 
> Use spin-up cpu with disabled interrupts instead PSCI CPU OFF
> halt and reboot procedures. Some platforms can't stop CPU via PSCI
> because Thrusted OS can't migrate execution to other CPU.

There are some information missing:
  - What's the problem if we don't do that (i.e. Xen will panic())
  - Reference to the spec
  - Why this is fine to not use PSCI off

I would suggest the following commit message:

"
When shutting down (or rebooting) the platform, Xen will call stop_cpu() 
on all the CPUs but one. The last CPU will then request the system to 
shutdown/restart.

On platform using PSCI, stop_cpu() will call PSCI CPU off. Per the spec 
(section 5.5.2 DEN0022D.b), the call could return DENIED if the Trusted 
OS is resident on the CPU that is about to be turned off.

As Xen doesn't migrate off the trusted OS (which BTW may not be 
migratable), it would be possible to hit the panic().

In the ideal situation, Xen should migrate the trusted OS or make sure 
the CPU off is not called. However, when shutting down (or rebooting) 
the platform, it is pointless to try to turn off all the CPUs (per 
section 5.10.2, it is only required to put the core in a known state).

So solve the problem by open-coding stop_cpu() in halt_this_cpu() and 
not call PSCI CPU off.
"

I will give an opportunity for you, Bertrand and Stefano to answer 
before committing it.

Cheers,

-- 
Julien Grall

