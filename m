Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8F74825C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559056.873747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzyo-0008Fo-4j; Wed, 05 Jul 2023 10:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559056.873747; Wed, 05 Jul 2023 10:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzyo-0008EM-22; Wed, 05 Jul 2023 10:43:26 +0000
Received: by outflank-mailman (input) for mailman id 559056;
 Wed, 05 Jul 2023 10:43:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGzym-0008Dx-1D
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:43:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzyl-00056S-Lt; Wed, 05 Jul 2023 10:43:23 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGzyl-0000zE-Gt; Wed, 05 Jul 2023 10:43:23 +0000
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
	bh=gc7KcbLyyY64bpEe5vbHn6NHmmmDoyv+thNynPBDSD8=; b=FGRJ/z1c8y05CDQeeXNRz10J+c
	4duVc2jNSPpet3TlNcYeaj30rZJkH4hkVF+5Mh5OyGANrQcgXgfXLgu8moTJs4R1eJccAo1538IM3
	+sa8qc0SIvb3Kx9ciGB9WethQUb1Ji7I3ai295LvDDCMp7PyIcST1AjHcsJO3ZpqPh3I=;
Message-ID: <3e01a7bb-73ff-9363-29e3-e4882cd03e37@xen.org>
Date: Wed, 5 Jul 2023 11:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 08/52] xen/arm64: move MMU related code from head.S to
 mmu/head.S
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-9-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

One more remark.

On 26/06/2023 04:33, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> There are lots of MMU specific code in head.S. This code will not
> be used in MPU systems. If we use #ifdef to gate them, the code
> will become messy and hard to maintain. So we move MMU related
> code to mmu/head.S, and keep common code still in head.S. We also
> add .text.idmap in mmu/head.S to make all code in this new file
> are still in identity map page but will be linked after head.S.
> 
> As "fail" in head.S is very simple and this name is too easy to
> be conflicted, so duplicate it in mmu/head.S instead of exporting
> it.
> 
> And some assembly macros that will be shared by MMU and MPU later,
> we move them to macros.h.
> 
> Rename enable_boot_mmu()/enable_runtime_mmu() to a more generic name
> enable_boot_mm()/enable_runtime_mm(), in order to make them common interfaces
> to be used for both MMU and later MPU system.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> 1. Move macros to macros.h
> 2. Remove the indention modification
> 3. Duplicate "fail" instead of exporting it.
> ---
> v3:
> - Rename enable_boot_mmu()/enable_runtime_mmu() to a more generic name
> enable_boot_mm()/enable_runtime_mm()
> ---
>   xen/arch/arm/arm64/Makefile             |   3 +
>   xen/arch/arm/arm64/head.S               | 469 +-----------------------
>   xen/arch/arm/arm64/mmu/head.S           | 453 +++++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/macros.h |  51 +++
>   4 files changed, 509 insertions(+), 467 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/mmu/head.S
> 
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 54ad55c75c..0c4b177be9 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -8,6 +8,9 @@ obj-y += domctl.o
>   obj-y += domain.o
>   obj-y += entry.o
>   obj-y += head.o
> +ifeq ($(CONFIG_HAS_MMU),y)
> +obj-y += mmu/head.o
> +endif

You could use obj-$(CONFIG_HAS_MMU) += mmu/head.o.

But in this case, I would rather prefer if we match how other 
subdirectory are added. I.e. on the parent's directory Makefile you add:

obj-$(CONFIG_MMU) += mmu/

And in the directory you add a Makefile which list the files to compile.

Cheers,

-- 
Julien Grall

