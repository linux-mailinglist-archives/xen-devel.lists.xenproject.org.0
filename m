Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB31C81453D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 11:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655016.1022652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE5CU-0008V9-Rq; Fri, 15 Dec 2023 10:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655016.1022652; Fri, 15 Dec 2023 10:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE5CU-0008Tj-Oq; Fri, 15 Dec 2023 10:13:46 +0000
Received: by outflank-mailman (input) for mailman id 655016;
 Fri, 15 Dec 2023 10:13:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rE5CT-0008Td-DQ
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 10:13:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rE5CS-0002b4-L2; Fri, 15 Dec 2023 10:13:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rE5CS-0002nN-FW; Fri, 15 Dec 2023 10:13:44 +0000
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
	bh=YF1IUtbjUDYNzmWTFBspUyEj570HY8hYtH34Zc78lgc=; b=4R2XC2H4ZQav5LSYMMtGu4BTp5
	/v2wQGI0G2HpqmAHPX0n9fukcB/QfukjukX5O6U83mE0i1BRflPuFWz3NpL+hJvbbUvoEYdoDt4OI
	Zc3pQJlZ/tPdtW+aGF0h5DX15NkpDsygDZSv1ni9PUIzYP+orBnf0M9FLA9zsnb2EJOo=;
Message-ID: <d7b880b2-10ec-4c3d-bf12-1c29995857d6@xen.org>
Date: Fri, 15 Dec 2023 10:13:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra/rules.rst: add Rule 17.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, george.dunlap@citrix.com,
 bertrand.marquis@arm.com, roger.pau@citrix.com, roberto.bagnara@bugseng.com,
 federico.serafini@bugseng.com
References: <alpine.DEB.2.22.394.2312081738100.1703076@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312081738100.1703076@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/12/2023 01:39, Stefano Stabellini wrote:
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - separated 17.1 in its own patch
> - add a comment
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 8a659d8d47..f29b4c3d9a 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -189,6 +189,12 @@ existing codebase are work-in-progress.
>        - A switch-expression shall not have essentially Boolean type
>        -
>   
> +   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
> +     - Required
> +     - The features of <stdarg.h> shall not be used
> +     - It is understood that in some limited circumstances <stdarg.h> is
> +       appropriate to use, such as the implementation of printk.

The last bullet point is unclear to me. You don't define what 
"appropriate" means here. So who is going to decide? Also, how is this 
going to be deviated?

Possibly the solution here is to remove the last bullet point and have a 
paragraph in deviations.rst explaining why we are using va_args.

Cheers,

-- 
Julien Grall

