Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A35B03EB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401526.643369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuAr-00056R-NA; Wed, 07 Sep 2022 12:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401526.643369; Wed, 07 Sep 2022 12:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuAr-00054D-Jv; Wed, 07 Sep 2022 12:28:57 +0000
Received: by outflank-mailman (input) for mailman id 401526;
 Wed, 07 Sep 2022 12:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uZ2f=ZK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVuAp-00052W-Lq
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:28:55 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a29f3444-2ea8-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 14:28:54 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id fv3so8271697pjb.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Sep 2022 05:28:54 -0700 (PDT)
Received: from leoy-huanghe.lan (45.78.11.189.16clouds.com. [45.78.11.189])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a622945000000b005361f6a0573sm12465605pfp.44.2022.09.07.05.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 05:28:52 -0700 (PDT)
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
X-Inumbo-ID: a29f3444-2ea8-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+HuSoWX5VQPvHtd0Wmv1YHN7SQPTvjy+G5KMriA4428=;
        b=iBDXAO+AZG3AfpN/OZkzvVXvs1krk6KaDQAPRXDg42atHYaaXTqPmmuEm/Gkl3728Q
         TLi3E9UdA1f0zamPUrTcR7btXMXQ7iLlBkKYyB4M9t7ZBAYMxk2EdHUEqocGsp5/10sM
         e51Qw1EsjWXO0KD30NNrWRZ0RI4MU/C3k/QY28XnMYS3pe9Pvan69IJxFB7m4BbnOZ+C
         6xZWv83lEsngsLau+960mL1d5HlSp59i4g39m8YUFXuRHttECXcKs11ZTJAwm3NRy5Jn
         kpWW21o1LOhjn3ZLeHBWBnRpEIE/mxN0uB+aS0CsgqDPFjfltFMkQ1vBk7KAXU0Kzm+a
         ntbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+HuSoWX5VQPvHtd0Wmv1YHN7SQPTvjy+G5KMriA4428=;
        b=ixWrmJwltLXMIoumhZjEhxD41oTEGLx3f1ekMU/QxcDRllRmG5/CWB89SdJqxEt+6W
         Efn7gy4xLBfjfb6dT+vx4ePkCrkanAWWfveTb49WoygMnH1gR++YW9d36TPbBvjHKwnN
         Nw5ZBDwqMFA8CAi5ZmfDKs8B7Pb3hBi6f5Lfpjthv1irah2J8BBrIt4RRASPBvCtFEv2
         h+OmhUZAHZZFlhux0oME5XQFfi8w+dita1859CQxtZ2hnyQXYI/Wni8CFNA4/0UOLrfy
         PcwYA6XWmd00hyUzoJBlRuqSr5p6l4ttVvmEI0MfVD2diUyid/QXrU48oBZJVZJELIEy
         /b6A==
X-Gm-Message-State: ACgBeo1+8H86CzZHk/kOM/dY6n0eYXWC8X4sbu9nRU+YqLdC8rHNkuir
	DT2zSVeKFKcqxVIZ/Okp1xZtCg==
X-Google-Smtp-Source: AA6agR6x9i63zIoe1HooAbbEBPEh8s9TrBDdmMWT5EJG9DZpqDm4L3lCj/pRq3m6v0YF1AkBKMRUOw==
X-Received: by 2002:a17:902:f68f:b0:176:c1e3:3ada with SMTP id l15-20020a170902f68f00b00176c1e33adamr3736019plg.74.1662553733032;
        Wed, 07 Sep 2022 05:28:53 -0700 (PDT)
Date: Wed, 7 Sep 2022 20:28:47 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: Add macro for version number string
Message-ID: <YxiOf9v5jPsAkRs/@leoy-huanghe.lan>
References: <20220907120420.387771-1-leo.yan@linaro.org>
 <40400a52-b55a-1c35-5ee8-32ebfb08bc28@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40400a52-b55a-1c35-5ee8-32ebfb08bc28@suse.com>

Hi Jan,

On Wed, Sep 07, 2022 at 02:12:25PM +0200, Jan Beulich wrote:
> On 07.09.2022 14:04, Leo Yan wrote:
> > On Arm64 Linux kernel prints log for Xen version number:
> > 
> >   Xen XEN_VERSION.XEN_SUBVERSION support found
> > 
> > The header file "xen/compile.h" is missed so that XEN_VERSION and
> > XEN_SUBVERSION are not defined, __stringify() wrongly converts them as
> > strings and concatenate to string "XEN_VERSION.XEN_SUBVERSION".
> > 
> > This patch introduces a string macro XEN_VERSION_STRING, we can directly
> > use it as version number string, as a result it drops to use of
> > __stringify() to make the code more readable.
> > 
> > The change has been tested on Ampere AVA Arm64 platform.
> > 
> > Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
> > Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with perhaps a small adjustment (but it'll be the Arm maintainers to judge):
> 
> > @@ -91,7 +92,7 @@ static int __init acpi_make_hypervisor_node(const struct kernel_info *kinfo,
> >                                              struct membank tbl_add[])
> >  {
> >      const char compat[] =
> > -        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
> > +        "xen,xen-"XEN_VERSION_STRING"\0"
> 
> I think readability would benefit here from adding blanks around
> XEN_VERSION_STRING here and ...

Agree that adding blanks is better.  Will do.

> 
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1367,7 +1367,7 @@ static int __init make_hypervisor_node(struct domain *d,
> >                                         int addrcells, int sizecells)
> >  {
> >      const char compat[] =
> > -        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
> > +        "xen,xen-"XEN_VERSION_STRING"\0"
> 
> ... here (as an aside I wonder why these variables aren't static
> __initconst), just like ...

Will add blanks.

> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -1341,8 +1341,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> >              efi_console_set_mode();
> >      }
> >  
> > -    PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSION)
> > -             XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
> > +    PrintStr(L"Xen " XEN_VERSION_STRING XEN_EXTRAVERSION
> > +	     " (c/s " XEN_CHANGESET ") EFI loader\r\n");
> 
> ... it is here in particular for XEN_CHANGESET.
> 
> The other general remark I have: Please follow patch submission guidelines
> and send To: the list with maintainers on Cc:.

Ah, just now quickly went through docs/process/sending-patches.pandoc,
thanks for reminding.

A question, since commit 5d797ee199b3 was merged in 4.11.0-rc6, for
fixing it, should I explictly add backport tag as below?

  Backport: 4.11+

Thanks,
Leo

