Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A22796DAE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 01:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596914.931044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2Cq-0005i0-9D; Wed, 06 Sep 2023 23:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596914.931044; Wed, 06 Sep 2023 23:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe2Cq-0005ff-6G; Wed, 06 Sep 2023 23:45:08 +0000
Received: by outflank-mailman (input) for mailman id 596914;
 Wed, 06 Sep 2023 23:45:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hRy5=EW=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qe2Co-0005fZ-6I
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 23:45:06 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 654b9d67-4d0f-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 01:45:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DECEA82857C4;
 Wed,  6 Sep 2023 18:45:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Lp2Q7wrJlamB; Wed,  6 Sep 2023 18:45:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0BB8782857C5;
 Wed,  6 Sep 2023 18:45:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vbB6nI-4Z1oK; Wed,  6 Sep 2023 18:44:59 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 92B0282857C4;
 Wed,  6 Sep 2023 18:44:59 -0500 (CDT)
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
X-Inumbo-ID: 654b9d67-4d0f-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0BB8782857C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694043900; bh=O4CBTmnG/tOoCAk90JJoYmxdN7o69dDb0AnnPW/APpQ=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=qODHAZoenyRDF5F9EdBGaB6zYNGkkeulH1Zk32rUSScitYjahgTgUB7RJBKpshm/l
	 5Yi56TomSZSs7xakRDbPqIzBWthaOFnpkGz16bH72dUOLTKODD4ujMVh3KtTmy8Xbn
	 oMeB4oI+/nON0GHwYLPBGJVoxHyFDa/kC57qfY/w=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <8ca65bea-75a5-369f-8124-d598aa87e24f@raptorengineering.com>
Date: Wed, 6 Sep 2023 18:44:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] xen/ppc: Drop support for pseries/OpenFirmware
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1693949731.git.sanastasio@raptorengineering.com>
 <8c09322cff220d4d102d50b2fc45e9290106d109.1693949731.git.sanastasio@raptorengineering.com>
 <e5fc9fe7-83fa-98a0-02db-8d28fc2b0524@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <e5fc9fe7-83fa-98a0-02db-8d28fc2b0524@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/23 1:44 AM, Jan Beulich wrote:
> On 05.09.2023 23:46, Shawn Anastasio wrote:
>> Since QEMU's PowerNV support has matured to the point where it is
>> now suitable for development, drop support for booting on the
>> paravirtualized pseries machine type and its associated interfaces.
> 
> I think you want to mention that the pseries functionality was actually
> broken by the earlier change, both verbally and by means of a Fixes:
> tag. The breakage actually may also want mentioning in patch 1 as well
> as the cover letter.
>

Will do. I'll add mentions to the breakage in both patches and add a
Fixes: tag to this patch specifically.

>> --- a/xen/arch/ppc/setup.c
>> +++ b/xen/arch/ppc/setup.c
>> @@ -14,17 +14,12 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>>  {
>>      if ( r5 )
>>      {
>> -        /* OpenFirmware boot protocol */
>> -        boot_of_init(r5);
>> +        /* Unsupported OpenFirmware boot protocol */
>> +        __builtin_trap();
>>      }
>>      else
>>      {
>> -        /*
>> -         * kexec boot protocol
>> -         *
>> -         * TODO: This currently assumes an OPAL/PowerNV system, but it's also
>> -         * possible to be kexec'd on an OF system.
>> -         */
>> +        /* kexec boot protocol */
>>          boot_opal_init((void *)r3);
> 
> At least part of the comment may want retaining, as the code only handles
> the OPAL case?
>

Since we're now explicitly only supporting Opal/PowerNV I don't think
there's any need to point out that this code path doesn't properly
handle the pseries+kexec case. boot_opal_init will gracefully
fail under that circumstance anyway when it tries to find an /ibm,opal
device tree node.

> Jan

Thanks,
Shawn


