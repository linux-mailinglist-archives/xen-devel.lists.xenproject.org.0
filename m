Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED94E4747
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293644.498899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWksX-000288-Df; Tue, 22 Mar 2022 20:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293644.498899; Tue, 22 Mar 2022 20:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWksX-00025U-AY; Tue, 22 Mar 2022 20:13:17 +0000
Received: by outflank-mailman (input) for mailman id 293644;
 Tue, 22 Mar 2022 20:13:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nWksW-00025O-7i
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:13:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWksV-0005oq-Rr; Tue, 22 Mar 2022 20:13:15 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.19.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nWksV-0006vX-Ly; Tue, 22 Mar 2022 20:13:15 +0000
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
	bh=oCDmvKRMe1Wbh3i+IWFgLE5JYtQlhIoytOBy7uVlgxA=; b=FAnCg5pntC0XKbNUdf6WGyV6bi
	+7Pnd+SW1eMV3s1xKSn/GLUbZslFT7kinWz+dWeo+tgcY58qJxDOkiO9nTzrFgPkJ0pmZid5sYwY/
	I5pcnx9iOxbk+Tb4aN3anz3YYTeUnXzMEtc4zziEz8Z/mvsoWOGx9YRdHL1mpaO2fqeo=;
Message-ID: <dd6678ca-887c-f2ac-fd76-3ef07626b544@xen.org>
Date: Tue, 22 Mar 2022 20:13:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 02/11] xen: move do_vcpu_op() to arch specific code
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220310073420.15622-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220310073420.15622-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/03/2022 07:34, Juergen Gross wrote:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 351029f8b2..f9de1be43c 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1570,15 +1570,11 @@ int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>       return rc;
>   }
>   
> -long cf_check do_vcpu_op(
> -    int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
> +long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>   {
> -    struct domain *d = current->domain;
> -    struct vcpu *v;
>       long rc = 0;
> -
> -    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> -        return -ENOENT;
> +    struct domain *d = current->domain;

It feels a bit strange to use current when you already have the vcpu in 
hand. So how about using v->domain?

The rest of the patch looks good to me.

Cheers,

-- 
Julien Grall

