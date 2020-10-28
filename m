Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9904D29D180
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 19:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13820.34572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXqLz-0006b0-A2; Wed, 28 Oct 2020 18:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13820.34572; Wed, 28 Oct 2020 18:39:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXqLz-0006ab-6b; Wed, 28 Oct 2020 18:39:23 +0000
Received: by outflank-mailman (input) for mailman id 13820;
 Wed, 28 Oct 2020 18:39:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kXqLx-0006aW-VH
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 18:39:21 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0afda49f-1c62-46d1-b86e-99e3ff4b169f;
 Wed, 28 Oct 2020 18:39:20 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXqLs-0000gN-Q5; Wed, 28 Oct 2020 18:39:16 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXqLs-0001nJ-Ih; Wed, 28 Oct 2020 18:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kXqLx-0006aW-VH
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 18:39:21 +0000
X-Inumbo-ID: 0afda49f-1c62-46d1-b86e-99e3ff4b169f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0afda49f-1c62-46d1-b86e-99e3ff4b169f;
	Wed, 28 Oct 2020 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=lml6EC611nVUIyq5DR/FBiHXXR9rNBG5/vkviIFPhF0=; b=OhEg9PUL6p7GJ//NKN2df3rLx3
	Ju/DtVBar0DM7JswbdUQvntDnnGBLZ0aPGOwRpXUr4/e7xAcPKDk0Wl64cFhy3SZ/h0iWW8MKtt7G
	62auUSitfZjuGcyyn11O6qpcAL6qBR5yPNUDwpbOvHMe3XSF3ZGVcI9ujFVlmKR/ZlgM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXqLs-0000gN-Q5; Wed, 28 Oct 2020 18:39:16 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXqLs-0001nJ-Ih; Wed, 28 Oct 2020 18:39:16 +0000
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
 <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c6790d34-2893-78c4-d49f-7ef4acfceb96@xen.org>
Date: Wed, 28 Oct 2020 18:39:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 26/10/2020 16:21, Bertrand Marquis wrote:
> When a Cortex A57 processor is affected by CPU errata 832075, a guest
> not implementing the workaround for it could deadlock the system.
> Add a warning during boot informing the user that only trusted guests
> should be executed on the system.
> An equivalent warning is already given to the user by KVM on cores
> affected by this errata.
> 
> Also taint the hypervisor as unsecure when this errata applies and
> mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

If you don't need to resend the series, then I would be happy to fix the 
typo pointed out by George on commit.

Cheers,

-- 
Julien Grall

