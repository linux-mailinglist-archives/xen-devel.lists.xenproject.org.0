Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2E84527D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 09:16:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674241.1049068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVSE7-0000HV-HZ; Thu, 01 Feb 2024 08:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674241.1049068; Thu, 01 Feb 2024 08:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVSE7-0000EW-EO; Thu, 01 Feb 2024 08:15:15 +0000
Received: by outflank-mailman (input) for mailman id 674241;
 Thu, 01 Feb 2024 08:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVSE5-0008Oo-Pi
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 08:15:13 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04cf22e6-c0da-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 09:15:11 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51124d43943so908980e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 00:15:12 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b0040e527602c8sm3658249wmo.9.2024.02.01.00.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 00:15:11 -0800 (PST)
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
X-Inumbo-ID: 04cf22e6-c0da-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706775311; x=1707380111; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ftZj8xWkxeuKAOmzAYbWpkD03g2lwYFka9yLaabGBYU=;
        b=fl2m96rzMgAtO6uVBnzWIazZuyEM4Mvjy0Smj8Irzbap8i3/caM+0FjUEeMRgoyCDW
         iduIKdw2FiyhEWuSbC570BF4Cx+547z3o6mb1UJBpWcg2i1pSSy3yGzaouU2dUrEC90t
         vwJ4kBC+Cn6zj+RG39PVFWXC3pPe8cgL6yMZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706775311; x=1707380111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftZj8xWkxeuKAOmzAYbWpkD03g2lwYFka9yLaabGBYU=;
        b=pC/idycX5XQewvJK0xOZ2HX2luKCIHsrAH/y/kHKh82ZAlrkkmvVk6qVlOgKXEABD5
         g7L/5rP0EKmC1YwQyv0DhiIUfdJeLiF8T0X5Ymx3/lPV5FYRSOBT6mQpWz+IYQiNMbAW
         kZPgYr5ykuY0hGN4EoJCdSqNB3JDygVKoxHUcxqQLwhL6By3bkOdWxg5Kd/nNx6M3b/2
         zLZx9Z6tRBytwupGWPBIYI5pxtyE8tHQ4Qbzgoc/sROrB9ESPUShgEhBczf7fAIz0piy
         2WLwEhjYujBfo0QU4sOItoXbhkoGsIV/+FkCc2tQwPmmWC2lxm4j/9KnG2Os2v8uKNsb
         GV3g==
X-Gm-Message-State: AOJu0YwmkdXlTTp5InqrYGXnr5qX29zKQeh/enKQ5+iyluTnBWsuP2Px
	XkTVaUIi3xCUHzSmeDT3RY5mYbCuUEwlViADnZbJL05yec0nUts8ESiQaREUabAjPiI4iL40NrJ
	S
X-Google-Smtp-Source: AGHT+IE8gLuXy+MPg1izu/6bIhKWak2wRqZet0KZ2tIQTi7ixhztfq33TeOjjIOuHvBuVum5CAKS/Q==
X-Received: by 2002:ac2:5fcb:0:b0:511:8a1:4e08 with SMTP id q11-20020ac25fcb000000b0051108a14e08mr1097492lfg.9.1706775311520;
        Thu, 01 Feb 2024 00:15:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU72vY78WMM5Oc05nOMgQHKUahgsw8cAJB74JwC997R/ve+rpdCHw2Iuue/6RSs2TuwxkFyU6X3WUykkvh4w0g/5hUjkUAnJDSwRTmwim84+je9wcTm
Date: Thu, 1 Feb 2024 09:15:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] shim: avoid building of vendor IOMMU code
Message-ID: <ZbtTDgXFdaLx6kgx@macbook>
References: <062053aa-455e-43d6-bc11-e25dc8052878@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <062053aa-455e-43d6-bc11-e25dc8052878@suse.com>

On Thu, Feb 01, 2024 at 08:39:31AM +0100, Jan Beulich wrote:
> There's no use for IOMMU code in the shim. Disable at least the vendor-
> specific code, until eventually IOMMU code can be disabled altogether.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

That was easier than I expected :).

Thanks, Roger.

