Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFBE73E1E4
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555547.867403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDn2D-0000u5-Dv; Mon, 26 Jun 2023 14:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555547.867403; Mon, 26 Jun 2023 14:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDn2D-0000qz-B4; Mon, 26 Jun 2023 14:17:41 +0000
Received: by outflank-mailman (input) for mailman id 555547;
 Mon, 26 Jun 2023 14:17:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDn2C-0000qt-5a
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:17:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDn2B-00037h-C7; Mon, 26 Jun 2023 14:17:39 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDn2B-0005SE-4X; Mon, 26 Jun 2023 14:17:39 +0000
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
	bh=KwyfllzkPI9B3LF9TCxd8RU/2YaW4pwrA8W//Kf/iro=; b=j6zcVoFW7H5m5343JaAglJinWx
	jz+PaIOAo0BmcTytVi5hxGSkIEnQRwaSUwhnPNQ9otGybjHIa3mIZW8pwf5f2LJyMyraW45qB92vk
	NGwNIism7Gq8Js94TICEiSBmc6TGhiHjwLSNXo+DSOhGM15BFSniqYPUHDE6/devmFiI=;
Message-ID: <0222d2f5-5ad2-7804-6e01-fb3e7e1367e8@xen.org>
Date: Mon, 26 Jun 2023 15:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 6/6] xen/arm: change parameter names in
 replace_grant_host_mapping().
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
 <2c2b9b3c53e556945baab3dd387bf029e12434b6.1687771796.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2c2b9b3c53e556945baab3dd387bf029e12434b6.1687771796.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 10:52, Federico Serafini wrote:
> In the current version of replace_grant_host_mapping() function, the
> declaration (correctly) uses the parameter names 'gpaddr' and
> 'new_gpaddr', while the definition uses the parameter names 'addr' and
> 'new_addr'.
> Change the parameter names of the definition to 'gpaddr' and
> 'new_gpaddr' so that it is clear what type of address is expected and
> violations of MISRA C:2012 Rule 8.3 are fixed.
> 
> In both declaration and definition of function
> replace_grant_host_mapping() change the parameter name 'mfn' to 'frame',
> thus improving readability and keeping consistency with name used in
> create_grant_host_mapping().
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

