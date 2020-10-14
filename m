Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C3728E5B1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6954.18176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSksZ-00058K-1D; Wed, 14 Oct 2020 17:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6954.18176; Wed, 14 Oct 2020 17:47:58 +0000
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
	id 1kSksY-00057y-UC; Wed, 14 Oct 2020 17:47:58 +0000
Received: by outflank-mailman (input) for mailman id 6954;
 Wed, 14 Oct 2020 17:47:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kSksX-000577-2R
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:47:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e490caa4-a6f5-42d9-b41d-639974549f07;
 Wed, 14 Oct 2020 17:47:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSksT-0002xV-A4; Wed, 14 Oct 2020 17:47:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kSksT-00021T-35; Wed, 14 Oct 2020 17:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MeL6=DV=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kSksX-000577-2R
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:47:57 +0000
X-Inumbo-ID: e490caa4-a6f5-42d9-b41d-639974549f07
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e490caa4-a6f5-42d9-b41d-639974549f07;
	Wed, 14 Oct 2020 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xcOGFvAWb0jDtMXoQWODmGvVCUSSa0MkKfdRyvwphGk=; b=Oj0MAr8mOTqNQmWqlHhMKk4ftI
	UX1dLj1vhugjAg1lapUT6Q4Yhv2xIbNXZwmmxtZDlYXP3zkZuBeYjPR92tZdkZJ3IkA/+xQLYp9jU
	3+oD9jLayq7klaIKWDeIVSMqp8ewAGSY8Odgykpe/gwACPu+0cPxUXytkOTtsMAlDCP4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSksT-0002xV-A4; Wed, 14 Oct 2020 17:47:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kSksT-00021T-35; Wed, 14 Oct 2020 17:47:53 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org>
 <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
 <20201012213451.GA89158@mattapan.m5p.com>
 <alpine.DEB.2.21.2010131759270.10386@sstabellini-ThinkPad-T480s>
 <20201014013706.GA98635@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1b5f19f6-ea70-9e58-bf36-de7f7d54153a@xen.org>
Date: Wed, 14 Oct 2020 18:47:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201014013706.GA98635@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliot,

On 14/10/2020 02:37, Elliott Mitchell wrote:
> On Tue, Oct 13, 2020 at 06:06:26PM -0700, Stefano Stabellini wrote:
>> On Mon, 12 Oct 2020, Elliott Mitchell wrote:
>>> I'm on different hardware, but some folks have setup Tianocore for it.
>>> According to Documentation/arm64/acpi_object_usage.rst,
>>> "Required: DSDT, FADT, GTDT, MADT, MCFG, RSDP, SPCR, XSDT".  Yet when
>>> booting a Linux kernel directly on the hardware it lists APIC, BGRT,
>>> CSRT, DSDT, DBG2, FACP, GTDT, PPTT, RSDP, and XSDT.
>>>
>>> I don't know whether Linux's ACPI code omits mention of some required
>>> tables and merely panics if they're absent.  Yet I'm speculating the list
>>> of required tables has shrunk, SPCR is no longer required, and the
>>> documentation is out of date.  Perhaps SPCR was required in early Linux
>>> ACPI implementations, but more recent ones removed that requirement?
>>
>> I have just checked and SPCR is still a mandatory table in the latest
>> SBBR specification. It is probably one of those cases where the firmware
>> claims to be SBBR compliant, but it is not, and it happens to work with
>> Linux.
> 
> Is meeting the SBBR specification supposed to be a requirement of running
> Xen-ARM?

This is not my goal. We should try to get Xen running everywhere as long 
as this doesn't require a lot of extra code. IOW, don't ask me to 
review/accept a port of Xen to RPI3 ;).

Cheers,

-- 
Julien Grall

