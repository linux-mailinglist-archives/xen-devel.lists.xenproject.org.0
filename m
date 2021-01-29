Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49B308798
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77861.141322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QVL-0001PZ-1u; Fri, 29 Jan 2021 09:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77861.141322; Fri, 29 Jan 2021 09:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QVK-0001PA-U7; Fri, 29 Jan 2021 09:55:50 +0000
Received: by outflank-mailman (input) for mailman id 77861;
 Fri, 29 Jan 2021 09:55:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5QVJ-0001P5-69
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:55:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5QVE-0002eQ-JQ; Fri, 29 Jan 2021 09:55:44 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5QVE-0000NU-B8; Fri, 29 Jan 2021 09:55:44 +0000
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
	bh=8FPqeP+gcOVbDFkB0279VtQfbO3uNxP0aU6B0zqJzBM=; b=CrwIQY0dxuylNnClbcQehg6I92
	IjYKQ+/pbO1rxNm2syg3OO0uCy5a8ShU2l9lR8fE54xa8WbIooCLPBdG84w3BE1XoAUnVquYskQ2v
	MMQAjoVKbuMP7Eh4zYj+O3bnXJuV/kU6dk9jvWH2FzvzS+NsBQ+C4vsXMTHgeN00N7+M=;
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2d98fd45-a88a-a198-a42d-393a713e1d54@xen.org>
Date: Fri, 29 Jan 2021 09:55:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 29/01/2021 01:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The purpose of this patch is to add a possibility for user
> to be able to select IOREQ support on Arm (which is disabled
> by default) with retaining the current behaviour on x86
> (is selected by HVM and it's prompt is not visible).
> 
> Also make the IOREQ be depended on CONFIG_EXPERT on Arm since
> it is considered as Technological Preview feature.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V5 -> V6:
>     - new patch
> ---
> ---
>   xen/common/Kconfig | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index fa049a6..225e57b 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -137,7 +137,13 @@ config HYPFS_CONFIG
>   	  want to hide the .config contents from dom0.
>   
>   config IOREQ_SERVER
> -	bool
> +	bool "IOREQ support (EXPERT)" if EXPERT && !X86
> +	default X86
> +	depends on HVM
AFAICT, CONFIG_HVM will already select CONFIG_IOREQ_SERVER. So are the 
two lines necessary?

Cheers,

-- 
Julien Grall

