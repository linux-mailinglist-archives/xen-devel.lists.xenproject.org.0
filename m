Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8E979C2B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799252.1209179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Na-0005ho-NI; Mon, 16 Sep 2024 07:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799252.1209179; Mon, 16 Sep 2024 07:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Na-0005fe-JU; Mon, 16 Sep 2024 07:42:38 +0000
Received: by outflank-mailman (input) for mailman id 799252;
 Mon, 16 Sep 2024 07:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H51U=QO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sq6NZ-0005fY-Cw
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:42:37 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3da42e29-73ff-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 09:42:36 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42cbe624c59so23026915e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 00:42:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b8b5asm68469935e9.7.2024.09.16.00.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 00:42:34 -0700 (PDT)
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
X-Inumbo-ID: 3da42e29-73ff-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726472555; x=1727077355; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UyahHg9GI0CF/P0AOI3nS5YJZ5Cu0KHCdf0TIljmiq0=;
        b=NdBzV4I5QZElHspKTT65gkb1q/8vrEl4yDclsmGhWARvgd2XlUupkOKVlypY1vOsZN
         d2herZeDoR9LQkxHhCMBcpGaUjZ/c0vEVSiBHpbtymsvWIKq9E8DC+LoId6pPRyZVLfa
         foI/DorBanV3WmfUG1Opo/tZDQHauqRbTKXII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726472555; x=1727077355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyahHg9GI0CF/P0AOI3nS5YJZ5Cu0KHCdf0TIljmiq0=;
        b=GA5k9R090DaALH3V7HLPkzE6AnApOWKtrQmBGX1hytY/Kp+KgDlloa2iYwhi2Kl6hc
         E+RlzezxivjbR5dP5UdQjICv0vVn8bSiwM20u8sn9vrujL533iOLB3SMsClsd3QzwpJB
         2UndMDFsagcWVIlG9qbkXo86Lt1jDMLhPtRn6bnQr6+Fceic9diXnvH3ZpRbgeQXL8FA
         hIBCcKWBqxmTA/0OdGG3T36FFVWKh6SNxpiWGf0Sd3anTEyFF4/Zb6Z5zNUrWWc2/xrH
         ZLXi4A3uw36EoPtlxLrIkIXJN7j0XCaAwAutkVZ7gHIh0ANf5se6adamU8cZVr+w7BSA
         sQEg==
X-Gm-Message-State: AOJu0Yzf6L6DnZhueMFQwhjXZmXaSGNlgysu6/iUinzsW2zkr+BqPlOy
	oEmk1dixs+/ZzsgZLuQtX8AdF/HhGJuGF9PsciSb1IiI5p0bsik2C1UDtqftn/E=
X-Google-Smtp-Source: AGHT+IF541LS+LPb0mSxDGifxoPU3RrcWESZytWIGGnCx1RyNRZqJSwxrTeRRLSs0C48SCY6HqbH7g==
X-Received: by 2002:a05:600c:468a:b0:42c:baf9:beed with SMTP id 5b1f17b1804b1-42d964e2705mr51404535e9.27.1726472554741;
        Mon, 16 Sep 2024 00:42:34 -0700 (PDT)
Date: Mon, 16 Sep 2024 09:42:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] x86/hvm: make stdvga support optional
Message-ID: <ZufhafDwU-jgYusv@macbook.local>
References: <20240912085709.858052-1-Sergiy_Kibrik@epam.com>
 <ZuKxEVsbV0MqLrtb@macbook.local>
 <0f256ef4-2059-4068-a38d-1293efbb35ca@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f256ef4-2059-4068-a38d-1293efbb35ca@epam.com>

On Mon, Sep 16, 2024 at 09:37:16AM +0300, Sergiy Kibrik wrote:
> 12.09.24 12:14, Roger Pau Monné:
> > Shouldn't Xen report an error if a user attempts to create a domain
> > with X86_EMU_VGA set in emulation_flags, but stdvga has been built
> > time disabled?
> 
> I'm afraid this can accidentally render the system unbootable, because it
> looks like toolstack always sets X86_EMU_VGA flag.

Not for PV or PVH guests.  It won't render the system unbootable, it
would just leave it unable to create HVM guests.  dom0 however, and PV
or PVH guests don't use the X86_EMU_VGA flag.

As pointed out by Jan, we need slightly better integration with the
toolstack.  IMO if we want to pursue this route we need a way for Xen
to advertise which X86_EMU_* are supported at least.

Thanks, Roger.

