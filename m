Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E676354F15
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 10:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105712.202191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThRl-0008Ut-ME; Tue, 06 Apr 2021 08:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105712.202191; Tue, 06 Apr 2021 08:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThRl-0008UU-Iv; Tue, 06 Apr 2021 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 105712;
 Tue, 06 Apr 2021 08:52:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ww1H=JD=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lThRk-0008UP-A7
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 08:52:28 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3ae95d4-c32e-4159-bc3e-52f3b204efb9;
 Tue, 06 Apr 2021 08:52:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e12so242108wro.11
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 01:52:26 -0700 (PDT)
Received: from dell ([91.110.221.193])
 by smtp.gmail.com with ESMTPSA id i8sm32058595wrx.43.2021.04.06.01.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:52:25 -0700 (PDT)
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
X-Inumbo-ID: b3ae95d4-c32e-4159-bc3e-52f3b204efb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3BgNDMl40dnCwKRmhOLm+B9cf4ULCtKCWabOrS4ebcw=;
        b=Asdziv4oEb1GmkAaeVVDLWI3Znln2RaErCLNpsXLzuYFdOjFmI+wtm1ABBb8Qzrhny
         TcmAdlweTBezZn6bLWI5bxAO6sixQ1qoRcBGyyLqdiQLPIYhlFyN1h+5meYfiH4JkWto
         p6pFe2LqKb8alZFUYIMjJAMVfORnDXryC0wNScdPtyGiNK6QyfD0bVL+lTSMwej9pLcV
         iQzMPvscomIPMUzjFxPNO4iPBn4L4vhotDqv492YkhoERqcLIfLNP5vCfCnxSMMP6sSJ
         KcvhK8JYrWbX7nPWHQ5J91FkPJXnbjYB6Ap1ZgdEBSg2YwCnF2NloEpC1gpS/cLHXxVn
         QScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3BgNDMl40dnCwKRmhOLm+B9cf4ULCtKCWabOrS4ebcw=;
        b=FxJSYKCOF0TmpCyGgJTRhJhnZkl/aOrLXM4ARyaknun7i9ouY/RywVyvwOvUYoFaly
         riEItBMEOQ1wVMs88dgK21Yknp36/Gjkcg6Wrhf7foJ6w91nFtlALjARMgNzFqcw2xsD
         QxqXccsuqI5gteQP887WsCFtlHXWyF4ve/MAy6VBl+Uue4nZv7G/Oul/FwbbDuLGNzv2
         UnF2VDBrZ+Y3drAOucOk9Byh2pwSkj2AWmI2GMo2UDfdvIcbThc8VcLDlGsTiJfqL/dC
         4W2nFo9bYxCl2QkTqMUKlhA+j+ZOVmWQ+yNR2Do6e3q7W6fHGlhlg4g1lfBD6XBjXM6O
         wtaw==
X-Gm-Message-State: AOAM531u1fw3EZ6S4TaPcb802a/gOICN9I3x2H/+FrFMDGjnZLesfnVY
	eN/64e+p1aJ++cpbi2fhd8kfLQ==
X-Google-Smtp-Source: ABdhPJyxLFG0M7WFSnkeNEm7vMCed81i1TOhAivLtyeLJw56m312VuEzXAMWCWyLobQLxSOjXKutyg==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr32839523wri.318.1617699146143;
        Tue, 06 Apr 2021 01:52:26 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:52:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	drbd-dev@lists.linbit.com, Jens Axboe <axboe@kernel.dk>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org,
	Philip Kelleher <pjk1939@linux.ibm.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/11] Rid W=1 warnings from Block
Message-ID: <20210406085223.GR2916463@dell>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
 <20210330132130.GK2916463@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210330132130.GK2916463@dell>

On Tue, 30 Mar 2021, Lee Jones wrote:

> On Fri, 12 Mar 2021, Lee Jones wrote:
> 
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Lee Jones (11):
> >   block: rsxx: core: Remove superfluous const qualifier
> >   block: drbd: drbd_interval: Demote some kernel-doc abuses and fix
> >     another header
> >   block: mtip32xx: mtip32xx: Mark debugging variable 'start' as
> >     __maybe_unused
> >   block: drbd: drbd_state: Fix some function documentation issues
> >   block: drbd: drbd_receiver: Demote non-conformant kernel-doc headers
> >   block: drbd: drbd_main: Remove duplicate field initialisation
> >   block: drbd: drbd_nl: Make conversion to 'enum drbd_ret_code' explicit
> >   block: drbd: drbd_main: Fix a bunch of function documentation
> >     discrepancies
> >   block: drbd: drbd_receiver: Demote less than half complete kernel-doc
> >     header
> >   block: xen-blkfront: Demote kernel-doc abuses
> >   block: drbd: drbd_nl: Demote half-complete kernel-doc headers
> 
> Would you like me to resubmit these?

It's been 3.5 weeks since these were submitted.

We are now at -rc6, so these should be merged soon.

Is there anything you'd like me to do to help?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

