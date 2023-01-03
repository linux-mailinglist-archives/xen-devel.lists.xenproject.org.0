Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855EC65C862
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 21:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470747.730354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCoCL-0003Dn-7l; Tue, 03 Jan 2023 20:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470747.730354; Tue, 03 Jan 2023 20:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCoCL-0003Ag-4a; Tue, 03 Jan 2023 20:47:49 +0000
Received: by outflank-mailman (input) for mailman id 470747;
 Tue, 03 Jan 2023 20:47:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pCoCJ-0003Aa-5R
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 20:47:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCoCI-0004pF-BW; Tue, 03 Jan 2023 20:47:46 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.2.2])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCoCI-0000Ww-5T; Tue, 03 Jan 2023 20:47:46 +0000
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
	bh=VsuQH8n3GuXWuA+VQJgibmsw0UwoS3Jh87+EAp1bEec=; b=Pp7lzDQvvlB4HdI9AWWQk0Q83z
	Y374uwIdkfvwX2CBHBJ0SjddoHdJ77RdnlFJ+zXIlRz20PYoDoyPaC6ie1XhsdkF8/mhl59C/Oeab
	H/zGT8IbuAkvYytW0l2jbui5LMTD5SHz/rlLISiDdBdnN3/p8AELBJUi5AxL/0XjVOuo=;
Message-ID: <a1300a9e-26a2-4307-d1c3-102729f16a09@xen.org>
Date: Tue, 3 Jan 2023 20:47:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-5-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230103200943.5801-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 03/01/2023 20:09, Andrew Cooper wrote:
> diff --git a/xen/include/public/version.h b/xen/include/public/version.h
> index c8325219f648..cf2d2ef38b54 100644
> --- a/xen/include/public/version.h
> +++ b/xen/include/public/version.h
> @@ -19,12 +19,20 @@
>   /* arg == NULL; returns major:minor (16:16). */
>   #define XENVER_version      0
>   
> -/* arg == xen_extraversion_t. */
> +/*
> + * arg == xen_extraversion_t.
> + *
> + * This API/ABI is broken.  Use XENVER_extraversion2 instead.

I read this as newer tools should never try to call XENVER_extraversion. 
But I don't think this is what you intend to say, correct? If so, I 
would say that an OS should first try XENVER_extraversion2 and then 
fallback to XENVER_extraversion if it returns -ENOSYS.

Same goes for the new hypercalls.

Cheers,

-- 
Julien Grall

