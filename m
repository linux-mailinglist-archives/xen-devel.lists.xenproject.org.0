Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCDA9D4F6
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968649.1358150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8R9p-00057F-4s; Fri, 25 Apr 2025 22:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968649.1358150; Fri, 25 Apr 2025 22:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8R9p-00055k-1P; Fri, 25 Apr 2025 22:04:29 +0000
Received: by outflank-mailman (input) for mailman id 968649;
 Fri, 25 Apr 2025 22:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u8R9n-0004uQ-WA
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:04:28 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f0c1d0c-2221-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 00:04:25 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 174561865645622.734428437619954;
 Fri, 25 Apr 2025 15:04:16 -0700 (PDT)
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
X-Inumbo-ID: 3f0c1d0c-2221-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1745618659; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=myvkN7Dcp4E4gqAspoa9r5dF4Bc4GzarusLj6oV4p2AJCfsyZWS3MQcWeONrpTjld+NrtzXf7g7P/cl3dc1GTKIstx7EF07LSEcmJRQJII4kLNPbzc4zrKmppAFiuzkjz247Es9042LU3wddGun8B5klEFSIHjHxUORL6aUVqLw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745618659; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DQuEqIMPvJwNj6ekWcI94f0W6Kksnl9ZxVg8n0zm3uE=; 
	b=BFLMIoO1iKWL0dZKZr46DbszI6xvovURKUb79kyGR94LQ7KDTHFLpix7/VoaAxpdkQZ2tqWsg4IZxPMpkq2Yv1nLni6Xr/23MQrxUawH5dJWETHu8jbEVVAa7L6yoUDin4gNmBbt/11Auv39l95YmF8/sLwfvcaoqb4Ndw1OG1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745618659;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DQuEqIMPvJwNj6ekWcI94f0W6Kksnl9ZxVg8n0zm3uE=;
	b=rPzFSFQ/D2GFi8tkI3FPW1kyLGGAba70/DpcoLougQGTGwBc+zZb5nWsgxrAweMg
	wfurc4kog6gW/UYjPYrEbgpkKQx2jvloQweUSFN2sB/WHCbJeBYNUiSADXMMV/2a5c0
	n+5fJnvge2g5Ab85lW6qZSY/UPKUaucARLE/HLaQ=
Message-ID: <9cad677f-cfcd-4eec-b824-01d281cb7076@apertussolutions.com>
Date: Fri, 25 Apr 2025 18:04:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 04/38] x86/hyperlaunch: convert vcpu0 creation to domain
 builder
Content-Language: en-US
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-5-dpsmith@apertussolutions.com>
 <D9FTMDQ501TU.1H73IHNYGWKZH@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 xsJuBFYrueARCACPWL3r2bCSI6TrkIE/aRzj4ksFYPzLkJbWLZGBRlv7HQLvs6i/K4y/b4fs
 JDq5eL4e9BdfdnZm/b+K+Gweyc0Px2poDWwKVTFFRgxKWq9R7McwNnvuZ4nyXJBVn7PTEn/Z
 G7D08iZg94ZsnUdeXfgYdJrqmdiWA6iX9u84ARHUtb0K4r5WpLUMcQ8PVmnv1vVrs/3Wy/Rb
 foxebZNWxgUiSx+d02e3Ad0aEIur1SYXXv71mqKwyi/40CBSHq2jk9eF6zmEhaoFi5+MMMgX
 X0i+fcBkvmT0N88W4yCtHhHQds+RDbTPLGm8NBVJb7R5zbJmuQX7ADBVuNYIU8hx3dF3AQCm
 601w0oZJ0jGOV1vXQgHqZYJGHg5wuImhzhZJCRESIwf+PJxik7TJOgBicko1hUVOxJBZxoe0
 x+/SO6tn+s8wKlR1Yxy8gYN9ZRqV2I83JsWZbBXMG1kLzV0SAfk/wq0PAppA1VzrQ3JqXg7T
 MZ3tFgxvxkYqUP11tO2vrgys+InkZAfjBVMjqXWHokyQPpihUaW0a8mr40w9Qui6DoJj7+Gg
 DtDWDZ7Zcn2hoyrypuht88rUuh1JuGYD434Q6qwQjUDlY+4lgrUxKdMD8R7JJWt38MNlTWvy
 rMVscvZUNc7gxcmnFUn41NPSKqzp4DDRbmf37Iz/fL7i01y7IGFTXaYaF3nEACyIUTr/xxi+
 MD1FVtEtJncZNkRn7WBcVFGKMAf+NEeaeQdGYQ6mGgk++i/vJZxkrC/a9ZXme7BhWRP485U5
 sXpFoGjdpMn4VlC7TFk2qsnJi3yF0pXCKVRy1ukEls8o+4PF2JiKrtkCrWCimB6jxGPIG3lk
 3SuKVS/din3RHz+7Sr1lXWFcGYDENmPd/jTwr1A1FiHrSj+u21hnJEHi8eTa9029F1KRfocp
 ig+k0zUEKmFPDabpanI323O5Tahsy7hwf2WOQwTDLvQ+eqQu40wbb6NocmCNFjtRhNZWGKJS
 b5GrGDGu/No5U6w73adighEuNcCSNBsLyUe48CE0uTO7eAL6Vd+2k28ezi6XY4Y0mgASJslb
 NwW54LzSSM0uRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29t
 PsJ6BBMRCAAiBQJWK7ngAhsjBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBTc6WbYpR8
 KrQ9AP94+xjtFfJ8gj5c7PVx06Zv9rcmFUqQspZ5wSEkvxOuQQEAg6qEsPYegI7iByLVzNEg
 7B7fUG7pqWIfMqFwFghYhQzOwU0EViu54BAIAL6MXXNlrJ5tRUf+KMBtVz1LJQZRt/uxWrCb
 T06nZjnbp2UcceuYNbISOVHGXTzu38r55YzpkEA8eURQf+5hjtvlrOiHxvpD+Z6WcpV6rrMB
 kcAKWiZTQihW2HoGgVB3gwG9dCh+n0X5OzliAMiGK2a5iqnIZi3o0SeW6aME94bSkTkuj6/7
 OmH9KAzK8UnlhfkoMg3tXW8L6/5CGn2VyrjbB/rcrbIR4mCQ+yCUlocuOjFCJhBd10AG1IcX
 OXUa/ux+/OAV9S5mkr5Fh3kQxYCTcTRt8RY7+of9RGBk10txi94dXiU2SjPbassvagvu/hEi
 twNHms8rpkSJIeeq0/cAAwUH/jV3tXpaYubwcL2tkk5ggL9Do+/Yo2WPzXmbp8vDiJPCvSJW
 rz2NrYkd/RoX+42DGqjfu8Y04F9XehN1zZAFmCDUqBMa4tEJ7kOT1FKJTqzNVcgeKNBGcT7q
 27+wsqbAerM4A0X/F/ctjYcKwNtXck1Bmd/T8kiw2IgyeOC+cjyTOSwKJr2gCwZXGi5g+2V8
 NhJ8n72ISPnOh5KCMoAJXmCF+SYaJ6hIIFARmnuessCIGw4ylCRIU/TiXK94soilx5aCqb1z
 ke943EIUts9CmFAHt8cNPYOPRd20pPu4VFNBuT4fv9Ys0iv0XGCEP+sos7/pgJ3gV3pCOric
 p15jV4PCYQQYEQgACQUCViu54AIbDAAKCRBTc6WbYpR8Khu7AP9NJrBUn94C/3PeNbtQlEGZ
 NV46Mx5HF0P27lH3sFpNrwD/dVdZ5PCnHQYBZ287ZxVfVr4Zuxjo5yJbRjT93Hl0vMY=
In-Reply-To: <D9FTMDQ501TU.1H73IHNYGWKZH@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/25/25 11:22, Alejandro Vallejo wrote:
> On Sat Apr 19, 2025 at 11:07 PM BST, Daniel P. Smith wrote:
>> Convert alloc_dom0_vcpu0() to dom0_set_affinity(), making it only set up the
>> node affinity based on command line parameters passed. At the same time,
>> introduce alloc_dom_vcpu0() as the replacement for alloc_dom0_vcpu(). Then have
>> alloc_dom_vcpu0() call dom0_set_affinity() when the boot domain is the control
>> domain, otherwise set the affinity to auto.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/dom0_build.c                 |  4 +---
>>   xen/arch/x86/domain-builder/domain.c      | 11 +++++++++++
>>   xen/arch/x86/include/asm/dom0_build.h     |  2 ++
>>   xen/arch/x86/include/asm/domain-builder.h |  1 +
>>   xen/arch/x86/setup.c                      |  5 +++--
>>   5 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain-builder/domain.c b/xen/arch/x86/domain-builder/domain.c
>> index f2277b9e3cf3..619d36ea0b87 100644
>> --- a/xen/arch/x86/domain-builder/domain.c
>> +++ b/xen/arch/x86/domain-builder/domain.c
>> @@ -9,6 +9,7 @@
>>   #include <xen/sched.h>
>>   
>>   #include <asm/bootinfo.h>
>> +#include <asm/dom0_build.h>
>>   
>>   unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>>   {
>> @@ -27,6 +28,16 @@ unsigned int __init dom_max_vcpus(struct boot_domain *bd)
>>       return bd->max_vcpus;
>>   }
>>   
>> +struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
>> +{
>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>> +        dom0_set_affinity(bd->d);
> 
> Similar as before, this probably wants to be DOMAIN_CAPS_HARDWARE?
> 
> I'll adjust while rebasing.

Does it?

v/r,
dps


