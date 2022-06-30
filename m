Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A3562236
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 20:41:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358679.587982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z6D-0003O3-4n; Thu, 30 Jun 2022 18:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358679.587982; Thu, 30 Jun 2022 18:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z6D-0003M5-1c; Thu, 30 Jun 2022 18:41:09 +0000
Received: by outflank-mailman (input) for mailman id 358679;
 Thu, 30 Jun 2022 18:41:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6z6B-0003Lz-3k
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 18:41:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z6A-0002Zr-Nv; Thu, 30 Jun 2022 18:41:06 +0000
Received: from [54.239.6.182] (helo=[10.95.73.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z6A-0000nz-I2; Thu, 30 Jun 2022 18:41:06 +0000
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
	bh=oIjU8+M+d9QrrwfgrJY3gAoCaOODXXLEHfwbb9ZHaeA=; b=jYVnmmV0+PMkg5j/Jk4z12YNka
	DGlnHq3OM70iE13q7Gw+hs5ZBzF//oNF5JUAcNOaaC6MovBsx1gFqI3ndGrEcU0J4kUlnwPDEQCTj
	zz8Z5mhj7EKAqSuDyYafXsDqKEDVUFUYWxiA70Y4iOYDIHOtX1kX/sZX8qG7dv4saw3E=;
Message-ID: <d4c92197-2839-5daa-9bb3-32fa91ade7a0@xen.org>
Date: Thu, 30 Jun 2022 19:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220623074428.226719-1-dmitry.semenets@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 23/06/2022 08:44, dmitry.semenets@gmail.com wrote:
> From: Dmytro Semenets <dmytro_semenets@epam.com>
> 
> When shutting down (or rebooting) the platform, Xen will call stop_cpu()
> on all the CPUs but one. The last CPU will then request the system to
> shutdown/restart.
> 
> On platform using PSCI, stop_cpu() will call PSCI CPU off. Per the spec
> (section 5.5.2 DEN0022D.b), the call could return DENIED if the Trusted
> OS is resident on the CPU that is about to be turned off.
> 
> As Xen doesn't migrate off the trusted OS (which BTW may not be
> migratable), it would be possible to hit the panic().
> 
> In the ideal situation, Xen should migrate the trusted OS or make sure
> the CPU off is not called. However, when shutting down (or rebooting)
> the platform, it is pointless to try to turn off all the CPUs (per
> section 5.10.2, it is only required to put the core in a known state).
> 
> So solve the problem by open-coding stop_cpu() in halt_this_cpu() and
> not call PSCI CPU off.
> 
> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

