Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEF3482FF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 21:39:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101168.193320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAGd-0000hT-G7; Wed, 24 Mar 2021 20:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101168.193320; Wed, 24 Mar 2021 20:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPAGd-0000h4-Cb; Wed, 24 Mar 2021 20:38:15 +0000
Received: by outflank-mailman (input) for mailman id 101168;
 Wed, 24 Mar 2021 20:38:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPAGb-0000gz-S5
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 20:38:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPAGX-00017W-6x; Wed, 24 Mar 2021 20:38:09 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPAGW-00009Z-VU; Wed, 24 Mar 2021 20:38:09 +0000
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
	bh=iOQbi+7HkgRyqLD7KeRJZ4WNsKFuSK99LmJBPhgZOL8=; b=Su0aCPpUJ9sdYZE/QP+nTTxDwV
	P6eQpELtjhoBFAmPHqpslGckbab3ZYQ8TVVPnn3GPquFSdXlUfyIoPw1Q/U9WQi2Fpb2yqc2ykn+J
	U+6wgypam8JwRLMsty0e+bGw+MaHEzlq/pDSnj2Gn1hfBD8oNVPQr98nqLjRpw57kFX0=;
Subject: Re: [PATCH v8] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 bertrand.marquis@arm.com
References: <20210322081715.26175-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7fde269c-688f-60ae-df14-6919efb50539@xen.org>
Date: Wed, 24 Mar 2021 20:38:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322081715.26175-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 22/03/2021 08:17, Michal Orzel wrote:
> Currently in order to link existing DTB into Xen image
> we need to either specify option CONFIG_DTB_FILE on the
> command line or manually add it into .config.
> Add Kconfig entry: CONFIG_DTB_FILE
> to be able to provide the path to DTB we want to embed
> into Xen image. If no path provided - the dtb will not
> be embedded.
> 
> Remove the line: AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
> as it is not needed since Kconfig will define it in a header
> with all the other config options.
> 
> Move definition of _sdtb into dtb.S to prevent defining it
> if there is no reference to it or if someone protects
> _sdtb with #ifdef rather than with .ifnes. If the latter,
> we will get a compiler error.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

I have committed to my for-next/4.16 branch for now. This will soon 
reached staging.

Cheers,

-- 
Julien Grall

