Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB747CA621
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617460.960058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLH8-0007eu-Fd; Mon, 16 Oct 2023 10:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617460.960058; Mon, 16 Oct 2023 10:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLH8-0007cz-CO; Mon, 16 Oct 2023 10:56:42 +0000
Received: by outflank-mailman (input) for mailman id 617460;
 Mon, 16 Oct 2023 10:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QGmD=F6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qsLH7-0005m8-90
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:56:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af9e93f8-6c12-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 12:56:40 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso705450966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 03:56:40 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e17-20020a170906845100b009a168ab6ee2sm3786409ejy.164.2023.10.16.03.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 03:56:40 -0700 (PDT)
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
X-Inumbo-ID: af9e93f8-6c12-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697453800; x=1698058600; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wkwYrOqIySaX1Yg4G7Hs4iWLV9buCx2iOWlZLWIW4gg=;
        b=R5D0qdclf3+DxTBMkGGeZJfOWfjRJdBQge7Yd3CFXOGS545yrzWQhdeBCG7I9P6eHP
         XZCw90VARrl3QYTHLfAvuIOhCisOiaXazQM71RVne7JtzFiCMKexRgxFXdEOYEaxGNPZ
         RbGAhJ/jcAx+uHDM5kBPB5GminKgFsK1KTa1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453800; x=1698058600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkwYrOqIySaX1Yg4G7Hs4iWLV9buCx2iOWlZLWIW4gg=;
        b=IIQj9O7gBNrntGHwmxh8aCgaLmkvKAjAAvGxiFZsjOIOTGbhjagzjKVmxald9hwkJ5
         aD9E0mEJAuALH5Bu8F3c5FHoPuFekK/32VOkuC4/MtakNlZAccbDP6jzU/VIYgCF8Oon
         ffEo+296V/QKGMF4P269Jze1Bdou4famWM7VIb5Nhrpfeak2hpAaymfEKlA7MxoQuOG/
         /vySpG5082zEyB62NqqpST8Vk4evVPiPavsNi3E6xOl1q8nCVFYr0UTZaEg4MG+GhCZS
         MfAcGlklQNTy3saCHxIdOMSzn/T9wLGBO+k39DYi/B5WITL+yo/HyTFg/Q81LJAehOJu
         kmKA==
X-Gm-Message-State: AOJu0YzcN6l8zmNgTjR6zJmAoVEFnAbBmu7ynaiursSpwoBJvadRn0EN
	LneTeAmWlq2iQT4MIgRGhggsE31QrxeceC0KYxk=
X-Google-Smtp-Source: AGHT+IEJeSb1mwUoF2yKPeKCVySXddzaEu2fTkKc5rG7c3IyiAmE2gsLV5S58IGUDOUwJmcLof1RCw==
X-Received: by 2002:a17:907:c13:b0:9c0:2897:1588 with SMTP id ga19-20020a1709070c1300b009c028971588mr3934785ejc.17.1697453800385;
        Mon, 16 Oct 2023 03:56:40 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:56:39 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	Anthony Perard <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiodakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH for-4.18 5/5] xenalyze: Reduce warnings about leaving a
 vcpu in INIT
Message-ID: <0d2d35ca-b07e-4ca6-bf26-ad47007ad05b@perard>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
 <20231009125137.1329146-6-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009125137.1329146-6-george.dunlap@cloud.com>

On Mon, Oct 09, 2023 at 01:51:37PM +0100, George Dunlap wrote:
> We warn when we see data for a vcpu moving into a non-RUNNING state,
> just so that people know why we're ignoring it.  On full traces, this
> happens only once.  However, if the trace was limited to a subset of
> pcpus, then this will happen every time the domain in question is
> woken on that pcpu.
> 
> Add a 'delayed_init' flag to the vcpu struct to indicate when a vcpu
> has experienced a delayed init.  Print a warning message once when
> entering the state, and once when leaving it.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

