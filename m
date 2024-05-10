Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766578C257C
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 15:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719873.1122729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Q6L-0006O6-Rj; Fri, 10 May 2024 13:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719873.1122729; Fri, 10 May 2024 13:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Q6L-0006LJ-P1; Fri, 10 May 2024 13:15:53 +0000
Received: by outflank-mailman (input) for mailman id 719873;
 Fri, 10 May 2024 13:15:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7ZJ=MN=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s5Q6J-0006Gl-Po
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 13:15:52 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b325ff0-0ecf-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 15:15:49 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id A54C280057;
 Fri, 10 May 2024 14:15:48 +0100 (BST)
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
X-Inumbo-ID: 6b325ff0-0ecf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715346948;
	bh=siIHVV1CqvBrMRJJb5ymjMh0hJqBbTR8oSZSgRT6bkI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kgT68tdgdiC1XsBtR9pZKYg2EU/AXaez7k0hqI7+9In+aPpj32HJkBz1/byujPaoi
	 +62eoNouNZFuyJR9huZsi/KwG+zH454efElBgnHAqBQrzSUgXj3uj1gdIHLSZl44Ts
	 o7uYJZwyN12LGURkUKHCD4DQkQg7IgXwyjwKH/Os=
MIME-Version: 1.0
Date: Fri, 10 May 2024 14:15:48 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Oleksii K ." <oleksii.kurochko@gmail.com>, Arthur Borsboom
 <arthurborsboom@gmail.com>
Subject: Re: [PATCH for-4.19] libxl: fix population of the online vCPU bitmap
 for PVH
In-Reply-To: <20240510124913.49945-1-roger.pau@citrix.com>
References: <20240510124913.49945-1-roger.pau@citrix.com>
Message-ID: <c285e23db3b50dbc10a90abc979dc0dc@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

Thanks for responding and fixing this so quickly.

On 2024-05-10 13:49, Roger Pau Monne wrote:
> libxl passes some information to libacpi to create the ACPI table for a 
> PVH
> guest, and among that information it's a bitmap of which vCPUs are 
> online
> which can be less than the maximum number of vCPUs assigned to the 
> domain.
> 
> While the population of the bitmap is done correctly for HVM based on 
> the
> number of online vCPUs, for PVH the population of the bitmap is done 
> based on
> the number of maximum vCPUs allowed.  This leads to all local APIC 
> entries in
> the MADT being set as enabled, which contradicts the data in xenstore 
> if vCPUs
> is different than maximum vCPUs.
> 
> Fix by copying the internal libxl bitmap that's populated based on the 
> vCPUs
> parameter.
> 
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Link: https://gitlab.com/libvirt/libvirt/-/issues/399
> Reported-by: Leigh Brown <leigh@solinno.co.uk>
> Fixes: 14c0d328da2b ('libxl/acpi: Build ACPI tables for HVMlite 
> guests')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Note that the setup of hvm_info_table could be shared between PVH and 
> HVM, as
> the fields are very limited, see hvm_build_set_params() for the HVM 
> side.
> However this late in the release it's safer to just adjust the PVH 
> path.
> 
> Also note the checksum is not provided when hvm_info_table is built for 
> PVH.
> This is fine so far because such checksum is only consumed by hvmloader 
> and not
> libacpi itself.
> 
> It's a bugfix, so should be considered for 4.19.
> ---
>  tools/libs/light/libxl_x86_acpi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_x86_acpi.c 
> b/tools/libs/light/libxl_x86_acpi.c
> index 620f3c700c3e..5cf261bd6794 100644
> --- a/tools/libs/light/libxl_x86_acpi.c
> +++ b/tools/libs/light/libxl_x86_acpi.c
> @@ -89,7 +89,7 @@ static int init_acpi_config(libxl__gc *gc,
>      uint32_t domid = dom->guest_domid;
>      xc_domaininfo_t info;
>      struct hvm_info_table *hvminfo;
> -    int i, r, rc;
> +    int r, rc;
> 
>      config->dsdt_anycpu = config->dsdt_15cpu = dsdt_pvh;
>      config->dsdt_anycpu_len = config->dsdt_15cpu_len = dsdt_pvh_len;
> @@ -138,8 +138,8 @@ static int init_acpi_config(libxl__gc *gc,
>          hvminfo->nr_vcpus = info.max_vcpu_id + 1;
>      }
> 
> -    for (i = 0; i < hvminfo->nr_vcpus; i++)
> -        hvminfo->vcpu_online[i / 8] |= 1 << (i & 7);
> +    memcpy(hvminfo->vcpu_online, b_info->avail_vcpus.map,
> +           b_info->avail_vcpus.size);
> 
>      config->hvminfo = hvminfo;

Tested-by: Leigh Brown <leigh@solinno.co.uk>

Regards,

Leigh.

