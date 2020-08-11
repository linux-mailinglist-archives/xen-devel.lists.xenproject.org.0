Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6EA241F67
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 19:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5YQa-000528-PY; Tue, 11 Aug 2020 17:51:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4+w=BV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k5YQY-00051z-MM
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 17:51:10 +0000
X-Inumbo-ID: a558f725-604d-4458-a15b-0afd7577a66d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a558f725-604d-4458-a15b-0afd7577a66d;
 Tue, 11 Aug 2020 17:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Zp1tfGQ1cDkpNCfk613PZSg3AqcJNdQScZORB+zDdI=; b=dBnI/YXvmpj7CygcjznImiTCFF
 2e0IdMeyX8C+mBEUGtRw4hoA0N1NYiSwIKoO/YWJ2Ey3c04otsQo1N5PiLkl+P54HBk1LpECDfeIm
 ynABT0MsE4XPYXhHCy0L9noA7KzeFGf077hucxLboxpcoftvDtjy5EP55662i9m/cnYE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5YQM-00089L-Uu; Tue, 11 Aug 2020 17:50:58 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5YQM-0000Ku-L7; Tue, 11 Aug 2020 17:50:58 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <02f6a5cf-46c3-c216-ad52-707e3409f156@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <88b80010-2c56-c038-800a-3abd44f46ca5@xen.org>
Date: Tue, 11 Aug 2020 18:50:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <02f6a5cf-46c3-c216-ad52-707e3409f156@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 11/08/2020 18:09, Oleksandr wrote:
> 
> On 05.08.20 12:32, Julien Grall wrote:
> 
> Hi Julien, Stefano
> 
>>
>>>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
>>>> index 5fdb6e8..5823f11 100644
>>>> --- a/xen/include/asm-arm/p2m.h
>>>> +++ b/xen/include/asm-arm/p2m.h
>>>> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct 
>>>> domain *d, unsigned long gfn,
>>>>                                           mfn_t mfn)
>>>>   {
>>>>       /*
>>>> -     * NOTE: If this is implemented then proper reference counting of
>>>> -     *       foreign entries will need to be implemented.
>>>> +     * XXX: handle properly reference. It looks like the page may 
>>>> not always
>>>> +     * belong to d.
>>>
>>> Just as a reference, and without taking away anything from the comment,
>>> I think that QEMU is doing its own internal reference counting for these
>>> mappings.
>>
>> I am not sure how this matters here? We can't really trust the DM to 
>> do the right thing if it is not running in dom0.
>>
>> But, IIRC, the problem is some of the pages doesn't belong to do a 
>> domain, so it is not possible to treat them as foreign mapping (e.g. 
>> you wouldn't be able to grab a reference). This investigation was done 
>> a couple of years ago, so this may have changed in recent Xen.
> 
> Well, emulator is going to be used in driver domain, so this TODO must 
> be resolved. I suspect that the check for a hardware domain in 
> acquire_resource() which I skipped in a hackish way [1] could be simply 
> removed once proper reference counting is implemented in Xen, correct?

It depends how you are going to solve it. If you manage to solve it in a 
generic way, then yes you could resolve. If not (i.e. it is solved in an 
arch-specific way), we would need to keep the check on arch that are not 
able to deal with it. See more below.

> 
> Could you please provide some pointers on that problem? Maybe some 
> questions need to be investigated again? Unfortunately, it is not 
> completely clear to me the direction to follow...
> 
> ***
> I am wondering whether the similar problem exists on x86 as well?

It is somewhat different. On Arm, we are able to handle properly foreign 
mapping (i.e. mapping page from a another domain) as we would grab a 
reference on the page (see XENMAPSPACE_gmfn_foreign handling in 
xenmem_add_to_physmap()). The reference will then be released when the 
entry is removed from the P2M (see p2m_free_entry()).

If all the pages given to set_foreign_p2m_entry() belong to a domain, 
then you could use the same approach.

However, I remember to run into some issues in some of the cases. I had 
a quick looked at the caller and I wasn't able to find any use cases 
that may be an issue.

The refcounting in the IOREQ code has changed after XSA-276 (this was 
found while working on the Arm port). Probably the best way to figure 
out if it works would be to try it and see if it fails.

Note that set_foreign_p2m_entry() doesn't have a parameter for the 
foreign domain. You would need to add a extra parameter for this.

> The 
> FIXME tag (before checking for a hardware domain in acquire_resource()) 
> in the common code makes me think it is a common issue. From other side 
> x86's
> implementation of set_foreign_p2m_entry() is exists unlike Arm's one 
> (which returned -EOPNOTSUPP so far). Or these are unrelated?

At the moment, x86 doesn't support refcounting for foreign mapping. 
Hence the reason to restrict them to the hardware domain.

> ***
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2020-08/msg00075.html
Cheers,

-- 
Julien Grall

