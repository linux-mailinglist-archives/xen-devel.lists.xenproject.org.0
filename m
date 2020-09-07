Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A915260441
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 20:08:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLZ7-0004mn-HL; Mon, 07 Sep 2020 18:08:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Tp4=CQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kFLZ6-0004mY-14
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 18:08:28 +0000
X-Inumbo-ID: 6d6d9206-b7d2-4b46-b535-c4aafa5f337d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d6d9206-b7d2-4b46-b535-c4aafa5f337d;
 Mon, 07 Sep 2020 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=tKXo5m1waetFKfyYTuwrEMnTCw0bCsrRfKHrf168mGo=; b=Sk1yjhQJmmBS1UjBlTuFdB17gq
 iklYAx6bCNcYNH7VI6T7hZ7lnR6xiwPDYBv3sqvjSMsIvpTVj+WOKo9dKQ10jJmwsYr9y6WkPYwTz
 JdEVciLAvSCzcqPf1wochlzFk3rPiITVcxBdK75P4piaGpG2zaESO4BkLesosqdH0peQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFLZ4-000749-5v; Mon, 07 Sep 2020 18:08:26 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFLZ4-0007ZE-0C; Mon, 07 Sep 2020 18:08:26 +0000
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <6beb3e6b-e438-caa1-5b51-836091c05ade@xen.org>
 <qrcMU44FmSMDmicmc9i2Lxpp4zrl0q2k8jgmTB9ZMyuBnbVDp84LHi5V_mNN2IlynTrft_BlSqUotpX4avgjNgMXA51f9cZVuaEoLEzje90=@trmm.net>
 <MCvbo5-dJcQ2-Sa-Rq2T7m0V2Z1WwsG2fSvBHwKL-dkI2KD5-0EMkGU9MT1VEv-tvnWhcZx3PhHp8V37pYm1l9oBO2_o--c7LMkb0QRmJXY=@trmm.net>
From: Julien Grall <julien@xen.org>
Message-ID: <75f651dd-c05e-3a85-2ba2-da7df4784bee@xen.org>
Date: Mon, 7 Sep 2020 19:08:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <MCvbo5-dJcQ2-Sa-Rq2T7m0V2Z1WwsG2fSvBHwKL-dkI2KD5-0EMkGU9MT1VEv-tvnWhcZx3PhHp8V37pYm1l9oBO2_o--c7LMkb0QRmJXY=@trmm.net>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 04/09/2020 19:18, Trammell Hudson wrote:
> On Friday, September 4, 2020 2:05 PM, Trammell Hudson <hudson@trmm.net> wrote:
> 
>> On Friday, September 4, 2020 1:58 PM, Julien Grall julien@xen.org wrote:
>>> On 28/08/2020 12:51, Trammell Hudson wrote:
>>>> This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
>>>> configuration file, the Linux kernel and initrd, as well as the XSM, and
>>>> CPU microcode into a single "unified" EFI executable.
>>>
>>> For Arm, I would also consider to add the DTB in "unified" EFI
>>> executable. See efi_arch_cfg_file_early() in xen/arch/arm/efi/efi-boot.h.
>>
>> Excellent point. The DTB is critical as well. I'll add that to
>> the patch on Xen's gitlab.
> 
> Here is an untested patch for loading DTB from unified image:
> 
> https://gitlab.com/xen-project/xen/-/merge_requests/4/diffs?commit_id=e55336e11cc6a7ce77f0bf8ce3aa0712c7017e8b

Thanks! I will directly try to the v3 of this series.

Cheers,

-- 
Julien Grall

