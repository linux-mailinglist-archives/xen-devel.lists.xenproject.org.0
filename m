Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FEB308731
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:04:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77808.141176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Phc-0003hP-SH; Fri, 29 Jan 2021 09:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77808.141176; Fri, 29 Jan 2021 09:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Phc-0003h2-PE; Fri, 29 Jan 2021 09:04:28 +0000
Received: by outflank-mailman (input) for mailman id 77808;
 Fri, 29 Jan 2021 09:04:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Pha-0003gx-Fr
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:04:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 623e2a34-cb87-4a26-b12a-dfaeaf8f975f;
 Fri, 29 Jan 2021 09:04:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAD41AE05;
 Fri, 29 Jan 2021 09:04:23 +0000 (UTC)
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
X-Inumbo-ID: 623e2a34-cb87-4a26-b12a-dfaeaf8f975f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611911064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3o9bFJWrd6YCeXAheprZXjUnGuTeJ73HNZI2dacw0k=;
	b=aroxBuaFmSqwcV462xi+mPGkjgxDKoEtmD6Z7Ea8e32EwpeuipL2VHe+7onxY5Qyf4pzeK
	xRdtc8ldoplUbSYNcwXDZUb8YwzwHpQogGULCijNdcazyJCUhaKmqnFN0sPn1GePwG1wx6
	5pKp23l4yjRpexGnDvmQWKFjmjhp56M=
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46146d40-7820-f3e1-2293-9b34084915c9@suse.com>
Date: Fri, 29 Jan 2021 10:04:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 02:48, Oleksandr Tyshchenko wrote:
> Julien Grall (3):
>   xen/ioreq: Make x86's IOREQ related dm-op handling common
>   xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
>   arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> 
> Oleksandr Tyshchenko (21):
>   x86/ioreq: Prepare IOREQ feature for making it common
>   x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
>   x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
>   xen/ioreq: Make x86's IOREQ feature common
>   xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>   xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
>   xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
>   xen/ioreq: Move x86's ioreq_server to struct domain
>   xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
>   xen/ioreq: Remove "hvm" prefixes from involved function names
>   xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
>   xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
>   xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>   xen/ioreq: Introduce domain_has_ioreq_server()
>   xen/dm: Introduce xendevicemodel_set_irq_level DM op

Going through the series I noticed that at least this one is still
lacking acks. I may have overlooked others. Do you have a clear
picture of which acks you still need to hunt for?

Jan

