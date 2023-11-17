Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61927EEFE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 11:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635024.990718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vsb-0002Ge-MM; Fri, 17 Nov 2023 10:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635024.990718; Fri, 17 Nov 2023 10:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vsb-0002Dt-JN; Fri, 17 Nov 2023 10:15:17 +0000
Received: by outflank-mailman (input) for mailman id 635024;
 Fri, 17 Nov 2023 10:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3vsa-0002Dn-BR
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 10:15:16 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3386e5b1-8532-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 11:15:15 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c50906f941so25137341fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 02:15:15 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b003fe61c33df5sm6686487wms.3.2023.11.17.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 02:15:14 -0800 (PST)
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
X-Inumbo-ID: 3386e5b1-8532-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700216115; x=1700820915; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JtN5H/wJPQwEEETu4NWtSSlUD1qXiWR4M/LuTh8uuvI=;
        b=pVIEHFxbnrpXZfYS3ylm8WUv92Za5X9U5KtqICSytsfOwfOsA8px/BT4V0kU3c7ezI
         w4vU1G0MOF2mkbVNq/j0ic7OH+wWHiTIvZXfsyWKmzt69VqtediA03Z2jeelUUg+aUS6
         bPmuljtY4/+daxJzex+/ug2RQgKbg9telBq7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700216115; x=1700820915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtN5H/wJPQwEEETu4NWtSSlUD1qXiWR4M/LuTh8uuvI=;
        b=cPjPu6+3e/bvJf482H17A8rLFZhXYwWEY4jGxPGBzt6dxxjBbLsI4+ubRR3RtmAZs2
         fxOhXHATFTCL4WzkOdpBcIeFpDDdHYLP8PlyUauB6OVGb5CC0pkKkdLzP7Nph+xQ5uQJ
         N9UquqHhRJwadby0OSMDdkGgSQMLMYDmqzEfcHQxhY2bHbTyRgAc7lEVqtjGxEWbTpbo
         AGAifDXor+MzCTUxSZXFgcRkTTt2vKrtebd/Vj03LucsKV01rU66PjgZefoi9kpK9ULO
         WUv0EtZ8MjSOjWEx4851i5kFPuwjFnCHEatSr2SpUWJcptBDJmKpM8P/Xums/pZ64Yrd
         ABtA==
X-Gm-Message-State: AOJu0YzXPKtiwNS6mh+blZEuZCGO04sKz/iPp+QeKyu58DGnWi6kodRA
	zZhOcb8Q6X0SeVuUtWcsdV7JzK73d3FLime6x+k=
X-Google-Smtp-Source: AGHT+IEbBGU7eT4q8z2kU3Mzq7HgjEKUHc8tnPA2LTw0jSwhyYTIYWZq1d3QGNbkJ8kfCqPFQl3ACg==
X-Received: by 2002:a2e:bc14:0:b0:2c5:1aae:400d with SMTP id b20-20020a2ebc14000000b002c51aae400dmr9954396ljf.22.1700216115022;
        Fri, 17 Nov 2023 02:15:15 -0800 (PST)
Date: Fri, 17 Nov 2023 11:15:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 6/6] automation: switch to multi-platform images when
 possible
Message-ID: <ZVc9MZQ3lJpL2Nz1@macbook.local>
References: <20231116121310.72210-1-roger.pau@citrix.com>
 <20231116121310.72210-7-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2311161711560.773207@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2311161711560.773207@ubuntu-linux-20-04-desktop>

On Thu, Nov 16, 2023 at 05:14:23PM -0800, Stefano Stabellini wrote:
> On Thu, 16 Nov 2023, Roger Pau Monne wrote:
> > Instead of using specific architecture image, switch to using multi-arch ones
> > and specify the desired architecture using the --platform option.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I haven't touched the Yocto dockerfile because I'm not sure how it's used.
> 
> We are missing:
> 
> automation/build/debian/buster-gcc-ibt.dockerfile

That file was updated in patch 5/6:

https://lore.kernel.org/xen-devel/20231116121310.72210-6-roger.pau@citrix.com/

> automation/build/debian/bookworm-cppcheck.dockerfile

Not sure I'm following, bookworm-cppcheck.dockerfile is updated...

> automation/tests-artifacts/*

Oh, didn't realize about those, I will do in a separate patch.

> Aside from that, it is fine.
> 
> How did you test the updated containers? Have you already pushed them to
> the registry?

I've pushed them to my local registry and changed the registry in one
of my Xen branches, see:

https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1074512137

Some jobs failed because the runners run out of space.

Thanks, Roger.

