Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891112703F5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 20:26:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJL5f-0007Px-9b; Fri, 18 Sep 2020 18:26:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPqB=C3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kJL5d-0007Pr-Mb
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 18:26:33 +0000
X-Inumbo-ID: 4051c328-8b1c-49a2-af6e-dee0de6e72e2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4051c328-8b1c-49a2-af6e-dee0de6e72e2;
 Fri, 18 Sep 2020 18:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=JXutYG4Qk5Rpokg6GWjssZzElKhTrWab064hNNtj0uw=; b=nMPEM2CY87LtmQRiNmSwmWZNw2
 Khr6PbZWTfZxMliAzgZEKp0pBIXdGCup2aMBuEpLUOPpbZIVPyaJqHhC3bgPl2EP3wJSxXDm6B3O+
 kmuaN9jkPL7FxtU4ILnNG4VTlz6bhoxBtQe0tRawZyZMDT67oQ/+AfaV9Dm2tImqplos=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJL5c-0005S2-Ac; Fri, 18 Sep 2020 18:26:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJL5c-00085j-3q; Fri, 18 Sep 2020 18:26:32 +0000
Subject: Re: AW: DT with memory bank of size 0 (WAS: Re: AW: AW: Colibri
 imx8qxp: Missing kernel boot module)
To: Daniel Wagner2 <Daniel.Wagner2@itk-engineering.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdb15b12e6f345249ea8bc685ca88787@itk-engineering.de>
 <b97ddb1f-fa6c-b5ea-4fd8-1d0c09c7a693@xen.org>
 <e421d4214c8a4201a917a9aa833de939@itk-engineering.de>
 <45400b8b-6379-e00e-50de-941bb2ff423c@xen.org>
 <alpine.DEB.2.21.2009161727100.27508@sstabellini-ThinkPad-T480s>
 <c5bb2ff6fb534eb3be072c0112ba3cdb@itk-engineering.de>
From: Julien Grall <julien@xen.org>
Message-ID: <6ea4f464-fe22-8a42-15e4-e19cc5832ffa@xen.org>
Date: Fri, 18 Sep 2020 19:26:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c5bb2ff6fb534eb3be072c0112ba3cdb@itk-engineering.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Daniel,

On 17/09/2020 10:47, Daniel Wagner2 wrote:
>>>> Btw 8_8000_0000 is the start address of this systems DDR Main
>>>> memory, according to the Reference Manual of the i.MX8QXP.
>>> I couldn't find this value in the DT. It is possible that U-boot is
>>> modifying the memory node before jumping to Xen (or Linux).
>>>
>>> Looking at Linux, they seem to ignore any bank with size == 0. I am
>>> starting to wonder whether your DT is (ab)using it.
>>>
>>> Do you have Linux running on baremetal on this board? If so would you
>>> mind to dump the DT from the userspace (via /proc/device-tree) this
> time?
> 
> I do have linux running on baremetal on the plattform.
> Created dtb and dts with devicetree-compiler:
> dtc -I fs -O dtb -o ~/dtb-dump /proc/device-tree
> dtc -I dtb -O dts -o ~/dts-dump ~/dtb-dump
> 
> uploaded both to google drive:
> https://drive.google.com/drive/folders/1jbpnz35sC0NbCyEjrkLqelBsKBztW1S6
> 
> You were right, after the boot, the memory node contains the second bank
> with
> size=0.
> 
> memory@80000000 {
> 	device_type = "memory";
> 	reg = < 0x00 0x80200000 0x00 0x7fe00000 0x08 0x80000000 0x00 0x00 >;
> };

Thank you for the testing. I am glad we finally found the reason!

>>>
>>> In any case, we may want to relax the check in Xen. Any opinions?
>>
>> Yeah, ignoring a bank with size=0 is fine. I checked the epapr and it
> doesn't
>> specify that size=0 is invalid, so I think it is actually better to ignore
> it and
>> continue even from a spec perspective.

I have sent a patch to ignore empty bank ([1]). Would you mind to test it?

The patch is based on unstable, but it should be easy to apply it on 
older release.

Best regards,

[1] https://lore.kernel.org/xen-devel/20200918171116.29005-1-julien@xen.org/

-- 
Julien Grall

