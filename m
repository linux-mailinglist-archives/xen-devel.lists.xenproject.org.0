Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949657DDDBD
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 09:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626104.976070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy6ZI-0006W3-52; Wed, 01 Nov 2023 08:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626104.976070; Wed, 01 Nov 2023 08:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy6ZI-0006SP-0N; Wed, 01 Nov 2023 08:27:16 +0000
Received: by outflank-mailman (input) for mailman id 626104;
 Wed, 01 Nov 2023 08:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qy6ZG-0006RZ-DC
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 08:27:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy6ZC-0002pZ-Ct; Wed, 01 Nov 2023 08:27:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy6ZC-0004Ob-6z; Wed, 01 Nov 2023 08:27:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=O/IyebYHyIEGG024OJQhMSJ9gW/kbs4LfT4m8H7kHj4=; b=4oNgu69XleDYOoIhNTdfnGlDEi
	ZAm3AlwwRasSGEDwiPR9D4I4pjHOAc8P/ZFBbD7xHK/AVdAo9n1cwbj6wBBZ+TQKXRVfaIyIAoq2S
	24G0fygF+UiAyRd2E0FqpaXYt3gZpjy08O/qTnUfi4GO2BuIUj5hE84cOUM+bV0EVEuw=;
Message-ID: <08d50d8e-00bc-4bd0-be64-49639028eca8@xen.org>
Date: Wed, 1 Nov 2023 08:27:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
Content-Language: en-GB
To: Chuck Zmudzinski <brchuckz@netscape.net>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Mario Marietto <marietto2008@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop>
 <CA+1FSih0hORYZf6Hfmf=nY4jkHPvFSgGfc1tJfzN6smnKxcsxA@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311625260.1795129@ubuntu-linux-20-04-desktop>
 <d7d353b6-8d98-4bfa-8f45-1cb56fcea1f8@netscape.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d7d353b6-8d98-4bfa-8f45-1cb56fcea1f8@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

@Stefano, as you pointed out, there is already a thread on xen-users for 
this discussion. Could we use this thread for any discussion? This would 
make easier to follow.

Some high level comment below.

On 01/11/2023 02:50, Chuck Zmudzinski wrote:
> On 10/31/2023 7:45 PM, Stefano Stabellini wrote:
>> Unfortunately there is no easy solution.
>>
>> Do you know the version of the SMMU available on the platform?
> 
> I am trying to discern, but I doubt we have v3 because we are
> working on a very old chromebook from 2012, and I am finding
> patches for smmv3 in Linux not starting until 2015. It is good to
> know about this option, though, for future work we might do on newer
> devices.

The chromebook is using the Exynos Sysmmu. So there is no SMMU.

> 
>> If it is a SMMUv3 you can try to use the nested SMMU patch series to
>> enable a virtual SMMU in Dom0: https://marc.info/?l=xen-devel&m=166991020831005
>> That way, Xen can use the SMMU to protect VMs, and Dom0 can also use the
>> SMMU for its own purposes at the same time.
>>
>> Alternatively, you can dig into the details of the exynos-drm driver to
>> see what exactly is the dependency on the IOMMU framework in Linux and
>> remove the dependency. Unfortunately none of us in this thread are
>> expert on exynos-drm so it would be difficult to advise on how to do
>> that. For example, I don't know how you could debug the x11 problem you
>> described because I don't typically work with x11 or with the exynos. If
>> there is an open source mailing list for exynos-drm development they
>> might be able to advise on how to remove the IOMMU dependency there.
> 
> We have received this message from Marek Szyprowski of Samsung:
> 
> https://lore.kernel.org/lkml/7a71e348-f892-4fd4-8857-b72f35ab5134@samsung.com/
> 
> Marek recommends this patch to possibly help with this issue:
> 
> https://github.com/torvalds/linux/commit/bbc4d205d93f52ee18dfa7858d51489c0506547f
> 
> and also these kernel config settings:
> 
> On 10/31/2023 8:08 AM, Marek Szyprowski wrote:
>> If not, then as a temporary workaround please disable
>> CONFIG_DRM_EXYNOS_MIXER and CONFIG_DRM_EXYNOS_HDMI in your kernel config
>> and check what will happen (You will lose the HDMI output, but maybe
>> this won't a big issue).
> 
> Mario and I have preliminary evidence that applying both of Marek's
> recommendations to the 6.1.59 kernel have improved the situation to
> the point where now the Chromebook can run X.org on Xen. We are doing
> further tests to see how Marek's patch and/or the kernel config settings
> to disable the mixer and the HDMI affect the behavior of the GPU in dom0
> on Xen.
> 
>>
>> The final option, which is a gross hack, would be to let Dom0 use the
>> IOMMU for its own gain. Xen doesn't use the IOMMU. If you do that you
>> lose freedom from interference between the VMs and you cannot run driver
>> domains or directly assign devices to DomUs. But if you are running a
>> research project you might be OK with that. To get it to work, you need
>> to hack Xen so that it remaps the IOMMU to Dom0 to let Dom0 program it
>> directly. The attached patch (untested) would be a place to start. You
>> also need to pass iommu=false to the Xen command line to prevent Xen
>> from using the iommu itself.

This is actually one of the reason why I am suggesting to do all the 
investigation in one thread. There, we already discovered that the IOMMU 
was assigned to dom0 because Xen doesn't have a driver and we don't hide 
them by default.

> 
> I am interested to investigate if only the mixer and the HDMI is causing
> the trouble. Based on what you are telling me about Xen not exposing the
> IOMMU to dom0, I don't fully understand the original log messages I was
> getting when I followed Julien's suggestion to find the symbols associated
> with each address in the original message, and those seemed to indicate that
> the exynos_drm device was using the IOMMU in dom0, but the mixer was not,
> and the fact that they both were not using the IOMMU is what caused the
> test to fail and Linux refuse to initialize the GPU on dom0, whereas on
> bare metal, the logs indicated both the exynos mixer, which I think is a
> sub device of the exynos_drm, and the exynos_drm, use the IOMMU on bare
> metal.
> 
> I also found this patch which suggests if we can get the devices to work
> we will be compromising the security and isolation between guests:

If you don't assign any device to the guests, then you will not break 
any isolation between guests because dom0 will own all of them.

But for passthrough, you would want to the IOMMU owned by Xen rather 
than dom0. Unless the Exynos sysmmu support 2-stages page-tables, then 
dom0 will not be able to use the IOMMU.

Cheers,

-- 
Julien Grall

