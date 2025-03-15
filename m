Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B6BA62FB3
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 16:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915841.1321171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttTqb-0005uy-Oa; Sat, 15 Mar 2025 15:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915841.1321171; Sat, 15 Mar 2025 15:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttTqb-0005tO-IH; Sat, 15 Mar 2025 15:54:49 +0000
Received: by outflank-mailman (input) for mailman id 915841;
 Sat, 15 Mar 2025 15:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvq=WC=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1ttTqa-0005tG-Ug
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 15:54:48 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12652f6-01b5-11f0-9899-31a8f345e629;
 Sat, 15 Mar 2025 16:54:45 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54298ec925bso4686917e87.3
 for <xen-devel@lists.xenproject.org>; Sat, 15 Mar 2025 08:54:45 -0700 (PDT)
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
X-Inumbo-ID: d12652f6-01b5-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054085; x=1742658885; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qxQS40i0Ch68XwgXa+Jru8hgZRhDi7GFz9Uqyb44yWE=;
        b=Z6NniDk9Pq2/REu07GGyiUkyHSAKj741GCxbLcCen0t9mnlfzc3n6XiNRKJwjqDEzX
         R4/8NEKXlT6OwlyNWdHi8ReUhK5KgnKPPnDKiV5WHJbFgdNGotAhp+i+JktScXMIXAdQ
         kff3afyou6DoMfQsfIv+ZXwK4XtBM9zct4dWQvsgfX6jK7Mn/jwUOv4/lgFrtMvBkVGz
         YSfWJn7D42Wd+9MVQ4dspp+UBuDNBJwN02DS3VtFIqo9+MGFZ1j1KbiuebMhwQd8DstG
         BIpFkv1vRyEmyDgEXrRhl39L1E/KIf/CEtXFlwj0pLEJWMvuzA5NmO4t6jOFeTemA2rY
         FVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054085; x=1742658885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxQS40i0Ch68XwgXa+Jru8hgZRhDi7GFz9Uqyb44yWE=;
        b=sjG7EDsDEznD13d6+9O7kITAZPyV3ridWVue0uC+0w1xvpiiVfDPoRWEsZkCd2/xCb
         hM0U+rE68FPqqUcd4AYKPEbrIrlsCbIKDRqcVMbwtkD60lQlV44b6jizsrithvOXuthP
         WO6v+o4zGHpVw5yQLu4KDfXPWV92wcmnXZXTlL+SiD/pwT4j2r28pZsoiThEXTnPZ7zw
         XFCJK9l0WFSvOkXVFrgFTdlbnbnNrYaP1RDvMTS3eaTw3XRW3p4wcDr9N6Kqh6+YwoPu
         XB0XZ/itX+NJDAPGUk2RexkIml9GVwppJ0eoHqq+g13mXE20KItsMuF7TfetH7LFHcUn
         dMVg==
X-Gm-Message-State: AOJu0YxkxVLJekrWmO2KR04Ua7BV6OCpz14hbKWtoa/bLuU+v/FlEiJV
	0mpapkFD3PFsq1Yo69IgJURBBDc2C7Jxy0R7UsINgYlK0/wQmFLXtbQD2OaWoKIAMWjlm9FY00Q
	ssdTyY4tdMYiO+QORHwdQASFTk4AQEA==
X-Gm-Gg: ASbGncsDikkIKmVOgo9LM6qCQdwsluNRf4idwh3KtnuJwinuha/6RsfmwwqFAN9SZ0g
	PtwR1NG/OFeJvv73TSOOURDBsLuhi8P0eauM0OvCRb2bC6BFafv09qePjcd9/oGPcpJi23ooAso
	p3aGBMOi7BKQv3xQIsbvTFY2wR
X-Google-Smtp-Source: AGHT+IFCaEI2DZdnGsgfV+lasn7746U+l7Gd9aOV9sWuQDcllPHilPpO/VDS7+hVLfUOXsQ7165wifXBQSg6Hu4huwg=
X-Received: by 2002:a05:6512:b9e:b0:549:78bd:6b8e with SMTP id
 2adb3069b0e04-549c396e744mr2247829e87.37.1742054084285; Sat, 15 Mar 2025
 08:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
In-Reply-To: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
From: Andriy Sultanov <sultanovandriy@gmail.com>
Date: Sat, 15 Mar 2025 15:54:32 +0000
X-Gm-Features: AQ5f1JoayLnUQPrWcVsSc6_FJ-onmdkrAWorhDjFCLP6OTuV_tapk1iPnu0POsU
Message-ID: <CAHPYgaUwCwKBtWBJCroBJZscvi5ODZAQiFbDXe=pXB=yPHOQ1Q@mail.gmail.com>
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 18:57, Andrii Sultanov <sultanovandriy@gmail.com> wrote:
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -297,7 +297,7 @@ static int __init register_range_for_iommu_devices(
>      /* reserve unity-mapped page entries for devices */
>      for ( bdf = rc = 0; !rc && bdf < ivrs_bdf_entries; bdf++ )
>      {
> -        if ( iommu != find_iommu_for_device(iommu->seg, bdf) )
> +        if ( iommu != find_iommu_for_device(iommu->sbdf) )
>              continue;

Note there's a bug here, this needs to stay as is. Will fix in V2.

