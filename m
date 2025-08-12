Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D6B2249F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078585.1439623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmHa-00061F-AI; Tue, 12 Aug 2025 10:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078585.1439623; Tue, 12 Aug 2025 10:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmHa-0005xh-77; Tue, 12 Aug 2025 10:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1078585;
 Tue, 12 Aug 2025 10:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jpx=2Y=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ulmHY-0005aV-Lv
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 10:31:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 72028ead-7767-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 12:31:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A8FC25E1;
 Tue, 12 Aug 2025 03:30:54 -0700 (PDT)
Received: from PWQ0QT7DJ1.cambridge.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.37.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 184493F738;
 Tue, 12 Aug 2025 03:31:00 -0700 (PDT)
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
X-Inumbo-ID: 72028ead-7767-11f0-a327-13f23c93f187
Date: Tue, 12 Aug 2025 11:30:59 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 1/2] arm/mpu: Enable is_xen_heap_page and co for ARM_32
Message-ID: <ka6nb4b7xnqdbumg5rtwudf2ybvsblw7lgs3lk3wz6czoji7k5@p37x2tochoph>
References: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
 <20250807174529.595577-2-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807174529.595577-2-ayan.kumar.halder@amd.com>

Hi Ayan,

> On Thu, Aug 07, 2025 at 06:45:28PM +0000, Ayan Kumar Halder wrote:
> In case of ARM_32, all of the RAM will be covered by a permanent contiguous
> mapping (where VA == PA) and there will be a single heap. Thus, the memory
> allocated from Xen heap uses PGC_xen_heap.
> This is similar to the scenario described for
> "CONFIG_SEPARATE_XENHEAP=n W/ DIRECT MAP OF ALL RAM" in common/page_alloc.c.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---

This patch breaks the build for ARM_32, CONFIG_MMU targets due to
multiple definition of `is_xen_heap_page` and `is_xen_heap_mfn`. The
pre-existing definitions are located at xen/arch/arm/include/asm/mmu/mm.h:30:9

Cheers,
Hari

