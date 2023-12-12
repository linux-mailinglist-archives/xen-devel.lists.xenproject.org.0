Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E480B80E992
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652939.1019120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0Up-0003Ln-F8; Tue, 12 Dec 2023 11:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652939.1019120; Tue, 12 Dec 2023 11:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0Up-0003JY-C8; Tue, 12 Dec 2023 11:00:15 +0000
Received: by outflank-mailman (input) for mailman id 652939;
 Tue, 12 Dec 2023 11:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzYH=HX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rD0Uo-0003JQ-Ii
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:00:14 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0182dde-98dd-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 12:00:13 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c46d6784eso18999465e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 03:00:13 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d5544000000b003333eadd206sm1043374wrw.27.2023.12.12.03.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 03:00:12 -0800 (PST)
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
X-Inumbo-ID: a0182dde-98dd-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702378813; x=1702983613; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N8MXrN+Cn3FzoXjyL/48GevHWtWaMfTYaAmqLcWF++M=;
        b=W9xJVjYd1O3xPVTgIYb80zngrvbBfokUiZQbHr/4b6y6ApU/dR0Bv3NaMd95HodzaC
         j2r6d0MYTErGYw/5Vcr42zW6rVX/NcuE+RhxAZevMULbycICmnNNLx5fe6xM1VVWnEjo
         HfAJF1wjr2Q/zAmqls0+YmoyHXFqYrid3TfVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702378813; x=1702983613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8MXrN+Cn3FzoXjyL/48GevHWtWaMfTYaAmqLcWF++M=;
        b=FKvdFB6Xtfcq6htzbS413MV44zaALzaTUgAoV30bGgKALTEhVWYAHmnPi+pElfp+W4
         +suyKVQn9YqGH/JHmyz3O3Pyeu1wvRX0YClAsHEyZxfsEXFamANNu7YqqQbCrYYHdb1/
         XLG+lhj3BQV7ZOKbtELFnrMOIv0DW4sD51HWIOw05dcmEcmsolGanBCQbi6VFcRnM6aE
         gp0FJDjGyvkTTxxFfaftyNrCqWR8TjbYMkvqX7PtKT5GV81lmdNlXoTnoKgy54iCxjTo
         ZqHoCCsh2YqG2NWe8OgyJwV8zm3hVSjLFUnAdvZATJ5nBR5/q5+30vNram0mt4CsZn3T
         rgWg==
X-Gm-Message-State: AOJu0YyUwtZ/ITAFDY+sQhUFKWzT3vlgoHRTT86p9pyr5J8mxAW0cQJG
	sx1vHJEVl9hgXLULsfx5GwoIQxfAb+mdNyg1WRs=
X-Google-Smtp-Source: AGHT+IG8roRDsBSl1Eg9ucnCVtZYhmkGFdewA2j57Hk7rAS0Hd8P+LcMU9szZSd1CZuKHbBWmYQrbw==
X-Received: by 2002:a05:600c:30d2:b0:40c:4378:f114 with SMTP id h18-20020a05600c30d200b0040c4378f114mr1925319wmn.177.1702378813111;
        Tue, 12 Dec 2023 03:00:13 -0800 (PST)
Date: Tue, 12 Dec 2023 12:00:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 0/3] Set CONFIG_X86_GENERIC=y for i386 kernel
 build
Message-ID: <ZXg9PCXWaAcBtLEo@macbook>
References: <20231208160226.14739-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208160226.14739-1-anthony.perard@citrix.com>

On Fri, Dec 08, 2023 at 04:02:23PM +0000, Anthony PERARD wrote:
> CONFIG_X86_GENERIC=y and fixes around arch specific config values.
> 
> Thanks,
> 
> Anthony PERARD (3):
>   create_build_jobs: Set reset pvops_kconfig_overrides
>   create_build_jobs: Enable X86_GENERIC for i386 kernel pvops jobs.
>   ts-kernel-build: Remove use of $XEN_TARGET_ARCH

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I would however request that if possible you expand a bit the
description on patch 2 with the additional information provided by
Juergen.

Thanks, Roger.

