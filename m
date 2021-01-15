Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C5F2F7F41
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68275.122220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qq1-0008Q3-J5; Fri, 15 Jan 2021 15:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68275.122220; Fri, 15 Jan 2021 15:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qq1-0008Pe-G5; Fri, 15 Jan 2021 15:16:33 +0000
Received: by outflank-mailman (input) for mailman id 68275;
 Fri, 15 Jan 2021 15:16:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0Qq0-0008PU-BL
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:16:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Qpt-0006IH-Bl; Fri, 15 Jan 2021 15:16:25 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Qpt-0001XI-47; Fri, 15 Jan 2021 15:16:25 +0000
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
	bh=Gx3g1L+7vnD3+2dgq/MUjwA9YqBBVKQ0OV7zrI4tA6s=; b=6sf/dLfMMcjAOJGNnwwc6sxCbW
	CQeH02RMDaRS7nMzD+xUTT2fHzp7OySdDt/18GBdQHwo/WQp7k1gPejJMq4NT996np2n+bCHDsjZV
	eIWr+IucCUSg4pULmuVN19DxMlrTOUsO4Epg53xbWlvUJChbQwnFmfEdIPN4yK3pkEUk=;
Subject: Re: [PATCH V4 01/24] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d9fcfec4-b5cb-7e5e-46dd-365ee2f91eff@xen.org>
Date: Fri, 15 Jan 2021 15:16:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As a lot of x86 code can be re-used on Arm later on, this
> patch makes some preparation to x86/hvm/ioreq.c before moving
> to the common code. This way we will get a verbatim copy
> for a code movement in subsequent patch.
> 
> This patch mostly introduces specific hooks to abstract arch
> specific materials taking into the account the requirment to leave
> the "legacy" mechanism of mapping magic pages for the IOREQ servers
> x86 specific and not expose it to the common code.
> 
> These hooks are named according to the more consistent new naming
> scheme right away (including dropping the "hvm" prefixes and infixes):
> - IOREQ server functions should start with "ioreq_server_"
> - IOREQ functions should start with "ioreq_"
> other functions will be renamed in subsequent patches.
> 
> Also re-order #include-s alphabetically.
> 
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

