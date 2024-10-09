Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7809978F4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 01:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815247.1228947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfr6-0003x2-Hv; Wed, 09 Oct 2024 23:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815247.1228947; Wed, 09 Oct 2024 23:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syfr6-0003um-EV; Wed, 09 Oct 2024 23:12:32 +0000
Received: by outflank-mailman (input) for mailman id 815247;
 Wed, 09 Oct 2024 23:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syfr4-0003ug-NW
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 23:12:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3aef8b8-8693-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 01:12:29 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728515544112387.6852691226467;
 Wed, 9 Oct 2024 16:12:24 -0700 (PDT)
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
X-Inumbo-ID: f3aef8b8-8693-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728515545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iHCysmOxMuXFYTpekrpDgjvqyctxxiZ+aBlc3qxP2Yk+Hb6Xk7HdXZ6P1hoyIHwmdYOdDZ2HLiY7CJ1AiD/hhu2hoUSf3nZfF3ApxXx0ww5PujISzL01HoI+h0x8SXAkO+GwS0amHe5MkOOEk0ZPfo9VdiEw84bqMkEzIVmU3FM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728515545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CRjgCxYHOQlWMv2xwQkbSVWeOeTMUyHT68y+ZkZVLXI=; 
	b=GFTes7zVLF3+gANJ8liJybGWmMI0VEftMKw2q3erQI1T3F/GwpeD54H+m/TIPURHfOQGteAhwIA47URAyqQaonxi3ypmbqVTIiqhZA/FK3d0/ugBQ3hy1eF0BreEsxF/o1Q43glBPb9I7yUoqPp1U1KpZzu/ja6ZY9XAnupLe1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728515545;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CRjgCxYHOQlWMv2xwQkbSVWeOeTMUyHT68y+ZkZVLXI=;
	b=hkbG1NErj0+7vfWv0/j8Y1+ciSjw+7aAeYWKmAF97nrcpykM0NVd7W46SthPGwRx
	gq6Le5rmKK6iWQ+kyezWIV3BxzZfRd8IqLG4T6CAL9ugTbnmi3RYKiyA2McysDaYzVs
	cSP+k5aNFreS6LLuwV97i1KZydhLts8/uWsbs2q8=
Message-ID: <71aec85a-c8ad-4ce0-95e7-e5a5ed96e422@apertussolutions.com>
Date: Wed, 9 Oct 2024 19:12:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/44] x86/boot: convert dom0_construct_pv initrd param
 to struct boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-31-dpsmith@apertussolutions.com>
 <b86bdb83-d4fa-4ebd-ba13-adff8dba7bdd@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b86bdb83-d4fa-4ebd-ba13-adff8dba7bdd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 14:30, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> This changes the type for the initrd parameter of dom0_construct_pv to 
>> be struct
>> boot_module. This conversion requires several adjustments throughout 
>> dom0_construct_pv
>> to account for the type change. Removes the usage of early_mod field 
>> for ramdisk module.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index 7b6afe64d799..16b8c1e40998 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
> 
>> @@ -367,7 +367,8 @@ static int __init dom0_construct(struct domain *d,
>>       unsigned long nr_pt_pages;
>>       unsigned long alloc_spfn;
>>       unsigned long alloc_epfn;
>> -    unsigned long initrd_pfn = -1, initrd_mfn = 0;
>> +    unsigned long initrd_pfn = -1;
>> +    mfn_t  initrd_mfn = { 0 };
> 
> = _mfn(0);

Ack.

> With that:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

v/r,
dps

