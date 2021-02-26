Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C5326343
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 14:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90306.170900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFd9x-0003Fu-Kc; Fri, 26 Feb 2021 13:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90306.170900; Fri, 26 Feb 2021 13:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFd9x-0003FV-HT; Fri, 26 Feb 2021 13:27:57 +0000
Received: by outflank-mailman (input) for mailman id 90306;
 Fri, 26 Feb 2021 13:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFd9v-0003FQ-ST
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 13:27:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26d7d8ff-d4d4-4e2f-8e94-b68cfabbcbc7;
 Fri, 26 Feb 2021 13:27:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55400AD74;
 Fri, 26 Feb 2021 13:27:54 +0000 (UTC)
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
X-Inumbo-ID: 26d7d8ff-d4d4-4e2f-8e94-b68cfabbcbc7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614346074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdfAgz1jJHl2MSMAUG70pDDursofdtrzfUF1wKdG9tU=;
	b=kxRvvhGrI/YWuY/TbnEQq3m/i/6hLakOtRoqLAT0EH1+muLvA1oVsRgm2G0yDZpA7LKmkH
	UCrmdAhQwTAF5N7aScRgWH5B2fNKLRuGSUyKsR1JmoWd1Hq4+1HVj4tyJDodePkQwxtRgZ
	aU3BaUITnVahrPwg/UCqIbbWHlNEfNU=
Subject: Re: [PATCH for-4.15 v5 1/3] xen/iommu: x86: Don't try to free page
 tables is the IOMMU is not enabled
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210226105640.12037-1-julien@xen.org>
 <20210226105640.12037-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3cd9b5c-a03a-a305-4133-7c2fe0546d97@suse.com>
Date: Fri, 26 Feb 2021 14:27:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226105640.12037-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 11:56, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> When using CONFIG_BIGMEM=y, the page_list cannot be accessed whilst it
> is is unitialized. However, iommu_free_pgtables() will be called even if
> the domain is not using an IOMMU.
> 
> Consequently, Xen will try to go through the page list and deference a
> NULL pointer.
> 
> Bail out early if the domain is not using an IOMMU.
> 
> Fixes: 15bc9a1ef51c ("x86/iommu: add common page-table allocator")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


