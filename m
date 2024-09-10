Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B2972A8B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 09:22:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795029.1204112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snvD1-0006X8-G6; Tue, 10 Sep 2024 07:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795029.1204112; Tue, 10 Sep 2024 07:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snvD1-0006Uv-Cf; Tue, 10 Sep 2024 07:22:43 +0000
Received: by outflank-mailman (input) for mailman id 795029;
 Tue, 10 Sep 2024 07:22:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snvD0-0006Up-Eh
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 07:22:42 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77042bbb-6f45-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 09:22:41 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so318889366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 00:22:41 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce9277sm447915066b.149.2024.09.10.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 00:22:39 -0700 (PDT)
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
X-Inumbo-ID: 77042bbb-6f45-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725952961; x=1726557761; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2XzcGJ9CHpUVmI2Qjvu0h7RfZYDHRIyC3QcUD62zzQ=;
        b=a4U+i4di8QLVXc2WMIvTtST98nmWCIhz47TpyR0eRItNuyDMQvbbX179MLgwlASmD6
         XoHiVH+Tvo/ddJwwnivmWNO3/4XCBWq3oRKwphp22lm9Wq8fJK3Z1Y4BnKKwz4zASlmx
         YTwugH5rBEbpDcIa6q2zwH1gHzNTX7eKfyJOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725952961; x=1726557761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2XzcGJ9CHpUVmI2Qjvu0h7RfZYDHRIyC3QcUD62zzQ=;
        b=tnd/C820pWZlJoAafyI/vfM/e6hj7M3LxDw50oh+mbN9BOagcWIHUu9eW7PsWeYbdb
         wS7M2Qk5i2wN3Vh7fJnPGm/Q3qcbMBygtaS0Yq7F33IWXurDRCEp8F+y7gpSlnTuy6O7
         URBdaW29k02s9m0g7TZH9wgIoui30nNBDTYzXMzqiSnkB6NHWsiXtHagvXVAWQlUf7Xd
         +ao7Ulbm5ns+CaqBm0k/54+5MSo9B1bEYetl5OEf8Juox/Ta8Z8Xu61BVxWkWy36Er3n
         wGSQ2usQ2OLb5NHedTWOcyMq/6yOEEWjvWD1nIC8BURM/kqyPqRz882qx7Mu+4tqvFrK
         bGaA==
X-Forwarded-Encrypted: i=1; AJvYcCVpUGrCX1uEvp6gJBJokR0QygpN6iuzepxmQK05BncJV/H3dQ3N2+C6dSrQnr6xff8Il91Ta4H4Gts=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBE2gzrHTtalLNcSva/Io0vgrAatAN1xoFFfAlwqbMJxwK2Ib1
	G0c9lk+MLpvV4jthDDK5TUOXUWIqKV1sHosHFOBQY8ts/M6k1BHFgHbo/CbnTNQ=
X-Google-Smtp-Source: AGHT+IEguAdmxCBaR1QB8kCKr4wvM2lfEhrwmL0iuSI4thRN/LxomXCTbP9/stpoAL4vqJLfL4K0dw==
X-Received: by 2002:a17:907:3a96:b0:a8b:154b:7649 with SMTP id a640c23a62f3a-a8b154b790dmr817815766b.15.1725952959944;
        Tue, 10 Sep 2024 00:22:39 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:22:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
	Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
	xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>,
	Arthur Borsboom <arthurborsboom@gmail.com>, stable@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
Message-ID: <Zt_zvt3VXwim_DwS@macbook.local>
References: <20240910020919.5757-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910020919.5757-1-jandryuk@gmail.com>

On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
> 
> Probing xen-fbfront faults in video_is_primary_device().  The passed-in
> struct device is NULL since xen-fbfront doesn't assign it and the
> memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
> 
> This was exposed by the conversion of fb_is_primary_device() to
> video_is_primary_device() which dropped a NULL check for struct device.
> 
> Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video helpers")
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=LkXWeiSiTKsDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
> Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> CC: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> The other option would be to re-instate the NULL check in
> video_is_primary_device()

I do think this is needed, or at least an explanation.  The commit
message in f178e96de7f0 doesn't mention anything about
video_is_primary_device() not allowing being passed a NULL device
(like it was possible with fb_is_primary_device()).

Otherwise callers of video_is_primary_device() would need to be
adjusted to check for device != NULL.

Thanks, Roger.

