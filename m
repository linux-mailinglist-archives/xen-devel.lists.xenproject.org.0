Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF37296B5B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10790.28800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsdV-0007gL-KJ; Fri, 23 Oct 2020 08:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10790.28800; Fri, 23 Oct 2020 08:41:21 +0000
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
	id 1kVsdV-0007fw-Gu; Fri, 23 Oct 2020 08:41:21 +0000
Received: by outflank-mailman (input) for mailman id 10790;
 Fri, 23 Oct 2020 08:41:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVsdT-0007fr-Gx
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:41:19 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd5ac4ca-fcea-4d2d-aa5c-3476333ffd07;
 Fri, 23 Oct 2020 08:41:18 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVsdS-0006OY-IF; Fri, 23 Oct 2020 08:41:18 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVsdS-00073R-AN; Fri, 23 Oct 2020 08:41:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVsdT-0007fr-Gx
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:41:19 +0000
X-Inumbo-ID: bd5ac4ca-fcea-4d2d-aa5c-3476333ffd07
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bd5ac4ca-fcea-4d2d-aa5c-3476333ffd07;
	Fri, 23 Oct 2020 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=TWdewo9d5jxMv1zaQDshWMRbbwOmCgPsNqHYJ8g2Ax0=; b=je0p9o3RWMuknnnVWfsifXubqC
	6m4E4H31nD/3M0S4IhLCBme+8j5Q7rL3RmQ1sjddYwx6wuXj7ksc5QUx7Y64WsamQ+sumqBva2KSu
	TBTQSWncKFEDuu4Fl2xp7UoytT/if3+ibtHs8AbU6HOqYbzFVB5EVaCsuFrijRtJCDeE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVsdS-0006OY-IF; Fri, 23 Oct 2020 08:41:18 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVsdS-00073R-AN; Fri, 23 Oct 2020 08:41:18 +0000
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
 <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
 <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b4ec906d-ebb6-add9-1bc0-39ab8d588026@xen.org>
Date: Fri, 23 Oct 2020 09:41:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 22/10/2020 22:17, Stefano Stabellini wrote:
> On Thu, 22 Oct 2020, Julien Grall wrote:
>> On 22/10/2020 02:43, Elliott Mitchell wrote:
>>> Linux requires UEFI support to be enabled on ARM64 devices.  While many
>>> ARM64 devices lack ACPI, the writing seems to be on the wall of UEFI/ACPI
>>> potentially taking over.  Some common devices may need ACPI table
>>> support.
>>>
>>> Presently I think it is worth removing the dependancy on CONFIG_EXPERT.
>>
>> The idea behind EXPERT is to gate any feature that is not considered to be
>> stable/complete enough to be used in production.
> 
> Yes, and from that point of view I don't think we want to remove EXPERT
> from ACPI yet. However, the idea of hiding things behind EXPERT works
> very well for new esoteric features, something like memory introspection
> or memory overcommit.

Memaccess is not very new ;).

> It does not work well for things that are actually
> required to boot on the platform.

I am not sure where is the problem. It is easy to select EXPERT from the 
menuconfig. It also hints the user that the feature may not fully work.

> 
> Typically ACPI systems don't come with device tree at all (RPi4 being an
> exception), so users don't really have much of a choice in the matter.

And they typically have IOMMUs.

> 
>  From that point of view, it would be better to remove EXPERT from ACPI,
> maybe even build ACPI by default, *but* to add a warning at boot saying
> something like:
> 
> "ACPI support is experimental. Boot using Device Tree if you can."
> 
> 
> That would better convey the risks of using ACPI, while at the same time
> making it a bit easier for users to boot on their ACPI-only platforms.

Right, I agree that this make easier for users to boot Xen on ACPI-only 
platform. However, based on above, it is easy enough for a developper to 
rebuild Xen with ACPI and EXPERT enabled.

So what sort of users are you targeting?

I am sort of okay to remove EXPERT. But I still think building ACPI by 
default is still wrong because our default .config is meant to be 
(security) supported. I don't think ACPI can earn this qualification today.

In order to remove EXPERT, there are a few things to needs to be done 
(or checked):
     1) SUPPORT.MD has a statement about ACPI on Arm
     2) DT is favored over ACPI if the two firmware tables are present.

> 
> 
>> I don't consider the ACPI complete because the parsing of the IORT (used to
>> discover SMMU and GICv3 ITS) is not there yet.
>>
>> I vaguely remember some issues on system using SMMU (e.g. Thunder-X) because
>> Dom0 will try to use the IOMMU and this would break PV drivers.
> 
> I am not sure why Dom0 using the IOMMU would break PV drivers? Is it
> because the pagetable is not properly updated when mapping foreign
> pages?

IIRC, yes. This would need to be tested again.

Cheers,

-- 
Julien Grall

