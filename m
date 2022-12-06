Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E26F643EF6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 09:45:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454486.712032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2TYc-0000p2-HY; Tue, 06 Dec 2022 08:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454486.712032; Tue, 06 Dec 2022 08:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2TYc-0000mg-Ei; Tue, 06 Dec 2022 08:44:06 +0000
Received: by outflank-mailman (input) for mailman id 454486;
 Tue, 06 Dec 2022 08:44:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecPl=4E=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2TYa-0000ma-Hk
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 08:44:04 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20f1f0e1-7542-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 09:44:03 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id o12so13759457pjo.4
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 00:44:01 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 i16-20020a17090332d000b00182d25a1e4bsm11982247plr.259.2022.12.06.00.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 00:43:58 -0800 (PST)
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
X-Inumbo-ID: 20f1f0e1-7542-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pEQf2u41sCivTRb7oOIHwvK+IurBtEE64RyFm4GQ9Do=;
        b=rvHy2VSOBqLia/A09Bp/LjhFBTUBLiZk+hw7OvnAOwqDNQVONZ4XQYvUT/oBaQo3YL
         Fd73B8BAYSEdKaBBUAgeSPMr7fjn30dXJS9o9AhY8MkB1XtBtP1vrdBTIq66DUQnwHnV
         fD3CDuOqW1ZYQSJavtVnq1kqrSnzirk+CaZ1utfBiZY3p1NC79wfMbTEv6E/0FT581w1
         b2w668aIQrEqhR//YbEm11ENsUUSiIUsLiq/r6ZrHVrjjG75YqUBaxqSAJ8wnKF/Athv
         xHaqABRjMdbxwyqLEWM67keNOnB6GWVuD2B6PJBp1rcylnUhslxxHcazAjXy0aQDciJr
         2cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEQf2u41sCivTRb7oOIHwvK+IurBtEE64RyFm4GQ9Do=;
        b=iaJae7SNPyMwD/f1m0Di4R3EzTQ1VEvPIeLpRrJL+mtqWkasWvAEHyFKtV8D0NHbmq
         Ll/0Rnz9TBKsBCVsvxbZljVYOPwoGnkbsZ9XyLbTtsCHe5Td4o4P48mGTBBFyPFwv+W8
         ZLlCtt+E0swymsguT4LRJf0YHt+yWYvIoriUZ6X3/ij+lJGKm7tIImn1+8pBQshh1JRn
         +kDawgSFXeVMk/vLsHEq+sPLNWtnSa/525UJh3wiiHheCTEzihZYUcRoz++hDc6jSill
         QnLSewkaxBkJIbGIGhpgF+w/phi/KmBlYfboQOFHzwZsJLkB9LGguGGu6f+5TYZZRCi3
         7xKw==
X-Gm-Message-State: ANoB5pnd0V3mapvp7MIRGFw777Ptxm303SlE1Zo+2z+FV37OhOnOf54/
	lb984+2iB1HV9fmKjSNYUu7GnQ==
X-Google-Smtp-Source: AA0mqf41Hyh/6Mqa4LHMKbxQGBcxJQ/gQopEfmf4NwV0/lDFgsVmbR2+ItNwlbuN1G9moPWVDvG2sg==
X-Received: by 2002:a17:90a:bd01:b0:21a:557:bb72 with SMTP id y1-20020a17090abd0100b0021a0557bb72mr567168pjr.46.1670316239370;
        Tue, 06 Dec 2022 00:43:59 -0800 (PST)
Date: Tue, 6 Dec 2022 14:13:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xen.org, Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] tools: Fix removal of COPYING and .gitignore
Message-ID: <20221206084355.jtmq4fejshobkie6@vireshk-i7>
References: <9f8818c9fe3f3ed43aa42bd0a06645af69c46034.1670311329.git.viresh.kumar@linaro.org>
 <664444f9-2e82-8b15-2613-4bc29bfb4e86@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <664444f9-2e82-8b15-2613-4bc29bfb4e86@suse.com>

On 06-12-22, 08:45, Juergen Gross wrote:
> Maybe in the tree you are using commit 25b55688e1f20ebb is missing?

Yes, that's the missing part I think.

-- 
viresh

