Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAA711E22
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 04:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539924.841269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2NWg-0003Nu-Ou; Fri, 26 May 2023 02:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539924.841269; Fri, 26 May 2023 02:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2NWg-0003Lq-LD; Fri, 26 May 2023 02:49:58 +0000
Received: by outflank-mailman (input) for mailman id 539924;
 Fri, 26 May 2023 02:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jaOs=BP=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1q2NWf-0003Lk-7p
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 02:49:57 +0000
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe080a77-fb6f-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 04:49:55 +0200 (CEST)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1ae452c2777so3031055ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 19:49:54 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902e9d100b00199203a4fa3sm2065914plk.203.2023.05.25.19.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 19:49:52 -0700 (PDT)
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
X-Inumbo-ID: fe080a77-fb6f-11ed-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685069393; x=1687661393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OPLzWUVi7gsop6G9dajjYUDmWusRBpLPLHka0+jrUs=;
        b=DRrLcN0pszpWK0JR6rgtYWVRdlBz/tBpSlRR3BiV8tDhNFgeXXSpppgo5mRNDuxUUo
         SWFq4/TdDZEVUNgUw9UGKXvhF7S9K6bIc2FFU2i0ofINXcdZWa70YSkknGmJ3xoX9Il+
         0aUblIgzicdRccdzP+pEaxa8Ta66lvLoAwdNsg0juELp115Ku3CDbT9JIsuoX/J/YS0P
         BJ/avCz4ueo3FRBWOCqxK7ROJNHKxFxzd000Ncir+HUtNp7zMwzAA2oa1GYv+HhmTQVE
         I+J6C24oQZzX9RxVkKsEA+uUXF9sn86eRkWYAzcHdoQNkHOgWQRu3vkvevCsHZmeKGdI
         983w==
X-Gm-Message-State: AC+VfDz5pweW5N+WTVZSEg5lT8G5V6THStUaPuBV7dDV+D4y6gfdAoOs
	wRoseE5O0xmjnIMOJu4Foso=
X-Google-Smtp-Source: ACHHUZ5XFpzeemUD1TUof6eCOZ3HnG5K/XByXYk4BPuootwhqPjfiNQxiSFweZaNQrfTmkP0NOc3aw==
X-Received: by 2002:a17:903:1c7:b0:1ad:bccc:af77 with SMTP id e7-20020a17090301c700b001adbcccaf77mr4770197plh.18.1685069393239;
        Thu, 25 May 2023 19:49:53 -0700 (PDT)
Date: Fri, 26 May 2023 02:49:51 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] xen/netback: Pass (void *) to virt_to_page()
Message-ID: <ZHAeT2m7297SOKfS@liuwe-devbox-debian-v2>
References: <20230523140342.2672713-1-linus.walleij@linaro.org>
 <20230524221147.5791ba3a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524221147.5791ba3a@kernel.org>

On Wed, May 24, 2023 at 10:11:47PM -0700, Jakub Kicinski wrote:
> On Tue, 23 May 2023 16:03:42 +0200 Linus Walleij wrote:
> > virt_to_page() takes a virtual address as argument but
> > the driver passes an unsigned long, which works because
> > the target platform(s) uses polymorphic macros to calculate
> > the page.
> > 
> > Since many architectures implement virt_to_pfn() as
> > a macro, this function becomes polymorphic and accepts both a
> > (unsigned long) and a (void *).
> > 
> > Fix this up by an explicit (void *) cast.
> 
> Paul, Wei, looks like netdev may be the usual path for this patch 
> to flow thru, although I'm never 100% sure with Xen.

Yes. Netdev is the right path.

Thanks,
Wei.

