Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3201276F64
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 13:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLP7G-000116-Gs; Thu, 24 Sep 2020 11:08:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLP7F-000111-M1
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 11:08:45 +0000
X-Inumbo-ID: 7ee15106-c54d-4d6d-807d-436bcc6cba2e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ee15106-c54d-4d6d-807d-436bcc6cba2e;
 Thu, 24 Sep 2020 11:08:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600945723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Cj3G6E1Aaii/aV3kVUEVjSLAdRvkQnlhImOFvIVm/Y=;
 b=arQYP/L1fRgvFEeEtiMk0VOBpnPcIpYlrlLfmjvwaE6XIDpc6H7atZ9ETVMX7AQg2XeL4e
 W+Ffgb/k0ykyZmA4ajozJ9yc0tseiJq1tuThubGmA1dYK9fiBQLx2wvnNnhaEM91CksgjS
 1baKFIZBUhE0L266IYPkmNMkxEZvkMw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A46C9B155;
 Thu, 24 Sep 2020 11:08:43 +0000 (UTC)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
Date: Thu, 24 Sep 2020 13:08:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.09.2020 22:16, Oleksandr wrote:
> On 23.09.20 21:03, Julien Grall wrote:
>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> @@ -91,6 +108,28 @@ struct arch_domain
>>>   #endif
>>>   }  __cacheline_aligned;
>>>   +enum hvm_io_completion {
>>> +    HVMIO_no_completion,
>>> +    HVMIO_mmio_completion,
>>> +    HVMIO_pio_completion
>>> +};
>>> +
>>> +struct hvm_vcpu_io {
>>> +    /* I/O request in flight to device model. */
>>> +    enum hvm_io_completion io_completion;
>>> +    ioreq_t                io_req;
>>> +
>>> +    /*
>>> +     * HVM emulation:
>>> +     *  Linear address @mmio_gla maps to MMIO physical frame 
>>> @mmio_gpfn.
>>> +     *  The latter is known to be an MMIO frame (not RAM).
>>> +     *  This translation is only valid for accesses as per 
>>> @mmio_access.
>>> +     */
>>> +    struct npfec        mmio_access;
>>> +    unsigned long       mmio_gla;
>>> +    unsigned long       mmio_gpfn;
>>> +};
>>> +
>>
>> Why do we need to re-define most of this? Can't this just be in common 
>> code?
> 
> Jan asked almost the similar question in "[PATCH V1 02/16] xen/ioreq: 
> Make x86's IOREQ feature common".
> Please see my answer there:
> https://patchwork.kernel.org/patch/11769105/#23637511
> 
> Theoretically we could move this to the common code, but the question is 
> how to be with other struct fields the x86's struct hvm_vcpu_io 
> has/needs but
> Arm's seems not, would it be possible to logically split struct 
> hvm_vcpu_io into common and arch parts?

Have struct vcpu_io and struct arch_vcpu_io as a sub-part of it?

Jan




