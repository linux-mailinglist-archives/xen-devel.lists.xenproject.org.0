Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA7456F98
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227924.394343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3wA-0004Ao-F1; Fri, 19 Nov 2021 13:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227924.394343; Fri, 19 Nov 2021 13:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3wA-00048c-B5; Fri, 19 Nov 2021 13:28:18 +0000
Received: by outflank-mailman (input) for mailman id 227924;
 Fri, 19 Nov 2021 13:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vbz8=QG=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1mo3w8-00048W-F8
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:28:16 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb0a6f4-493c-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:28:15 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id t83so10106182qke.8
 for <xen-devel@lists.xenproject.org>; Fri, 19 Nov 2021 05:28:15 -0800 (PST)
Received: from six (c-73-89-138-5.hsd1.vt.comcast.net. [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id b2sm1415682qtg.88.2021.11.19.05.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 05:28:14 -0800 (PST)
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
X-Inumbo-ID: 8cb0a6f4-493c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FHwVnoqUJeOtdMp9p83z0F3h/SF/Hbkc9tmIoRMfg7Q=;
        b=ZUw96n0oN1sKLm6g6M/jeI75iVAPQ/ES6CHqH6EzNrlS75K1nYo7tavZW1hnw55NsA
         IzBsPkGehSlhbzacY2CR62RZzY2GeQB+IeNJUR+6JMM2r2lb3O62kGTcRV0PC4b+Dnt2
         KafnphPqYr8ZOCWgPDSazv+N4JzM5eKOwu2BXO4CBkpVdBwJox0p9CELOXbbav3883UH
         e8pfN9ETTl9M0Jzc5juB/OjdcYfpGQiEcQGHl99kqrKtBocZ1CHzsiqNej/2pKrt6HGP
         oWjFPghoWS/loaUf7k0cJIb9dKilZhX4sUqROO4pNNHZFJWDj+ptkHwSoHNCu0MaXjYW
         dojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FHwVnoqUJeOtdMp9p83z0F3h/SF/Hbkc9tmIoRMfg7Q=;
        b=bnBh1QfRcInsa5gcovY+XJqbVxGXSZEIjd2ulzTRDoweVPq+IdjH6Qg9v7crG8/+sy
         cOtyQy38uUkk3XGiRK69ndBZ/ihLy0gMvTdcllukvH7b0go2+o3m/p9Eli5Un61GHd/z
         c6NBvGbYrd2HapSvWCe8oEfXZnbszJkfuB9ZHUWMXdYflXdA+7FDZ5Nu3vnDptYmaHWu
         CQZiuNIbebwUUTha3praAashOyKZK1dhqd1BIL5TvrlCRTgh1qegH6cL9U6jxYKDrnTB
         20mx0IVNwKjwsoNN9JcJIbbmwR3e9UhIwkkzJhy1CkLuN4oAKn7NpmzD96waWMcthqVr
         wmAg==
X-Gm-Message-State: AOAM531QqYgUieS4aobgK5HCnUg+sWWCBItXrWta+aNcq3OSzrXLgQkq
	+nAaoKoGtgA2yXGG68SgISsbrvix88c=
X-Google-Smtp-Source: ABdhPJwHKVQF/NOPspjOUPzpkGXQ2uflDGFK6VoAfeym+wxHgdozgid123JBYVJhjPs0i2W9/bPUZw==
X-Received: by 2002:a37:2e03:: with SMTP id u3mr28380446qkh.313.1637328494502;
        Fri, 19 Nov 2021 05:28:14 -0800 (PST)
Date: Fri, 19 Nov 2021 08:28:12 -0500
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.16] golang/xenlight: regen generated code
Message-ID: <20211119132812.GA27119@six>
References: <20211119102948.156887-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119102948.156887-1-anthony.perard@citrix.com>

On Fri, Nov 19, 2021 at 10:29:48AM +0000, Anthony PERARD wrote:
> Fixes: 7379f9e10a3b ("gnttab: allow setting max version per-domain")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/golang/xenlight/helpers.gen.go | 4 ++++
>  tools/golang/xenlight/types.gen.go   | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index 6e1b05431056..b746ff108131 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -323,6 +323,7 @@ x.CpuTime = uint64(xc.cpu_time)
>  x.VcpuMaxId = uint32(xc.vcpu_max_id)
>  x.VcpuOnline = uint32(xc.vcpu_online)
>  x.Cpupool = uint32(xc.cpupool)
> +x.GpaddrBits = byte(xc.gpaddr_bits)
>  x.DomainType = DomainType(xc.domain_type)
>  
>   return nil}
> @@ -355,6 +356,7 @@ xc.cpu_time = C.uint64_t(x.CpuTime)
>  xc.vcpu_max_id = C.uint32_t(x.VcpuMaxId)
>  xc.vcpu_online = C.uint32_t(x.VcpuOnline)
>  xc.cpupool = C.uint32_t(x.Cpupool)
> +xc.gpaddr_bits = C.uint8_t(x.GpaddrBits)
>  xc.domain_type = C.libxl_domain_type(x.DomainType)
>  
>   return nil
> @@ -1012,6 +1014,7 @@ return fmt.Errorf("converting field VnumaNodes: %v", err) }
>  }
>  x.MaxGrantFrames = uint32(xc.max_grant_frames)
>  x.MaxMaptrackFrames = uint32(xc.max_maptrack_frames)
> +x.MaxGrantVersion = int(xc.max_grant_version)
>  x.DeviceModelVersion = DeviceModelVersion(xc.device_model_version)
>  if err := x.DeviceModelStubdomain.fromC(&xc.device_model_stubdomain);err != nil {
>  return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
> @@ -1341,6 +1344,7 @@ return fmt.Errorf("converting field VnumaNodes: %v", err)
>  }
>  xc.max_grant_frames = C.uint32_t(x.MaxGrantFrames)
>  xc.max_maptrack_frames = C.uint32_t(x.MaxMaptrackFrames)
> +xc.max_grant_version = C.int(x.MaxGrantVersion)
>  xc.device_model_version = C.libxl_device_model_version(x.DeviceModelVersion)
>  if err := x.DeviceModelStubdomain.toC(&xc.device_model_stubdomain); err != nil {
>  return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index a0acfaacc3a8..b1e84d525843 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -316,6 +316,7 @@ CpuTime uint64
>  VcpuMaxId uint32
>  VcpuOnline uint32
>  Cpupool uint32
> +GpaddrBits byte
>  DomainType DomainType
>  }
>  
> @@ -479,6 +480,7 @@ BlkdevStart string
>  VnumaNodes []VnodeInfo
>  MaxGrantFrames uint32
>  MaxMaptrackFrames uint32
> +MaxGrantVersion int
>  DeviceModelVersion DeviceModelVersion
>  DeviceModelStubdomain Defbool
>  StubdomainMemkb uint64
> -- 
> Anthony PERARD
>
Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Thanks for catching that.

-NR

