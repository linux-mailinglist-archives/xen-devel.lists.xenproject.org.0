Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B60F7E9989
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 10:57:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631473.984816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Th6-0006l6-Ou; Mon, 13 Nov 2023 09:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631473.984816; Mon, 13 Nov 2023 09:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Th6-0006im-MO; Mon, 13 Nov 2023 09:57:24 +0000
Received: by outflank-mailman (input) for mailman id 631473;
 Mon, 13 Nov 2023 09:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2Th5-0006hu-B7
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 09:57:23 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07b584c7-820b-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 10:57:18 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4083740f92dso34307015e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 01:57:21 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b00407efbc4361sm13316876wmq.9.2023.11.13.01.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 01:57:20 -0800 (PST)
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
X-Inumbo-ID: 07b584c7-820b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699869440; x=1700474240; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7G1QwiIpJLr43cE2gE1FhyQ2DAAhYkK70fZcgtchn7c=;
        b=BqQFaw2exJzNEu+zfb+j3+nmQPPugo7NYsUC9U+xpQEjILvwOS3rjIvtvTkDiwKTwA
         CwkmgCgMQGYZc8Mg63kX/tFbzQGf6hAX/Y7696LfKJXxxIIKS1DkWEj/dMDHsOC7spa3
         OHsTPCgdA3Qxb1rGBKZIPPVpbpZjXnDrGmbz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869440; x=1700474240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7G1QwiIpJLr43cE2gE1FhyQ2DAAhYkK70fZcgtchn7c=;
        b=Cb+zI0CdH6r4ejy5gb3zVa3t+MTVRzN7aPKgGouCj42Ni8XoabLTMCvOtONzQF59vS
         HkyUKmDl9lOK/NpqZ29zkSDdwGq+sg42/dLxf0M+qt5UwfC8UEaD7BmbWVIxtfjV6upg
         mxWKDfv2yqS6T8CZmcouVFpOYFTK3dgneMf263dg8k0XVV9drT3xugsuYDOKcCP9Q93K
         Hgq22ijlouotAsosIyw7ugdxO1gnE9z+7C8ZCwVB9409WWVLYdEYlBpP/U9D7nOhB1OQ
         1FZ3nOMOOyu4p3J64Qwf/VeQqMm1NnRz9yAWNvgfe57r14kL6t+mICh5Yi6V8TJ2zFFN
         n7JQ==
X-Gm-Message-State: AOJu0YyC9uaSGmYVd9il63MVCI8sf9nzrtl9eUhw7bwaIBqYLXAIfidd
	AR+KMcTw8m4bO3OE1Wf2P4rAaA==
X-Google-Smtp-Source: AGHT+IEZDs0CNCgHLv/LrRv1OyPLIv4OY3G3UIEwAuOIIK3H5UeZCYYGRWVLtesyWMk3Ax2MFGalXA==
X-Received: by 2002:a05:600c:6022:b0:409:c1e:7fe8 with SMTP id az34-20020a05600c602200b004090c1e7fe8mr5011167wmb.19.1699869440623;
        Mon, 13 Nov 2023 01:57:20 -0800 (PST)
Date: Mon, 13 Nov 2023 10:57:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/intel: fix indentation
Message-ID: <ZVHy_9y063awxdng@macbook.local>
References: <20231113085130.43458-1-roger.pau@citrix.com>
 <02f3b155-797d-8b6a-4f64-f2d376f9cc24@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02f3b155-797d-8b6a-4f64-f2d376f9cc24@suse.com>

On Mon, Nov 13, 2023 at 10:22:19AM +0100, Jan Beulich wrote:
> On 13.11.2023 09:51, Roger Pau Monne wrote:
> > Adjust line to use a hard tab and align using spaces afterwards, instead of
> > using all spaces.
> > 
> > Fixes: fc3090a47b21 ('x86/boot: Clear XD_DISABLE from the early boot path')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> > ---
> > Realized while doing backports, not sure if it's worth fixing on it's own.
> 
> Fine for staging, but regardless of the Fixes: tag not a backporting
> candidate imo.

No, not unless there's a further backport that requires the adjusted
context maybe.

Thanks, Roger.

