Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313559804E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 10:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389371.626232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObAl-0003Hb-Lc; Thu, 18 Aug 2022 08:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389371.626232; Thu, 18 Aug 2022 08:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObAl-0003F1-J1; Thu, 18 Aug 2022 08:46:39 +0000
Received: by outflank-mailman (input) for mailman id 389371;
 Thu, 18 Aug 2022 08:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bNE=YW=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oObAj-0003Ev-U6
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 08:46:38 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 440c82d5-1ed2-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 10:46:36 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id c2so978435plo.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 01:46:36 -0700 (PDT)
Received: from leoy-yangtze.lan (173.242.127.92.16clouds.com. [173.242.127.92])
 by smtp.gmail.com with ESMTPSA id
 l190-20020a6225c7000000b0052ceaba7411sm975228pfl.125.2022.08.18.01.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 01:46:34 -0700 (PDT)
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
X-Inumbo-ID: 440c82d5-1ed2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=D56CvDrJy2+LFqkdX541ahOhXvOP4rA+3zP0nFT6fC8=;
        b=LsuWBATNCVoOiBsLblHOjoOHs6OCtb+NSH1jdTuBiAsVqGteJbV8j/lT26KXQDH5Eg
         jD0XAFTGOdL5beHlGYGCKiLySA68shXsFZyYhWsihsLs2COo84Bsa/s6Egus+Sjr2rY/
         ZZJXVHKf51MkCq8Lc/xR/iZfOeAvvfWR2qSF0aYp0W0u5hB8bi7rUwX838L0GnOUaDlU
         oLIC101nw2ehUYsHhkmHRbfvq+VVhiuJ6tVDS4LUxvxpqToMJpxbjhaviI5XsURS/aeD
         mGG4rivGycWb6/Qz5jddapSHLIos4g7/xfhm8v8GnF2GJw/0pdTSPwe6zSbHth62tglY
         DDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=D56CvDrJy2+LFqkdX541ahOhXvOP4rA+3zP0nFT6fC8=;
        b=sy27lnEvbTq8gwkZ2wrb2nhmy7a+Or+sPPf5B3xHa3SXPVb0hBOmSMfM91ykmKcp6W
         812tXfDVIm5vxQf/NwF9UEl9NG9E2ZdMF3Wwt7tZAHtE0umsbDVMeeB0TyL/9tXIZVZt
         MI/TJxroe9GcTuAm9KKqA4fDaEwgt1DQ+58jTxfpFgPSeqeR3Uap8T8h0YJ3aLyCN7dc
         Wy0RMhcb2l0oOjXSElI1BoLmeff7e/LL28GBrjnWLeXcudCbyVsGX/5gr4ta8CA0LvmJ
         zM9J5GkpZVV34DtRJA89gG01LnVC8FauRMMeeJqFU7sD7He6xXP4QXuShn6hnLSNiSNb
         XSpw==
X-Gm-Message-State: ACgBeo3FwhyXZDofD3wW1ZcWj2upSSbBrf5EM6qPsCXxW5nI4J2Neiv1
	KG+LLT35ixNo5R1MR/0uPFDkEw==
X-Google-Smtp-Source: AA6agR4nxUdDHodS2+TcY0qmwYpMORSJYD+5jLGD8RySt1NA82Bf8sF2eC9tkPMpwSzcd98HiIathA==
X-Received: by 2002:a17:902:7e45:b0:172:8c47:ff2e with SMTP id a5-20020a1709027e4500b001728c47ff2emr1759489pln.24.1660812394578;
        Thu, 18 Aug 2022 01:46:34 -0700 (PDT)
Date: Thu, 18 Aug 2022 16:46:29 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Yv38Zdxy8qGY/hpF@leoy-yangtze.lan>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
 <3d2fb83d-f75e-6c12-a48d-bfa175e6faef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d2fb83d-f75e-6c12-a48d-bfa175e6faef@suse.com>

Hi Jan,

On Thu, Aug 18, 2022 at 09:47:46AM +0200, Jan Beulich wrote:
> On 18.08.2022 09:34, Leo Yan wrote:
> > On Wed, Aug 17, 2022 at 03:17:53PM +0200, Jan Beulich wrote:
> >> Furthermore - what if Linux decided to change their structure? Or
> >> is there a guarantee that they won't? Generally such structures
> >> belong in the public interface, guaranteeing forward compatibility
> >> even if Linux decided to change / extend theirs (at which point
> >> consuming code there would need to do translation, but maybe using
> >> a Xen-defined struct [plus translation in Linux] right away would
> >> be best).
> > 
> > I saw Ard has helped to answer this question in his email.  As Ard
> > said, the general way is to rely on Linux EFI stub to allocate the
> > data structure for MEMRESERVE configuration table.
> > 
> > Given Xen uses pseudo EFI booting (the ACPI table is passed via DT), in
> > short term I don't think Xen can support Linux EFI stub, so we need to
> > maintain this structure in Xen as well.
> > 
> > This structure eventually will not change frequently, so I assume
> > later we will have little effort for maintainence it.
> 
> "Will not change frequently" isn't enough. Imo there needs to be a
> public interface structure in Xen and translation code in Linux.
> That's the only way the consuming code in Linux can remain (largely)
> independent of changes to the structure in Linux (i.e. changes there
> can be expected to be accompanied by updating of this code, perhaps
> simply in order to keep things building).

Yes, actually Xen doesn't care about the structure definition for
linux_efi_memreserve, it just allocates the table and finally used by
Linux kernel.  So another way is we can simply allocate a bigger
memory region (e.g. 64 bytes), which is sufficient than kernel's
structure linux_efi_memreserve size (only 16 bytes), then we can
initilize it as all zeros, and this can be helpful if later kernel
extend the data structure.

But this method is a bit arbitrary, this is why I did't write like this.
As Julien said, I think the critical thing is to make a call to support
EFI stub or not.  If rollback to use current method, then I am happy to
refine the patch with above idea.

Thanks,
Leo

