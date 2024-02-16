Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700D58579E4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 11:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682097.1061141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rav6h-0006tg-AQ; Fri, 16 Feb 2024 10:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682097.1061141; Fri, 16 Feb 2024 10:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rav6h-0006rs-7R; Fri, 16 Feb 2024 10:06:11 +0000
Received: by outflank-mailman (input) for mailman id 682097;
 Fri, 16 Feb 2024 10:06:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvWc=JZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rav6f-0006rm-IR
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 10:06:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec0d1d1-ccb2-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 11:06:04 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso14351175e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 02:06:04 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k35-20020a05600c1ca300b00412393ddac2sm1882613wms.6.2024.02.16.02.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:06:03 -0800 (PST)
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
X-Inumbo-ID: fec0d1d1-ccb2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708077964; x=1708682764; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lWCxDqYfXRaxaQCwA9Hec1KR2+4tL8pkf9Q3DO8XS0=;
        b=jGmVv0NC1e8hnQEedjsvRfDP6vGqRQQjA3OM9F+jKbASvo5/D8Jwi/zlwQbnNTAibb
         SruFvwhpZx91RRKhCMQ+ZnBoVYRxVBohLOX0mLI1HH0sYAixMNdtRNAqjDOT1nncV/8R
         ZsOw5ZwheH10lYjVRXxXDH/8YX61SgKy/vZ0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708077964; x=1708682764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lWCxDqYfXRaxaQCwA9Hec1KR2+4tL8pkf9Q3DO8XS0=;
        b=LrS3M6poLQgUJDIxCY/xKr0P6hjYybh1BbHxxJwUsW5SVO8xiNXDJFZPlrcVjsYEVg
         ZhLoPlaD9K0ro2s239lUJ6fQqzcrCWr6icN2/mIWBkhVxdLO921YFzoKDF/kSIuQQSFq
         4DaakU0UGqH4x6skrsxgCry04QxU23gJsOnibLIxQkGUqldoovNdsBjwTYngcQyO8Jvb
         CqQhQjuboxfyoN8WlOowzF36l4SN30sxealn/5TbjhiZgqA6E+dqa+tsVhzudR3jJ8gn
         H6s5rAiYB/P3nfSL4GCu5BxH2damSEwIgd5QUafkF4uf27s8KKAiRKN9yoOlPFuh+1CB
         sEoA==
X-Gm-Message-State: AOJu0YxW2TGIylIYcMYJFJnggoz7PnCc2Bsw7Dsz2qVccAskOeUcjLuO
	J/G/mIfcFyqcBktX2MDzag6XYxOi8h5Z5yM9cnKAxANWJsQIHZLkXQGnGZxxnBw=
X-Google-Smtp-Source: AGHT+IGfjGvravXrHcsVPXEsF1dF66g6XrcCb1kO+o4Bd7jg1P6uX1/p8G982uR+h/tsU4504Ga8Zw==
X-Received: by 2002:a05:600c:310e:b0:411:f8e8:16dd with SMTP id g14-20020a05600c310e00b00411f8e816ddmr3272743wmo.0.1708077964201;
        Fri, 16 Feb 2024 02:06:04 -0800 (PST)
Date: Fri, 16 Feb 2024 10:06:03 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V3] libxl: Add "grant_usage" parameter for virtio disk
 devices
Message-ID: <657da391-0aab-4e34-8f50-7352b554936f@perard>
References: <20240215150644.2477378-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215150644.2477378-1-olekstysh@gmail.com>

On Thu, Feb 15, 2024 at 05:06:44PM +0200, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Allow administrators to control whether Xen grant mappings for
> the virtio disk devices should be used. By default (when new
> parameter is not specified), the existing behavior is retained
> (we enable grants if backend-domid != 0).
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> In addition to "libxl: arm: Add grant_usage parameter for virtio devices"
> https://github.com/xen-project/xen/commit/c14254065ff4826e34f714e1790eab5217368c38
> 
>  V2:
>   - clarify documentation to match the implementation
>   - apply a default value if "grant_usage" is missing the Xenstore
>     in libxl__disk_from_xenstore()
> 
>  V3:
>   - include autogenerated changes to tools/libs/util/libxlu_disk_l.c(h)
>   - remove debug log from libxl__disk_from_xenstore(),
>     correct coding style

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

