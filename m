Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D867351834B
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 13:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319524.539783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqko-0003Z9-3q; Tue, 03 May 2022 11:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319524.539783; Tue, 03 May 2022 11:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqko-0003W6-0e; Tue, 03 May 2022 11:31:42 +0000
Received: by outflank-mailman (input) for mailman id 319524;
 Tue, 03 May 2022 11:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7qc=VL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nlqkm-0003W0-Gz
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 11:31:40 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97d899a1-cad4-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 13:31:38 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1651577492033577.5969784216805;
 Tue, 3 May 2022 04:31:32 -0700 (PDT)
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
X-Inumbo-ID: 97d899a1-cad4-11ec-8fc4-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1651577497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=keIcmYiTU2s1Fi2qPgffgv1u+MA1PHR3409YrnaLrAXovoCqHBffuxXO8cbYkav0vKBkV3CZRjyoJx1L8ZFCXX2K2gLQ2rZpu0DemhWTflNXNlFB8ndhzEvscLSiJ5770vvNtomQVamXHMnAZd5L8mz9P8rPiqK5MipsCkpy2+c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1651577497; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=L9QqY4cMLNeoXiV3OJDVAFImgfcLfNv3geetzMx4Tp8=; 
	b=OqlcPMYvuymDDIszZ0SGDqbsmImsmk23FZbh5mONDupPESnVd3sQpOJpgXKm1xrxuFWuTo6vPCiscJUmc6LU7l1uAweJF0K9qiUSIYkIfY3OIit0FZZ0xiI5Is9fbUkPNql6wUDBv2321tai4bd2A/F3GorQUJ1DDGnLTp5at6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1651577496;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=L9QqY4cMLNeoXiV3OJDVAFImgfcLfNv3geetzMx4Tp8=;
	b=ROj6nSGpYmSBLcH+Kp+FnLrl/O//Ldz2hQHEfXPjofH+jbbZbJyarryz53T4P8Pg
	qgh38CNIh9vU2tBrpotScSuwS6YOi34vh8IPAGz0N0VORD9vw6z0gNlS4rtxJpj53Il
	CgVu4t++UX3RCNO8bgQn8NDm1o+zBtSU8AVCx5JA=
Message-ID: <89aad289-8ab9-c43f-f048-b302bcc0f568@apertussolutions.com>
Date: Tue, 3 May 2022 07:30:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Scott Davis <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220502133027.920-1-dpsmith@apertussolutions.com>
 <20220502133027.920-2-dpsmith@apertussolutions.com>
 <CAKf6xptU7VxGzaHe=jVc0O2fbZfQi1Rmf0hDsJzOB-9k7=4W-Q@mail.gmail.com>
 <7db6b050-7ace-406f-550b-d407c57cfa59@apertussolutions.com>
 <15634549-bde3-873b-862c-37ebb891ba0e@apertussolutions.com>
 <D7CF00DB-F6E1-4B81-9597-13CFAB6102B0@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <D7CF00DB-F6E1-4B81-9597-13CFAB6102B0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/3/22 05:43, Luca Fancellu wrote:
> 
> 
>> On 2 May 2022, at 14:53, Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
>>
>> On 5/2/22 09:49, Daniel P. Smith wrote:
>>> On 5/2/22 09:42, Jason Andryuk wrote:
>>>> On Mon, May 2, 2022 at 9:31 AM Daniel P. Smith
>>>> <dpsmith@apertussolutions.com> wrote:
>>>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>>>> index d5d0792ed4..b9057222d6 100644
>>>>> --- a/xen/arch/arm/setup.c
>>>>> +++ b/xen/arch/arm/setup.c
>>>>> @@ -1048,6 +1048,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>>>     /* Hide UART from DOM0 if we're using it */
>>>>>     serial_endboot();
>>>>>
>>>>> +    if ( (rc = xsm_set_system_active()) != 0 )
>>>>> +        panic("xsm(err=%d): "
>>>>> +              "unable to set hypervisor to SYSTEM_ACTIVE privilege\n", err);
>>>>
>>>> You want to print rc in this message.
>>>
>>> Thanks, but now I want to figure out how that compile
>>
>> Ah, arm which I do not have a build env to do build tests.
> 
> I’ve built this patch on arm (changing err to rc), everything looks fine, so with that
> addressed:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Thank you and my apologies for not adding your review-by this morning. I
had v6 queued to go out last night and missed this email before releasing.

