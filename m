Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0A1245197
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 19:24:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6zv1-0003sE-U6; Sat, 15 Aug 2020 17:24:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zz9Y=BZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6zv0-0003s6-Hg
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 17:24:34 +0000
X-Inumbo-ID: 8c2f45c8-eb87-41d4-aed3-4c047f9c844c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c2f45c8-eb87-41d4-aed3-4c047f9c844c;
 Sat, 15 Aug 2020 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=skzWDiaxQiZel37UtcK8d+PezAAAhvm09qgYAMtk5UU=; b=189x7XMqxpK3twYBf/+GIcveMw
 twfema4tBah6xEAJoWvJkv0J9+WyJHcPbKD3sge77ZvwwrGSIf4KlZxuAETrIchYSVQXl02YbxatQ
 l6Y9ZS7PSb3ctbSCRoqUw/pFJMr2USDL+cFiZuUQ5sLsaJ0YzmP9ZAsN5Ct88I7zCxs0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6zuh-0006IG-Oz; Sat, 15 Aug 2020 17:24:15 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6zuh-0002pt-F0; Sat, 15 Aug 2020 17:24:15 +0000
Subject: Re: [RFC PATCH V1 00/12] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5b6dcf57-ab0d-a4cd-654e-9f5007e84a63@xen.org>
Date: Sat, 15 Aug 2020 18:24:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
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

Hi Oleksandr,

On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Hello all.
> 
> The purpose of this patch series is to add IOREQ/DM support to Xen on Arm.
> You can find an initial discussion at [1]. Xen on Arm requires some implementation
> to forward guest MMIO access to a device model in order to implement virtio-mmio
> backend or even mediator outside of hypervisor. As Xen on x86 already contains
> required support this patch series tries to make it common and introduce Arm
> specific bits plus some new functionality. Patch series is based on Julien's
> PoC "xen/arm: Add support for Guest IO forwarding to a device emulator".
> Besides splitting existing IOREQ/DM support and introducing Arm side,
> the patch series also includes virtio-mmio related changes (toolstack)
> for the reviewers to be able to see how the whole picture could look like.
> For a non-RFC, the IOREQ/DM and virtio-mmio support will be sent separately.
> 
> According to the initial discussion there are a few open questions/concerns
> regarding security, performance in VirtIO solution:
> 1. virtio-mmio vs virtio-pci, SPI vs MSI, different use-cases require different
>     transport...
> 2. virtio backend is able to access all guest memory, some kind of protection
>     is needed: 'virtio-iommu in Xen' vs 'pre-shared-memory & memcpys in guest'
> 3. interface between toolstack and 'out-of-qemu' virtio backend, avoid using
>     Xenstore in virtio backend if possible.
> 4. a lot of 'foreing mapping' could lead to the memory exhaustion, Julien
>     has some idea regarding that.
> 
> Looks like all of them are valid and worth considering, but the first thing
> which we need on Arm is a mechanism to forward guest IO to a device emulator,
> so let's focus on it in the first place.
> 
> ***
> 
> Patch series [2] was rebased on Xen v4.14 release and tested on Renesas Salvator-X
> board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk backend (we will share it later)
> running in driver domain and unmodified Linux Guest running on existing
> virtio-blk driver (frontend). No issues were observed. Guest domain 'reboot/destroy'
> use-cases work properly. Patch series was only build-tested on x86.
> 
> Please note, build-test passed for the following modes:
> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set
> 5. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set
> 
> Build-test didn't pass for Arm32 mode with 'CONFIG_IOREQ_SERVER=y' due to the lack of
> cmpxchg_64 support on Arm32. See cmpxchg usage in hvm_send_buffered_ioreq()).

I have sent a patch to implement cmpxchg64() and guest_cmpxchg64() (see 
[1]).

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20200815172143.1327-1-julien@xen.org/T/#u

-- 
Julien Grall

