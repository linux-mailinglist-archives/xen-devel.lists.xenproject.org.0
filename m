Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6A7EB302
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632755.987149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uzq-0004Vq-I5; Tue, 14 Nov 2023 15:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632755.987149; Tue, 14 Nov 2023 15:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uzq-0004Te-Dn; Tue, 14 Nov 2023 15:06:34 +0000
Received: by outflank-mailman (input) for mailman id 632755;
 Tue, 14 Nov 2023 15:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GB7=G3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2uzp-0004TV-CW
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:06:33 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646db630-82ff-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:06:30 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5098e423ba2so8208474e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:06:30 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h17-20020a5d5051000000b0032d9523de65sm8019661wrt.48.2023.11.14.07.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:06:28 -0800 (PST)
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
X-Inumbo-ID: 646db630-82ff-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699974388; x=1700579188; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loyouxkDicSGwr5WgKmXnBg04CIKruHdycVQw/SC16M=;
        b=hgDbOKKjoBMObTMPHIJet4oO5bjhVJdQq1EnCj0/IFcBFjyG9UbaYSk2QP7zyH1JN5
         ovMjr4r2PvOX4nZJdy3CxbDqGvzQJAsk0e0DSbaXlohwH5D1uluBR8wLdq+yOT5rBN5A
         v2wzFkQlCF8Hj+2W3XBYWzeRNUY9HrfTz1Xfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974388; x=1700579188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loyouxkDicSGwr5WgKmXnBg04CIKruHdycVQw/SC16M=;
        b=H2kY905EA2m3WWvI1M11jB5IwvQdmCkOl8Gp5NJyZodmE8Tqjdij0bB9ILzewnPxTd
         81rManvi8FF6mAePvVn8u1eYmdijDFemLrMzUmn0NvSVyA8pIRio8ghRcUPO0gQNIkI6
         +9DCNhNJTW4a/4PLMCIPLrt+scWsdsEGFjhp4Lw4Qb/mRGk22Cbn4ScCLsOuCdIYPL8l
         Ly+by9At2yelL/pX+r18D48h2B6omUY7f8Yqg3NWsSC4ysaN7kQiOIfSosWZVUzdGlJg
         Th8LovPVFP+pi4EOFS6rGUlobrFgN31RursPZJWpHXMuOqzRIFt+t2TeyN0T/ghalXm7
         zM4A==
X-Gm-Message-State: AOJu0YybmapNL59jDlCLGV09fsZ8ytSlaZjUC+1DUcxQhxk0CLDjwSgF
	N8ULXaXzCwczQdouFtwY79y5zw==
X-Google-Smtp-Source: AGHT+IEQ5vn/s19I+3R1fAP+LvmTj2ru7gX1RLBVUAWfJnymuoMPrZ3rDGxZvGnAK/vgSxE2x+WvGg==
X-Received: by 2002:a05:6512:3e24:b0:505:73e7:b478 with SMTP id i36-20020a0565123e2400b0050573e7b478mr8992112lfv.16.1699974388381;
        Tue, 14 Nov 2023 07:06:28 -0800 (PST)
Date: Tue, 14 Nov 2023 16:06:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: On x2APIC mode, derive LDR from APIC_ID
Message-ID: <ZVOM8-hcigtGG0-t@macbook.local>
References: <20231113165023.5824-1-alejandro.vallejo@cloud.com>
 <ZVJifMqOR_3zINYZ@macbook.local>
 <5c4a237e-975d-f452-1261-f9fc10ef65c6@suse.com>
 <65536590.050a0220.eb28a.617d@mx.google.com>
 <f278f367-81cb-4a72-9303-23622dea3abd@suse.com>
 <fd99ea62-f011-4bcb-ba83-4698b5d267fd@citrix.com>
 <ZVOAEFoYFDp8lxCd@macbook.local>
 <2a340b44-9d3e-431f-94d6-e77e6145fc6a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a340b44-9d3e-431f-94d6-e77e6145fc6a@citrix.com>

On Tue, Nov 14, 2023 at 02:44:09PM +0000, Andrew Cooper wrote:
> On 14/11/2023 2:11 pm, Roger Pau Monné wrote:
> > On Tue, Nov 14, 2023 at 12:55:46PM +0000, Andrew Cooper wrote:
> >> On 14/11/2023 12:32 pm, Jan Beulich wrote:
> >>> On 14.11.2023 13:18, Alejandro Vallejo wrote:
> >>>> On Tue, Nov 14, 2023 at 11:14:22AM +0100, Jan Beulich wrote:
> >>>>> On 13.11.2023 18:53, Roger Pau Monné wrote:
> >>>> I don't think vlapic_match_logical_addr() is affected. The LDR's are still
> >>>> unique in the bogus case so the matching ought to work. Problem would arise
> >>>> if the guest makes assumptions about APIC_ID and LDR relationships.
> >>> The LDRs still being unique (or not) isn't what I'm concerned about. It is
> >>> the function's return value which would be wrong, as the incoming "mda"
> >>> presumably was set in its respective field on the assumption that the LDRs
> >>> are set in a spec-compliant way. There not having been problem reports
> >>> makes me wonder whether any guests actually use logical delivery mode in a
> >>> wider fashion.
> >> They likely don't.
> >>
> >> Logical delivery for xAPIC only works in a tiny fraction of cases
> >> (assuming correct topology information, which we don't give), and
> >> persuading a VM to turn on x2APIC without a vIOMMU is not something
> >> we've managed to do in Xen.
> > We do, in fact the pvshim (or nested Xen) will run in x2APIC mode if
> > available.
> > Linux >= 5.17 will also use x2APIC mode if available when running as a
> > Xen HVM guest:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8980fcb210851138cb34c9a8cb0cf0c09f07bf9
> 
> Yeah that's never actually been tested with 256 vCPUs.
> 
> A VM *must* have either a vIOMMU, or know (via whatever means) that
> there are no IO-APICs, or (via whatever means) that all IO-APICs can use
> reserved bits for 32k destination APIC ID support.
> 
> As it stands, this is just something which will explode on us in the
> future.  Hopefully the worst that will happen is a panic on boot.

Linux already accounts for this, vCPUs with APIC IDs > 255 won't be
used if there's no IOMMU or extended destination ID support:

https://elixir.bootlin.com/linux/latest/source/arch/x86/kernel/apic/apic.c#L1844

We should see how that goes once we allow APIC IDs > 255 for guests.

That makes me remember I should add an item to get extended
destination ID functional for Xen.

Thanks, Roger.

