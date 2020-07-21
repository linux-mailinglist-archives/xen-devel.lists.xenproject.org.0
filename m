Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA8227CF4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:29:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpWL-0004De-Oi; Tue, 21 Jul 2020 10:29:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxpWK-0004DZ-AG
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:29:12 +0000
X-Inumbo-ID: 04042376-cb3d-11ea-84fe-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04042376-cb3d-11ea-84fe-bc764e2007e4;
 Tue, 21 Jul 2020 10:29:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 184so2362798wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 03:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=H3X2ZwtUY79YQvzuxeH6DYPwazZR85JEKqa9Q2HMgH8=;
 b=BnDblM4MUR9QdgJZYKD49dzQ8UzAYj4lbW5VsMrW7e21oiEMWZGY2xc95c5CB1JuOs
 ajwb4IjT8t4W8d2+JVEkrp8BdGQioGcebFVRPY7FubEhI28Q8wf7+UVhREqXT5NTgUz8
 DGOkfgSCCxwQUKTUtJWdFntpwntSHD1IX24QXs8P4IHIL7h3CJsK4MnEJ0PjOKOx8qJ0
 UU+BeSJSctONB/hrjS6hbTPvsmLk6mi5DxZjdFSGZoXi4EOac/CbkM1VW4q0O5G8Uwor
 kZ544l6YKkj7ZZGOMz1OdNzjmbkspXqc1ezctr8ju67Kd6W/pkqiIgzwcV+gii25hXQS
 p58w==
X-Gm-Message-State: AOAM5323hwrj0LZVPOkr2qzH6RrKhO1ywcOg0uzeg+gSArN2AY+J9APM
 vaXrPTAsRWuLFZ5OalHJNsI=
X-Google-Smtp-Source: ABdhPJxA2c5PvSEcxR26leW5NWXedE+r+FeCC9HFuqAdMNZD5TXA2KLhQOSBYnfLZuA75oi1bvnLIQ==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr3628079wmj.161.1595327350615; 
 Tue, 21 Jul 2020 03:29:10 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c7sm38230408wrq.58.2020.07.21.03.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 03:29:10 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:29:08 +0000
From: Wei Liu <wl@xen.org>
To: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH v1 1/1] oxenstored: fix ABI breakage introduced in Xen
 4.9.0
Message-ID: <20200721102908.ci5wcg2ylurxoyd5@liuwe-devbox-debian-v2>
References: <cover.1594825512.git.edvin.torok@citrix.com>
 <6fcfdb706cc2f666069c1d0bbc59d22f660fc81d.1594825512.git.edvin.torok@citrix.com>
 <1594826510774.33560@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594826510774.33560@citrix.com>
User-Agent: NeoMutt/20180716
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 03:21:50PM +0000, Christian Lindig wrote:
> 
> ________________________________________
> From: Edwin Török <edvin.torok@citrix.com>
> Sent: 15 July 2020 16:10
> To: xen-devel@lists.xenproject.org
> Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu; Igor Druzhinin
> Subject: [PATCH v1 1/1] oxenstored: fix ABI breakage introduced in Xen 4.9.0
> 
> dbc84d2983969bb47d294131ed9e6bbbdc2aec49 (Xen >= 4.9.0) deleted XS_RESTRICT
> from oxenstored, which caused all the following opcodes to be shifted by 1:
> reset_watches became off-by-one compared to the C version of xenstored.
> 

I guess this needs

Backport: 4.9+

(Ian FYI)

> Looking at the C code the opcode for reset watches needs:
> XS_RESET_WATCHES = XS_SET_TARGET + 2
> 
> So add the placeholder `Invalid` in the OCaml<->C mapping list.
> (Note that the code here doesn't simply convert the OCaml constructor to
>  an integer, so we don't need to introduce a dummy constructor).
> 
> Igor says that with a suitably patched xenopsd to enable watch reset,
> we now see `reset watches` during kdump of a guest in xenstored-access.log.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> Tested-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  tools/ocaml/libs/xb/op.ml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/ocaml/libs/xb/op.ml b/tools/ocaml/libs/xb/op.ml
> index d4f1f08185..9bcab0f38c 100644
> --- a/tools/ocaml/libs/xb/op.ml
> +++ b/tools/ocaml/libs/xb/op.ml
> @@ -28,7 +28,7 @@ let operation_c_mapping =
>             Transaction_end; Introduce; Release;
>             Getdomainpath; Write; Mkdir; Rm;
>             Setperms; Watchevent; Error; Isintroduced;
> -           Resume; Set_target; Reset_watches |]
> +           Resume; Set_target; Invalid; Reset_watches |]
>  let size = Array.length operation_c_mapping
> 
>  let array_search el a =
> --
> 2.25.1
> 
> -- 
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

