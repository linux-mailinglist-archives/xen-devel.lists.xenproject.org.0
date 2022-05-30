Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02258537CB2
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 15:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338590.563385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfbE-0004iX-Rv; Mon, 30 May 2022 13:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338590.563385; Mon, 30 May 2022 13:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvfbE-0004f6-OS; Mon, 30 May 2022 13:38:24 +0000
Received: by outflank-mailman (input) for mailman id 338590;
 Mon, 30 May 2022 13:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23U3=WG=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1nvfbD-00049o-93
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 13:38:23 +0000
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6242a71-e01d-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 15:38:22 +0200 (CEST)
Received: by mail-wm1-f50.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so8412387wme.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 06:38:22 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfdb82000000b002102e6b757csm5331680wri.90.2022.05.30.06.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 06:38:21 -0700 (PDT)
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
X-Inumbo-ID: c6242a71-e01d-11ec-837f-e5687231ffcc
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KsAtagss1zN3OoHQ7StI415A2RqFxEh/FfqiDwV3lwg=;
        b=EzgFPSO7VN8io8cVTJxOcKTm6zR0nXxsZED7aCFaoDH0yxbW+vYH/F4PUWeGkoRFN9
         0bP452jOG1VQIFYSQDWuYPyNQHaGLbXUaBKVYX0+aauposdJ9+KPEADTzzNdEnATnF86
         48nBlAZrMQpYzkI6b0LHmYvjKumKwCIi+IzyLqQSRr+QY16nEdVjqHVc0EQi6MFt6uHT
         ybXZjnt7EzVwBChnykOvc8lzasQB+o1pHdc/lChyAzaemZHmu11kvmSexTNP3aCei4EQ
         icmwBtiyzah+zMdxjAkE6OCZr7LRA1XmxnN/kKD1L/2R+Jj/W7rdnee8uj6oynVqQ5lO
         opqA==
X-Gm-Message-State: AOAM530XCko0s2ttbl2m4dzcpumkTIC76u5bWKT4hw6B5v/YqnOf95O7
	4R+Iz5sKj5y2GcMHOFEZFjY=
X-Google-Smtp-Source: ABdhPJyLAdckxSBuBL1xhlfS9GVoNCXS4Kx15kZbX2/pn3pGdm0f8N7kwpIgiWG6jbtRdSs4v7MPfw==
X-Received: by 2002:a7b:c1d8:0:b0:397:337a:b593 with SMTP id a24-20020a7bc1d8000000b00397337ab593mr18979837wmj.96.1653917902170;
        Mon, 30 May 2022 06:38:22 -0700 (PDT)
Date: Mon, 30 May 2022 13:38:20 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/netback: fix incorrect usage of
 RING_HAS_UNCONSUMED_REQUESTS()
Message-ID: <20220530133820.5mbjaavusxdhv25c@liuwe-devbox-debian-v2>
References: <20220530113459.20124-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530113459.20124-1-jgross@suse.com>

On Mon, May 30, 2022 at 01:34:59PM +0200, Juergen Gross wrote:
> Commit 6fac592cca60 ("xen: update ring.h") missed to fix one use case
> of RING_HAS_UNCONSUMED_REQUESTS().
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 6fac592cca60 ("xen: update ring.h")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

