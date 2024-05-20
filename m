Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DB98C9DD6
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 15:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726096.1130349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92kF-0003oS-K2; Mon, 20 May 2024 13:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726096.1130349; Mon, 20 May 2024 13:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92kF-0003lv-HQ; Mon, 20 May 2024 13:08:03 +0000
Received: by outflank-mailman (input) for mailman id 726096;
 Mon, 20 May 2024 13:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRrK=MX=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s92kE-0003lp-6n
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 13:08:02 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbd9045f-16a9-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 15:08:01 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2451da9b4feso1263423fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 06:08:01 -0700 (PDT)
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
X-Inumbo-ID: fbd9045f-16a9-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716210479; x=1716815279; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TO5UrABCDtztqQoaLvBeUtfIOS9kDOaSnyrlFQpHDAA=;
        b=WYA5i8oBKVXkw09ZHOBDOoG84zb2Ho3m+dyielVY2ZMLofA3jTnLRwxi3ucxFSdYpF
         wMAuNztb5gAaPcf2tRFi+1eG/HGb+WTEMldFOX9uZDdE41xMsj+x9zNioW2sP0eiz3Jx
         tounpS0NV4rWJFuWEO6ETLGRPEmZ5h2HQwXF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716210479; x=1716815279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TO5UrABCDtztqQoaLvBeUtfIOS9kDOaSnyrlFQpHDAA=;
        b=OKI1As7DkgEtuvr9Pjdo/LPo6OUziglZ46uODt4qDWm/0i1ny39sjwRvZsSksC2jG/
         YdtfozunY9zqCw9dbowapjqZRdQMl1p0UYvw160p/AcTWfKSR03ZPe2EAYEmU8aEaJnI
         3DRytkMS/0Age2xOwkiHV0fzXz4bidYxfhjV65H88ah7A3SEIEQH6d5pf7rA5nnQdZqe
         5LLlITsqTvShg93RiOmHOz/eiUDXkkSXSOafV0DImOQ05tjcp9dTDT3a6OCQG9HscSkA
         6fwy+s8pRGRuuM/56sqzLTIcXq/LtrqdR1yDX1AGyMep8p3iudV5iifbLYFcm5izAepn
         njlw==
X-Gm-Message-State: AOJu0YyFAdQZJasoM7drh7Xw2wJKYP45KkqDKDOL22rg1nSsuV1kSVpr
	rN+BF4bgANCtClAgWIWsMidObcrHulcOSDmLXtqdcQ/y4w88H6/te9S3m5EJwENQJb4YfeMqKm0
	E1ovdXOEkGjxR81lLc5Hc/Odi8pfr3zBwwBciTA==
X-Google-Smtp-Source: AGHT+IF4niWJMdcwDp17C9EaQg3LWFhfY/G9LB9CWEpn7pjIgPCX7YnW5qUgA6jXHWduMcSTp7zhKQjODQ6vYhMdeaA=
X-Received: by 2002:a05:6870:7246:b0:241:98e4:5590 with SMTP id
 586e51a60fabf-24198e4a118mr35530792fac.5.1716210479677; Mon, 20 May 2024
 06:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240520082145.1571451-1-xin.wang2@amd.com>
In-Reply-To: <20240520082145.1571451-1-xin.wang2@amd.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 20 May 2024 14:07:48 +0100
Message-ID: <CA+zSX=bRO-GvH6pa9QAnHq9UBKHNx1d3jzd+-_FjTyXvADSJAw@mail.gmail.com>
Subject: Re: [PATCH] tools/golang: Add missing golang bindings for vlan
To: Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <rosbrookn@gmail.com>, 
	Anthony PERARD <anthony@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Leigh Brown <leigh@solinno.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2024 at 9:21=E2=80=AFAM Henry Wang <xin.wang2@amd.com> wrot=
e:
>
> It is noticed that commit:
> 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
> introduces a new "vlan" string field to libxl_device_nic. But the
> golang bindings are missing. Add it in this patch.
>
> Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_ni=
c")
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Acked-by: George Dunlap <george.dunlap@cloud.com>

