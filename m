Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC65B02A9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401324.643169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt2e-000494-Jv; Wed, 07 Sep 2022 11:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401324.643169; Wed, 07 Sep 2022 11:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVt2e-000462-H9; Wed, 07 Sep 2022 11:16:24 +0000
Received: by outflank-mailman (input) for mailman id 401324;
 Wed, 07 Sep 2022 11:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZ2f=ZK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVt2d-00045s-EA
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:16:23 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8083ae48-2e9e-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:16:22 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id d82so651586pfd.10
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 04:16:22 -0700 (PDT)
Received: from leoy-huanghe.lan (45.78.11.189.16clouds.com. [45.78.11.189])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a17090a2ecc00b001fdea53b90csm10788453pjs.16.2022.09.07.04.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 04:16:20 -0700 (PDT)
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
X-Inumbo-ID: 8083ae48-2e9e-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=tPO4IhBF7wjvwU+GHqokUrye5m5b4pJOPaUDIfvbkk8=;
        b=gooRwmWWPtr1nR/ie/0LA3iRAANFIBZUgdOUW7e5UnKl4A4dDHbVeTh8FJM4veTRVu
         QQZQNHlOCycOO1CR7aCC0CLlaKMcbTNwrTkISulZ04vSjU6rXp2UsuSJLzTRTOp6tMQ7
         j+IXAbjZCw9hIPzd2uZ3/jwNSMBGSfiVPMcBwP4A/PKge1KCw7mTe8CKcKyTqcUWsHQZ
         B5Z07pzHr0tuhpm7sYFwy5c3kXbAN8+OdNLID7xFe5mE7DwEPu32I/5EiFcvRP5a1NRv
         AIljdnatvz+ArLs8vyHb+EH8xnuYRbgq4wss0Qr9o7wyFAAgbdCbWPck+WElV2zjJqia
         leQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=tPO4IhBF7wjvwU+GHqokUrye5m5b4pJOPaUDIfvbkk8=;
        b=gtGv3mQ+gI4TtK74P/q99YKWNTFfKJ3+5SUAOxx1nAmI3JtHT9eYzrfRUQePpwXfDc
         4dd9wkrWlQFnaEhG9klRl57Eyoki2co48ZOAgqTipYZzbM1sugB2yeLGTJ3PYNzuBuP8
         SdgEh9OnhJNZNGTAWkApySyPWIkAtT9f/bD7NqJojfCJVe9iXWgg1dQZAJdmxB1jLwgO
         wNKlKDN72frOxj6MkNaFXdiyM/BNtFRgceIr9L0FwN4ykgmZVe9pD0RpP0hg2cMa5v5D
         zogl9+voBRsUMo+lw72J8YYLJJ8qs4X8ETKqGNIaqYLjCRlJCAzkPCrCho1Z5g0X94C2
         gKbw==
X-Gm-Message-State: ACgBeo0jtOpZza7hhISYmJAgPxNHmfV9kktw5vtmKw74eB8/dyyTDTFm
	hxmG6BM2ia4impseBbl62IvQIw==
X-Google-Smtp-Source: AA6agR6hZtobP//j/AwM19R3JdlSpWQ3OFFOCZS23/S3mZpboxo+MkyiLoz5pyLtzNtGZDR/zBZqjQ==
X-Received: by 2002:a63:1a04:0:b0:42b:d33a:2613 with SMTP id a4-20020a631a04000000b0042bd33a2613mr2835435pga.429.1662549380780;
        Wed, 07 Sep 2022 04:16:20 -0700 (PDT)
Date: Wed, 7 Sep 2022 19:16:16 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Message-ID: <Yxh9gCqeHtHtivKN@leoy-huanghe.lan>
References: <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
 <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
 <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
 <10E7EFB2-65A4-4092-9DC5-71825BC9595B@arm.com>
 <5ce7f63c-5ba5-f2cb-8e3e-f6dd2d9d76f7@suse.com>
 <524F3B92-5298-4BE3-864D-A076A8873800@arm.com>
 <Yxh7tycPrb8YXXXK@leoy-huanghe.lan>
 <C61236ED-5F5A-44C3-AED9-867CF80F078F@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C61236ED-5F5A-44C3-AED9-867CF80F078F@arm.com>

On Wed, Sep 07, 2022 at 11:12:24AM +0000, Bertrand Marquis wrote:

[...]

> > Just remind, We need to define XEN_VERSION_STRING in compile.h.in rather
> > than in compile.h, something like:
> > 
> >  #define XEN_VERSION_STRING @@version@@.@@subversion@@
> 
> Very true but you will need the quotes here

Yeah.

> >>>> Quotes at beginning and end should not be there.
> >>> 
> >>> I have to admit that I dislike the STR infix. I'd prefer a suffixed variant
> >>> (e.g. XEN_VERSION_STRING) or one omitting "string" altogether, e.g.
> >>> XEN_FULL_VERSION (albeit I see "full" as being potentially ambiguous here,
> >>> since one might expect that to include XEN_EXTRAVERSION as well then).
> >> 
> >> 
> >> Version is a value so here I though it made sense to distinguish that one as it is a string representation of it.
> >> 
> >> XEN_VERSION_STRING is ok I think.
> >> 
> >> I generally dislike anything named FULL, EXTRA, BASE or other which are just unclear.
> > 
> > XEN_VERSION_STRING is good for me.
> > 
> > Hi Bertrand, just let me know if you prefer to cook your own patch for
> > this (essentially this idea is coming from you) or you want me to
> > follow up for a new patch?  Either way is fine for me.
> 
> Please push a new patch and add:
> Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Sure, will do.

Thanks all for suggestions.

Leo

