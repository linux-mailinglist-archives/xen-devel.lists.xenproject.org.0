Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E3C83750
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171644.1496651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmSe-0005EW-2X; Tue, 25 Nov 2025 06:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171644.1496651; Tue, 25 Nov 2025 06:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmSd-0005C9-Ve; Tue, 25 Nov 2025 06:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1171644;
 Tue, 25 Nov 2025 06:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmSc-0005C3-LX
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:23:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43fa9620-c9c7-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:23:32 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso24215445e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:23:32 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf226c2asm231059685e9.10.2025.11.24.22.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:23:31 -0800 (PST)
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
X-Inumbo-ID: 43fa9620-c9c7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051812; x=1764656612; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOOQl3kZW1bVC+fk7t2YWU1R6hWEB46Dmnal7magMFw=;
        b=k0NWXZGz2CeDC8TJSpIx9mU18oFQaFe3nFybnl6IChsPoJOIKRXLrL7cuO4HSDVlQ8
         AB0qCrLrDXqhLwkNanaQxrRUG+tNLnKVNDBGjiEdECFdzNFto+7idkzGOl04/X89JMiH
         4jKvC6h6oDK39ltfYNj51FvLJlLQWTPwpL108rBFswJnftJD/Bz1BW8x5GNW5qTMFSdY
         ogsYZSP5RagkPu17T8tbrWim5TEG0W7SNuIb3qBhS0FaRxiznbQ6FWAgtcc+j0BI1pvy
         KaJKw+mlRFFnBDvP+zXwjhDBES4axB2B7qVmPIUddY8fFl+z1dLA6jQbkcA5YKAmJ1XK
         yrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051812; x=1764656612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOOQl3kZW1bVC+fk7t2YWU1R6hWEB46Dmnal7magMFw=;
        b=m9gkyTrVYnI2PR7hoAwn+h8tMharYGIaq4SxuVbCb/8FRMi9d6z2Mk87TMLYgJCTU0
         +2I7EkypXUoZ3nyAuM1BWyABrIpxCtbAfKZa8JbU5vJyphtCJIwtaUw9ppKeFyShkX5B
         sLRrtI/NmvdnZZlsCYWNHoqaFXd3JtDo74EJl2fRqAr5diWaUqvVNBdvV9JhqsR7jDoj
         29eVob+9O+zx5KYrEU7wxYl5y4ZaVuAMJBN15Cd1fr4eB3AAZ0kIJ8mdJk8SN9Kcp8Q+
         Sl31kG+hKX/wfdrFfrfhY2N6UNNr/wpIlljd27ajr0mtz4fRkgqjajfyiPc8YerSIUk1
         KRBw==
X-Forwarded-Encrypted: i=1; AJvYcCWOpB7NCT4eU0cONP8SEPg0eyH4gpkp06AWnGtVrmZ32hYjUNLgHKUugvOLBilSQXJGLIDLhiSkL1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFdnHuvGyFNQpTo9Yztq5zs+9UhbjDrwIghBfeNTvDsf86AUtA
	6ZABsPefuBMde4UQGkU5JVJj2n89kCt2IP7FoddIWr84FPYWEJd2saJW+qS8KXfxft8=
X-Gm-Gg: ASbGncv/AFpqlkhb5yzMNMAqcfVbvvChKpuvF77Hs5dQpW0fuihN0NwC3D3xdtD9lfJ
	mnT0KNBlAroWG2WcfFgFEWv+a3/nBUP/jJJtwXtYEXslhr7BAf10da4Po2H26YgI/0NO94O52L0
	hdUiwxF2er9qT4pt/g7YIraCDAq+i6W5Iq57lu4UQ5l+GDRv10srWUZIT6FgzCXNSmpUODeWUn5
	E2e5qsy7VRw+yX0P8VCaCEcxkOm3MHo6lwQOn9P4l1GWnKRkf64DS5IN6XvVjO6tz/T+b2jT8vd
	cBRBOr4uD6wbuhZ0RgTRjqfaSYRsf3sMcx2Cu63bI18w4Iz90td6X/GUu6bhuYtdBD1ceYVXLaq
	rhVyZybYD0n+3fREw85cxdDsNNdC1v0kjm4TkSzP2vndskTtatmJwPkLer2PWMUHG9t3VfCWTL8
	kDH+KK4S3cL2r2Lm38QUHI/HVYeinqTB7JHE7yIZan1xRAsK2ywKJ9643D+cCa+V7W
X-Google-Smtp-Source: AGHT+IGLa5fRK9K5L3FkUn0xfaMF4zkOQClpsNtdNtMutakIaGVpTMJc0y08tQVlCwv9gBeMm+157Q==
X-Received: by 2002:a05:600c:3543:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-477c1142268mr112956985e9.20.1764051811939;
        Mon, 24 Nov 2025 22:23:31 -0800 (PST)
Message-ID: <541f756c-0fde-488b-b386-814fb276ebae@linaro.org>
Date: Tue, 25 Nov 2025 07:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] error: Use error_setg_errno() for simplicity and
 consistency
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-14-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> Use error_setg_errno() instead of passing the value of strerror() or
> g_strerror() to error_setg().
> 
> The separator between the error message proper and the value of
> strerror() changes from " : ", "", " - ", "- " to ": " in places.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   backends/spdm-socket.c      |  4 ++--
>   backends/tpm/tpm_emulator.c | 13 +++++--------
>   hw/9pfs/9p.c                |  3 +--
>   hw/acpi/core.c              |  3 +--
>   hw/intc/openpic_kvm.c       |  3 +--
>   hw/intc/xics_kvm.c          |  5 +++--
>   hw/remote/vfio-user-obj.c   | 18 +++++++++---------
>   hw/sensor/emc141x.c         |  4 ++--
>   hw/sensor/tmp421.c          |  4 ++--
>   hw/smbios/smbios.c          |  4 ++--
>   hw/virtio/vdpa-dev.c        |  4 ++--
>   migration/postcopy-ram.c    | 10 +++++-----
>   net/slirp.c                 |  5 +++--
>   qga/commands-posix-ssh.c    | 23 +++++++++++++----------
>   system/vl.c                 |  2 +-
>   target/ppc/kvm.c            |  5 ++---
>   16 files changed, 54 insertions(+), 56 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


