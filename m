Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB5B224E1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078618.1439643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmZk-0000j1-Ud; Tue, 12 Aug 2025 10:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078618.1439643; Tue, 12 Aug 2025 10:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmZk-0000g9-Re; Tue, 12 Aug 2025 10:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1078618;
 Tue, 12 Aug 2025 10:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jpx=2Y=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ulmZj-0000g3-9K
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 10:49:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 11d5e012-776a-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 12:49:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347B325E1;
 Tue, 12 Aug 2025 03:49:41 -0700 (PDT)
Received: from PWQ0QT7DJ1.cambridge.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.37.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0D603F738;
 Tue, 12 Aug 2025 03:49:47 -0700 (PDT)
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
X-Inumbo-ID: 11d5e012-776a-11f0-a327-13f23c93f187
Date: Tue, 12 Aug 2025 11:49:46 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 2/2] arm/mpu: Disable map_domain_page for MPU
Message-ID: <jffvunpm5spistkt5b3y6rqyq2i7m7xcn3j4nz7bbm3sajvp4q@fbv6f2746bvl>
References: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
 <20250807174529.595577-3-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807174529.595577-3-ayan.kumar.halder@amd.com>

Hi Ayan,

> On Thu, Aug 07, 2025 at 06:45:29PM +0000, Ayan Kumar Halder wrote:
> There is no domheap for ARM_32. All of the RAM is mapped and VA == PA.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  xen/arch/arm/Kconfig           |  2 +-
>  xen/arch/arm/mpu/domain-page.c | 45 ----------------------------------
>  2 files changed, 1 insertion(+), 46 deletions(-)
>  delete mode 100644 xen/arch/arm/mpu/domain-page.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index a0c8160474..5355534f3d 100644
> --- a/xen/arch/arm/Kconfig

This patch is breaking ARM_32, MPU builds for me. I think this also needs:

```
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 50f8fe4326..4963c8b550 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
-obj-$(CONFIG_ARM_32) += domain-page.o
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += setup.init.o
 ```

Cheers,
Hari

