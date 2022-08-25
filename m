Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4A5A0EF9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 13:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393313.632176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAyt-0001D5-Rx; Thu, 25 Aug 2022 11:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393313.632176; Thu, 25 Aug 2022 11:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRAyt-0001B9-Ot; Thu, 25 Aug 2022 11:25:03 +0000
Received: by outflank-mailman (input) for mailman id 393313;
 Thu, 25 Aug 2022 11:25:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azg/=Y5=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oRAys-00017o-Dc
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 11:25:02 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e59b86a-2468-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 13:25:01 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id 142so318287pfu.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Aug 2022 04:25:00 -0700 (PDT)
Received: from leoy-huanghe
 (ec2-54-176-161-147.us-west-1.compute.amazonaws.com. [54.176.161.147])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a63e811000000b00429ffc18e5csm12606291pgh.59.2022.08.25.04.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 04:24:58 -0700 (PDT)
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
X-Inumbo-ID: 8e59b86a-2468-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=+i6O62x+X+PNyCsytiy4KbtqPpRQcPQh69I2f6GYTeo=;
        b=Cs/11/vTKdD/X6bmnN5OIgEfyihzp7TZbfnNb9L/tJbLDMF3qHfz81z0LLEGNGvPrq
         wimSyuaWOzd4sEBomBf0gCfNnjWLoGzDg+EAbZsLAOCGhAgOXealBaJXb89F2rZQhSEU
         in8nsgsFsm0DxXqnIlGiAmIl3h3ekGtW+Kz7E/V4Yw+eM015WVth56rzpV9cAAe2WZrw
         //AlvfJHBFF69RL4rcmvrt0q6NTYdtbzf74uuAxsMWME40a/xcn6uhMcn6CSyvwuVJLe
         leJmxnzX4epL5+AcpM3qXJ3LgXXZaT/XZDLf5ufImB1KPnFaW5ZQZP+f/HU9TyGuT90o
         Sfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=+i6O62x+X+PNyCsytiy4KbtqPpRQcPQh69I2f6GYTeo=;
        b=oY61OuxLop20cyq3RR0VBJyO+ehJWaf1d9h/xbIb9SKEMH5v25HDg6vn61u/1jNYz4
         Ev3QRAWrOwkC5zhfopju4cVZe2g8WkMmxvZpSTEvVOuWC2b15xtUynwT0G5dUwTDZQfL
         EG3s2n0potos7ZcjlXUURBvQ8kG0lRbTNyiJZNdL0WQxttr+m+8kP5XZNv4rPTdIbjqW
         EOoM99mK75j6ol8PDmoXZXq/34uF27Dds+fusWcPQtFHykEJKTR1WVMy/wKZ25OF6+90
         zsrnNGK7R/cex+8yusilyLEeLQ9pWHKMJ95tq6bTnZLA0u72HfYtWiSROVhah0sypxVv
         i81A==
X-Gm-Message-State: ACgBeo3mzV9lDh059GQGxJWrx4yZHJ8ooplcbfM0gXN56sSbJCk4XQZS
	YUnM+cH5SyG8062oHAOxcjv0vQ==
X-Google-Smtp-Source: AA6agR4g/zBuDcyR8N+sSt/wb+FpIVe8DzFAPplbgic7m0KMrXY3F+lPmTC8wl6tYJCClGOYuGxYWw==
X-Received: by 2002:a63:1853:0:b0:41d:70c0:978e with SMTP id 19-20020a631853000000b0041d70c0978emr2994200pgy.32.1661426699459;
        Thu, 25 Aug 2022 04:24:59 -0700 (PDT)
Date: Thu, 25 Aug 2022 19:24:52 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <YwdcBFmCQ4pU1kDi@leoy-huanghe>
References: <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
 <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org>
 <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>

Hi Julien,

On Thu, Aug 25, 2022 at 10:07:18AM +0100, Julien Grall wrote:

[...]

> > In other words, let's assume the Dom0 kernel panic and its secondary
> > kernel is launched by kexec, is it necessarily for the secondary
> > kernel to reuse the primary kernel's RD pending page?
> 
> No.

If the answer is no, then I think it's feasible to pass the same ACPI
table or DT binding for virtual GICv3 from primary kernel to secondary
kernel, then the second kernel can initialize the VGIC and allocate a
new RD tables (and trap to Xen in EL2 to handle the new allocated RD
tables).  How about you think for this?

Thanks a lot for quick response.

Leo

