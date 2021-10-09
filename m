Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30198427497
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 02:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204976.360222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ02F-0003dR-3N; Sat, 09 Oct 2021 00:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204976.360222; Sat, 09 Oct 2021 00:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ02E-0003aJ-Vx; Sat, 09 Oct 2021 00:16:18 +0000
Received: by outflank-mailman (input) for mailman id 204976;
 Sat, 09 Oct 2021 00:16:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUea=O5=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1mZ02D-0003aD-KW
 for xen-devel@lists.xenproject.org; Sat, 09 Oct 2021 00:16:17 +0000
Received: from mail-qt1-x82c.google.com (unknown [2607:f8b0:4864:20::82c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35faf5f8-ffe1-4d34-87ed-7e88d1e9d591;
 Sat, 09 Oct 2021 00:16:16 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id d8so11160596qtd.5
 for <xen-devel@lists.xenproject.org>; Fri, 08 Oct 2021 17:16:16 -0700 (PDT)
Received: from six (c-73-89-138-5.hsd1.vt.comcast.net. [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id x9sm616585qtw.84.2021.10.08.17.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 17:16:15 -0700 (PDT)
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
X-Inumbo-ID: 35faf5f8-ffe1-4d34-87ed-7e88d1e9d591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TB0XrSz76GmDWduFUHCz3rCT4aQ7mpDasapPcaUx0FI=;
        b=OCqy4W5bfczTToz4MdzD2Uq3k+KQSw64mk+8vTverDVEYIjCP9y+4XC+LJcUi6sNXy
         KlGNlVpoYg+lmnRdTRDzy2dWA1UMC1IATqGJj/4c4p6MkUxJfm3+O5cPHrcGX8YMw67I
         tHWsLZZUyMq3vIPKm02uWD0sqkvZzXEbS21bi60qspv7TL6Hm7wOMmlC3aDDiKATvg7x
         yg3TjbKaVUP3wRKJholoPNoMn09qLWVYYy/e0ArdIXW3DuZh1A7CAcr1qo1E0sruTsd9
         qKNU3ord0jqPeRabFdKGxhFUhZTk00LQ4ATkl4Jad4anBIqk9+mJm0LrjBtS2TgAuGLK
         sLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TB0XrSz76GmDWduFUHCz3rCT4aQ7mpDasapPcaUx0FI=;
        b=FcsP1T7SQfIspktRghva/vpST3b/b3P8J+ALMxTEwWoOPUL9kEL1eUwfLR7ZMK8A46
         134IH9r1O2WQ3By2gIbNdBBTF0YVG4R1tAiCL/x/HyI46KmmYolAlrdjg2LsgFWsuoE1
         CSOYLXau8P1brdMAjniAB7mzd3VdU4fhkVemAXI8SXBXwyQfCeEx0lKxUgwxgUCi2mYX
         pfeXfUgioqpy3suPlPTBJnoVQii9TiUrM8T8wW5z6vCIw8HiZi3+22hSnwPzlq4ebpUK
         xrhmGXCG4GY0IeX2+TNHfxQa1wwAx10lXw8F+Es+29TbHuYkldN6edT9PZrqYm+gpS98
         MKOw==
X-Gm-Message-State: AOAM533ceEvOTxtwkKm1iDxN8ybW86LymAiPfCNwSb9YacN1UgvLoRLi
	U+v60XcRWPzsa6GE1QU2jVo=
X-Google-Smtp-Source: ABdhPJz6oBta4l6qb4nYeWa7ZDpw78/JU6AweBYPgpKkcDUZY1blikCJ5TW7ZOGjBtM6f232JA/usA==
X-Received: by 2002:ac8:570e:: with SMTP id 14mr1446616qtw.65.1633738575845;
        Fri, 08 Oct 2021 17:16:15 -0700 (PDT)
Date: Fri, 8 Oct 2021 20:16:12 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: Re: [PATCH v3 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
Message-ID: <20211009001612.GA241019@six>
References: <20211008081933.18546-1-michal.orzel@arm.com>
 <20211008081933.18546-2-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008081933.18546-2-michal.orzel@arm.com>

On Fri, Oct 08, 2021 at 10:19:31AM +0200, Michal Orzel wrote:
> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
> indicates whether the platform supports vPMU
> functionality. Modify Xen and tools accordingly.
> 
> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
> definition in sysctl.h which wrongly use (1<<6)
> instead of (1u<<6).
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Changes since v2:
> -do not define bit position and mask separately
> Changes since v1:
> -new in v2
> ---
>  tools/golang/xenlight/helpers.gen.go | 2 ++
>  tools/golang/xenlight/types.gen.go   | 1 +
>  tools/include/libxl.h                | 6 ++++++
>  tools/libs/light/libxl.c             | 1 +
>  tools/libs/light/libxl_types.idl     | 1 +
>  tools/ocaml/libs/xc/xenctrl.ml       | 1 +
>  tools/ocaml/libs/xc/xenctrl.mli      | 1 +
>  tools/xl/xl_info.c                   | 5 +++--
>  xen/common/domain.c                  | 2 ++
>  xen/common/sysctl.c                  | 3 +++
>  xen/include/public/sysctl.h          | 6 ++++--
>  xen/include/xen/domain.h             | 2 ++
>  12 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index bfc1e7f312..c8669837d8 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -3360,6 +3360,7 @@ x.CapHap = bool(xc.cap_hap)
>  x.CapShadow = bool(xc.cap_shadow)
>  x.CapIommuHapPtShare = bool(xc.cap_iommu_hap_pt_share)
>  x.CapVmtrace = bool(xc.cap_vmtrace)
> +x.CapVpmu = bool(xc.cap_vpmu)
>  
>   return nil}
>  
> @@ -3391,6 +3392,7 @@ xc.cap_hap = C.bool(x.CapHap)
>  xc.cap_shadow = C.bool(x.CapShadow)
>  xc.cap_iommu_hap_pt_share = C.bool(x.CapIommuHapPtShare)
>  xc.cap_vmtrace = C.bool(x.CapVmtrace)
> +xc.cap_vpmu = C.bool(x.CapVpmu)
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 09a3bb67e2..45f2cba3d2 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -1008,6 +1008,7 @@ CapHap bool
>  CapShadow bool
>  CapIommuHapPtShare bool
>  CapVmtrace bool
> +CapVpmu bool
>  }

For the golang re-gen,

Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Thanks,
NR

