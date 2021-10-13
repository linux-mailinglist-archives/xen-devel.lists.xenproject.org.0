Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E842B89E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 09:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207959.363960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYQW-0002hk-I8; Wed, 13 Oct 2021 07:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207959.363960; Wed, 13 Oct 2021 07:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maYQW-0002ew-Ee; Wed, 13 Oct 2021 07:11:48 +0000
Received: by outflank-mailman (input) for mailman id 207959;
 Wed, 13 Oct 2021 07:11:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K823=PB=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1maYQV-0002dg-M9
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 07:11:47 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1f347d01-5b27-4c4a-85a5-76ba11e5a374;
 Wed, 13 Oct 2021 07:11:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53F131FB;
 Wed, 13 Oct 2021 00:11:45 -0700 (PDT)
Received: from [10.57.25.166] (unknown [10.57.25.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8E173F66F;
 Wed, 13 Oct 2021 00:11:42 -0700 (PDT)
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
X-Inumbo-ID: 1f347d01-5b27-4c4a-85a5-76ba11e5a374
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <alpine.DEB.2.21.2110121439100.9408@sstabellini-ThinkPad-T480s>
 <44eae5c0-28a0-590a-07c6-6b411b23ebc3@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <70fa9c08-4a5d-323a-a629-6471aeb76797@arm.com>
Date: Wed, 13 Oct 2021 09:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <44eae5c0-28a0-590a-07c6-6b411b23ebc3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 13.10.2021 08:18, Jan Beulich wrote:
> On 12.10.2021 23:48, Stefano Stabellini wrote:
>> On Mon, 11 Oct 2021, Roger Pau Monné wrote:
>>> On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
>>>> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
>>>> Reject the use of this new flag for x86 as VPCI is not supported for
>>>> DOMU guests for x86.
>>>
>>> I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
>>> PVH dom0, like we do for any other CDF flags when Xen builds dom0.
>>>
>>> Things like PVH vs PV get translated into CDF flags by create_dom0,
>>> and processed normally by the sanitise_domain_config logic, vPCI
>>> should be handled that way.
>>>
>>> Do you think you could see about fixing this?
>>
>> Andrew suggested to use XEN_SYSCTL_PHYSCAP_vpci to check whether we can
>> set XEN_DOMCTL_CDF_vpci in libxl and it looks like we have consensus on
>> this approach. [1][2]
>>
>> So it makes sense that XEN_DOMCTL_CDF_vpci is only set when
>> XEN_SYSCTL_PHYSCAP_vpci is also set, i.e. XEN_SYSCTL_PHYSCAP_vpci ==
>> XEN_DOMCTL_CDF_vpci.
>>
>> From [2], XEN_SYSCTL_PHYSCAP_vpci is not going to be set on x86, so then
>> XEN_DOMCTL_CDF_vpci should also be left unset?
>>
>> If you think XEN_DOMCTL_CDF_vpci should be set for x86 PVH Dom0, then
>> XEN_SYSCTL_PHYSCAP_vpci should also be set for x86 PVH Dom0.
> 
> Except that XEN_SYSCTL_PHYSCAP_vpci is not a domain specific attribute,
> but a host-wide one.
> 
> Jan
> 
> 
I already prepared a patch introducing XEN_SYSCTL_PHYSCAP_vpci. We agreed
that the cap_vpci should not be set neither for x86 nor ARM. This means that
the flag vpci_is_available, which tells us about vPCI platform support (and is used
in condition to set cap_vpci) is set to false by default. Later on it should be set by vPCI driver.
For me it does not make sense for XEN_SYSCTL_PHYSCAP_vpci saying that platform does not support vPCI
but setting XEN_DOMCTL_CDF_vpci for dom0 pvh.
I would prefer not setting XEN_DOMCTL_CDF_vpci for now at all. This way we have a chance
to merge Rahul's series until friday.

Cheers,
Michal

