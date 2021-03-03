Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E632B814
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 14:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92849.175045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHRks-0008CD-AS; Wed, 03 Mar 2021 13:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92849.175045; Wed, 03 Mar 2021 13:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHRks-0008Bo-6t; Wed, 03 Mar 2021 13:41:34 +0000
Received: by outflank-mailman (input) for mailman id 92849;
 Wed, 03 Mar 2021 13:41:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHRkr-0008Bj-14
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 13:41:33 +0000
Received: from mail-qv1-xf29.google.com (unknown [2607:f8b0:4864:20::f29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4582f87e-b412-4d67-bedf-46f4583d382a;
 Wed, 03 Mar 2021 13:41:32 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id r5so11614270qvv.9
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 05:41:32 -0800 (PST)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id n5sm11450708qkp.133.2021.03.03.05.41.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 05:41:31 -0800 (PST)
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
X-Inumbo-ID: 4582f87e-b412-4d67-bedf-46f4583d382a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=whEpbR7WTbtRDMaD+RUjMVHegptTMi8I2/fBd5p79hQ=;
        b=gKarmlPK8ZldDK+R56MY4YjAAzNvVeGqNKLHPM5yqK8czmX7ScgPXP8wQsbM2e8K3S
         SVkpqP4dC4aYeTyGQYrTqyu54I94/dfi656SV19KXeNnkWDWp73wC+rOMSHOVtjmuZb+
         Yzms0wMxRK4c73kGflkqSNXMrAAEsEUMnU4b4QYNFf4R/scDpdAVmdoGeH9ZWAA5y6ih
         ma7MJYJKp0rn3TObm/33q6U5yMCDOQ4ps6bFqacc0oH0iXCktgxbwpCr/lE2rZaH2qQk
         kUPOogXUjYY/sGNPKuDKqqTuLvlS9Sacnlno80Rw+pm7Ih81TpvyR5927WIh+KkjFowu
         nBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=whEpbR7WTbtRDMaD+RUjMVHegptTMi8I2/fBd5p79hQ=;
        b=MF/xw1K7qo7eq+nBmW5rTfOH9ajh5h/yfYVoI62/drMnsBUpc8SO31YqFQ+xfc85MX
         vLURVnHLXmIxmaoxtQPNA/oqCgCTwiX9CUHn6Y9XThZFt1PjvKc/JFCnE9TB81k1LAxG
         L8kVvXrckAcJW45aNp7Fsx2fcLJAzMBv9T+YTdaywdf7bMGMvs0IXC6kum8HMlvSlD1i
         RaOIL0RD0zkVZ80METTJ8sy2xEbk4Kmszo0h7MnYjb84jU3hrKGg2O5FgCcsg/vjUHuW
         UqO0o7aypREUbDjcvDXV668vBAOW7uhKhwS95VhJXv+tY+OYhRa4p8dto2UmVEPUFvkt
         cENw==
X-Gm-Message-State: AOAM531ZfTX04ZnRMeSwENMl2+0x4s50xJl/NArvu/tJ2VzaY2i9LpJ+
	JYvST//U9ughjfwUlLeuS0c=
X-Google-Smtp-Source: ABdhPJxHiw+hVs6DHqlSXtEPTn30G2zZsJ9TL2FN+VBV6ypZexgoNkPFvAhz6y8XQk+/59TLNfA0bA==
X-Received: by 2002:a05:6214:194f:: with SMTP id q15mr24786748qvk.46.1614778891756;
        Wed, 03 Mar 2021 05:41:31 -0800 (PST)
Date: Wed, 3 Mar 2021 08:41:28 -0500
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC v2 0/7] add function support to IDL
Message-ID: <YD+SCKyagzddny1t@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
 <24639.23378.722148.653250@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24639.23378.722148.653250@mariner.uk.xensource.com>

On Wed, Mar 03, 2021 at 09:48:02AM +0000, Ian Jackson wrote:
> Nick Rosbrook writes ("[RFC v2 0/7] add function support to IDL"):
> > At a Xen Summit design session for the golang bindings (see [1]), we
> > agreed that it would be beneficial to expand the libxl IDL with function
> > support. In addition to benefiting libxl itself, this would allow other
> > language bindings to easily generate function wrappers.
> > 
> > The first version of this RFC is quite old [1]. I did address comments
> > on the original RFC, but also expanded the scope a bit. As a way to
> > evaluate function support, I worked on using this addition to the IDL to
> > generate device add/remove/destroy functions, and removing the
> > corresponding macros in libxl_internal.h. However, I stopped short of
> > actually completing a build with this in place, as I thought it made
> > sense to get feedback on the idea before working on the next step.
> 
> This is exciting!  I hope to find time to look at it, but I'm the
> release manager for Xen 4.15 and that's taking most of my time right
> now.

Of course, I understand. Thank you for expressing interest, I look
forward to hearing your thoughts when time permits.

Thanks,
NR

