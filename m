Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19A7DBE14
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:38:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625320.974523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVHJ-0003KC-CM; Mon, 30 Oct 2023 16:38:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625320.974523; Mon, 30 Oct 2023 16:38:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVHJ-0003Hk-8q; Mon, 30 Oct 2023 16:38:13 +0000
Received: by outflank-mailman (input) for mailman id 625320;
 Mon, 30 Oct 2023 16:38:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxVHH-0002l9-LL
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:38:11 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5de12e3-7742-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:38:09 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so7593693a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:38:09 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 f26-20020aa7d85a000000b0053e3d8f1d9fsm6263960eds.67.2023.10.30.09.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 09:38:09 -0700 (PDT)
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
X-Inumbo-ID: b5de12e3-7742-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698683889; x=1699288689; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GAtWOQuGuBciqx4zP+O4k/vnaYzXMJngCsGOR6ayFhE=;
        b=EGxrAQAETufQd+V37qbzJvfCCbNTfpqcRDbLjM+wV3mRBbCSaxafwGy4kprekn1Sp2
         a/z6o7hYlLScv3VCXx+2wpi3Af3cGUR0K5l85bwgRjvawAFsegALKRvfEipImrTLmROj
         2Sclw0j/Oq3q/nPUHKO6I8dSfqIFcoXwl+PEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683889; x=1699288689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAtWOQuGuBciqx4zP+O4k/vnaYzXMJngCsGOR6ayFhE=;
        b=wC1/X+byrcIUY2Qre990T94gVDVK75MzitpriwkSI0BotG68seyIrp/9NpX760ySoM
         SHVCC2tBk+zj3defxLl3DlS+Za5qLsbfWu46upNkDCLVHzqyA5Gy8U/aAi21LllP1BbT
         R0uPCCR66Z6VFD94j4pD8UDRnVNCvCjcy6mZrX7f1X/hl2PhWoJbmI6hA8IEXxvV70hw
         1yBLjPbofz+hcIqRFE70M57NQWm/wv7mnF7n+DDpqv3ONSFdIr47K/sgH7+xMij5NRfH
         HGZ3/juO2TXbWkNwaQnl63JhuXamOTDEpWVOpt0XjVNLULvFV8t3kUIQ9IR8yJRMidiQ
         TfUA==
X-Gm-Message-State: AOJu0Yxx4zegUYkFzc9T3D40KxnasLOIVr7hcEybrs0q0nK0lzHdFA4H
	sxPeSSdUMA+5KfJez2UabOFhEA==
X-Google-Smtp-Source: AGHT+IFtVR07qq7+4xAQ2nAHMyO8TrEGfDIGvlruH4f0frpQpGmz64WTa6FrdQICYILM47+uu56DOg==
X-Received: by 2002:aa7:d351:0:b0:53e:467c:33f1 with SMTP id m17-20020aa7d351000000b0053e467c33f1mr9334254edr.8.1698683889559;
        Mon, 30 Oct 2023 09:38:09 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:38:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZT_b8BZH4AVOM3JG@macbook>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <6734e477-0aa5-c74c-4f64-02ca0415ae9e@suse.com>
 <ZT_VguxJLtOQeYK1@macbook>
 <db4eac3c-3ecf-d376-0a22-6cdcf6616f73@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db4eac3c-3ecf-d376-0a22-6cdcf6616f73@suse.com>

On Mon, Oct 30, 2023 at 05:34:48PM +0100, Jan Beulich wrote:
> On 30.10.2023 17:10, Roger Pau Monné wrote:
> > On Mon, Oct 30, 2023 at 03:32:56PM +0100, Jan Beulich wrote:
> >> On 24.10.2023 15:51, Roger Pau Monne wrote:
> >>> The current implementation of x2APIC requires to either use Cluster Logical or
> >>> Physical mode for all interrupts.  However the selection of Physical vs Logical
> >>> is not done at APIC setup, an APIC can be addressed both in Physical or Logical
> >>> destination modes concurrently.
> >>>
> >>> Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
> >>> IPIs, and Physical mode for external interrupts, thus attempting to use the
> >>> best method for each interrupt type.
> >>>
> >>> Using Physical mode for external interrupts allows more vectors to be used, and
> >>> interrupt balancing to be more accurate.
> >>>
> >>> Using Logical Cluster mode for IPIs allows less accesses to the ICR register
> >>> when sending those, as multiple CPUs can be targeted with a single ICR register
> >>> write.
> >>>
> >>> A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
> >>> box gives the following average figures:
> >>>
> >>> Physical mode: 26617931ns
> >>> Mixed mode:    23865337ns
> >>>
> >>> So ~10% improvement versus plain Physical mode.
> >>
> >> Nice.
> >>
> >>>  Note that Xen uses Cluster
> >>> mode by default, and hence is already using the fastest way for IPI delivery at
> >>> the cost of reducing the amount of vectors available system-wide.
> >>>
> >>> Make the newly introduced mode the default one.
> >>>
> >>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Do we want to keep a full Logical Cluster mode available?  I don't see a reason
> >>> to target external interrupts in Logical Cluster mode, but maybe there's
> >>> something I'm missing.
> >>>
> >>> It's not clear to me whether the ACPI FADT flags are meant to apply only to
> >>> external interrupt delivery mode, or also to IPI delivery.  If
> >>> ACPI_FADT_APIC_PHYSICAL is only meant to apply to external interrupts and not
> >>> IPIs then we could possibly get rid of physical mode IPI delivery.
> >>>
> >>> Still need to put this under XenServer extensive testing, but wanted to get
> >>> some feedback before in case approach greatly changes.
> >>
> >> Looks quite okay, just a couple of minor remarks:
> > 
> > Thanks.
> > 
> > Do we still want to keep the pure cluster mode?
> 
> I think we should keep it for a full release cycle or two.

OK, will make the requested changes and send v2 then.

Thanks, Roger.

