Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA1811997
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654120.1020818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSC2-00063v-Io; Wed, 13 Dec 2023 16:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654120.1020818; Wed, 13 Dec 2023 16:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSC2-00060c-Fh; Wed, 13 Dec 2023 16:34:42 +0000
Received: by outflank-mailman (input) for mailman id 654120;
 Wed, 13 Dec 2023 16:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CjQj=HY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rDSC1-00060W-Vz
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:34:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82e6ff0b-99d5-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 17:34:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso73114585e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 08:34:40 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b0040b2a52ecaasm23231138wms.2.2023.12.13.08.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:34:39 -0800 (PST)
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
X-Inumbo-ID: 82e6ff0b-99d5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702485279; x=1703090079; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nj0Q83XvuXxLhMhY7PSsyG+0vOtzeakcpdULBF6l2zw=;
        b=D4fwBVf8gApelpcssReXJDrdnF1x7qYTajh3REOoGuRfY62xGhD1ZFiiVLnrMCasjU
         7bzJWor/5OCobYO1DJXVol+i7OElb0vJQzyitpCErv67yavnm11Q3YXxQv9xm8hmkWOD
         s6wXZQMaS+lpyhJgmTRVbct3IflBpidy0ZEgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485279; x=1703090079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nj0Q83XvuXxLhMhY7PSsyG+0vOtzeakcpdULBF6l2zw=;
        b=CjOqxu8v82poXzzBp2muFOTJMhd0L4DLXd1Nm55PELHA/SDLXx5TG1EytfbCViw51Q
         fQCTk2Q2yIGd8QXzgRK6d9UdCrxB+8sF9vrKgJ3nmGwafSuyOm3ibC8Zdp+i0luxyay/
         qtfiWwsAPfCibSMVFy+dIUfDMa9qawCIEgByQ9ZICJv7nulGjLYRSj193WEh3R03wahh
         7rfPGEukjofU53LYFdkAJHOSi5dk+BoXp/HRPMM3o/J2uaxHT/u0B1jkqdK6XUkFfmqw
         yfkbiWdGjtUhkzge0rBL+XJdzDjtHnrFM/CIajk/yhpbIxvuBQwASd+vYm/wcADSzMtY
         gS9w==
X-Gm-Message-State: AOJu0Yxl8HrGTZOyarjydFBbE+NQbcVhoDnsiHtKLRbwbf8vzRkUIgS6
	j5buvugUkhsxvHb7ohibV1SLHA==
X-Google-Smtp-Source: AGHT+IEEt+q/vmnkJM779zjwUKHjBe1K7aW3P4liMP8s+LDKjooSTJITTy8f64WlLlSuQTZywhJSlA==
X-Received: by 2002:a05:600c:3793:b0:40c:17cb:4558 with SMTP id o19-20020a05600c379300b0040c17cb4558mr4410143wmr.109.1702485279364;
        Wed, 13 Dec 2023 08:34:39 -0800 (PST)
Date: Wed, 13 Dec 2023 16:34:38 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 0/3] Set CONFIG_X86_GENERIC=y for i386 kernel
 build
Message-ID: <53e3c1a3-f605-4930-97bd-f812a6eb272e@perard>
References: <20231208160226.14739-1-anthony.perard@citrix.com>
 <ZXg9PCXWaAcBtLEo@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXg9PCXWaAcBtLEo@macbook>

On Tue, Dec 12, 2023 at 12:00:12PM +0100, Roger Pau Monné wrote:
> On Fri, Dec 08, 2023 at 04:02:23PM +0000, Anthony PERARD wrote:
> > CONFIG_X86_GENERIC=y and fixes around arch specific config values.
> > 
> > Thanks,
> > 
> > Anthony PERARD (3):
> >   create_build_jobs: Set reset pvops_kconfig_overrides
> >   create_build_jobs: Enable X86_GENERIC for i386 kernel pvops jobs.
> >   ts-kernel-build: Remove use of $XEN_TARGET_ARCH
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I would however request that if possible you expand a bit the
> description on patch 2 with the additional information provided by
> Juergen.

Pushed.

Thanks,

-- 
Anthony PERARD

