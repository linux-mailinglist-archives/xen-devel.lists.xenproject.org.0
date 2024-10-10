Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE79979C9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815310.1229026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhL0-0002U7-7i; Thu, 10 Oct 2024 00:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815310.1229026; Thu, 10 Oct 2024 00:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhL0-0002SF-5A; Thu, 10 Oct 2024 00:47:30 +0000
Received: by outflank-mailman (input) for mailman id 815310;
 Thu, 10 Oct 2024 00:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhKy-0002S5-LG
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:47:28 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37b3aca9-86a1-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 02:47:27 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728521241337635.1970057559772;
 Wed, 9 Oct 2024 17:47:21 -0700 (PDT)
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
X-Inumbo-ID: 37b3aca9-86a1-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728521242; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lY4iIpFbpJxkxh3GPB27gyUMyp4iNN7DsjBkjG/P1K2Spm2GRNKruwjjirJsj0qQzIaGoLUan27HZtCmGeHQONqXM98vXisHEQ/CoqrK999tFQ7QkRtyF3R18FDUn5h3KfH0t6Ku3+ONxOOrJjJylIpsUMycyjvAVp/6WC5DaRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728521242; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gZTkhOSk/kaV0obRoFr8A61Yu9lGE1AAoGmhvHhtnbY=; 
	b=bnqe7aVHjEvT9C+L6kAtKkVu41ic0h04gWeydsM2ROdypBpxPdrHaj0BXY76aXEk95V74i4IZC+ye+V/fRDixYrDnql7HKPgC5b8vs0KUi9WTiPkZyeiZqo/PqT1PPrpjVvHGFC1gXH0/7zP0Tyw+LthajpYGv0Zh2ftynBfv3Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728521242;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gZTkhOSk/kaV0obRoFr8A61Yu9lGE1AAoGmhvHhtnbY=;
	b=g1tH3eAVoigkESX0SpMUc1QMuJ5U24PpHZJwy6e8EkHvKG1sMsThJD7Rcie0SwbX
	Jlg4JcyVN5X/TLt8i3yFRpbWcyiWD6EbpLUl/40Dqmyf/dAjfc7HJcAELFWpkAgrOx/
	/vI1rIyLPQtdouzPZUU4wfRtW2nu5zudWLkMbvQU=
Message-ID: <d0b5da96-1928-48c8-b677-144df881cae3@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:47:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 41/44] x86/boot: add struct domain to struct
 boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-42-dpsmith@apertussolutions.com>
 <949190c5-07a2-44dc-a4de-bc59ae88beec@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <949190c5-07a2-44dc-a4de-bc59ae88beec@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 15:48, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Store a reference to the created domain in struct boot_domain.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index f250638edf09..e6a231bd2d42 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -959,7 +959,6 @@ static struct domain *__init create_dom0(struct 
>> boot_info *bi)
>>           },
>>       };
>>       struct boot_domain *bd = &bi->domains[0];
>> -    struct domain *d;
>>       if ( opt_dom0_pvh )
>>       {
>> @@ -976,13 +975,13 @@ static struct domain *__init create_dom0(struct 
>> boot_info *bi)
>>       /* Create initial domain.  Not d0 for pvshim. */
>>       bd->domid = get_initial_domain_id();
>> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : 
>> CDF_privileged);
> 
> It's a smaller patch if you keep `d` and the line above and then do:
>         bd->d = d;

Yah, this can be done.

v/r,
dps

