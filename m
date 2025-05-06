Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C5AAC611
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 15:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977239.1364286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIN3-0000Lj-CI; Tue, 06 May 2025 13:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977239.1364286; Tue, 06 May 2025 13:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCIN3-0000GL-7b; Tue, 06 May 2025 13:30:05 +0000
Received: by outflank-mailman (input) for mailman id 977239;
 Tue, 06 May 2025 13:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCIN2-0007l5-58
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 13:30:04 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37727125-2a7e-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 15:30:03 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso49665835e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 06:30:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae0cafsm13863913f8f.19.2025.05.06.06.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 06:30:02 -0700 (PDT)
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
X-Inumbo-ID: 37727125-2a7e-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746538203; x=1747143003; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONMJPfb5UP5y6Kl3++JQNjAP78w7eZw+RJt1c4Un/qk=;
        b=txYU5XAocljpTeV2yLA2BtbTWRKi3HEOmuTFu4PkVPpQwSq6ue372COZ/k9oJW0tY9
         DRn/xuydGsPUmel8ebPwWdT71i/R2kF+A3H4dwZshkLJ0sYBxZQNcKQ+VxjmV6+0o1li
         moHziYhNBaUngyI/+2oDNMqPv/rzKu7mQeIGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538203; x=1747143003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONMJPfb5UP5y6Kl3++JQNjAP78w7eZw+RJt1c4Un/qk=;
        b=dvydN6DKiWTSeh1SD4qaIpojQI5MlPVgpkrMynZxx+x+FkGRgG7ZSU3UI9T2Rv4Esf
         e8ciWa5rieQ0eIoUSW6nRfIkKee3cNWelT1SQGcVGC9+0VUS7Dhl1On7eFp2UTkzQn9Q
         CmO15syq2T5+wq/A87IIeYyu9Tflf+epYbSa9Pp3QQ+cxap2A3CCcNJx7133aoZZvkTG
         yTjkFv62GO9v/uvrPX7HIBAZzUe15b5Vblp2kNEmmegE1pxQB6/k1DxF6medsD+LQHCj
         5pj9MLJmDvqHff+yWNlN07uRotL7sGc12ymsL8cU3i+gmTOeYPzPoVrp7KQTyGEMwNb1
         ETtg==
X-Gm-Message-State: AOJu0YxbIy5lBWcHgir88oVFHvpG/d56ulcxFBTvnyrvixDJYgPwJVT6
	2cBHMrNTK14qz5mKwwmqxPDucZTOZptYHu9eaiMHKzKrbZb2nIiKLA+5+0nUJiU=
X-Gm-Gg: ASbGncs7OtOMh2X+i61wzEqAotrVM+htlM8SaDQ20qZ/MJv1VrivLZ9OrHM867OrGB3
	dEGDwCyyTugyEqJxBjITFVpkBHMM4at1V32Wt5FP5qPqQWMUz3z1yw9OaepzxrAxZglu37rf28/
	c6IAB+gJt1i3pHc5InIlJsSN3J1vzVVgYllyH1VXeOheoPyLh/1JOQWyKk0H8bToVzRWP/MPOu0
	oCbvozs02MdMg5dujap1zruxRGyyvG1C2GbOJBBrS5bx70WyLwjJldlzFeKhqYghIfDBZV8m2Wr
	9YNVI8mtDRul+HTBMmm7qZp/QRN/dzOq3U9cvk4f7FEhHA==
X-Google-Smtp-Source: AGHT+IHGZjU6QD78g4RF8L7+HVM0nBOkbPwm5f9mZ4OFfVKiMLGXF1dWjhkh0IJs10SK5sO51RHrFQ==
X-Received: by 2002:a05:600c:3b23:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-441c48aa2f7mr89030825e9.1.1746538202746;
        Tue, 06 May 2025 06:30:02 -0700 (PDT)
Date: Tue, 6 May 2025 15:30:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 01/11] vpci/header: Move emulating cap list logic into
 new function
Message-ID: <aBoO2dumV8Ss4RwB@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-2-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:18:53PM +0800, Jiqian Chen wrote:
> No functional changes.
> Follow-on changes will benifit from this.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

