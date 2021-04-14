Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491DE35EF80
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 10:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110360.210644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWasy-0003z8-4r; Wed, 14 Apr 2021 08:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110360.210644; Wed, 14 Apr 2021 08:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWasy-0003yg-0O; Wed, 14 Apr 2021 08:28:32 +0000
Received: by outflank-mailman (input) for mailman id 110360;
 Wed, 14 Apr 2021 08:28:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWasv-0003yI-Qe
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 08:28:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWasp-0005dP-P8; Wed, 14 Apr 2021 08:28:23 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWasp-0005Dz-HO; Wed, 14 Apr 2021 08:28:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=PcUxa9JqaXK31h3i6FFECX0va0RkhCd5qUob+JgcV4U=; b=gUXke1UsGJduwrGFjrHEg/aoDm
	cc/csqpTOsJp8Bu25gXi4HflbxZlRDzVV4d45I4XPtmC9Y1DJV5zydb6kHGtkxXXvFGpQoQ1RH6o7
	tjxg7r05t7ck9pdF6BEnIIepSpAShTv3AbIofsyy5YbfzokK00cS7ymLKfKdwCGWissk=;
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Jan Beulich <jbeulich@suse.com>
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
 <ca4bef26-0869-8a56-e96c-04d3b41ffcd6@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b6fa61e1-5e16-ad04-a052-89f617064a42@xen.org>
Date: Wed, 14 Apr 2021 09:28:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ca4bef26-0869-8a56-e96c-04d3b41ffcd6@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 14/04/2021 08:08, Jan Beulich wrote:
> On 13.04.2021 19:12, Julien Grall wrote:
>> On 12/04/2021 11:49, Roger Pau Monné wrote:
>>> On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
>>>> --- a/xen/include/xen/vpci.h
>>>> +++ b/xen/include/xen/vpci.h
>>>> @@ -91,6 +91,7 @@ struct vpci {
>>>>            /* FIXME: currently there's no support for SR-IOV. */
>>>>        } header;
>>>>    
>>>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>>>        /* MSI data. */
>>>>        struct vpci_msi {
>>>>          /* Address. */
>>>> @@ -136,6 +137,7 @@ struct vpci {
>>>>                struct vpci_arch_msix_entry arch;
>>>>            } entries[];
>>>>        } *msix;
>>>> +#endif /* CONFIG_PCI_MSI_INTERCEPT */
>>>
>>> Note that here you just remove two pointers from the struct, not that
>>> I'm opposed to it, but it's not that much space that's saved anyway.
>>> Ie: it might also be fine to just leave them as NULL unconditionally
>>> on Arm.
>>
>> Can the two pointers be NULL on x86? If not, then I would prefer if they
>> disappear on Arm so there is less chance to make any mistake (such as
>> unconditionally accessing the pointer in common code).
> 
> Alternative proposal: How about making it effectively impossible to
> de-reference the pointer on Arm by leaving the field there, but having
> the struct definition available on non-Arm only?

Meh, it making more difficult for the reader because it has to go 
through one more hop to find out why the structure is not defined.

IOW, I still prefer Rahul's version.

Cheers,

-- 
Julien Grall

