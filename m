Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA942749B
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 02:18:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204984.360233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ03t-0004Gi-Ek; Sat, 09 Oct 2021 00:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204984.360233; Sat, 09 Oct 2021 00:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZ03t-0004Di-BD; Sat, 09 Oct 2021 00:18:01 +0000
Received: by outflank-mailman (input) for mailman id 204984;
 Sat, 09 Oct 2021 00:18:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUea=O5=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1mZ03s-0004Da-Dg
 for xen-devel@lists.xenproject.org; Sat, 09 Oct 2021 00:18:00 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea5095e5-1fe0-46d6-9361-b3bc96a81ea2;
 Sat, 09 Oct 2021 00:17:59 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id g21so11166535qki.11
 for <xen-devel@lists.xenproject.org>; Fri, 08 Oct 2021 17:17:59 -0700 (PDT)
Received: from six (c-73-89-138-5.hsd1.vt.comcast.net. [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id w1sm590078qtv.71.2021.10.08.17.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 17:17:58 -0700 (PDT)
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
X-Inumbo-ID: ea5095e5-1fe0-46d6-9361-b3bc96a81ea2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/SbXNvitl5VQKOS6dtzeYuzLMwtRWMHw1EBaq4nNZhA=;
        b=qOTLNvQFQuemwRFMboCTjZN7am5fKGiBcPLCwH0k/ET+ghb7c0xtiJKOkddNqGoYdB
         n9n4TWEA+c+LiVeFhfU6J3TGJCiMXoXEQio5LCg0NCVLnBm+uZxpYih1rPWnzAGrKYY5
         rrBztR0cjgJXIXlhAt9zJHS08ZcAjZ8zf1UxyIK2tkqyBzJKgUY55z7Bc2or9jITjpAn
         l6EdXaHao9OFG6DoJYqhftovWZrPxMcxbTjPlp2V0PjB00kJhqoe3KZsfl8ylDd9RAr6
         3qmdrpZ99gGcLeQ7PS3IwFnxbFhm7NIh7hxRyLnEY1XUfdrFjyvhb302ilbhyvSuap0a
         LwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/SbXNvitl5VQKOS6dtzeYuzLMwtRWMHw1EBaq4nNZhA=;
        b=cXA26IuxhDR4h6OZ2TZTcoJ7sp8sn8K5Btmy65xZt7J3Qdesm9t/bVPUtn/DAycT5y
         0nKrTxNJtop+ZW7ViN3ZFo1BS264Kxih9+BN3plLYHAaekXQtZEs0RdEqXYJhuWxbi7N
         RK5oi1NITeKkzJweapjI77WYzEkqGHT+Onny+teeSJ3/oF0K995flRb6Z5qQe/Poy86E
         auGDiLC8er6ZWOIAX++3K58fmj/WBeYoMbkXOSPnSyuzOaFFVThQ6da4acl944//1AkQ
         XwRjfebJQ3bW7o5WlsTCkB7yAwqVQWGTCTeez4c8d9fb6Q222EJzit7KEfYq2f2llAWe
         Y32A==
X-Gm-Message-State: AOAM531gniD0cpwZfK0R8fcSliFyPBW7SGeyGaGXB84pYgXRG0Y7R1vC
	xX1pauS6L+sv4KrMTa/X1Ok=
X-Google-Smtp-Source: ABdhPJxQfVwLSxd4kwKx4o1go8fhDAAguM4KkaJEAPb6/w497lHWkGPqcmF7RcbJks0tyEQ7gbqzBA==
X-Received: by 2002:a37:8a82:: with SMTP id m124mr5542650qkd.406.1633738679271;
        Fri, 08 Oct 2021 17:17:59 -0700 (PDT)
Date: Fri, 8 Oct 2021 20:17:56 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/3] xen: Expose the PMU to the guests
Message-ID: <20211009001756.GB241019@six>
References: <20211008081933.18546-1-michal.orzel@arm.com>
 <20211008081933.18546-4-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008081933.18546-4-michal.orzel@arm.com>

On Fri, Oct 08, 2021 at 10:19:33AM +0200, Michal Orzel wrote:
> Add parameter vpmu to xl domain configuration syntax
> to enable the access to PMU registers by disabling
> the PMU traps(currently only for ARM).
> 
> The current status is that the PMU registers are not
> virtualized and the physical registers are directly
> accessible when this parameter is enabled. There is no
> interrupt support and Xen will not save/restore the
> register values on context switches.
> 
> Please note that this feature is experimental.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Signed-off-by: Julien Grall <julien@xen.org>
> ---
> Changes since v2:
> -remove redundant check from x86 code
> -do not define bit position and mask separately
> Changes since v1:
> -modify vpmu parameter to be common rather than arch specific
> ---
>  docs/man/xl.cfg.5.pod.in             | 17 +++++++++++++++++
>  tools/golang/xenlight/helpers.gen.go |  6 ++++++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  6 ++++++
>  tools/libs/light/libxl_create.c      |  4 ++++
>  tools/libs/light/libxl_types.idl     |  2 ++
>  tools/ocaml/libs/xc/xenctrl.ml       |  1 +
>  tools/ocaml/libs/xc/xenctrl.mli      |  1 +
>  tools/xl/xl_parse.c                  |  2 ++
>  xen/arch/arm/domain.c                | 10 ++++++++--
>  xen/arch/arm/setup.c                 |  1 +
>  xen/common/domain.c                  |  9 ++++++++-
>  xen/include/asm-arm/domain.h         |  1 +
>  xen/include/public/domctl.h          |  4 +++-
>  14 files changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 4b1e3028d2..55c4881205 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -690,6 +690,23 @@ default.
>  B<NOTE>: Acceptable values are platform specific.  For Intel Processor
>  Trace, this value must be a power of 2 between 4k and 16M.
>  
> +=item B<vpmu=BOOLEAN>
> +
> +Currently ARM only.
> +
> +Specifies whether to enable the access to PMU registers by disabling
> +the PMU traps.
> +
> +The PMU registers are not virtualized and the physical registers are directly
> +accessible when this parameter is enabled. There is no interrupt support and
> +Xen will not save/restore the register values on context switches.
> +
> +vPMU, by design and purpose, exposes system level performance
> +information to the guest. Only to be used by sufficiently privileged
> +domains. This feature is currently in experimental state.
> +
> +If this option is not specified then it will default to B<false>.
> +
>  =back
>  
>  =head2 Devices
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index c8669837d8..2449580bad 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1119,6 +1119,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
>  x.Altp2M = Altp2MMode(xc.altp2m)
>  x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
> +if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>  
>   return nil}
>  
> @@ -1600,6 +1603,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
>  xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
>  xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
> +if err := x.Vpmu.toC(&xc.vpmu); err != nil {
> +return fmt.Errorf("converting field Vpmu: %v", err)
> +}
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index 45f2cba3d2..b2e8bd1a85 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -521,6 +521,7 @@ MsrRelaxed Defbool
>  }
>  Altp2M Altp2MMode
>  VmtraceBufKb int
> +Vpmu Defbool
>  }
>  
>  type DomainBuildInfoTypeUnion interface {

For the golang re-gen,

Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Thanks,
NR

