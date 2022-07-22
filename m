Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54857E353
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 17:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373321.605462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEu8t-0007pg-69; Fri, 22 Jul 2022 15:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373321.605462; Fri, 22 Jul 2022 15:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEu8t-0007nO-2Q; Fri, 22 Jul 2022 15:00:39 +0000
Received: by outflank-mailman (input) for mailman id 373321;
 Fri, 22 Jul 2022 15:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEu8r-0007nI-Jd
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 15:00:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09d76c4c-09cf-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 17:00:36 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658502027966808.5026853773671;
 Fri, 22 Jul 2022 08:00:27 -0700 (PDT)
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
X-Inumbo-ID: 09d76c4c-09cf-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658502029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D68mHYTQzgzyB54MnPBo1g7/y4ujM2DiCsF59J8/EC+JHAofZJhaSWd5Q0kaPJW4ao/oV31F6MlodiIXRR0kz7d+mZj6qiOt9VMd4x3XAnDHA/ARKDt7twNAoOiW6VBPeavpqhhE821KhutRg2lPanWkbR+4s6aKJ0Srqyb2Q64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658502029; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TVu2m/FUCQZmTM7meZirvQChW7DS1/cB07OQf3IJzRs=; 
	b=nqKpBPqZlqxJd2wmx9Fcw6/ocjnKEUjgPwQqjmPYaiWdwskthfGEiiLCHbotAdc+kgDRSwSVgsuLU9WCvMeMX2IPYuigEmVRO5769uqWzuL6gcCbVNC6qGS/BI/tnNybkHH7QqSa34zoEyxPOaV1dzXFiS4KA3TgzT7Sx9l/sFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658502029;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TVu2m/FUCQZmTM7meZirvQChW7DS1/cB07OQf3IJzRs=;
	b=gPOJExkKiB4QxWq70/5NJYTa7F4PTpIOhcg8ZLnAJiPiJZvcZ7AbNNnVVerKwaYG
	sD1eBfZi30XDFRTIDYpdbap2QP29mutrHTlTE+Vj705DkyKg/msMMrsfpiWoite7Rkm
	mgAgAMJyQ89EGqe+bzxQPH1hEmk2yW8U1o9b1fsg=
Message-ID: <5cc059f8-1d13-eccc-ded6-c91feaf6c02b@apertussolutions.com>
Date: Fri, 22 Jul 2022 11:00:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
 <59114d3a-b9fe-1fb0-fac3-fe14fe4c505f@suse.com>
 <e6484f17-b79f-35c7-2d1d-d03bae7c0973@apertussolutions.com>
 <6cc461b1-e308-0e2f-3f78-caf491095042@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
In-Reply-To: <6cc461b1-e308-0e2f-3f78-caf491095042@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/20/22 03:27, Jan Beulich wrote:
> On 19.07.2022 19:02, Daniel P. Smith wrote:
>> On 7/19/22 05:32, Jan Beulich wrote:
>>> On 06.07.2022 23:04, Daniel P. Smith wrote:
>>>> --- a/xen/arch/x86/efi/efi-boot.h
>>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>>> @@ -18,7 +18,7 @@ static multiboot_info_t __initdata mbi = {
>>>>   * The array size needs to be one larger than the number of modules we
>>>>   * support - see __start_xen().
>>>>   */
>>>> -static module_t __initdata mb_modules[5];
>>>> +static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];
>>>
>>> If the build admin selected 1, I'm pretty sure about nothing would work.
>>> I think you want max(5, CONFIG_NR_BOOTMODS) or
>>> max(4, CONFIG_NR_BOOTMODS) + 1 here and ...
>>
>> Actually, I reasoned this out and 1 is in fact a valid value. It would
>> mean Xen + Dom0 Linux kernel with embedded initramfs with no externally
>> loaded XSM policy and no boot time microcode patching. This is a working
>> configuration, but open to debate if it is a desirable configuration.
>> The question is whether it is desired to block someone from building
>> such a configuration, or any number between 1 and 4. If the answer is
>> yes, then why not just set the lower bound of the range in the Kconfig
>> file instead of having to maintain a hard-coded lower bound in a max
>> marco across multiple locations?
> 
> While I'd be fine with the lower bounds being raised, I wouldn't be very
> happy with seeing those lower bounds becoming arch-specific.

Okay, and I am not sure how changing the range in Kconfig would make it
arch-specific. I was not proposing making the existing range conditioned
and having arch specific instances. There is one range, it will have a
lower bound of 4 and the upper bound of 31768.

v/r,
dps

