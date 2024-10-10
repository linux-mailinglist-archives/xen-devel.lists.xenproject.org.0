Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C2997A04
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 03:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815375.1229117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhiV-0008Sz-Ul; Thu, 10 Oct 2024 01:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815375.1229117; Thu, 10 Oct 2024 01:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhiV-0008RA-Qm; Thu, 10 Oct 2024 01:11:47 +0000
Received: by outflank-mailman (input) for mailman id 815375;
 Thu, 10 Oct 2024 01:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhiU-0008R4-F6
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 01:11:46 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c3a2431-86a4-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 03:11:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728522696188496.68263030616276;
 Wed, 9 Oct 2024 18:11:36 -0700 (PDT)
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
X-Inumbo-ID: 9c3a2431-86a4-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728522698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dBeBfaDto9GNKdMVScVF9/0DwBi9njvZhyIc+sIMN0OvI7RoErL6uruogln1NNTNl5PhfLkgh7De4PJn6q8hJ3mu8tljMRmTcDDKrIdHzkEqyjYNT5XqXs6YHDq/D193eEMEoqXCalZTu7lNYCjo22loH1kpQyDvYuF4gAzKjUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728522698; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lg62GVQsE6x2aCxahcVNVYLttwIXT4Edl9jV2NaIpAY=; 
	b=j2rcRz8lpZKhUynOUQM50rPQAe3TyZEd6PQrAfnKS1b6UDNhNMP1osyBQnZe06ZZ+m4sZtdFFcxxtNaVwmN034eXlyEW/tkRbD8hdjXZ9am35kXA1oM8WdUvHg9JSq+8EQSkLZ9NV5Q91w0rpMpVG4v108iwO7/QC83Fw/Rp/Fg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728522698;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Lg62GVQsE6x2aCxahcVNVYLttwIXT4Edl9jV2NaIpAY=;
	b=X4k6l6cN7fm1uOo8K/3VfYOw9a7PDbD6xVGdpIaH6xY7pI3Lt6U02jgfDCfukuAS
	vM9TP09DARUeQYHGD6NusVO/zA61URzFpL62aFGghPFaqsw38uVcGqEbvhjYXqA5EHa
	lVanajxrRF8+KtSUoqdf0r0YgbfCnnj3fjCstHKo=
Message-ID: <f11c6844-c3f9-413a-b280-0073577de464@apertussolutions.com>
Date: Wed, 9 Oct 2024 21:11:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/44] x86/boot: introduce boot module types
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-10-dpsmith@apertussolutions.com>
 <77257ccc-2da9-4b9c-bc91-21357486c206@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <77257ccc-2da9-4b9c-bc91-21357486c206@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/9/24 11:30, Jan Beulich wrote:
> On 06.10.2024 23:49, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -311,6 +311,10 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
>>       for ( i = 0; i <= bi->nr_modules; i++ )
>>           bi->mods[i].mod = &mods[i];
> 
> This loop, on its last iteration, has done ...
> 
>> +    /* map the last mb module for xen entry */
>> +    bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
>> +    bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];
> 
> ... this assignment already, hasn't it?

Yep, looks like I missed that the rebase of this commit put the 
assignment back in. Will make sure it's not re-inserted.

v/r,
dps

