Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E55449BAB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 19:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223595.386353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk9Pl-0004NM-OR; Mon, 08 Nov 2021 18:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223595.386353; Mon, 08 Nov 2021 18:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk9Pl-0004KW-LD; Mon, 08 Nov 2021 18:30:41 +0000
Received: by outflank-mailman (input) for mailman id 223595;
 Mon, 08 Nov 2021 18:30:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mk9Pk-0004KQ-Bw
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 18:30:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mk9Pj-0002Ce-43; Mon, 08 Nov 2021 18:30:39 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.146.147]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mk9Pi-0006E7-UU; Mon, 08 Nov 2021 18:30:39 +0000
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
	bh=2C3BBODaoH4xTM6CDXePzZjWAHtA4h9erVLABm/wjYY=; b=RHRZq1k0wOMV+gYu2eJ/z+whmf
	+6muQqaqdONWLJ+8tLOWFSk0ByjWCmtuV0BvrLIqzVSeBSk0JDVlnwWoXqyoTidGcAj2xHH/RaW2W
	PmDXn/b3eM6XHcfc4mBHA1sx4CwbN/JjbIVd/jJe0TVxNkFTVDOBWkLOffLuYFV7+Y8I=;
Message-ID: <17547d29-8e15-96f6-2418-5f7ca1c3237d@xen.org>
Date: Mon, 8 Nov 2021 18:30:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [RFC 1/1] xen/arm: set iommu property for IOMMU-protected devices
To: Roman Skakun <rm.skakun@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Roman Skakun <roman_skakun@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrii Anisov <andrii_anisov@epam.com>
References: <cover.1633106362.git.roman_skakun@epam.com>
 <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roman,

On 04/10/2021 10:54, Roman Skakun wrote:
> From: Roman Skakun <roman_skakun@epam.com>
> 
> Xen is not exposing any IOMMU properties to Dom0.
> So Dom0 assumes that all it's devices are not protected by IOMMU.
> 
> To make Dom0 aware of IOMMU-protected devices, we need to mark
> them somehow. With this approach Dom0 Linux kernel will be able
> to selectively disable swiotlb-xen fops for them which will remove
> unnecessary buffer bounces.
> 
> This patch adds mechanism to describe IOMMU-protected devices by
> adding `xen,behind-iommu` property to relevant device nodes in
> Dom0 device tree.

A few years ago, I attempted to disable the swiotlb when Xen configured 
the IOMMU for the device (see [1]). Did you have a chance to go through 
the thread? In particular, I think Ian Campbell suggestion about 
creating an IOMMU binding is quite interesting.

Stefano, what do you think?

Cheers,

[1] 
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1392913301-25524-1-git-send-email-julien.grall@linaro.org/

-- 
Julien Grall

