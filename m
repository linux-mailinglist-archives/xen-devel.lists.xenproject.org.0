Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E134D1B04
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287040.486820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbCu-0001Rm-5p; Tue, 08 Mar 2022 14:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287040.486820; Tue, 08 Mar 2022 14:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbCu-0001Oq-2c; Tue, 08 Mar 2022 14:53:00 +0000
Received: by outflank-mailman (input) for mailman id 287040;
 Tue, 08 Mar 2022 14:52:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRbCs-0001Ok-Ii
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:52:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRbCs-0002lP-4V; Tue, 08 Mar 2022 14:52:58 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[10.95.172.145]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRbCr-0000kX-UC; Tue, 08 Mar 2022 14:52:58 +0000
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
	bh=xAGpVn6ICxxQqGruhypNuS2n0r7aqLv7IlkJ+aRhPa8=; b=onrB034/fBRiTJo/ZudiDrLA/l
	zC6IVE3AMJ1/rHIp5vLKY+Yrka//hcAIDdH5zjMBpe+Ya4l0xSNiHVEFljH4LBmjuIXspRalYBSXA
	wWvk2OIdkE2yxHL4W1oJdctjIW5G3zbHh916zOGRuxTcdP3b9ATEptNs6gVW99ZlnKHU=;
Message-ID: <3dcefa20-829a-ca13-941b-ede25ef81813@xen.org>
Date: Tue, 8 Mar 2022 14:52:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 0/2] livepatch: enable -f{function,data}-sections
 compiler option
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <20220308134924.83616-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220308134924.83616-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/03/2022 13:49, Roger Pau Monne wrote:
> Hello,
> 
> The content in v3 has been split in two patches, but is still mostly the
> same. The main difference is that first patch does a bit of cleanup of
> the build logic now that the header object file doesn't need to be the
> first one passed to the linker script.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (2):
>    xen/build: put image header into a separate section
>    livepatch: set -f{function,data}-sections compiler option

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com> # xen/arm

Cheers,

> 
>   xen/Kconfig                 |  4 +++
>   xen/Makefile                |  2 ++
>   xen/arch/arm/arch.mk        |  2 --
>   xen/arch/arm/arm32/Makefile |  3 +--
>   xen/arch/arm/arm32/head.S   |  1 +
>   xen/arch/arm/arm64/Makefile |  3 +--
>   xen/arch/arm/arm64/head.S   |  1 +
>   xen/arch/arm/xen.lds.S      | 49 ++++++++++++++++++++-----------------
>   xen/arch/x86/Makefile       |  5 ++--
>   xen/arch/x86/arch.mk        |  2 --
>   xen/arch/x86/boot/head.S    |  2 +-
>   xen/arch/x86/xen.lds.S      | 22 ++++++++++-------
>   xen/common/Kconfig          |  1 +
>   13 files changed, 54 insertions(+), 43 deletions(-)
> 

-- 
Julien Grall

