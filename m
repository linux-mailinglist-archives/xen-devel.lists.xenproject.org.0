Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE33087CE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77916.141469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R45-0006gq-2A; Fri, 29 Jan 2021 10:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77916.141469; Fri, 29 Jan 2021 10:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R44-0006gT-Um; Fri, 29 Jan 2021 10:31:44 +0000
Received: by outflank-mailman (input) for mailman id 77916;
 Fri, 29 Jan 2021 10:31:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5R43-0006g1-FY
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:31:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5R3l-0003Lm-F7; Fri, 29 Jan 2021 10:31:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5R3l-0002ku-4s; Fri, 29 Jan 2021 10:31:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=a2NtBLJ1fTYDnyWnuMCkxPsYMs3sCf3btgkNUAVF4BQ=; b=t7uutFQ9k4E32aGSspgR1fsEtQ
	jrG/8gvHKuEhNPJpnk41g72FoFf9TnCgvGwcZoUY5deg0Etbo+PLeW1IGOf9aJcswCwE3kG5Umls8
	8RFJGtuxRzN6GoX+Gjd5w/S+hpYnMc4S3P8FTsbpwYwHGtnlkyCYne+NzN+nA2eL5UpU=;
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <46146d40-7820-f3e1-2293-9b34084915c9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f968587b-f3cb-1407-817e-341e265ed8aa@xen.org>
Date: Fri, 29 Jan 2021 10:31:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <46146d40-7820-f3e1-2293-9b34084915c9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/01/2021 09:04, Jan Beulich wrote:
> On 29.01.2021 02:48, Oleksandr Tyshchenko wrote:
>> Julien Grall (3):
>>    xen/ioreq: Make x86's IOREQ related dm-op handling common
>>    xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
>>    arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>
>> Oleksandr Tyshchenko (21):
>>    x86/ioreq: Prepare IOREQ feature for making it common
>>    x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
>>    x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
>>    xen/ioreq: Make x86's IOREQ feature common
>>    xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>>    xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
>>    xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
>>    xen/ioreq: Move x86's ioreq_server to struct domain
>>    xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
>>    xen/ioreq: Remove "hvm" prefixes from involved function names
>>    xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
>>    xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
>>    xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>>    xen/ioreq: Introduce domain_has_ioreq_server()
>>    xen/dm: Introduce xendevicemodel_set_irq_level DM op
> 
> Going through the series I noticed that at least this one is still
> lacking acks. I may have overlooked others. Do you have a clear
> picture of which acks you still need to hunt for?

I have pinged the tools maintainers to get an ack on the series.

I went through the rest of the series, everything else looks suitably acked.

Cheers,

-- 
Julien Grall

