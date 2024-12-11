Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95A59ED406
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855195.1268201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQoz-00020s-UE; Wed, 11 Dec 2024 17:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855195.1268201; Wed, 11 Dec 2024 17:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQoz-0001zF-RH; Wed, 11 Dec 2024 17:48:25 +0000
Received: by outflank-mailman (input) for mailman id 855195;
 Wed, 11 Dec 2024 17:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLQoz-0001z9-28
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:48:25 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cbbfb9e-b7e8-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 18:48:22 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733939293889905.8481153499937;
 Wed, 11 Dec 2024 09:48:13 -0800 (PST)
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
X-Inumbo-ID: 1cbbfb9e-b7e8-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733939297; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EbaxsIhDZ0T8EveJeM9QHEFjURLIVN23qWPyYnklrTdW5hZX1KuwerHri4GRfr60U+KQmOezIikIPrLObgxG61wDmsswOewBq1C5nLOXdjEraJr3NZtYTMZYsSN0yKoN9tICvD6Z/EphN5ZI71eyBQoYYG3Irg4kXiwBYjuHUu8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733939297; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YGNri/AxMCHpfyBgHH9l/zMoenKe3yZTJZzLs9MsvJA=; 
	b=ds58Qr/u4bgXuCQxJrFpWMdHzjsEw52GWCjuwSDTd8hqnRV0fAulGofN7aGinAWhN2dV7TwQSYedSvsltBbCdv7DSdj+2mOZWpIHWhRPfv6Ndh1ZYtmrVBn4+eTlwydQ8mSd0q8+CBS9a8YdCJKI8Bt9pMnVtnorOqbD/iKpyyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733939297;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YGNri/AxMCHpfyBgHH9l/zMoenKe3yZTJZzLs9MsvJA=;
	b=PoQKqKRju/GsyPkOqwVUX9ducm2HEzG9VYSe1RJXcaI6Q5ZydvmaHouOJJgRoVsa
	LuaIuS+Fa4oX7zj/6Q+ZY3ewWXQRiCpNn1q4zmHRMCH+blv5UloS5fia5oA9xH7KF7N
	ADUkAI3lRSuFWZ6GTPFyUXV/BAyMHnL5oUHAN/Cc=
Message-ID: <029011a0-0b7c-48e2-a98a-845588bbc7bf@apertussolutions.com>
Date: Wed, 11 Dec 2024 12:48:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-13-dpsmith@apertussolutions.com>
 <294035fd-45c9-4c59-a5b7-bc1ebed90e47@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <294035fd-45c9-4c59-a5b7-bc1ebed90e47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 07:06, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/domain_builder/fdt.c
>> +++ b/xen/arch/x86/domain_builder/fdt.c
>> @@ -141,6 +141,25 @@ static int __init process_domain_node(
>>               bd->domid = (domid_t)val;
>>               printk("  domid: %d\n", bd->domid);
>>           }
>> +        if ( match_fdt_property(fdt, prop, "mode" ) )
>> +        {
>> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>> +            {
>> +                printk("  failed processing mode for domain %s\n",
>> +                       name == NULL ? "unknown" : name);
>> +                return -EINVAL;
>> +            }
>> +
>> +            printk("  mode: ");
>> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) ) {
>> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
>> +                    printk("HVM\n");
>> +                else
>> +                    printk("PVH\n");
>> +            }
>> +            else
>> +                printk("PV\n");
> 
> Oh, and: What about BUILD_MODE_ENABLE_DM also being set here?

Are you asking in the sense that the PV domain is being flag as a device 
model domain? Maybe I am missing something, but I am not aware of 
anything specific that must be set for a PV domain to operate as device 
model domain. If flask is in play, then there is a secure label 
requirement but that is separate of a mode that the domain must be 
running in. Please enlighten me if I am over looking something.

v/r,
dps

