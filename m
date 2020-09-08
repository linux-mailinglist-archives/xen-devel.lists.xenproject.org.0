Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7749126125B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeI7-0002Mx-2g; Tue, 08 Sep 2020 14:08:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFeI5-0002Ms-Eg
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:08:09 +0000
X-Inumbo-ID: e34f1ecc-24f3-492e-8986-3d08fafd8391
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e34f1ecc-24f3-492e-8986-3d08fafd8391;
 Tue, 08 Sep 2020 14:08:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AAA5AD0F;
 Tue,  8 Sep 2020 14:08:07 +0000 (UTC)
Subject: Re: [PATCH] Arm64: fix build with gcc 10
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
 <F0DDBF49-93F2-4203-A62E-045DD2F4EA9E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0362eb3-2e72-ea0d-bff5-e0b7ff54104f@suse.com>
Date: Tue, 8 Sep 2020 16:08:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <F0DDBF49-93F2-4203-A62E-045DD2F4EA9E@arm.com>
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

On 08.09.2020 15:05, Bertrand Marquis wrote:
>> On 8 Sep 2020, at 13:53, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> With gcc10 inlining is (no longer?) the default for certain atomics.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> --- a/xen/arch/arm/arch.mk
>> +++ b/xen/arch/arm/arch.mk
>> @@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-
>>
>> CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
>> CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
>> +$(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
> 
> Why not adding this before with the other “call cc-option” ?

I elected to group it with the other Arm64 specific ones.

> Also it might be a good idea to have a sentence in the commit message with the
> error happening when this is not added:
> undefined reference to `__aarch64_ldadd4_acq_rel’
> 
> Because some might need to backport this to other Xen releases if they switch to
> a new compiler (although i could not reproduce that with Xen 4.14).

I guess I'll go with Julien's suggested description (with some
minor adjustments perhaps).

Jan

