Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F5E9ED6CB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 20:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855263.1268251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSiY-0000x0-4M; Wed, 11 Dec 2024 19:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855263.1268251; Wed, 11 Dec 2024 19:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLSiY-0000uj-1a; Wed, 11 Dec 2024 19:49:54 +0000
Received: by outflank-mailman (input) for mailman id 855263;
 Wed, 11 Dec 2024 19:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLSiW-0000uc-Ny
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 19:49:52 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1395a458-b7f9-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 20:49:49 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733946578178640.3325830817193;
 Wed, 11 Dec 2024 11:49:38 -0800 (PST)
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
X-Inumbo-ID: 1395a458-b7f9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733946580; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hOzneaWZo6iyJbmQNns9dpq38N5tkC44ULH9yr+oSlmaZrvFIuyNQqzV6SxCYFc3B+z2LdjZ671goBuVnDEdBL5FsPkwvyyJl8qUYsjyOV/SX+lfGmzp+I+jjoQylimaFioPqhnbgtSsGG9FcGVa/9X6IVt65Vo6stxL27V12M8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733946580; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QRMV5mz0I1LKwrGBAt8mQqfHcldiCxpHbNA/ilPHm7A=; 
	b=DeAANlDOKTpQW+ocVsHPFZSoBEpb7I3+j4MCJBEq62bCWCFQgmgUXnIId13VETxJjpwlD5Q/A2txYwVCLUzH+6t1n0q57uoIb+5GmqvppbYL3mGns5n2NoMLV9yjsEgposBj3YZX3e0h8Sgw5IvxLJCYzaAG+t0OYMS/AePtEC0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733946580;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QRMV5mz0I1LKwrGBAt8mQqfHcldiCxpHbNA/ilPHm7A=;
	b=Rb+cGOFfymNCKPTgTBivGUP3IV7ABcoGwtJVDRo74i3lQg82ICx8snuPKnHsofxz
	WKdYFiYZ3o7hkoTdlC22GSF16EmhtYo5wGCwZKx37KWM2rCzkMAhL+R57RtUelP5UsK
	TnwvGtmG5e4wNb/eGYoadT2QkmuIfFspNHG+R24s=
Message-ID: <18da1057-9874-44b0-a25c-f1ce733611f8@apertussolutions.com>
Date: Wed, 11 Dec 2024 14:49:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-15-dpsmith@apertussolutions.com>
 <88126e8c-96f8-4cb2-a899-eec2b800cf66@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <88126e8c-96f8-4cb2-a899-eec2b800cf66@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 07:19, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -617,6 +617,9 @@ int __init construct_dom0(struct boot_domain *bd)
>>       if ( !get_memsize(&dom0_max_size, LONG_MAX) && bd->max_pages )
>>           dom0_size.nr_pages = bd->max_pages;
>>   
>> +    if ( opt_dom0_max_vcpus_max == UINT_MAX && bd->max_vcpus )
>> +        opt_dom0_max_vcpus_max = bd->max_vcpus;
> 
> Isn't this kind of backwards? I.e. aren't you meaning to move us towards
> boot-domains?

Prior to domain builder, available construction parameters for dom0 were 
exposed as command line parameters. This allowed for boot-time 
adjustments to the parameters. With domain builder, there are now two 
sources for dom0 construction parameters. Those coming from the device 
tree and those coming from the command line. For most x86 platforms, the 
device tree parameters can only be constructed prior to booting Xen. 
Whereas the command line parameters allow boot-time adjustments, at 
least for dom0. That is the thinking at least. Now if there is interest 
in being able to retire the command line options, that would definitely 
simplify things.

> Also, what about the counterpart opt_dom0_max_vcpus_min? That wants to be
> controllable from DT too, I would think?

Yes, in theory we will eventually be able to do requested/min/max as 
well as cpu pinning/affinity. For now it was requested we focus on 
implementing only requested vcpus.

v/r,
dps


