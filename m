Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814ED4E7A23
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 18:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294927.501831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXoCf-00037p-2E; Fri, 25 Mar 2022 17:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294927.501831; Fri, 25 Mar 2022 17:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXoCe-000356-Ua; Fri, 25 Mar 2022 17:58:24 +0000
Received: by outflank-mailman (input) for mailman id 294927;
 Fri, 25 Mar 2022 17:58:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXoCd-000350-Cf
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 17:58:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXoCc-0000O0-V7; Fri, 25 Mar 2022 17:58:22 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXoCc-0000K9-Nu; Fri, 25 Mar 2022 17:58:22 +0000
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
	bh=XMy+bKgacPjXDWULVR5e8vI0pDVvCSsQfT5c+Y2Fe1I=; b=eUyRKN+XbL9Qv3l62NCXXD+Wuy
	S7m/e5TFeYg0yqjbPNGlhTXCW1tCjz/LhHaKlU6VdKO5n2zan127uV3sEsMqfB0akExV8Z763it7m
	h9gyEVpJRjzBCA5qs1GLHa83+vgb6yUl1LtYuwbu0VnkJ1Gb17dRcKcjHrTUno36Rc4o=;
Message-ID: <5c2cc1dd-d070-a88c-0e49-bca9ba56900c@xen.org>
Date: Fri, 25 Mar 2022 17:58:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/5] xen: introduce xen,enhanced dom0less property
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-1-sstabellini@kernel.org>
 <3a00dff8-c213-616e-48b0-6e2b6f30dbce@xen.org>
 <alpine.DEB.2.22.394.2203221653230.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203221653230.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/03/2022 00:08, Stefano Stabellini wrote:
> On Sat, 29 Jan 2022, Julien Grall wrote:
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 6931c022a2..9144d6c0b6 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
>>>                                     const struct dt_device_node *node)
>>>    {
>>>        struct kernel_info kinfo = {};
>>> +    const char *dom0less_enhanced;
>>>        int rc;
>>>        u64 mem;
>>>    @@ -2978,6 +2979,12 @@ static int __init construct_domU(struct domain *d,
>>>          kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>>>    +    rc = dt_property_read_string(node, "xen,enhanced",
>>> &dom0less_enhanced);
>>> +    if ( rc == -EILSEQ ||
>>
>> I think the use an -EILSEQ wants an explanation. In a previous version, you
>> wrote that the value would be returned when:
>>
>> fdt set /chosen/domU0 xen,enhanced
>>
>> But it is not clear why. Can you print pp->value, pp->length, strnlen(..) when
>> this happens?
> 
> I added in dt_property_read_string:
> 
> printk("DEBUG %s %d value=%s value[0]=%d length=%u len=%lu\n",__func__,__LINE__,(char*)pp->value, *((char*)pp->value),pp->length, strlen(pp->value));
> 
> This is the output:
> (XEN) DEBUG dt_property_read_string 205 value= value[0]=0 length=0 len=0

Thanks posting the log!

For convenience, I am copying the comment on top of 
dt_property_read_string() prototype:

  * Search for a property in a device tree node and retrieve a null
  * terminated string value (pointer to data, not a copy). Returns 0 on
  * success, -EINVAL if the property does not exist, -ENODATA if property
  * doest not have value, and -EILSEQ if the string is not
  * null-terminated with the length of the property data.

Per your log, the length is NULL so I would have assumed -ENODATA would 
be returned. Looking at the implementation:

     const struct dt_property *pp = dt_find_property(np, propname, NULL);

     if ( !pp )
         return -EINVAL;
     if ( !pp->value )
         return -ENODATA;
     if ( strnlen(pp->value, pp->length) >= pp->length )
         return -EILSEQ;

We consider that the property when pp->value is NULL. However, AFAICT, 
we never set pp->value to NULL (see unflatten_dt_node()).

So I think there is a bug in the implementation. I would keep the check 
!pp->value (for hardening purpose) and also return -ENODATA when 
!pp->length.

Most of our device-tree code is from Linux. Looking at v5.17, the bug 
seems to be present there too. This would want to be fixed there too.

Cheers,

-- 
Julien Grall

