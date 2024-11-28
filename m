Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BC9DBC68
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 20:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845605.1260962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGjwT-0002X0-Cs; Thu, 28 Nov 2024 19:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845605.1260962; Thu, 28 Nov 2024 19:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGjwT-0002UU-9z; Thu, 28 Nov 2024 19:12:45 +0000
Received: by outflank-mailman (input) for mailman id 845605;
 Thu, 28 Nov 2024 19:12:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tGjwS-0002UO-9d
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 19:12:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGjwR-00A7oY-2K;
 Thu, 28 Nov 2024 19:12:44 +0000
Received: from [2a02:8012:3a1:0:1024:27fc:e73a:2414]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGjwR-00B11p-2i;
 Thu, 28 Nov 2024 19:12:43 +0000
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
	bh=bd+yrVeOOjO/1CAeWits6ETh43t9T+oZdIJwS6ygI1E=; b=3r1lPDMf/BjGN6mt4BdSxgARhq
	1ox86k2wLNwx0sMIy1RPSi+urbbZO7Ce9J7as92aiZSo621Y2x2cvaBdQiX5Iz+syCu3dq/cPPIn2
	jg5Aj5JHHq+YQuN6VuVFxZdWcZI55TdAJ9TuCV1bhb2YUzDoSyXv4l9cFVcFAOaK0fVU=;
Message-ID: <ab7f3e10-631b-432c-8f12-359ac71d3340@xen.org>
Date: Thu, 28 Nov 2024 19:12:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drivers/char: rename arm-uart.c to uart-init.c
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f168e76eacc2fd2e6da559a38c33e187da515614.1732027276.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f168e76eacc2fd2e6da559a38c33e187da515614.1732027276.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 19/11/2024 14:55, Oleksii Kurochko wrote:
> Rename the file containing uart_init() to enable reuse across other
> architectures that utilize device trees or SPCR tables to locate UART
> information.
> After locating UART data, {acpi}_device_init() is called to initialize
> the UART.
> 
> arm_uart_init() is renamed to uart_init() to be reused by other
> architectures.
> 
> A new configuration option, CONFIG_GENERIC_UART_INIT, is introduced,
> currently available only for Arm. Enabling CONFIG_UART_INIT on additional
> architectures will require additional functionality, such as device tree
> mapping and unflattening, etc.
> 
> arm-uart.c is removed from "ARM (W/ VIRTUALIZATION EXTENSIONS) ARCHITECTURE"
> section in the MAINTAINERS file, as it is no longer Arm-specific and can
> now be maintained by maintainers of other architectures.
> 
> Use GENERIC_UART_INIT for CONFIG_ARM by adding `select GENERIC_UART_INIT`
> to CONFIG_ARM.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall


