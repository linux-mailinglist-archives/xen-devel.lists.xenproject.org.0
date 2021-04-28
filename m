Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312A36E123
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 23:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119588.226129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbs1c-00020c-T8; Wed, 28 Apr 2021 21:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119588.226129; Wed, 28 Apr 2021 21:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbs1c-00020D-Q2; Wed, 28 Apr 2021 21:47:16 +0000
Received: by outflank-mailman (input) for mailman id 119588;
 Wed, 28 Apr 2021 21:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQXR=JZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lbs1b-000208-C5
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 21:47:15 +0000
Received: from mail-wm1-f47.google.com (unknown [209.85.128.47])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d98b096-9b14-4177-882b-4407b4fa9ec5;
 Wed, 28 Apr 2021 21:47:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so5453225wmn.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 14:47:14 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g11sm1415698wri.59.2021.04.28.14.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 14:47:13 -0700 (PDT)
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
X-Inumbo-ID: 3d98b096-9b14-4177-882b-4407b4fa9ec5
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HEMsuhb6RIOSWGDsdfDgT0wSbV+yIfaLeVOJdIJc/Gg=;
        b=orU6LhuB6qVmyOt8e23pLemBSolMyJKuu7NttcNrTy/NS5jWhDJkeFL2SgnOL9mp3W
         vfRfn48xKrFx4jjqzlZXabPHa8LdWoE2xnCm2Zo4daQADxn2pGZpSzkYKvrKcV7KForN
         I4QZeO5JNfC9X7NpC+lEbuSE62FWwRYUjw9IkkF86srSCtxeSYBFLQgiQIzb0iDjzbak
         edNn3XlIfr1ooZimLl2v5vsK2D/utBq8+TVW0OChU5N5JN9koSs6RZc13pLGeP2j9Lb1
         AYvMaG0mlR4TsHUu7WzQIIWg0M6irawIHBROyFSmueiM6m+o8ZdSXOg88CC8F1rSbibw
         2/oQ==
X-Gm-Message-State: AOAM530vUY2nIIxiBXLeQcuXzsHg99NUli0wVS70hBA1/FMncG9cbWmG
	1llfYWnBjJAI1X3YXMipO/U=
X-Google-Smtp-Source: ABdhPJwt4S3YZg9772iJOslM8XH6XCAOKnZw6qBWYfusg5VwBsDdt9QFtLftVjbgDbk5RPIbHth7jg==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr33474523wmc.138.1619646433741;
        Wed, 28 Apr 2021 14:47:13 -0700 (PDT)
Date: Wed, 28 Apr 2021 21:47:11 +0000
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
	Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
	Wei Liu <wei.liu2@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Hongyan Xia <hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Hongian Xia <hongyax@amazon.com>
Subject: Re: [PATCH RFCv2 12/15] xen/arm: add Persistent Map (PMAP)
 infrastructure
Message-ID: <20210428214711.7kujg337ja34jb7k@liuwe-devbox-debian-v2>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-13-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210425201318.15447-13-julien@xen.org>

On Sun, Apr 25, 2021 at 09:13:15PM +0100, Julien Grall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> The basic idea is like Persistent Kernel Map (PKMAP) in Linux. We
> pre-populate all the relevant page tables before the system is fully
> set up.
> 
> We will need it on Arm in order to rework the arm64 version of
> xenheap_setup_mappings() as we may need to use pages allocated from
> the boot allocator before they are effectively mapped.
> 
> This infrastructure is not lock-protected therefore can only be used
> before smpboot. After smpboot, map_domain_page() has to be used.
> 
> This is based on the x86 version [1] that was originally implemented
> by Wei Liu.
> 
> Take the opportunity to switch the parameter attr from unsigned to
> unsigned int.
> 
> [1] <e92da4ad6015b6089737fcccba3ec1d6424649a5.1588278317.git.hongyxia@amazon.com>
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> [julien: Adapted for Arm]
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> 
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> Cc: Hongian Xia <hongyax@amazon.com>
> 
> This is mostly a copy of the PMAP infrastructure currently discussed
> on x86. The only difference is how the page-tables are updated.
> 
> I think we want to consider to provide a common infrastructure. But
> I haven't done it yet to gather feedback on the overall series
> first.

+1. This infrastructure should be common code with arch hooks where
appropriate.

Wei.

