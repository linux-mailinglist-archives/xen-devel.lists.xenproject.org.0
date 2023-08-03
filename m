Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8176E9B1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 15:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576364.902404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRY8P-0000Hy-Vs; Thu, 03 Aug 2023 13:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576364.902404; Thu, 03 Aug 2023 13:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRY8P-0000FI-TE; Thu, 03 Aug 2023 13:12:57 +0000
Received: by outflank-mailman (input) for mailman id 576364;
 Thu, 03 Aug 2023 13:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qRY8O-0000FC-1Y
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 13:12:56 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741d7b0e-31ff-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 15:12:54 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691068361302602.0827953807205;
 Thu, 3 Aug 2023 06:12:41 -0700 (PDT)
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
X-Inumbo-ID: 741d7b0e-31ff-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691068363; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KdBsPb/36Bx0f6EAyNk9GAejDbzVKtsrpfId3o9DsKSakDAiXm5iaPRAD3zydRDbmASP0TEiC96RfTIVn12R1QBFxj8TU9SmO2w5UygtJyzXafjUtlwTLBl2tPiE80EoDRd+wjpXVwLeDHqCeWjtwzjbVfftZOskzYHYf+TgOQ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691068363; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=p+i+tVUmrsXbTJPh7J2O2HcVZAW1GBPm8/kJrcCQziQ=; 
	b=HmkZojdErOmaW8xbYJKKP6X6BtaE3dQx8oGsIJJWeCitpEzy15wI/RrsrDEY7T/WI9ScJeDbm9AlpNJrzTOOxZvf1JXDMrLUWXM8YHak12EwoFWbGlMFaOfxk7Tw9IGFLux8y7wTKl89AYlIhjVfd0QE6aLeseIOY8JYiymVJk0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691068363;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=p+i+tVUmrsXbTJPh7J2O2HcVZAW1GBPm8/kJrcCQziQ=;
	b=QZRQZK+9piv1CiQOSJUm2QJ2zYpE37zd78k2Kr3BFRv/47HgBV6nc1SGfYE5tdVc
	gTXcy1VXwG2W02betM0mkPC7zn9lPXQjfaDCj1FbjaBdNCUo/2aWJVDUUq9pgITk2Fi
	C0U2v6hlY2RpLXyT9wKLHudxtuw8koe0AmfX0QSk=
Message-ID: <98db3f0c-6188-ba1b-7252-ae3e31adbf36@apertussolutions.com>
Date: Thu, 3 Aug 2023 09:12:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
 <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
 <alpine.DEB.2.22.394.2308021657290.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308021657290.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 8/2/23 19:58, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Jan Beulich wrote:
>>> -    for ( ; ; )
>>> +    if ( d == NULL )
>>
>> This covers both Xen receiving input and the domain receiving input having
>> gone away. Originally in the latter case the next sequential (in domid
>> numbering) domain would be switched to. In the new logic you start over
>> from the beginning of the domain list. Such a change in behavior (if
>> deemed acceptable at all, which I'm not convinced of) needs calling out in
>> the description.
> 
> I think it would be best to keep the current behavior as we already
> have people using it unless we have strong reasons to change it.

I agree and intended to keep the order of switching but I disagree on 
keeping the complete current behavior. I mean that by the complete 
current behavior being defined, at least for Arm, as meaning only the 
domains created at boot. The is_console flag in struct domain is the DAC 
equivalent to granting the FLASK access XEN__READCONSOLE to a domain, it 
was just never implemented/used until domoless enable it. An intended 
consequence of this patch is to ensure any domain granted the privilege, 
either through the DAC is_console or FLASK XEN__READCONSOLE, is included 
in the rotation regardless if the domain was created at boot or at runtime.

v/r,
dps

