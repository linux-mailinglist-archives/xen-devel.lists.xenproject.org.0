Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100DA2C3837
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37246.69503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmgc-0004C9-AC; Wed, 25 Nov 2020 04:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37246.69503; Wed, 25 Nov 2020 04:45:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmgc-0004Bk-6m; Wed, 25 Nov 2020 04:45:46 +0000
Received: by outflank-mailman (input) for mailman id 37246;
 Wed, 25 Nov 2020 04:45:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=al8A=E7=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1khmga-0004BZ-Ea
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:45:44 +0000
Received: from mail-qt1-x82d.google.com (unknown [2607:f8b0:4864:20::82d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03097ec4-8f92-4f73-bd0c-626decb9b687;
 Wed, 25 Nov 2020 04:45:43 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id t5so835477qtp.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 20:45:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=al8A=E7=zededa.com=roman@srs-us1.protection.inumbo.net>)
	id 1khmga-0004BZ-Ea
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:45:44 +0000
X-Inumbo-ID: 03097ec4-8f92-4f73-bd0c-626decb9b687
Received: from mail-qt1-x82d.google.com (unknown [2607:f8b0:4864:20::82d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 03097ec4-8f92-4f73-bd0c-626decb9b687;
	Wed, 25 Nov 2020 04:45:43 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id t5so835477qtp.2
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 20:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/+i1NuicU7Zmir8kXt8ybxJFulLsIkl2OPxPwAmEbCo=;
        b=NvnMVlQ3Br4hY8l2E+zSzIRD1sRtzZnn2ayc8KSNs+UYWSBODheOkOFhfHsqB+jH9m
         uXSHwaOQUtzeA/J6o/WjefoANTp8I1LWFxDMI6H1BkWs7zKYFCSRp3OaOSRIgNcsthky
         ZtEpvtIpWSykV9LlKm19yzsk6/0k1AyAeLkdhMH3mA2a0mlqqA2/Dy3u51jSsw4vyVtW
         fZwkeVltpCphT9Y5KiMFzJ/LPQKNlih9mrCDn2GeMWBKp3uUhGYTCW3OPKjkAlSM/Hao
         3j4yneIBd8gP+O06IortVVwnq2b3uhrUhvYXxC+8UtvQQYhH1D+RD3gRsxqR6aiWU2Pg
         BxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+i1NuicU7Zmir8kXt8ybxJFulLsIkl2OPxPwAmEbCo=;
        b=VLLgwI71lvvDOyjmzb3gerQJ8ibahP1BfhBuGDIJzVH0pXVin7r7sn1Xptn2d94sNF
         3E6QNXgd9sYH4tSiXP9+UWUqwjsxFU8wS5qDb/RNZLirm8pSAdRQjik18OPyP4MCH3D8
         kqISVOmzdW5I+Wrvo/dbLrJN7/KYK8aofnN9xoUrqmT5I+VRDmUVayyTAJV+jU94c17x
         FxlCAGEBcpY4Q9q3u8WaPK/WHclI0twRBpSd+XAthRTLvwgYAprSB1NR6HzSe6CHj3uV
         j9sk3J4YvNKXRi9XrQICq/MfMTBb0lrBhe8HLRHUEuomyKNs57zcmpUtiy5kkT8b2OV0
         WiOw==
X-Gm-Message-State: AOAM533Lhpr4aoa5JJ702zFqBdhiSUY66AWSEk6JCZN8h0zwuftqKq5q
	SpFmE0ae6DUZOKjZE59bpU5ferFj8mjFet16CuctUg==
X-Google-Smtp-Source: ABdhPJzTDxqVaHXAPv1xmBHDSFnPqV/aUe7gtto4xc8NqPt4KYLMSk7uVzIs/LyqoK13uHVi1R3hDnFe2FXvQXjxloI=
X-Received: by 2002:aed:32c7:: with SMTP id z65mr1476685qtd.266.1606279543420;
 Tue, 24 Nov 2020 20:45:43 -0800 (PST)
MIME-Version: 1.0
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com> <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
 <X73ghKgQEXLv2z2p@mattapan.m5p.com>
In-Reply-To: <X73ghKgQEXLv2z2p@mattapan.m5p.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 24 Nov 2020 20:45:32 -0800
Message-ID: <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
Subject: Re: Xen on RP4
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 8:41 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> On Tue, Nov 24, 2020 at 08:01:32PM -0800, Roman Shaposhnik wrote:
> > On Tue, Nov 24, 2020 at 7:37 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > Presently I'm using a 5.8 kernel with your patches and haven't seen
> > > graphical output under Xen with either boot stack.  I've confirmed fully
> > > operational graphics without Xen on Tianocore, I've confirmed operational
> > > virtual terminals with U-Boot and not Xen.
> > >
> > > I had been planning to wait a bit before moving to 5.9, but if that is
> > > the crucial ingredient I'll move early.
> >
> > We're still using 5.4 -- but it seems that the next LTS 5.10 is also functional.
> >
> > I can bet $10 whatever it is -- it is DT related ;-)
>
> Given how many of the pieces I'm assembling are alpha or beta level, I
> estimate a 50:50 chance on that.  Good odds it is device-tree, but good
> odds I grabbed a bad version of $something.
>
> I mostly wanted to know whether I was in completely uncharted territory
> and needed to wait for others to catch up, versus merely working in a
> situation where support is funky and I'm at an unknown location in
> charted territory.
>
> I'll be keeping the Tianocore setup available since Xen on ARM really
> /should/ allow ACPI...

I don't think you're in the uncharted -- so perhaps a bit of debugging left.

And, of course, alway feel free to compare what we do -- the image is
docker pull away.

Thanks,
Roman.

