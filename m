Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9AF8BCA9F
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717384.1119533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ucZ-000393-Vq; Mon, 06 May 2024 09:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717384.1119533; Mon, 06 May 2024 09:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3ucZ-000370-Sy; Mon, 06 May 2024 09:26:55 +0000
Received: by outflank-mailman (input) for mailman id 717384;
 Mon, 06 May 2024 09:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3ucY-0002PT-Fl
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:26:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5f8b57d-0b8a-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 11:26:52 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso10873355e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:26:52 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c1c0300b004186f979543sm19269133wms.33.2024.05.06.02.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 02:26:52 -0700 (PDT)
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
X-Inumbo-ID: c5f8b57d-0b8a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714987612; x=1715592412; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wy4+P0aSKp9sb0zjzlVOE4/kxyRE9YvkU63k0Vlw5HU=;
        b=TAFm1C5dRlWvKaAMtMA5ekJPldWu0q73GpIK/M1xiBPxNiwqrT3cAJzQlne04hfVdC
         UGRdSxpNQWwzSL/TAtJRjXG1MvaBaHULT7JHLfcV1eoe4Z4ZeG2SR30KnPwu4+ahU8JJ
         MmRcB9XTtVHKWLhkpXj5pdHJEzpA3ivdJPWLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714987612; x=1715592412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy4+P0aSKp9sb0zjzlVOE4/kxyRE9YvkU63k0Vlw5HU=;
        b=Go7iBC4T7ZNr9OJ7+idJ5zXfhvuz1mhu9J8JHg6kvGec/jbzq85JwjtfHvGszSU4m4
         JtcEd6CL578vsF1iw7tTgtwVmwzxsTSUdNW4intIxcUI8KCQBXw0yO2/26yIAQg/afLu
         m88qoYNPqBfvnK11kK3DdW9qoSBh1MlS8d6WgosiqOxPOh0zP0kcpSOW19DE7L13aQiX
         1oTmOQ98CJR+VGyJBF/Z9lmrotLYYuLCWosnIY6cHsVPa/qt/3cGDAREaoscva2EL5B6
         t+uR9iHpQ7ogbp50eykcErBurO7yNinYZs1+KqLIaVzmBDwS53ZzK00U6J66NuKSDz7M
         UhHQ==
X-Gm-Message-State: AOJu0Yzo9h1q66xG+ZjtZl0BUqXYYWv2+4cgIH6rWHgSvJaubL55kkN3
	B7kLme1Dn9+Ll/2SNs703unVL0HkRoeu3q0IgruAySOpag8Du6Oxb/WdoBGLrPg=
X-Google-Smtp-Source: AGHT+IHtyKfYDz+jLI++pGxzapbKNhU18SZK1bty5s2bfrMu/GM+X/F053AkW8Ux0q9JwymolbOncw==
X-Received: by 2002:a05:600c:3554:b0:41b:6dbb:52f9 with SMTP id i20-20020a05600c355400b0041b6dbb52f9mr7523731wmq.39.1714987612384;
        Mon, 06 May 2024 02:26:52 -0700 (PDT)
Date: Mon, 6 May 2024 11:26:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 02/12] VT-d: tidy error handling of RMRR parsing
Message-ID: <ZjiiW7ZeZCIiMiFP@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <97577ebf-3871-47be-97c5-8164701be756@suse.com>
 <ZjifDsIeRseZD27n@macbook>
 <77e6c510-b5bd-4cb5-a29c-44bf0cf7a521@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77e6c510-b5bd-4cb5-a29c-44bf0cf7a521@suse.com>

On Mon, May 06, 2024 at 11:21:06AM +0200, Jan Beulich wrote:
> On 06.05.2024 11:12, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 11:14:02AM +0100, Jan Beulich wrote:
> >> It's acpi_parse_one_rmrr() where the allocation is coming from (by way
> >> of invoking acpi_parse_dev_scope()), or in add_one_user_rmrr()'s case
> >> allocation is even open-coded there, so freeing would better also happen
> >> there. Care needs to be taken to preserve acpi_parse_one_rmrr()'s
> >> ultimate return value.
> >>
> >> While fiddling with callers also move scope_devices_free() to .init and
> >> have it use XFREE() instead of open-coding it.
> >>
> >> In register_one_rmrr() also have the "ignore" path take the main
> >> function return path.
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> --- a/xen/drivers/passthrough/vtd/dmar.c
> >> +++ b/xen/drivers/passthrough/vtd/dmar.c
> >> @@ -82,14 +82,13 @@ static int __init acpi_register_rmrr_uni
> >>      return 0;
> >>  }
> >>  
> >> -static void scope_devices_free(struct dmar_scope *scope)
> >> +static void __init scope_devices_free(struct dmar_scope *scope)
> >>  {
> >>      if ( !scope )
> >>          return;
> >>  
> >>      scope->devices_cnt = 0;
> >> -    xfree(scope->devices);
> >> -    scope->devices = NULL;
> >> +    XFREE(scope->devices);
> >>  }
> >>  
> >>  static void __init disable_all_dmar_units(void)
> >> @@ -595,17 +594,13 @@ static int register_one_rmrr(struct acpi
> > 
> > register_one_rmrr() could also be made __init AFAICT? (even before
> > this patch)
> 
> Indeed, all the more when it calls acpi_register_rmrr_unit(), which is
> __init. With scope_devices_free() becoming __init here, it would seem
> quite logical to fold that adjustment right into here. I'll do so,
> unless you'd indicate that this would then invalidate your R-b.

Sure, feel free to fold here.

Thanks, Roger.

