Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD933380C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 10:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95917.181114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJuho-0001Y7-G2; Wed, 10 Mar 2021 09:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95917.181114; Wed, 10 Mar 2021 09:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJuho-0001Xi-Cg; Wed, 10 Mar 2021 09:00:36 +0000
Received: by outflank-mailman (input) for mailman id 95917;
 Wed, 10 Mar 2021 09:00:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJuhm-0001Xd-HU
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 09:00:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dbb345b-2d2f-4102-be7e-1182ff352c7e;
 Wed, 10 Mar 2021 09:00:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71417AD74;
 Wed, 10 Mar 2021 09:00:32 +0000 (UTC)
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
X-Inumbo-ID: 4dbb345b-2d2f-4102-be7e-1182ff352c7e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615366832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OTr2wJ5XeMutAszimHjmu47PkcDW5hHRBQjZt8mVSBE=;
	b=jnyNuuc9Hr1M7Nwv8X/M/5ZoKNtyV+V81d3dMNVVBDpt/zVuppKbkUUTu2x3bhBKLzbPh8
	ceE5OyMpAKa2vycxcxdGJVEEFU9F+HhgpSC/IzPWOkfurnInEPRC60Wc/n/0yx/fGBUqtn
	1jYaClbOK2ZwseedzUuBUcDY/xJaLOg=
Subject: Re: [PATCH v4] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20210310065803.348-1-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3247ee1d-f843-7c74-20a4-315716a91097@suse.com>
Date: Wed, 10 Mar 2021 10:00:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310065803.348-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.03.2021 07:58, Michal Orzel wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -400,6 +400,14 @@ config DOM0_MEM
>  
>  	  Leave empty if you are not sure what to specify.
>  
> +config DTB_FILE
> +	string "Absolute path to device tree blob"
> +	depends on HAS_DEVICE_TREE
> +	---help---
> +	  When using a bootloader that has no device tree support or when there
> +	  is no bootloader at all, use this option to specify the absolute path
> +	  to a device tree that will be linked directly inside Xen binary.

Nit: Linux, iirc, has dropped support for ---help--- (allowing
only help now). To limit churn whenever we're going to re-sync
our kconfig again, I'd like to avoid introduction of new uses
of the old form. I'm sure this could be taken care of while
committing.

Jan

