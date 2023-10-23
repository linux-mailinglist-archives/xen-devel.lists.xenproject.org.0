Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABAE7D3A37
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 17:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621532.968079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quwPo-00084m-Px; Mon, 23 Oct 2023 15:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621532.968079; Mon, 23 Oct 2023 15:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quwPo-00082H-N8; Mon, 23 Oct 2023 15:00:24 +0000
Received: by outflank-mailman (input) for mailman id 621532;
 Mon, 23 Oct 2023 15:00:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1quwPn-000829-DL
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 15:00:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1quwPj-0002Pj-QY; Mon, 23 Oct 2023 15:00:19 +0000
Received: from [54.239.6.184] (helo=[192.168.24.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1quwPj-0005TR-KH; Mon, 23 Oct 2023 15:00:19 +0000
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
	bh=lhp2yYw8Fv9r4oPR6cVa5VI3XmWCvhzWzMbEZL2bc0k=; b=hOUBYAluRm6LOhyCewzFGitakO
	uI/orekVpnrXzlnala7i78UtWQ0Yc6qtxJqUaprVJTm4/Z4JRyb7AkGWfLRQFptNW3KuRRqrIR9fX
	wdXJ8pHTI6PJS/wtXnkHiSDxVwpO1wT5veBTRoUKli3o1iwDt+cr22Ws8GUHm1FjL7rQ=;
Message-ID: <a63ded4f-09b0-41c8-a9c9-832a12fc9133@xen.org>
Date: Mon, 23 Oct 2023 16:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Refactor arm64/domctl.c 'subarch_do_domctl' to avoid unreachable
 break.
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com
References: <6c118d318d68ea3613d9a0a79d75c0c9@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6c118d318d68ea3613d9a0a79d75c0c9@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/10/2023 15:51, Nicola Vetrini wrote:
> Hi,

Hi Nicola,

> while taking care of some patches regarding MISRA C Rule 2.1 (code 
> shouldn't be unreachable), I
> came across this function:
> 
> long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> {
>      switch ( domctl->cmd )
>      {
>      case XEN_DOMCTL_set_address_size:
>          switch ( domctl->u.address_size.size )
>          {
>          case 32:
>              if ( !cpu_has_el1_32 )
>                  return -EINVAL;
>              /* SVE is not supported for 32 bit domain */
>              if ( is_sve_domain(d) )
>                  return -EINVAL;
>              return switch_mode(d, DOMAIN_32BIT);
>          case 64:
>              return switch_mode(d, DOMAIN_64BIT);
>          default:
>              return -EINVAL;
>          }
>          break;
> 
>      default:
>          return -ENOSYS;
>      }
> }
> 
> here the break after the innermost switch is clearly unreachable, but 
> it's also guarding a possible fallthrough.
> I can see a couple of solutions to this:
> 
> - mark the part after the switch unreachable;
> - introduce a variable 'long rc' to store the return value, and 
> consequently rework the control flow of all the switches
>    (e.g. rc = -EINVAL and similar);
> - remove the break, but I consider this a risky move, unless -ENOSYS 
> would be an ok value to be returned if some case
>    from the switch above does not have a return statement.

- move the nested switch in a separate function, so the code in 
subarch_do_domctl() can be replaced with:

return set_address_size(...);

> 
> What would be the preferred way of addressing this violation?

I would actually prefer the 4th option I suggested.

Cheers,

-- 
Julien Grall

