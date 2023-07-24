Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546475F794
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568907.889016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv99-0003DY-8S; Mon, 24 Jul 2023 12:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568907.889016; Mon, 24 Jul 2023 12:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv99-0003BX-5Q; Mon, 24 Jul 2023 12:58:43 +0000
Received: by outflank-mailman (input) for mailman id 568907;
 Mon, 24 Jul 2023 12:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOzI=DK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qNv97-0003BP-MM
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:58:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf4478b5-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:58:39 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.132.135])
 by support.bugseng.com (Postfix) with ESMTPSA id 508004EE0737;
 Mon, 24 Jul 2023 14:58:38 +0200 (CEST)
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
X-Inumbo-ID: cf4478b5-2a21-11ee-8612-37d641c3527e
Message-ID: <014b6c1a-9e83-15f7-67d7-74afaf97b9a2@bugseng.com>
Date: Mon, 24 Jul 2023 14:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/dt: Rework the prototype of dt_property_read_string()
 to help Eclair
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230724102443.91894-1-julien@xen.org>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <20230724102443.91894-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/23 12:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Eclair vXXX is unable to prove the parameter out_string will only be
> used the return of dt_property_read_string() is 0. So it will consider
> that MISRA C:2012 Rule 9.1 was violated.

This is not correct: ECLAIR cannot prove that the rule is not violated, 
and hence emits a caution, because the analysis is sound.

> 
> Rework the prototype so the string is returned and use ERR_PTR() to
> embed the error code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> The XXX should be replaced with the version of Eclair. Nicola, can you
> provide it?

I don't see as valuable mentioning ECLAIR at all, but rather explain 
what the change is about (encoding the error value as a return value and 
removing the **out_value parameter).

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

