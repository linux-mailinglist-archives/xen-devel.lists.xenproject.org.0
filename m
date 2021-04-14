Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D435EE03
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110291.210530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZdx-0003X2-Ij; Wed, 14 Apr 2021 07:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110291.210530; Wed, 14 Apr 2021 07:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWZdx-0003Wd-Fg; Wed, 14 Apr 2021 07:08:57 +0000
Received: by outflank-mailman (input) for mailman id 110291;
 Wed, 14 Apr 2021 07:08:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWZdv-0003WY-OA
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 07:08:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3edbe01e-fd5c-449c-86bc-4c78dda82757;
 Wed, 14 Apr 2021 07:08:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 092C6ABF6;
 Wed, 14 Apr 2021 07:08:54 +0000 (UTC)
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
X-Inumbo-ID: 3edbe01e-fd5c-449c-86bc-4c78dda82757
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618384134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RiFrZyUPfSjBNn4B9b7ANfZDAeDCAhfH65U6rhgfmbI=;
	b=G4uLbLZXs0Tjk8cckPDDjnzNtZMjKFWxT0lUa9I9A7ZjobfWQx4i3HGSnV+20ghRUYJCxo
	i8Dmi5ZbrbwQaPIaUfKR7bhiZDzpucO2cpHIekgxJzNM0nxA3Ma/tpqV698giuhyjlJANB
	QuKN+eXBnYWGcCGky556p9A02V4Xju8=
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Rahul Singh <rahul.singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca4bef26-0869-8a56-e96c-04d3b41ffcd6@suse.com>
Date: Wed, 14 Apr 2021 09:08:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.04.2021 19:12, Julien Grall wrote:
> On 12/04/2021 11:49, Roger Pau Monné wrote:
>> On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
>>> --- a/xen/include/xen/vpci.h
>>> +++ b/xen/include/xen/vpci.h
>>> @@ -91,6 +91,7 @@ struct vpci {
>>>           /* FIXME: currently there's no support for SR-IOV. */
>>>       } header;
>>>   
>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>>       /* MSI data. */
>>>       struct vpci_msi {
>>>         /* Address. */
>>> @@ -136,6 +137,7 @@ struct vpci {
>>>               struct vpci_arch_msix_entry arch;
>>>           } entries[];
>>>       } *msix;
>>> +#endif /* CONFIG_PCI_MSI_INTERCEPT */
>>
>> Note that here you just remove two pointers from the struct, not that
>> I'm opposed to it, but it's not that much space that's saved anyway.
>> Ie: it might also be fine to just leave them as NULL unconditionally
>> on Arm.
> 
> Can the two pointers be NULL on x86? If not, then I would prefer if they 
> disappear on Arm so there is less chance to make any mistake (such as 
> unconditionally accessing the pointer in common code).

Alternative proposal: How about making it effectively impossible to
de-reference the pointer on Arm by leaving the field there, but having
the struct definition available on non-Arm only?

Jan

