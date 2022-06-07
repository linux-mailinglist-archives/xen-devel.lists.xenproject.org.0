Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4392754008D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 15:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343305.568622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZj6-0007zi-2g; Tue, 07 Jun 2022 13:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343305.568622; Tue, 07 Jun 2022 13:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZj5-0007x0-Va; Tue, 07 Jun 2022 13:58:31 +0000
Received: by outflank-mailman (input) for mailman id 343305;
 Tue, 07 Jun 2022 13:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyZj4-0007Mg-2O
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 13:58:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7c5694d-e669-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 15:58:29 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654610300304342.68285292228654;
 Tue, 7 Jun 2022 06:58:20 -0700 (PDT)
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
X-Inumbo-ID: e7c5694d-e669-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; t=1654610304; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fnp8UMO+bB8cCYj2NMvftNSOUQb1g0qKEwP0oMxmjb+EcrCcwlUKhbPYN9rsr0diNGswoqkgReXZ0ubvLogeVbgz9r/Z4Lx89y4jzO4sZkmXDk2MlA0srGAByk8DiLxnaldiyxhsuAo7tuqpGuXohfVtVIIEQGdlDFumihbMR6Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654610304; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gi6Pus47de7pulvticJ0b4ipqHwzYws15CHcLrCm5S0=; 
	b=CNwv75cs21mHMbmPbCAEP5Myrmyzc3JSSiGgo5fFJfUg+iRLmYLj29ie+LvzKDcBWAZmi6jROgqKo3R0q9mPlN30gXIFgTFU+1JeRndk85A+Xc8DizEXlSI+Fg2rVFNoaWGbzzyCE3Anj1NfwtbLph44sXB8fIoH9ea0HDDt46c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654610304;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gi6Pus47de7pulvticJ0b4ipqHwzYws15CHcLrCm5S0=;
	b=FvlCoMwbMMSEIuE/4e/Qb8gM4uYSfBY7UFlKFup0W19CIvb1yG2g0ihDdKgEnTCM
	VpRH6Q2nYfpMbawBWh0E2NcuazRwmwMHr6gqoDxbaY0+7yZpYKfFDXXkvwhqvm+wuHw
	GDH1HYvxi3CkqvircqLXrhd8v+dq/Iq6kuSRZCrY=
Message-ID: <f2fc5c13-fd33-5fff-1135-e21e979009ca@apertussolutions.com>
Date: Tue, 7 Jun 2022 09:56:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 3/3] xsm: properly handle error from XSM init
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-4-dpsmith@apertussolutions.com>
 <c206a20b-ee5f-aa5b-64ba-fe06469f0f2f@citrix.com>
 <40db300c-4d20-8339-599f-bcf6521442fa@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <40db300c-4d20-8339-599f-bcf6521442fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/1/22 02:49, Jan Beulich wrote:
> On 31.05.2022 21:18, Andrew Cooper wrote:
>> On 31/05/2022 19:20, Daniel P. Smith wrote:
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index 53a73010e0..ed67b50c9d 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1700,7 +1701,11 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>>      mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
>>>                                    RANGESETF_prettyprint_hex);
>>>  
>>> -    xsm_multiboot_init(module_map, mbi);
>>> +    if ( xsm_multiboot_init(module_map, mbi) )
>>> +        warning_add("WARNING: XSM failed to initialize.\n"
>>> +                    "This has implications on the security of the system,\n"
>>> +                    "as uncontrolled communications between trusted and\n"
>>> +                    "untrusted domains may occur.\n");
>>
>> The problem with this approach is that it forces each architecture to
>> opencode the failure string, in a function which is very busy with other
>> things too.
>>
>> Couldn't xsm_{multiboot,dt}_init() be void, and the warning_add() move
>> into them, like the SLIO warning for ARM already?
> 
> I, too, was considering to suggest this (but then didn't on v3). Furthermore
> the warning_add() could then be wrapped in a trivial helper function to be
> used by both MB and DT.

Re: helper function, ack.

