Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E97E7ACF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630012.982636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nnv-0000Wl-R9; Fri, 10 Nov 2023 09:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630012.982636; Fri, 10 Nov 2023 09:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nnv-0000V3-Np; Fri, 10 Nov 2023 09:27:55 +0000
Received: by outflank-mailman (input) for mailman id 630012;
 Fri, 10 Nov 2023 09:27:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1Nnu-0000Ux-IT
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:27:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1Nns-0000Wx-Oc; Fri, 10 Nov 2023 09:27:52 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.18.68]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1Nns-0004ZD-I2; Fri, 10 Nov 2023 09:27:52 +0000
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
	bh=Pt4qtIOOFJtYzUilWxiv/V5zq33bTf81EwvmXRfNEJ8=; b=48MaHmSBvKNts7Xh0Wt1dUJlgi
	Q5hvX1BbQBttWR6DNIMTKqVwx9QbiNhu1jbQ1w962ewjujTt5U6CE0xpVqgoipb9grFR+IyQYXX3q
	hivXFz+EctNeUWIpZ6J0sXMD3zAiTa3LZpfZEuDyyVNjhYRW+20CSE20ZFwqp9A+umSQ=;
Message-ID: <329849be-f2c1-4ca6-8b97-b288d163aeb1@xen.org>
Date: Fri, 10 Nov 2023 09:27:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Use hex for bitstream_size as expected by u-boot
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 viryaos-discuss@lists.sourceforge.net
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, brian@woods.art
References: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 10/11/2023 01:44, Stefano Stabellini wrote:
> Reported-by: Brian Woods <brian@woods.art>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index b284887..6e52da5 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -790,7 +790,7 @@ bitstream_load_and_config()
>           check_file_type "$BITSTREAM" "BIT data"
>           bitstream_addr=$memaddr
>           load_file $BITSTREAM "fpga_bitstream"
> -        bitstream_size=$filesize
> +        bitstream_size=`printf "0x%X\n" $filesize`

Looking at [1], there is no indication that the size parameter for "fpga 
load" should be hexadecimal. At the contrary, all the example I have 
found seems to use $filesize.

Furthermore, this code also seems to have been added more than two years 
ago. I would have hope this was tested back then. So I think the commit 
message needs to contain a bit more information about why this is needed 
now.

Is this a change in U-boot? Different U-boot configuration? Or just this 
was never tested/used.

>           if test "$UBOOT_SOURCE"
>           then
>               # we assume the FPGA device is 0 here
> 

Cheers,

[1] 
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/124682257/U-Boot+FPGA+Driver

-- 
Julien Grall

