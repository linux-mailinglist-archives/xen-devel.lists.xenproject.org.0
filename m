Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FF4AF181
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 13:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269096.463083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHm4f-0006SO-UC; Wed, 09 Feb 2022 12:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269096.463083; Wed, 09 Feb 2022 12:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHm4f-0006PK-PV; Wed, 09 Feb 2022 12:27:53 +0000
Received: by outflank-mailman (input) for mailman id 269096;
 Wed, 09 Feb 2022 12:27:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHm4e-0006PC-V4
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 12:27:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHm4e-0003z6-Qi; Wed, 09 Feb 2022 12:27:52 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHm4e-00030w-Ks; Wed, 09 Feb 2022 12:27:52 +0000
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
	bh=OH+QeOw3J4hYf7G+rTy6RFRbg1QJc4aR/2tkVQ9Snho=; b=eHAk0JIlurEX0t4N9nvzQZwpUb
	Hs51ratpKkiPTnEGwbgI8cSWm0ArC/tPnA8bmYPVdCnre+x+GxgdgvOdMfXtwcFELq8LvEE4kaDmx
	ux4QseezokKNqlsJZai5BnxZyfzPEyx4A3C0fsvY9up2AuMfXjyNlLMlCPUGVmIfwILI=;
Message-ID: <355b5383-6710-0a50-9c60-3abbf46970d2@xen.org>
Date: Wed, 9 Feb 2022 12:27:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 01/11] xen: introduce internal CDF_xxx flags for domain
 creation
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-2-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220127074929.502885-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/01/2022 07:49, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> We are passing an internal-only boolean flag at domain creation to
> specify whether we want the domain to be privileged (i.e. dom0) or
> not. Another flag will be introduced later in this series.
> 
> This commit extends original "boolean" to an "unsigned int" covering both
> the existing "is_priv" and our new "directmap", which will be introduced later.
> 
> To make visible the relationship, we name the respective constants CDF_xxx
> (with no XEN_DOMCTL_ prefix) to represent the difference with the public
> constants XEN_DOMCTL_CDF_xxx.
> 
> Allocate bit 0 as CDF_privileged: whether a domain is privileged or not.
> 
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

