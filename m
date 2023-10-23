Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA57D3A84
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 17:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621542.968111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quwfl-00048H-N1; Mon, 23 Oct 2023 15:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621542.968111; Mon, 23 Oct 2023 15:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quwfl-00045D-Jg; Mon, 23 Oct 2023 15:16:53 +0000
Received: by outflank-mailman (input) for mailman id 621542;
 Mon, 23 Oct 2023 15:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1quwfk-000455-67
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 15:16:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30c51cb5-71b7-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 17:16:50 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 58B5C4EE0747;
 Mon, 23 Oct 2023 17:16:50 +0200 (CEST)
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
X-Inumbo-ID: 30c51cb5-71b7-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 17:16:50 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com
Subject: Re: Refactor arm64/domctl.c 'subarch_do_domctl' to avoid unreachable
 break.
In-Reply-To: <a63ded4f-09b0-41c8-a9c9-832a12fc9133@xen.org>
References: <6c118d318d68ea3613d9a0a79d75c0c9@bugseng.com>
 <a63ded4f-09b0-41c8-a9c9-832a12fc9133@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <902a34031e0173e1219f084560522d0d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 23/10/2023 17:00, Julien Grall wrote:
> On 23/10/2023 15:51, Nicola Vetrini wrote:
>> Hi,
> 
> Hi Nicola,
> 
>> while taking care of some patches regarding MISRA C Rule 2.1 (code 
>> shouldn't be unreachable), I
>> came across this function:
>> 
>> long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>> {
>>      switch ( domctl->cmd )
>>      {
>>      case XEN_DOMCTL_set_address_size:
>>          switch ( domctl->u.address_size.size )
>>          {
>>          case 32:
>>              if ( !cpu_has_el1_32 )
>>                  return -EINVAL;
>>              /* SVE is not supported for 32 bit domain */
>>              if ( is_sve_domain(d) )
>>                  return -EINVAL;
>>              return switch_mode(d, DOMAIN_32BIT);
>>          case 64:
>>              return switch_mode(d, DOMAIN_64BIT);
>>          default:
>>              return -EINVAL;
>>          }
>>          break;
>> 
>>      default:
>>          return -ENOSYS;
>>      }
>> }
>> 
>> here the break after the innermost switch is clearly unreachable, but 
>> it's also guarding a possible fallthrough.
>> I can see a couple of solutions to this:
>> 
>> - mark the part after the switch unreachable;
>> - introduce a variable 'long rc' to store the return value, and 
>> consequently rework the control flow of all the switches
>>    (e.g. rc = -EINVAL and similar);
>> - remove the break, but I consider this a risky move, unless -ENOSYS 
>> would be an ok value to be returned if some case
>>    from the switch above does not have a return statement.
> 
> - move the nested switch in a separate function, so the code in
> subarch_do_domctl() can be replaced with:
> 
> return set_address_size(...);
> 
>> 
>> What would be the preferred way of addressing this violation?
> 
> I would actually prefer the 4th option I suggested.
> 
> Cheers,

Would you mind sending the patch yourself?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

