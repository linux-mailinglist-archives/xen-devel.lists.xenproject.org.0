Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 754AB7F721B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640532.998906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tno-0001nB-5X; Fri, 24 Nov 2023 10:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640532.998906; Fri, 24 Nov 2023 10:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tno-0001kw-2M; Fri, 24 Nov 2023 10:52:52 +0000
Received: by outflank-mailman (input) for mailman id 640532;
 Fri, 24 Nov 2023 10:52:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6Tnn-0001kp-1z
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:52:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6Tnl-00022a-NT; Fri, 24 Nov 2023 10:52:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6Tnl-0006po-E1; Fri, 24 Nov 2023 10:52:49 +0000
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
	bh=q7K8dfR8gSbFASqn0aUr1XHthWqYqM55v4sOETO3qVQ=; b=iIcz+rpa+fgMtLPvLN4gpv1yXR
	R28ZeD1rV9oj7bGsj/rTW1+CGaYw2LDELYsb7Lgq5iIaLGATK2wQ/F9kQSjJBbPsrz8D/fTJR+dBk
	yDS7NK4AuoaLFqG++m+rMUVmwHA58y1XQY+7EJ067c6UbMrkzXh/cuQ3qvPgf9cesEf0=;
Message-ID: <91beb976-1e77-42e1-9f03-13aba705670e@xen.org>
Date: Fri, 24 Nov 2023 10:52:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] xen/asm-generic: introduce stub header paging.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <01807c303ef000d6316f71bc4bad93d1b6c03830.1700221559.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <01807c303ef000d6316f71bc4bad93d1b6c03830.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 17/11/2023 12:24, Oleksii Kurochko wrote:
> The patch introduces generic paging.h header for Arm, PPC and
> RISC-V.
> 
> All mentioned above architectures use hardware virt extensions
> and hardware pagetable extensions thereby it makes sense to set
> paging_mode_translate and paging_mode_external by default.
> 
> Also in this patch Arm and PPC architectures are switched to
> generic paging.h header.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

