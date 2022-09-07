Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD915B0457
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401624.643502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuXb-0007Cp-F9; Wed, 07 Sep 2022 12:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401624.643502; Wed, 07 Sep 2022 12:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuXb-0007Ac-Be; Wed, 07 Sep 2022 12:52:27 +0000
Received: by outflank-mailman (input) for mailman id 401624;
 Wed, 07 Sep 2022 12:52:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZ2f=ZK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVuXZ-0007AV-Oi
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:52:25 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb0c25c5-2eab-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 14:52:24 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id 202so13461737pgc.8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 05:52:24 -0700 (PDT)
Received: from leoy-huanghe.lan (n058152048222.netvigator.com. [58.152.48.222])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a17090a16cf00b002005fcd2cb4sm6257213pje.2.2022.09.07.05.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:52:22 -0700 (PDT)
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
X-Inumbo-ID: eb0c25c5-2eab-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=a+WaeHnZk55/Rn0ky4Kfi+q5eGygvNqLVsftUcAdhiA=;
        b=t5SqmITZkzz2V3WzMcyat6ypljDQVYyJB1Q6D+RxTHolFo7UTYN8ptjbLhn22xHMPn
         8Q1dttpdamsiFDmmaEH3zr06KaRezJWaZQm43kiXEo4oPITCp3CYSzDlH2BFJdhu2k+l
         pcuO4uXzXW8zWX14FIrBTjgC/LkWl0sXMggTaT1nkbPB9eu6nUX3kKJjstXFhrZXDuGy
         owTGwugCeGRHXCtNRgbxW/pPm0eNC+DO5nu7g4RSxBuh1b7S1ea7pkpHDV7Swm1DfMKx
         lZk1SDh3Hy6PxIBPOI1wM/jGlfHtitS51xr77xXj8+QvDVuWVKcv1HcVJwuZxXoMFUaP
         xUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=a+WaeHnZk55/Rn0ky4Kfi+q5eGygvNqLVsftUcAdhiA=;
        b=FIBBquqE7rhU4AQmDnmBUYkAEIXgDNoifAwluzfpVHRXFZQ3cuHWUsYZNLLvLYNrEP
         J4Giyim1+pKq1N3JAdJL9RQY4iBo5iCvZjqC0LWzlE/Q4dWB1+28vhzumlVtgv2mQC5Z
         uOMTssOtTHNFwbGkrNyhAKdIFtTE1qq25g88oJoxwXo46APbPAjWFis/CJAu99ua5z6c
         JU5fWoJpfEJY9qVHfdNq45M30ShPMZ5xFieSL+0V5887uuNve7ss1mKjeWUVij/Tbx9/
         yHs7h6HR30O2Opb33OabL7qhDF9xGOzHxtqVSnpTc7XYUPbQ0OgPN8yruT5qufQnFoli
         QyMg==
X-Gm-Message-State: ACgBeo1iEfTYHenL+dgRWrMJhR3exLHMysOhMD13R/GVdbxe0rvcLQAt
	O0gV6kjnNlVKCNoW3l0cMt0eGQ==
X-Google-Smtp-Source: AA6agR5xR1q6IL1nd8omUPFYa4NLsVlbrSb6T5V8+PhJmUcVxUQgLdgHRbEetuS8PxAuPA2qbol23Q==
X-Received: by 2002:a63:82c1:0:b0:434:ac18:f6e with SMTP id w184-20020a6382c1000000b00434ac180f6emr3291684pgd.120.1662555142910;
        Wed, 07 Sep 2022 05:52:22 -0700 (PDT)
Date: Wed, 7 Sep 2022 20:52:16 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Add macro for version number string
Message-ID: <YxiUAIXb4xFTJNsv@leoy-huanghe.lan>
References: <20220907120420.387771-1-leo.yan@linaro.org>
 <4A5E6FC5-1716-4D7E-95EB-83CA6451D88A@arm.com>
 <19658a68-573f-9d27-ead3-fd0c57dcf68a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19658a68-573f-9d27-ead3-fd0c57dcf68a@suse.com>

On Wed, Sep 07, 2022 at 02:34:25PM +0200, Jan Beulich wrote:
> On 07.09.2022 14:20, Bertrand Marquis wrote:
> > Hi Leo,
> > 
> > Thanks a lot for the quick handling here.
> > 
> >> On 7 Sep 2022, at 13:04, Leo Yan <leo.yan@linaro.org> wrote:
> >>
> >> On Arm64 Linux kernel prints log for Xen version number:
> >>
> >>  Xen XEN_VERSION.XEN_SUBVERSION support found
> >>
> >> The header file "xen/compile.h" is missed so that XEN_VERSION and
> >> XEN_SUBVERSION are not defined, __stringify() wrongly converts them as
> >> strings and concatenate to string "XEN_VERSION.XEN_SUBVERSION".
> >>
> >> This patch introduces a string macro XEN_VERSION_STRING, we can directly
> >> use it as version number string, as a result it drops to use of
> >> __stringify() to make the code more readable.
> >>
> >> The change has been tested on Ampere AVA Arm64 platform.
> >>
> >> Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
> >> Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Regarding the change suggested by Jan to add spaces, I think it is a
> > good idea so if the commiter agrees to do on it on commit please do,
> > otherwise we can keep this as is.
> 
> If I end up committing this, I'd be happy to add the blanks, and therefore
> I'm inclined to say no need for a re-send.

For easier for maintainers, have sent patch v2 with adding blank and
adding review tags.  Thanks!

Leo

