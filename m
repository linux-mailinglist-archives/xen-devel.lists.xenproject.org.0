Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCB7B0974
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 17:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609125.948010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWw0-00078G-73; Wed, 27 Sep 2023 15:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609125.948010; Wed, 27 Sep 2023 15:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWw0-000769-4O; Wed, 27 Sep 2023 15:58:44 +0000
Received: by outflank-mailman (input) for mailman id 609125;
 Wed, 27 Sep 2023 15:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7BWj=FL=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qlWvz-000761-1m
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 15:58:43 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba29ea24-5d4e-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 17:58:41 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32329d935d4so6385100f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Sep 2023 08:58:41 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j13-20020adfd20d000000b003232c2109cbsm7555172wrh.7.2023.09.27.08.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 08:58:39 -0700 (PDT)
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
X-Inumbo-ID: ba29ea24-5d4e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695830320; x=1696435120; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjjhkzh+nSri1VRDKkw1DrOsgSHLju6NOUp/L35SrdQ=;
        b=oxOKQU3xpm4uY6UJBotJKin+Ml0yMCjs9uckv87yHbCSq+/ApY/tFTS20Wk5O8JJiA
         vrv0uRp7ZW6bBZkJofKZge2BlHkGLj4Q/l5A+B9NBqWDY2zZmoLym5UAzrZ5lOu+L67w
         HM+m1Mtu8jdu67npnA27y8Vy09m+Dh/xF1DSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830320; x=1696435120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjjhkzh+nSri1VRDKkw1DrOsgSHLju6NOUp/L35SrdQ=;
        b=fZGhOPU4SeJYMp1XDeKmR9QarUwjXHtyH4m5B4HaHLGicZx5DbM0T71X3k01N3XhMd
         honB3AgAj/uCxFpGynTvg6XoJX2OTLX74YEKW6v2M8NUdA62bqyWq/o6QipdWmY4zF2H
         wUXQm5rWvtBnbIvN3bhkGmgJuEmfUhaXM7XYdcZir/WxVDRFEqNEquKid7y/G3nJSRUN
         04hN5lOhWBgNdzPBIUlp4c7j82sOvP3mt5Oy1Qo7Az9uBDnnuEXHoVUUSraYJxdEyn2f
         Z4aVsi0Gfiq1VG+L95lo9pYRNHPWa5qK2z7XLjW9Tsr2VEl2uOqlFZw+orfOkhdjfcj+
         Ow9w==
X-Gm-Message-State: AOJu0YyIESRnQ9eibGoTe+Jdbc5GNdKU5hvnkfdmYvkF+AX8qWlXXa6m
	fljMX/RxoagGFkJngVqu6zVuwA==
X-Google-Smtp-Source: AGHT+IGzQjQVBt3MY3twRw61jLcoHR40oTH5yKXmfeJ26Sm7183gxJRHv7lyxSSfRbTyAgw/etr1kg==
X-Received: by 2002:a5d:66c2:0:b0:31f:b0ba:f2ce with SMTP id k2-20020a5d66c2000000b0031fb0baf2cemr2418868wrw.9.1695830320311;
        Wed, 27 Sep 2023 08:58:40 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:58:39 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v2 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
Message-ID: <d8b23542-27ae-4435-bf9e-0dd96891b43e@perard>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
 <4e25395c844a312556303e3484a915e875e0e5a7.1695801813.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e25395c844a312556303e3484a915e875e0e5a7.1695801813.git.nicola.vetrini@bugseng.com>

On Wed, Sep 27, 2023 at 11:52:31AM +0200, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes from RFC:
> - Dropped unused/useless code
> - Revised the sed command
> - Revised the clean target
> 
> Changes in v2:
> - Added explanative comment to the makefile
> - printf instead of echo

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

