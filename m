Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95A540087
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 15:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343296.568600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZhn-000770-Eo; Tue, 07 Jun 2022 13:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343296.568600; Tue, 07 Jun 2022 13:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZhn-00074b-BN; Tue, 07 Jun 2022 13:57:11 +0000
Received: by outflank-mailman (input) for mailman id 343296;
 Tue, 07 Jun 2022 13:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyZhm-00074V-0r
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 13:57:10 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b785aae1-e669-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 15:57:08 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654610219359757.4448433028651;
 Tue, 7 Jun 2022 06:56:59 -0700 (PDT)
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
X-Inumbo-ID: b785aae1-e669-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1654610224; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NgD/lrOma2MdX58Kdyi3sc+FlohT0S9Zd8/aikUnsQDOKnKbquphyoV0N2bSL8mdTq7Ge/clRm5pCL4/xkUs1teONELvrH2wZCC6Gf4ot4IQ+BYeZxkIFxT/lf7cUbQK40dvET9RI1nWXvZN1HF0ImR8ssmG4gWtsHLrPumpn0I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654610224; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=i+13/atmT2pRkn+f2pb7VWfDJx2TihjcLgz8X3iQ3xw=; 
	b=KZxlGwKk9j9FBxbYKxmd4O/Aului3XMlpWM9ZNPm2Mf1/ehzPqFN/VqMJZn14dQ4TCDRqd3EeBU8wab+eivCV7z8spx/XuuIkwOZItzZTC5HVLgzDFA/6pVHeUF18ahoK9hT7YhjHHVEn//io7/7ufMpl2d0NGriJghoaRXsvWs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654610224;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=i+13/atmT2pRkn+f2pb7VWfDJx2TihjcLgz8X3iQ3xw=;
	b=OL9cfskioxpqc/hD+3UrKbIljiRoA6HiLS8x8+3Ms/Hj0ZdRCCq7Qn5CE5ZTeQlH
	n7In/RJWXBKc4GKBg9HNituzbApuLQ1WCwAw53Q5GSXIuk8XZIgK5GM7ek4ColfR8NG
	a+TkZRePdwSGpCbu2qqE9OKwq46Gc994scukI9zU=
Message-ID: <76d59a32-203a-5a8b-83f4-ab60d419ef9f@apertussolutions.com>
Date: Tue, 7 Jun 2022 09:55:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-4-dpsmith@apertussolutions.com>
 <c206a20b-ee5f-aa5b-64ba-fe06469f0f2f@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 3/3] xsm: properly handle error from XSM init
In-Reply-To: <c206a20b-ee5f-aa5b-64ba-fe06469f0f2f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 5/31/22 15:18, Andrew Cooper wrote:
> On 31/05/2022 19:20, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 53a73010e0..ed67b50c9d 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1700,7 +1701,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>>                                    RANGESETF_prettyprint_hex);
>>  
>> -    xsm_multiboot_init(module_map, mbi);
>> +    if ( xsm_multiboot_init(module_map, mbi) )
>> +        warning_add("WARNING: XSM failed to initialize.\n"
>> +                    "This has implications on the security of the system,\n"
>> +                    "as uncontrolled communications between trusted and\n"
>> +                    "untrusted domains may occur.\n");
> 
> The problem with this approach is that it forces each architecture to
> opencode the failure string, in a function which is very busy with other
> things too.
> 
> Couldn't xsm_{multiboot,dt}_init() be void, and the warning_add() move
> into them, like the SLIO warning for ARM already?
> 
> That would simplify both ARM and x86's __start_xen(), and be an
> improvement for the RISC-V series just posted to xen-devel...

I was trying to address the MISRA review comment by handling the
unhandled return while trying to provide a uniform implementation across
arch. Moving the xsm_{multiboot,dt}_init() to void will address both and
as you point out make it simpler overall.

v/r,
dps

