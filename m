Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D29ED479
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 19:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855233.1268230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLR5z-00015k-Pb; Wed, 11 Dec 2024 18:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855233.1268230; Wed, 11 Dec 2024 18:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLR5z-000145-N6; Wed, 11 Dec 2024 18:05:59 +0000
Received: by outflank-mailman (input) for mailman id 855233;
 Wed, 11 Dec 2024 18:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLR5y-00013u-DX
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 18:05:58 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 907abb16-b7ea-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 19:05:56 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733940349333613.1622616607953;
 Wed, 11 Dec 2024 10:05:49 -0800 (PST)
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
X-Inumbo-ID: 907abb16-b7ea-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733940351; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IRzFixlOPDEwGnV06tDo7D/IvhDjwyCUe0KNjVdQDv/js8VexEQzL3iHa6y7VQZndweIggV+hB2kgZVg91tyEAYc1jV1vfs+zn3Q6WgUwpZtpCnCSpxg513P2BJflxf7f5CksFUG0PM/b+zfs0a1lOzROL2hs3/ag6bP2z93BUk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733940351; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=12ImO80Zzt0+1Mm+hbsb8wgw1RlNEeGO9yRNMtB0DDg=; 
	b=NjkN3EsY2psVZIammRihAEFuFNhpPgN0lJkrA72OveXkvGNF0jVY3vv0sTcOWW2ZQIcvtXTU0UopdL2+Pt4IL0oWY3hjDegdeQuYvUBd7C9jTbhKkxVVnoNGLERxEJ1/0VB49uYa21fZidsV1feZr7QSUbv8oDujMZB1gpgNvLo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733940351;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=12ImO80Zzt0+1Mm+hbsb8wgw1RlNEeGO9yRNMtB0DDg=;
	b=LR5JYPMCHVWDUgS0T7JZuZUuvzaPHWOulbRdMqbVi9V0oQvbcbSyJJ9uEd91qBpE
	a6ZDA+Eajm6MIo2jHkCZDHx+tfIO0np5TI/0NVGzUsj4qgZ0sUFKXYcp9zi1eO2oGZ6
	Iws7E8c/bPLXjyzCx0jvFS7H/SQu/zbq17Wlllws=
Message-ID: <b235791b-6cae-45c7-af6b-710ed2edf63f@apertussolutions.com>
Date: Wed, 11 Dec 2024 13:05:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-15-dpsmith@apertussolutions.com>
 <0dc5d92f-5405-4eaa-ae77-bfa6a347d9d8@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <0dc5d92f-5405-4eaa-ae77-bfa6a347d9d8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 19:05, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Introduce the `cpus` property, named as such for dom0less 
>> compatibility, that
>> represents the maximum number of vpcus to allocate for a domain. In 
>> the device
>> tree, it will be encoded as a u32 value.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
> 
>> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/ 
>> domain_builder/fdt.c
>> index b8ace5c18c6a..d24e265f2378 100644
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -197,6 +197,18 @@ static int __init process_domain_node(
>>               bd->max_pages = PFN_DOWN(kb * SZ_1K);
>>               printk("  max memory: %ld\n", bd->max_pages << PAGE_SHIFT);
>>           }
>> +        if ( match_fdt_property(fdt, prop, "cpus" ) )
> 
> I think I forgot to mention it on earlier ones, but I think all these 
> match_fdt_property() should be chained together with "else if".

Ack.

> With that
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

