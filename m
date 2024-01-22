Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC1A8365C8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 15:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669970.1042537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRvZ8-0004c4-2W; Mon, 22 Jan 2024 14:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669970.1042537; Mon, 22 Jan 2024 14:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRvZ7-0004Yp-VP; Mon, 22 Jan 2024 14:46:21 +0000
Received: by outflank-mailman (input) for mailman id 669970;
 Mon, 22 Jan 2024 14:46:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7P8=JA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rRvZ6-0004Yj-IM
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 14:46:20 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00e7e034-b935-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 15:46:19 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50f1c524010so2887871e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 06:46:19 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v67-20020a814846000000b005ff88cbbc93sm3258597ywa.111.2024.01.22.06.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 06:46:18 -0800 (PST)
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
X-Inumbo-ID: 00e7e034-b935-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705934779; x=1706539579; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AShAgfscyXkM4Dj61Z5qkB9oc20t5f3dM6fddpcYmL8=;
        b=BjPAa4CZ5mAISqxYkfvQR8l2pp2dgqTKlMbFumivV+N3P5+wVxAULMlER8zeiYyapC
         Wy/YEv9DhsIGym/l1WY3M6NvdFVBC6dJs/j7lpL0mQBV/B4FnLWhavRbQnW7TCVHIg90
         659r74AvzLmh2kDQtpcRN+uyf0ybuAYTk2G5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705934779; x=1706539579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AShAgfscyXkM4Dj61Z5qkB9oc20t5f3dM6fddpcYmL8=;
        b=QVOVDB6cgOq9chrHwIL/cKQbRzbD8NXBZLIYqrchARWmbKEsiox6ZpuvQhOG3Klb78
         xNtkAMqdanfC8U6U486ah95mgauu1iTTfCVDhLvQX1d3Q/W2URq9yniLlJVLMEzb2OND
         G3k5ZTTvcFMUApJ1s5HS5qD2P/+XNXmotBF/NPk794niPDmiWdyVEVUICalYoBb+EoFa
         ifC0t8Vc+uRa8g9zp8Y2H6NUQ2OPNbhqxRXNh0M/3cBa9UK9Bp3h1DHxwt/aGyiyLhDy
         feZu4DnRFBZGRufd2ZHJINCK4QlVpL9zmbM4ObbuQOKKWtwUFbizVKEZuQLwYmzlXHSj
         SNAA==
X-Gm-Message-State: AOJu0YyaNpT5TRbNNUjuNkj7C/zitvoG+a0KytUbEo3piEVeuPwq08pO
	wCehGgafBvSTEL2Iqw1Wwz8r0sxDMqmR+PgkJJmfcV4P9pB8F9DY9WUB3yTVj6s=
X-Google-Smtp-Source: AGHT+IFSSCnyaaGflfqIItqCbL/iZxAyVXZOqctvsXSu6KoOYtFeMlqLRu7HNLJNxlPm1DpPf/MrCQ==
X-Received: by 2002:a05:6512:3084:b0:50e:7a9e:5c76 with SMTP id z4-20020a056512308400b0050e7a9e5c76mr955424lfd.175.1705934779048;
        Mon, 22 Jan 2024 06:46:19 -0800 (PST)
Date: Mon, 22 Jan 2024 14:46:15 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] lib{fdt,elf}: move lib{fdt,elf}-temp.o and their deps
 to $(targets)
Message-ID: <30468fd2-df76-4d62-b5f5-ff25568c09a8@perard>
References: <20240122113955.45594-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122113955.45594-1-michal.orzel@amd.com>

On Mon, Jan 22, 2024 at 12:39:55PM +0100, Michal Orzel wrote:
> At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
> under the hood) results in a crash. This is due to a profiler trying to
> access data in the .init.* sections (libfdt for Arm and libelf for x86)
> that are stripped after boot. Normally, the build system compiles any
> *.init.o file without COV_FLAGS. However, these two libraries are
> handled differently as sections will be renamed to init after linking.
> 
> To override COV_FLAGS to empty for these libraries, lib{fdt,elf}.o were
> added to nocov-y. This worked until e321576f4047 ("xen/build: start using
> if_changed") that added lib{fdt,elf}-temp.o and their deps to extra-y.
> This way, even though these objects appear as prerequisites of
> lib{fdt,elf}.o and the settings should propagate to them, make can also
> build them as a prerequisite of __build, in which case COV_FLAGS would
> still have the unwanted flags. Fix it by switching to $(targets) instead.
> 
> Also, for libfdt, append libfdt.o to nocov-y only if CONFIG_OVERLAY_DTB
> is not set. Otherwise, there is no section renaming and we should be able
> to run the coverage.
> 
> Fixes: e321576f4047 ("xen/build: start using if_changed")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

