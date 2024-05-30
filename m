Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486EB8D49C0
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 12:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732642.1138649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCd7x-0007GJ-SZ; Thu, 30 May 2024 10:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732642.1138649; Thu, 30 May 2024 10:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCd7x-0007Ed-P2; Thu, 30 May 2024 10:35:21 +0000
Received: by outflank-mailman (input) for mailman id 732642;
 Thu, 30 May 2024 10:35:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sCd7w-0007EX-EI
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 10:35:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCd7u-0005BO-Mr; Thu, 30 May 2024 10:35:18 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCd7u-00075Z-Cz; Thu, 30 May 2024 10:35:18 +0000
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
	bh=xCpCPIdJ11U9KOAdkbscgoHanCLOoti5gX3qByTVS7o=; b=AkMI7fD7MGIK3anj819bCjsEfN
	LW5lEZ4o3nKgfaQ26SEEtFwgP+6fLgZPummyCCJ/4LBwm5xJXkY2jrKqFvVtksYc+XRxE+TycXR9P
	YArSoUTesEIsldcBcmQcyiuvH5225T29dpWcV0bF49v7M52GLs27KjTkFM6RtgO5iiqI=;
Message-ID: <047ca670-cd9e-4803-8083-7770b7230042@xen.org>
Date: Thu, 30 May 2024 11:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: dom0less: add TEE support
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
 <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org> <87bk4oxpxk.fsf@epam.com>
 <CBB42DF2-94AE-4566-B83D-3AB3CB2E01DE@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CBB42DF2-94AE-4566-B83D-3AB3CB2E01DE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 30/05/2024 10:40, Bertrand Marquis wrote:
>> But we are making assumption that all TEE implementation will have its
>> node inside "/firmware/". I am not 100% sure that this is correct. For
>> example I saw that Google Trusty uses "/trusty" node (directly inside
>> the DTS root). On other hand, it is not defined in dts bindings, as far
>> as I know.
> 
> 
> Regarding the firmware part you can easily handle that by looking for /firmware
> and create it if it does not exist before creating your sub-node and this should
> be node in the optee node creation function not in tee.c.

This would work if the node /firmware doesn't exist. But how would you 
handle the case where it is already present?

I looked at the libfdt API and AFAICT the DTB creation needs to be 
linear. IOW, you can't add a subnode to an already created node.

There is an helper to create a placeholder, but AFAIK this is only for a 
property. You also need to know the size in advance.

Cheers,

-- 
Julien Grall

