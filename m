Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711BA1D7F93
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 19:04:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jajAt-0004zL-D5; Mon, 18 May 2020 17:03:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFi1=7A=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jajAr-0004zG-E4
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 17:03:33 +0000
X-Inumbo-ID: 80ab74c4-9929-11ea-a87f-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80ab74c4-9929-11ea-a87f-12813bfff9fa;
 Mon, 18 May 2020 17:03:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n5so330889wmd.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 10:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nGkI8tP239tDUEkOH0wudLcKJV8oZ9pOIkB3tDZoxrg=;
 b=YREmVS/JqP7lqzxp39gP3lgCD2262D0QlMLXv/JPajIBs2LN+4rtDnuu91iwIaDwNI
 KTjd6KKkZwmA10xogjcy3Z4ZZZctTAcCDiBApVb0j+miwwUm6zjszCNK6+AHGxu/0Bh4
 nhDrblD35j2HzLN2MU6Bt8csaf3XA5CbC15mkcqQrHrkbH4pxLi2+rGaMz765v7lwVNP
 TAJhvpmwdVAzZ1YvEcPzYriui17ntuLg0llrMjDU+0grmWL/5Im9LvcbU7KfiW//9rAs
 pTrgYd7L758afGoRMDs/1eWSI+IL1WfSRj8xFR8HwFgXfFbK7S9s2bgFP04VfUi7Cfei
 icfQ==
X-Gm-Message-State: AOAM5321oLbbPpFq9tJS5LZeaURMeNBr6mPkblZnEe6jBqTii1ZcCU+h
 3E5hcqblFnwy+ipJVR5BOjU=
X-Google-Smtp-Source: ABdhPJywQb6/ikR7MO4Iw1Y4FKE6Mj4/g+sg5oH2NUQrfDPj2FUFFI/J5INqaz3stG76S71YWUUnMg==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr350905wme.154.1589821411650; 
 Mon, 18 May 2020 10:03:31 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id s67sm275684wmf.3.2020.05.18.10.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 10:03:30 -0700 (PDT)
Date: Mon, 18 May 2020 17:03:29 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] tools: use HOSTCC/CPP to compile rombios code and
 helper
Message-ID: <20200518170329.vis2yzz5qcacqt64@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200518144400.16708-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518144400.16708-1-olaf@aepfle.de>
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 04:44:00PM +0200, Olaf Hering wrote:
> Use also HOSTCFLAGS for biossums while touching the code.
> 
> Spotted by inspecting build logfile.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

> ---
>  tools/firmware/rombios/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/firmware/rombios/Makefile b/tools/firmware/rombios/Makefile
> index 78237fd736..02abdb3038 100644
> --- a/tools/firmware/rombios/Makefile
> +++ b/tools/firmware/rombios/Makefile
> @@ -19,7 +19,7 @@ clean: subdirs-clean
>  distclean: clean
>  
>  BIOS-bochs-latest: rombios.c biossums 32bitgateway.c tcgbios.c
> -	gcc -DBX_SMP_PROCESSORS=1 -E -P $< > _rombios_.c
> +	$(CPP) -DBX_SMP_PROCESSORS=1 -P $< > _rombios_.c
>  	bcc -o rombios.s -C-c -D__i86__ -0 -S _rombios_.c
>  	sed -e 's/^\.text//' -e 's/^\.data//' rombios.s > _rombios_.s
>  	as86 _rombios_.s -b tmp.bin -u- -w- -g -0 -j -O -l rombios.txt
> @@ -29,6 +29,6 @@ BIOS-bochs-latest: rombios.c biossums 32bitgateway.c tcgbios.c
>  	rm -f _rombios_.s
>  
>  biossums: biossums.c
> -	gcc -o biossums biossums.c
> +	$(HOSTCC) $(HOSTCFLAGS) -o biossums biossums.c
>  
>  -include $(DEPS_INCLUDE)

