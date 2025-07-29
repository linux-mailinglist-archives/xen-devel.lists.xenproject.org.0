Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C91B154A8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:29:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063101.1428896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrtC-0007BQ-1T; Tue, 29 Jul 2025 21:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063101.1428896; Tue, 29 Jul 2025 21:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrtB-00078R-UY; Tue, 29 Jul 2025 21:29:37 +0000
Received: by outflank-mailman (input) for mailman id 1063101;
 Tue, 29 Jul 2025 21:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oL40=2K=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ugrtB-00078L-1l
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:29:37 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ddb47bf-6cc3-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 23:29:33 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1753824564656381.7596782574932;
 Tue, 29 Jul 2025 14:29:24 -0700 (PDT)
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
X-Inumbo-ID: 1ddb47bf-6cc3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; t=1753824566; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WCes3E3mkJMBXfiQzyGz523CI03GdrzR+cUYjhdxF0I/fBCTNgbReNGtUHTaDmB1Fh/ogOPAGwYP6padn8nuwOvYqL4YvCvdY8TKetwcNM5hcJvcrcAKc6/S57UEHHlyPEwZIsaYIagdQYhR65X6rDp7CCLs6MdyDvVcWiNysaM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753824566; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4QZwNADOMklL2wUhJ9LYV6xeMr84fPOM5SE4RnWyz88=; 
	b=keEce4qQMVoZfPOyZSBE7Nm9gHgzSlLLFCrC+mF+zYKflTN1L9BaALcEg4ctnvpth7Lfi6a6gwpagcGG6s5CLyHt7FH4Ktvh+vONLRWRof056CZ0lCgInzu/6ribo95cCfeKwjonaemR16H1GtJpy2G0+HIf0yzgDJCEYvSYdQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753824566;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4QZwNADOMklL2wUhJ9LYV6xeMr84fPOM5SE4RnWyz88=;
	b=u//TOkB9hNElvTMwk8U8iMAiByViqGuL0XisSjbuN+fTZUSy31g/KdJX6B2S2cvH
	Jmkwyrc1/gDExDPkoNhkbgs24GmjpLC2CA9FDmrfMjjbVUTUANyKysOdgMM0Z+T9sHa
	fnb6nEuNpLdDDK//wyJZ4dX8XeRaeidO9ScquL08=
Message-ID: <ba1de9a2-09b1-4332-b27d-0e485d0c8ce5@apertussolutions.com>
Date: Tue, 29 Jul 2025 17:29:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
 <aICM2hqQoloEahgD@macbook.local> <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>
 <aINi024baOV5LQgn@macbook.local>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <aINi024baOV5LQgn@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/25/25 06:56, Roger Pau Monné wrote:
> On Fri, Jul 25, 2025 at 12:02:18PM +0200, Alejandro Vallejo wrote:
>> On Wed Jul 23, 2025 at 9:18 AM CEST, Roger Pau Monné wrote:
>>> On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
>>>> Later patches will keep refactoring create_dom0()
>>>> until it can create arbitrary domains. This is one
>>>> small step in that direction.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> ---
>>>>   xen/arch/x86/setup.c | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>> index c6890669b9..6943ffba79 100644
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>>       if ( IS_ERR(d) )
>>>>           panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>>   
>>>> -    init_dom0_cpuid_policy(d);
>>>> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
>>>
>>> You possibly want this to be:
>>>
>>> (d->cdf & (CDF_privileged | CDF_hardware)) == (CDF_privileged | CDF_hardware)
>>>
>>> To ensure the contents of dom0_cpuid_cmdline is only applied to dom0,
>>> and not to the hardware or control domains.  I assume it should be
>>> possible to pass a different set of cpuid options for the hardware vs
>>> the control domains.
>>>
>>> Thanks, Roger.
>>
>> Why only a hwdom+ctldom, surely a single hwdom should get it too.
> 
> hm, not really I think: a late hardware domain would get any custom
> cpuid options from the toolstack that created it, or in the
> hyperlaunch case from the provided configuration, but not from the
> dom0-cpuid command line option I would expect.  Otherwise you have two
> different sources of cpuid options, the inheritance from dom0-cpuid,
> plus whatever is provided from the hardware domain configuration.

Yes, this has been a sticking point for me and never got any good 
answers thus far. Should the dom0 related xen command line options only 
apply when not booting via hyperlaunch. If the answer is no, then you're 
in this area with some dom0 options that really are applicable to hwdom 
vs ctldom and vice-a-versa. Some could even be suggested to apply to 
both. And then, I don't believe there really is a consensus one which 
options apply to which domains. Over the years working on this, I have 
been an advocate that commandline adjustments allow for quicker 
troubleshooting by the user/administrator. In the last version of the 
multidomain construction RFC, I am growing more and more to advocate for 
my initial proposition, that dom0 options only apply when not using 
hyperlaunch.

>> I can see
>> the argument for a ctldom not getting it. For our use case having dom0
>> disaggregated is of the essence, so what happens with a hwdom that is not a
>> ctldom is fairly important.
>>
>> That said, I'm thinking moving in a different direction and have a generic
>> init_cpuid_policy() that internally checks for hw or control, or leave the
>> default policy or something else.
> 
> Right, so instead of introducing init_{hwdom,ctrldom}_cpuid_policy()
> equivalents you would rather generalize init_dom0_cpuid_policy() so
> it's used by all domains.
> 
>> This would remove the conditional and allow much finer selection. e.g: a domain
>> brought up through a "nomigrate" DTB node (TBD: nonexisting binding atm) would
>> get itsc reported, just as dom0 does today.
> 
> We might want to enforce such no migration attribute at the hypervisor
> level (by adding a new domain field to signal it possibly?), as this
> is all toolstack knowledge ATM.
> 
> On a related tangent: domains brought up using hyperlaunch will have a
> config file, capable of expressing options like cpuid features I
> expect, at which point ITSC could be set in the config file and Xen
> won't need to do any guessing?

The goal has never been to support all the configuration options that a 
full toolstack can adjust for the VM. I have always felt it should be a 
light-weight toolstack to allow essential configuration. I still 
advocate for the boot domain that would have capabilities like parsing 
the AML, walking PCI device tree, etc. It would then handle any more 
complicated initialization/configuration of the VMs before exiting and 
allowing all the domains to start

v/r,
dps


