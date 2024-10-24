Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E599AEC13
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 18:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825501.1239729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40ih-0007FH-Et; Thu, 24 Oct 2024 16:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825501.1239729; Thu, 24 Oct 2024 16:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t40ih-0007Cv-Be; Thu, 24 Oct 2024 16:29:55 +0000
Received: by outflank-mailman (input) for mailman id 825501;
 Thu, 24 Oct 2024 16:29:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFxE=RU=redhat.com=fmartine@srs-se1.protection.inumbo.net>)
 id 1t40ig-0007Cp-CX
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 16:29:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31de9dec-9225-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 18:29:53 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-rDSr2h8YMselVBO7YedLNA-1; Thu, 24 Oct 2024 12:29:50 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-431604a3b47so8192325e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 09:29:50 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186c1e911sm50457715e9.45.2024.10.24.09.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 09:29:48 -0700 (PDT)
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
X-Inumbo-ID: 31de9dec-9225-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729787391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=;
	b=fdGRwmWsqj+lueErmglc1O03FFyhlr7+9pEdARz3JBGWrD4TSCEIh3blrr6F2eMu+UWGQT
	uBNPQmfBsE2nkHNLJJD2W+1nhZsw1pNIaVohT2YFi7dYo7Fr78sTVT7Rx+3SxiYF2Z/kJK
	E2EIcadfe7Ubo1M0WucEfEqaeG3vcDA=
X-MC-Unique: rDSr2h8YMselVBO7YedLNA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787389; x=1730392189;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZXCwg6hYJwlV3dQoijUPbMEIAM4RESJSpWVfasu2GA=;
        b=IbEIm/wSThKtTrajGHI5pl7r//JJ8gMhRHNdvGLyDpKw0BBHh/qRpbrnZhm7OFSCuB
         SG+s/cRn0EdvLesLap0G5Sox4hG0MvbL+GwrsVRI0Ia4KslxcxFIEVmWRw84pitBfSE+
         10jir5yRoQGpfdu3HXheU2xyemSDxIwdU0PZLaU6KVnwhGRGpJ9DWCof//jF+I3dk8I1
         7vBG3rIL4v8G7759h6ysl1QH2UpyvOvemKl8K1bErYR0B4MeljebCH77pvCVDEK2TI3J
         VZrDOBHvfzDlsPcD2Iimm6kD5A5o9z6ctcF02Gkso6NF5Jo9FAzSRVwxxJ+YsNUf/XaY
         diXg==
X-Forwarded-Encrypted: i=1; AJvYcCUucrrh2bVr0ixEG15+jMVnm6okx23j3/BSR7iMnmwoPBgd+Gfr5o/v3uIt+1Mr948oWetM00yoQnk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywfb0mYbURoRz2N09+2BMRJV/gF4qbh2qNlqb8GbS1Wl3pwbDfJ
	qOuw3j4pnX5K/qHrdnFttCZVlSj0offD6AN2BSkP6oJWiDlD6S4byjbp/vFYlNOGvEWrumIWIEs
	/hHPPjNRmRYYmyzugNJVpFlbo2VbeHjUso8Gy12iyzxJtS47ZPPrEXNCZ9/bXQ6H9
X-Received: by 2002:a05:600c:1e16:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-4318c6f505cmr23112415e9.19.1729787389134;
        Thu, 24 Oct 2024 09:29:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET7dTcaOAuam5O1YOxfn6XKm0SifRdkj3JgT8AA6xwQNV6mNJK26LyEtPp9s4XkYUWZXGjDQ==
X-Received: by 2002:a05:600c:1e16:b0:431:561b:b32a with SMTP id 5b1f17b1804b1-4318c6f505cmr23112135e9.19.1729787388661;
        Thu, 24 Oct 2024 09:29:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, David Airlie <airlied@gmail.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Simon Ser
 <contact@emersion.fr>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and
 all drivers
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
References: <20241024162240.2398664-1-jani.nikula@intel.com>
 <20241024162240.2398664-2-jani.nikula@intel.com>
Date: Thu, 24 Oct 2024 18:29:47 +0200
Message-ID: <875xph1n2c.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Jani Nikula <jani.nikula@intel.com> writes:

Hello Jani,

> We stopped using the driver initialized date in commit 7fb8af6798e8
> ("drm: deprecate driver date") and (eventually) started returning "0"
> for drm_version ioctl instead.
>
> Finish the job, and remove the unused date member from struct
> drm_driver, its initialization from drivers, along with the common
> DRIVER_DATE macros.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


