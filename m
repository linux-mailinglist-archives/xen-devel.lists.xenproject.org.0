Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39153AB30
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340558.565625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRRv-0005tV-Kw; Wed, 01 Jun 2022 16:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340558.565625; Wed, 01 Jun 2022 16:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRRv-0005qT-HT; Wed, 01 Jun 2022 16:43:59 +0000
Received: by outflank-mailman (input) for mailman id 340558;
 Wed, 01 Jun 2022 16:43:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nwRRu-0005q7-4i
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:43:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwRRs-00052T-Vu; Wed, 01 Jun 2022 16:43:56 +0000
Received: from [54.239.6.189] (helo=[192.168.4.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nwRRs-00044A-PG; Wed, 01 Jun 2022 16:43:56 +0000
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
	bh=7ISjeHr5jWWeQil9NMXknQxeXIvcVXP44GBhtySct9c=; b=vZhc6L/LFIYSLKhThXDpJifEK7
	oO2gXirj/PjhTZkV3ey4Q7CuCbcgchC7mLaowiCWjKj77I4OOwljbfVzau3vrzi9Fapla54U8zwGy
	jkWCOowiKIblBDY2P9FnFgFz+BZM2XnValQxgjjwcee4WU7Ut+D/0Q3DOgTU2ez41DK0=;
Message-ID: <847647f6-8583-ca22-3cec-90cebe36896d@xen.org>
Date: Wed, 1 Jun 2022 17:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH V2] libxl/arm: Create specific IOMMU node to be referred
 by virtio-mmio device
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 30/05/2022 22:06, Oleksandr Tyshchenko wrote:
> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
> index 209d43d..df58944 100644
> --- a/xen/include/public/device_tree_defs.h
> +++ b/xen/include/public/device_tree_defs.h
> @@ -7,6 +7,7 @@
>    * onwards. Reserve a high value for the GIC phandle.

This comment need to be updated.

Cheers,

-- 
Julien Grall

