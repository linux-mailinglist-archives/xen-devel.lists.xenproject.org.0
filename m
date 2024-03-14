Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33887BD3C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693207.1080988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkld-0004MN-4i; Thu, 14 Mar 2024 13:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693207.1080988; Thu, 14 Mar 2024 13:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkkld-0004K1-1y; Thu, 14 Mar 2024 13:05:05 +0000
Received: by outflank-mailman (input) for mailman id 693207;
 Thu, 14 Mar 2024 13:05:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rkklb-0004Jo-Rk
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:05:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkklb-0000FK-Gt; Thu, 14 Mar 2024 13:05:03 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rkklb-0002BL-9l; Thu, 14 Mar 2024 13:05:03 +0000
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
	bh=RMLE+8EQP3e1rIQFGir0fpapdmY+/+zZKLCMYIH65o0=; b=YXIX1BYv+z//xY2zYG3SNFqQ0M
	A45ztxEOKsDvxUItju+fGS7Pv3ERJuXEO8NlN0UZ6ogUIzJYE5E0URh1CUdobfKXv7NLztvIZSJ8S
	2I/FFu5hbNBqGNvxzE3xym9uqbZRZQUYloAwQkkun25EipVHJJyoNsxb073YWQvYaDd4=;
Message-ID: <8dfba9d5-8bed-4952-82a7-5ab41e74df16@xen.org>
Date: Thu, 14 Mar 2024 13:05:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v6 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com
References: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 07/03/2024 12:39, Ayan Kumar Halder wrote:
> Hi,
> 
> Refer https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
> for the previous discussion on this issue.
> 
> Also, the linux earlycon hvc driver has been fixed.
> See https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3
> 
> Changes from v1:-
> 1. Split the change across 3 patches as per the design consensus.
> 
> v2 :-
> 1. Reordered the patches.
> 
> v3 :-
> 1. Change mentioned in individual patches.
> 
> v4 :-
> 1. Change mentioned in individual patches.
> 
> v5 :-
> 1. Change mentioned in individual patches.
> 
> 
> Ayan Kumar Halder (2):
>    xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation"
>      cmd option
>    xen/arm: arm32: Add emulation of Debug Data Transfer Registers
> 
> Michal Orzel (1):
>    xen/arm: arm64: Add emulation of Debug Data Transfer Registers

I have committed the 3 patches.

Cheers,

-- 
Julien Grall

