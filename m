Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0205AF70A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400215.641891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgID-0004Qk-3N; Tue, 06 Sep 2022 21:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400215.641891; Tue, 06 Sep 2022 21:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIC-0004Mh-Kq; Tue, 06 Sep 2022 21:39:36 +0000
Received: by outflank-mailman (input) for mailman id 400215;
 Tue, 06 Sep 2022 21:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCHN=ZJ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oVgGo-0000Cs-0c
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:10 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9409470c-2df6-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:14:19 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id x19so11707463pfr.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 08:14:19 -0700 (PDT)
Received: from leoy-huanghe.lan (n058152048222.netvigator.com. [58.152.48.222])
 by smtp.gmail.com with ESMTPSA id
 f21-20020aa79695000000b00538405dfe4asm10234125pfk.111.2022.09.06.08.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:14:17 -0700 (PDT)
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
X-Inumbo-ID: 9409470c-2df6-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=yXjISJhrY/N3Iy39LpKe7XmBe/2D/mWjQT063XPGd4E=;
        b=OymWPPqRv+u6skIwxE/9+SFKWH1CAraBhECGYGkoQcB2yreDn+fep/6gWgum+17xEc
         PfbtnD26KQFas8BU1kpA8xwCUNRdYIrBJhUNIIBqr+DacgqEp7nq8N10ql58fyVWlKH3
         s3KjlNs6+g6Dynm8oAWLDBbBFxYWz9Q+/5U0fmF53fgtHqUnzq/uypYikJpeRoDHZ5nM
         ZEDFvq+D3cOAqUHD86RHW52kZrF5FxR16dRlKCyMsl8RNWfQ/U09V4hnVDrYFo200LAd
         pxzhUY70cgupJ/+/tXRoFMXr/ajgd25/BiY0IJ2CNfTgMu/3j+Ik/M9sCPWWTMqc1k+I
         2X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=yXjISJhrY/N3Iy39LpKe7XmBe/2D/mWjQT063XPGd4E=;
        b=h6KL1gEeFamp6XRd2aSwrnIoX/xn7ttV6Nr1z8ro6Ah1ZLpxgV3AtWnHAEBfghGsg6
         GayCmWLqKlREckh0oZkMbpqOARDZnVCf5Fz3i45I+9IPTx+72FbtpoQ1AjgOGtfTCwoe
         mnRcya2nYEs8AkaOsmpPZogXaxPYONdhrCUPaLEEIwAof8CNixHtOZwIqY8x7K3dBbEf
         yaMLl65CXdvX5A/nx4l61inV3VZZzRaf8wbrqJkaNKIClbW9iXeYeg9G+YxSYViATPX0
         NKZTNywJ0LrcmOuoxedyaL5Qe/mkZoibjQZtsUwhBwWGzV7MTR8Ke7SXNjGJMri3wtOS
         oFXg==
X-Gm-Message-State: ACgBeo34u5D8S42NUKyUDdRj+N9Ult4QE1jJ7+2VSEmunmNKMYCZ71ux
	fpB3aps9k35bkbcgsj4kVyLQkA==
X-Google-Smtp-Source: AA6agR6TSIGQwaHdJVaO7Ov5llyWeP9bLlt91wN7uSHBHuVQSSoutENLbzU+d/ottHaH89FzmnBPlw==
X-Received: by 2002:a05:6a02:305:b0:42c:4b07:8280 with SMTP id bn5-20020a056a02030500b0042c4b078280mr34996840pgb.354.1662477258266;
        Tue, 06 Sep 2022 08:14:18 -0700 (PDT)
Date: Tue, 6 Sep 2022 23:14:14 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Message-ID: <Yxdjxmru2sz2yTQ4@leoy-huanghe.lan>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <09F01AC7-6125-49C3-80BF-637BBFDC739A@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09F01AC7-6125-49C3-80BF-637BBFDC739A@arm.com>

On Tue, Sep 06, 2022 at 01:09:28PM +0000, Bertrand Marquis wrote:
> Hi Leo,
> 
> > On 6 Sep 2022, at 12:31, Leo Yan <leo.yan@linaro.org> wrote:
> > 
> > On Arm64 Linux kernel prints log for Xen version number:
> > 
> >  [    0.000000] Xen XEN_VERSION.XEN_SUBVERSION support found
> > 
> > Because the header file "xen/compile.h" is missed, XEN_VERSION and
> > XEN_SUBVERSION are not defined, thus compiler directly uses the
> > string "XEN_VERSION" and "XEN_SUBVERSION" in the compatible string.
> > 
> > This patch includes the header "xen/compile.h" which defines macros for
> > XEN_VERSION and XEN_SUBVERSION, thus Xen can pass the version number via
> > hypervisor node.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Very nice finding and side effect from stringify.
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks for review, Bertrand.

