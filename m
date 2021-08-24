Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B19D3F5E60
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171322.312630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVqo-0001w4-4h; Tue, 24 Aug 2021 12:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171322.312630; Tue, 24 Aug 2021 12:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVqo-0001tp-1R; Tue, 24 Aug 2021 12:48:22 +0000
Received: by outflank-mailman (input) for mailman id 171322;
 Tue, 24 Aug 2021 12:48:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIVqm-0001tZ-8L
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:48:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVqf-0003JD-Il; Tue, 24 Aug 2021 12:48:13 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIVqf-000664-Cj; Tue, 24 Aug 2021 12:48:13 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=cnEuulBrOIjQKZLoOdzkzpcx19I/WHPHq0paK0dDiKk=; b=Jh5hzLSqjKJR8DDYAFKt4ND4pE
	u7CMNX0KWIf5dMk0ARxz8OM1sSlAlMt078flxBzyuaXYyprf36dqNI7qs5hqWwdavObxLBl/sofus
	gWAAG51EMX6MIMCxrnkyHOaUUCnD3Gqc+4XTaC9ugNd5gO+TthBQMROqBLoHJUXmRxRs=;
Subject: Re: [PATCH v3 6/6] x86: change asm/debugger.h to xen/debugger.h
To: Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <f341cf43ec2fb32a78d92265740e595f56fa76ae.1629315874.git.bobby.eshleman@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f0954c0c-f1cf-2102-bef0-d430fabab969@xen.org>
Date: Tue, 24 Aug 2021 13:48:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f341cf43ec2fb32a78d92265740e595f56fa76ae.1629315874.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 18/08/2021 21:29, Bobby Eshleman wrote:
> This commit allows non-x86 architecture to omit the file asm/debugger.h
> if they do not require it.  It changes debugger.h to be a general
> xen/debugger.h which, if CONFIG_CRASH_DEBUG, resolves to include
> asm/debugger.h.
> 
> It also changes all asm/debugger.h includes to xen/debugger.h.
> 
> Because it is no longer required, arm/debugger.h is removed.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> ---
> Changes in v3:
> - No longer introduces a fake TRAP_invalid_op for arm to consume, it
>    is not necessary given the removal of the arm calls now precedes
>    this patch.
> - Instead of defining prototypes that arch/ is expected to implement,
>    this version simply #includes <arch/debugger.h> when CONFIG_CRASH_DEBUG.
> 
>   xen/arch/x86/traps.c           |  2 +-
>   xen/common/domain.c            |  2 +-
>   xen/common/gdbstub.c           |  2 +-
>   xen/common/keyhandler.c        |  2 +-
>   xen/common/shutdown.c          |  2 +-
>   xen/drivers/char/console.c     |  2 +-
>   xen/include/asm-arm/debugger.h | 15 ----------

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

