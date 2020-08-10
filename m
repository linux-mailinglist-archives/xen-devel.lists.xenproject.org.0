Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A391B240B2E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 18:31:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5AgZ-0002UR-Jd; Mon, 10 Aug 2020 16:30:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wyEj=BU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k5AgY-0002UM-L9
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 16:30:06 +0000
X-Inumbo-ID: df600f23-b581-4e8d-a3d6-c79092e5d976
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df600f23-b581-4e8d-a3d6-c79092e5d976;
 Mon, 10 Aug 2020 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PvsCx8S2JYO+IEBaSTZwP9snZvkloGE0UQ91hC/SGms=; b=g+qVPyvScwQ9MQFBO7YZeXDMBp
 o8dnzvTFjqJ2GWeWQZChvO4kEx9mdKjyMDCfOuOWB6PRgjrWo0yVqvVwGoVCotDc0cjoPsXJ04Eui
 ADKPlvZYfFzWc+VpxuoV/GL5yDGKgxx7xoNvXfF7dKORNOoFiZUKa9HY021NQTbzCm+I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5AgM-0002ox-Dz; Mon, 10 Aug 2020 16:29:54 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k5AgM-00010k-4W; Mon, 10 Aug 2020 16:29:54 +0000
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <6bfc3920-8f29-188c-cff4-2b99dabe166f@xen.org>
 <b0103c16-0cec-1734-93a6-3a4169448179@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c5cb0196-f761-52f5-ef32-d0a560bd559c@xen.org>
Date: Mon, 10 Aug 2020 17:29:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b0103c16-0cec-1734-93a6-3a4169448179@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 06/08/2020 12:37, Oleksandr wrote:
> 
> On 05.08.20 16:30, Julien Grall wrote:
>> Hi,
> 
> Hi Julien
> 
> 
>>
>> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> As a lot of x86 code can be re-used on Arm later on, this patch
>>> splits IOREQ support into common and arch specific parts.
>>>
>>> This support is going to be used on Arm to be able run device
>>> emulator outside of Xen hypervisor.
>>>
>>> Please note, this is a split/cleanup of Julien's PoC:
>>> "Add support for Guest IO forwarding to a device emulator"
>>>
>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>>   xen/arch/x86/Kconfig            |    1 +
>>>   xen/arch/x86/hvm/dm.c           |    2 +-
>>>   xen/arch/x86/hvm/emulate.c      |    2 +-
>>>   xen/arch/x86/hvm/hvm.c          |    2 +-
>>>   xen/arch/x86/hvm/io.c           |    2 +-
>>>   xen/arch/x86/hvm/ioreq.c        | 1431 
>>> +--------------------------------------
>>>   xen/arch/x86/hvm/stdvga.c       |    2 +-
>>>   xen/arch/x86/hvm/vmx/realmode.c |    1 +
>>>   xen/arch/x86/hvm/vmx/vvmx.c     |    2 +-
>>>   xen/arch/x86/mm.c               |    2 +-
>>>   xen/arch/x86/mm/shadow/common.c |    2 +-
>>>   xen/common/Kconfig              |    3 +
>>>   xen/common/Makefile             |    1 +
>>>   xen/common/hvm/Makefile         |    1 +
>>>   xen/common/hvm/ioreq.c          | 1430 
>>> ++++++++++++++++++++++++++++++++++++++
>>>   xen/include/asm-x86/hvm/ioreq.h |   45 +-
>>>   xen/include/asm-x86/hvm/vcpu.h  |    7 -
>>>   xen/include/xen/hvm/ioreq.h     |   89 +++
>>>   18 files changed, 1575 insertions(+), 1450 deletions(-)
>>
>> That's quite a lot of code moved in a single patch. How can we check 
>> the code moved is still correct? Is it a verbatim copy?
> In this patch I mostly tried to separate a common IOREQ part which also 
> resulted in updating x86 sources to include new header.  Also I moved 
> hvm_ioreq_needs_completion() to common header (which probably wanted to 
> be in a separate patch). It was a verbatim copy initially (w/o 
> hvm_map_mem_type_to_ioreq_server) and then updated to deal with arch 
> specific parts.

I would prefer if the two parts are done separately. IOW, the code 
movement be nearly a verbatim copy.

> In which way do you want me to split this patch?
> 
> I could think of the following:
> 
> 1. Copy of x86's ioreq.c/ioreq.h to common code > 2. Update common ioreq.c/ioreq.h
> 3. Update x86's parts to be able to deal with common code
> 4. Move hvm_ioreq_needs_completion() to common code
> 

Ideally the code movement should be done in the same patch. This helps 
to check the patch is only moving code and also avoids mistakes on rebase.

So my preference would be to first modify the x86 code (e.g. renaming) 
to make it common and then have one patch that will move the code.

Cheers,

-- 
Julien Grall

