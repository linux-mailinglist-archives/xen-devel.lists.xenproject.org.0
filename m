Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD1622C38A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 12:46:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyvCg-0006YL-RZ; Fri, 24 Jul 2020 10:45:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5T8C=BD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyvCg-0006YG-08
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 10:45:26 +0000
X-Inumbo-ID: c761f623-cd9a-11ea-a3a4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c761f623-cd9a-11ea-a3a4-12813bfff9fa;
 Fri, 24 Jul 2020 10:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l+UAk3p0LmCJrUnDM/PS/Q9/RWFRvTqJ3FXosS3Dh4Q=; b=v7CEzxo7jzkPxhDNIdLc+s5xGb
 fG2Lr6jq9b/u4IKwTfAuoRLQj1pSIEAJZE5Rlm/ntCdxBqfgk1CG7CCYhBpHMhV7o62AwPtpu+Nb6
 G6GxFujGBr9oriS4dSedU2pWy+deiKX+5Ud23w6uus2pU8OKxvKkwQKzIwQCuD2KLqE0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyvCc-0005IT-HB; Fri, 24 Jul 2020 10:45:22 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyvCc-0001gQ-8J; Fri, 24 Jul 2020 10:45:22 +0000
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Alejandro <alejandro.gonzalez.correo@gmail.com>,
 xen-devel@lists.xenproject.org
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
Date: Fri, 24 Jul 2020 11:45:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+ Andre and Stefano)

On 20/07/2020 15:53, Alejandro wrote:
> Hello all.

Hello,

> 
> I'm new to this community, and firstly I'd like to thank you all for
> your efforts on supporting Xen in ARM devices.

Welcome to the community!

> 
> I'm trying Xen 4.13.1 in a Allwinner H6 SoC (more precisely a Pine H64
> model B, with a ARM Cortex-A53 CPU).
> I managed to get a dom0 Linux 5.8-rc5 kernel running fine, unpatched,
> and I'm using the upstream device tree for
> my board. However, the dom0 kernel has trouble when reading some DT
> nodes that are related to the CPUs, and
> it can't initialize the thermal subsystem properly, which is a kind of
> showstopper for me, because I'm concerned
> that letting the CPU run at the maximum frequency without watching out
> its temperature may cause overheating.

I understand this concern, I am aware of some efforts to get CPUFreq 
working on Xen but I am not sure if there is anything available yet. I 
have CCed a couple of more person that may be able to help here.

> The relevant kernel messages are:
> 
> [  +0.001959] sun50i-cpufreq-nvmem: probe of sun50i-cpufreq-nvmem
> failed with error -2
> ...
> [  +0.003053] hw perfevents: failed to parse interrupt-affinity[0] for pmu
> [  +0.000043] hw perfevents: /pmu: failed to register PMU devices!
> [  +0.000037] armv8-pmu: probe of pmu failed with error -22

I am not sure the PMU failure is related to the thermal failure below.

> ...
> [  +0.000163] OF: /thermal-zones/cpu-thermal/cooling-maps/map0: could
> not find phandle
> [  +0.000063] thermal_sys: failed to build thermal zone cpu-thermal: -22
Would it be possible to paste the device-tree node for 
/thermal-zones/cpu-thermal/cooling-maps? I suspect the issue is because 
we recreated /cpus from scratch.

I don't know much about how the thermal subsystem works, but I suspect 
this will not be enough to get it working properly on Xen. For a 
workaround, you would need to create a dom0 with the same numbers of 
vCPU as the numbers of pCPUs. They would also need to be pinned.

I will leave the others to fill in more details.

> 
> I've searched for issues, code or commits that may be related for this
> issue. The most relevant things I found are:
> 
> - A patch that blacklists the A53 PMU:
> https://patchwork.kernel.org/patch/10899881/
> - The handle_node function in xen/arch/arm/domain_build.c:
> https://github.com/xen-project/xen/blob/master/xen/arch/arm/domain_build.c#L1427

I remember this discussion. The problem was that the PMU is using 
per-CPU interrupts. Xen is not yet able to handle PPIs as they often 
requires more context to be saved/restored (in this case the PMU context).

There was a proposal to look if a device is using PPIs and just remove 
them from the Device-Tree. Unfortunately, I haven't seen any official 
submission for this patch.

Did you have to apply the patch to boot up? If not, then the error above 
shouldn't be a concern. However, if you need PMU support for the using 
thermal devices then it is going to require some work.

> 
> I've thought about removing "/cpus" from the skip_matches array in the
> handle_node function, but I'm not sure
> that would be a good fix.

The node "/cpus" and its sub-node are recreated by Xen for Dom0. This is 
because Dom0 may have a different numbers of vCPUs and it doesn't seen 
the pCPUs.

If you don't skip "/cpus" from the host DT then you would end up with 
two "/cpus" path in your dom0 DT. Mostly likely, Linux will not be happy 
with it.

I vaguely remember some discussions on how to deal with CPUFreq in Xen. 
IIRC we agreed that Dom0 should be part of the equation because it 
already contains all the drivers. However, I can't remember if we agreed 
how the dom0 would be made aware of the pCPUs.

@Volodymyr, I think you were looking at CPUFreq. Maybe you can help?

Best regards,

-- 
Julien Grall

