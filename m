Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD829D06D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 15:49:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13659.34404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXmlM-00021Y-WC; Wed, 28 Oct 2020 14:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13659.34404; Wed, 28 Oct 2020 14:49:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXmlM-00021D-Su; Wed, 28 Oct 2020 14:49:20 +0000
Received: by outflank-mailman (input) for mailman id 13659;
 Wed, 28 Oct 2020 14:49:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kXmlL-000218-Gd
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:49:19 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2da1031-33b0-4293-b27d-cca03d11408c;
 Wed, 28 Oct 2020 14:49:18 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXmlJ-0003pu-Gh; Wed, 28 Oct 2020 14:49:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kXmlJ-0005DA-8y; Wed, 28 Oct 2020 14:49:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HSML=ED=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kXmlL-000218-Gd
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:49:19 +0000
X-Inumbo-ID: c2da1031-33b0-4293-b27d-cca03d11408c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c2da1031-33b0-4293-b27d-cca03d11408c;
	Wed, 28 Oct 2020 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=geuIc3HYqWdr3oeekfddYO573JieDsY3CqsARBmN6rk=; b=cjJrLhbpqbtWffi1pBlMnPhEbt
	3abymfb/l14/JZZoSut8aS4sG/3IOxgUimXwthPRqzwnN2RkmcFJXbo93oKlqFKW19Ip+gKvb2Ea1
	OF0uUUKH0m0m9ESAUYoidCT1Ra7VzsUoUMctjB0fKJOSZPBtkL6kXFhjKlal4fOr8aIY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXmlJ-0003pu-Gh; Wed, 28 Oct 2020 14:49:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kXmlJ-0005DA-8y; Wed, 28 Oct 2020 14:49:17 +0000
Subject: Re: [qemu-mainline test] 156257: regressions - FAIL
To: Jason Andryuk <jandryuk@gmail.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <osstest-156257-mainreport@xen.org>
 <CAKf6xpss8KpGOvZrKiTPz63bhBVbjxRTYWdHEkzUo2q1KEMjhg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <70d87480-6fcf-9fe0-34c0-30bd711406a4@xen.org>
Date: Wed, 28 Oct 2020 14:49:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpss8KpGOvZrKiTPz63bhBVbjxRTYWdHEkzUo2q1KEMjhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Anthony and Stefano,)

Hi Jason,

On 28/10/2020 13:37, Jason Andryuk wrote:
> On Tue, Oct 27, 2020 at 5:23 PM osstest service owner
> <osstest-admin@xenproject.org> wrote:
>>
>> flight 156257 qemu-mainline real [real]
>> flight 156266 qemu-mainline real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/156257/
>> http://logs.test-lab.xenproject.org/osstest/logs/156266/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 152631
> 
> QEMU doesn't start with "qemu-system-i386: -xen-domid 1: Option not
> supported for this target"
> 
> This happens if CONFIG_XEN isn't set.
> 
> QEMU is built with:
>                    host CPU: aarch64
>             host endianness: little
>                 target list: i386-softmmu
> 
> commit 8a19980e3fc4 "configure: move accelerator logic to meson"
> introduced this logic:
> +accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> +if cpu in ['x86', 'x86_64']
> +  accelerator_targets += {
> +    'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': ['x86_64-softmmu'],
> +    'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
> +  }
> +endif

I always wondered when this would come to bite us :). I am surprised it 
took so long.

> 
> I guess something like this would fix it:
> if cpu in ['aarch64', 'arm']
>    accelerator_targets += { 'CONFIG_XEN': ['i386-softmmu'], }
> endif

Per the logic above, I think this correct. @Stefano, @Anthony, can you 
have a look?

Cheers,

-- 
Julien Grall

