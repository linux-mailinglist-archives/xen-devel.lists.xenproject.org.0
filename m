Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E5724BB1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 20:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544160.849725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6bid-0002Is-N5; Tue, 06 Jun 2023 18:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544160.849725; Tue, 06 Jun 2023 18:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6bid-0002FX-Jl; Tue, 06 Jun 2023 18:47:47 +0000
Received: by outflank-mailman (input) for mailman id 544160;
 Tue, 06 Jun 2023 18:47:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6bic-0002FR-HW
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 18:47:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6bic-0003Y2-5r; Tue, 06 Jun 2023 18:47:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6bic-00055t-0K; Tue, 06 Jun 2023 18:47:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=/N31AeL/2zp+WR28V0XOQ1htyMHiGIqd9k4yaHInVz0=; b=EG6EHye8zKY7JTHmRsR4cEbCrT
	fU1WJlsnZ2m04GTdtohKzJWW5WQfHYB+YNYLwt1lfDmbEQjerVs0jCnOzIv3OWG973as9HOt//gVD
	eGIa6uVb3lH23UCsw2X+S/uKGWOjoxwl2W2Az/bE36Xah6td46b3YyB0ihZ4lQkF5Ojg=;
Message-ID: <898ec4e0-6351-2279-110b-8833dcfa0d94@xen.org>
Date: Tue, 6 Jun 2023 19:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v8 05/12] arm/sve: save/restore SVE context switch
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
 <20230531072413.868673-6-luca.fancellu@arm.com>
 <A7BE07AF-6EBB-4801-B538-27F0389BC75F@arm.com>
 <D5834820-A16C-4F17-8607-44B84CCDCFED@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <D5834820-A16C-4F17-8607-44B84CCDCFED@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 06/06/2023 14:22, Luca Fancellu wrote:
> 
> 
>> On 1 Jun 2023, at 11:17, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Luca,
>>
>>> On 31 May 2023, at 09:24, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>
>>> Save/restore context switch for SVE, allocate memory to contain
>>> the Z0-31 registers whose length is maximum 2048 bits each and
>>> FFR who can be maximum 256 bits, the allocated memory depends on
>>> how many bits is the vector length for the domain and how many bits
>>> are supported by the platform.
>>>
>>> Save P0-15 whose length is maximum 256 bits each, in this case the
>>> memory used is from the fpregs field in struct vfp_state,
>>> because V0-31 are part of Z0-31 and this space would have been
>>> unused for SVE domain otherwise.
>>>
>>> Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
>>> creation given the requested vector length and restore it on
>>> context switch, save/restore ZCR_EL1 value as well.
>>>
>>> List import macros from Linux in README.LinuxPrimitives.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Cheers
>> Bertrand
>>
>>> ---
>>> Changes from v7:
>>> - Fixed comments for sve_context_init and sve_context_free,
>>>   protect arch.vfp.sve_zreg_ctx_end, arch.zcr_el1, arch.zcr_el2
>>>   with ifdefs. (Julien)
>>> - Given the changes, dropped Bertrand's R-by
> 
> Hi Julien,
> 
> Are you ok with the changes I’ve done? Are they addressing your last comments?
Sorry I was away last week. I will have a another look in a bit and 
commit if everything is in order.

Cheers,

-- 
Julien Grall

