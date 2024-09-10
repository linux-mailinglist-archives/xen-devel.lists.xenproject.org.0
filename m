Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A522C9740DB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 19:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795937.1205423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4sL-0007Gc-NI; Tue, 10 Sep 2024 17:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795937.1205423; Tue, 10 Sep 2024 17:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so4sL-0007Eg-JF; Tue, 10 Sep 2024 17:42:01 +0000
Received: by outflank-mailman (input) for mailman id 795937;
 Tue, 10 Sep 2024 17:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1so4sJ-0007Ea-OO
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 17:42:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa36e35e-6f9b-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 19:41:58 +0200 (CEST)
Received: from [192.168.1.20] (host-79-37-206-90.retail.telecomitalia.it
 [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 2F3E24EE07CB;
 Tue, 10 Sep 2024 19:41:57 +0200 (CEST)
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
X-Inumbo-ID: fa36e35e-6f9b-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725990117; bh=LfxQlLe+0wjsAv5gFXApZmIW3WP4aWQ2F/nbmF6ohNk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XUiuBhABFm3rM4TSu71uNBknlhIN701ifscEeUpODM6p1BDMOJwXBDzFpR793AsPS
	 K8wtnDJelSOtaFw0goYVPyztJZ2LYn9beHOUuecJfzo56vhmLxry/sIsnFdhh5y5VV
	 8bOp7nIy1plaWwcZ2M8+bPR93KFJdn3NpMXlL4ifqIbCUY4E4KKhTEJafkyhvzpOLG
	 vykHe9qpeMpQZmVlpiwZ8W7Ljq38ac48PdjLv+Xia+2Hstf+uOOZkYLilmE+eeV/OG
	 5/qzieEpyuc5yGivEKP75shpvSlb2o53ZCwJDD+u5jyh5ntPfIodnEbe2ybiqoAzng
	 HVZhFjMxwVSXg==
Message-ID: <d8b4e697-97cf-42be-bc29-96b4befa7efa@bugseng.com>
Date: Tue, 10 Sep 2024 19:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 12/12] xen/pci: address a violation of MISRA C Rule
 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <fd3bb0369cc1666a6c4ad79c54ee8772c1e561c2.1725958417.git.federico.serafini@bugseng.com>
 <e37247e7-3ffd-4c95-8b05-10662728724a@suse.com>
 <1d808a8f-1aa1-4bff-bfe2-09b39a48f96d@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <1d808a8f-1aa1-4bff-bfe2-09b39a48f96d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/24 16:59, Jan Beulich wrote:
> On 10.09.2024 16:57, Jan Beulich wrote:
>> On 10.09.2024 12:09, Federico Serafini wrote:
>>> Address violations of MISRA C:2012 Rule 16.3:
>>> "An unconditional `break' statement shall terminate every
>>> switch-clause".
>>
>> Since in our interpretation "return" is okay too, why is not sufficient to
>> simply ...
>>
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
>>>       {
>>>       case 1: case 2: case 4:
>>>           if ( *s )
>>> -    default:
>>>               return -EINVAL;
>>> +        break;
>>
>> ... insert just this one line here?
> 
> I guess the problem is with the description: It's un-annotated fall-through
> in this case, not so much the lack of a break (or alike).
> 
> Jan
> 
>>> +    default:
>>> +        return -EINVAL;
>>>       }
>>>   
>>>       phantom_devs[nr_phantom_devs++] = phantom;
>>
> 

Do you prefer this?

case 1: case 2: case 4:
     if ( *s )
         fallthrough;
     break;
default:
     return -EINVAL;


-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

