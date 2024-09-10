Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7324C9740FC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 19:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795945.1205433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4wv-00082b-8Z; Tue, 10 Sep 2024 17:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795945.1205433; Tue, 10 Sep 2024 17:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4wv-000814-5C; Tue, 10 Sep 2024 17:46:45 +0000
Received: by outflank-mailman (input) for mailman id 795945;
 Tue, 10 Sep 2024 17:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1so4wt-0007zb-Dk
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 17:46:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a27b54bb-6f9c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 19:46:40 +0200 (CEST)
Received: from [192.168.1.20] (host-79-37-206-90.retail.telecomitalia.it
 [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id C932F4EE07CB;
 Tue, 10 Sep 2024 19:46:39 +0200 (CEST)
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
X-Inumbo-ID: a27b54bb-6f9c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725990400; bh=aQB6QaTuZ0Xjgp9rqRV530zk277LB8O2KrsfTKK6P5o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Dxzsg8kV97I82C+XUkoRP88cIbvozq4mrZ0ypVxp5rgqJE/wyh6bIzVBThkTAGyAj
	 AZH0rm2mnXIJd/peP4PiuZd72o0mx8Lt52icvDoTKtiDbJxJL3k0RcXIhg37EhlVW0
	 MwVahggK0BoavNF20ub9czAea8ZzRO4Zo+S5vkB/zAJvp5o6DezhEvaT3QWxNRwygq
	 IhqVfC120Zgar7a5Wf7ZFmYtl9rqngzKkPQX6UUTN94Mh7lwJQtQ4pxn+pYK1d+kco
	 I7+ASn4PGKw5I38CeevcTQb6XOxYzsmgcwgOsb6ZwGj5W5dpzazPvKOHEAmccuvhsd
	 rsItYNguVOOJw==
Message-ID: <c9b11661-7b63-4f9b-8cd3-c505a7c24aa1@bugseng.com>
Date: Tue, 10 Sep 2024 19:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 12/12] xen/pci: address a violation of MISRA C Rule
 16.3
From: Federico Serafini <federico.serafini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <fd3bb0369cc1666a6c4ad79c54ee8772c1e561c2.1725958417.git.federico.serafini@bugseng.com>
 <e37247e7-3ffd-4c95-8b05-10662728724a@suse.com>
 <1d808a8f-1aa1-4bff-bfe2-09b39a48f96d@suse.com>
 <d8b4e697-97cf-42be-bc29-96b4befa7efa@bugseng.com>
Content-Language: en-US, it
Organization: BUGSENG
In-Reply-To: <d8b4e697-97cf-42be-bc29-96b4befa7efa@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/09/24 19:41, Federico Serafini wrote:
> On 10/09/24 16:59, Jan Beulich wrote:
>> On 10.09.2024 16:57, Jan Beulich wrote:
>>> On 10.09.2024 12:09, Federico Serafini wrote:
>>>> Address violations of MISRA C:2012 Rule 16.3:
>>>> "An unconditional `break' statement shall terminate every
>>>> switch-clause".
>>>
>>> Since in our interpretation "return" is okay too, why is not 
>>> sufficient to
>>> simply ...
>>>
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -170,8 +170,10 @@ static int __init cf_check 
>>>> parse_phantom_dev(const char *str)
>>>>       {
>>>>       case 1: case 2: case 4:
>>>>           if ( *s )
>>>> -    default:
>>>>               return -EINVAL;
>>>> +        break;
>>>
>>> ... insert just this one line here?
>>
>> I guess the problem is with the description: It's un-annotated 
>> fall-through
>> in this case, not so much the lack of a break (or alike).
>>
>> Jan
>>
>>>> +    default:
>>>> +        return -EINVAL;
>>>>       }
>>>>       phantom_devs[nr_phantom_devs++] = phantom;
>>>
>>
> 
> Do you prefer this?
> 
> case 1: case 2: case 4:
>      if ( *s )
>          fallthrough;
>      break;
> default:
>      return -EINVAL;
> 
> 

Oh no, sorry,
this does not make sense.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

