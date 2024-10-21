Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB59A6D7E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823636.1237660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2ttg-0000dg-Kh; Mon, 21 Oct 2024 15:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823636.1237660; Mon, 21 Oct 2024 15:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2ttg-0000bp-Hm; Mon, 21 Oct 2024 15:00:40 +0000
Received: by outflank-mailman (input) for mailman id 823636;
 Mon, 21 Oct 2024 15:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2ttf-0000bj-Aq
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:00:39 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b746656-8fbd-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:00:38 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9362c26d8so9659288a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:00:38 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee10bsm211122366b.51.2024.10.21.08.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:00:35 -0700 (PDT)
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
X-Inumbo-ID: 3b746656-8fbd-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729522837; x=1730127637; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ULGMTaWk9o/AEQ73xekKUtrsfU2argESkvYLJDyNso=;
        b=YZQQzvnfeQxOYOVPs/INkBfHjJKFvVDx8Si2FYuqV28xN5OaeiEvG01SCTm4CPQIJc
         LDXrSV2m5dCOjURme0lcAhlFLBN9A47IjEPDz0yLW65gGKP8LyZwLJOb2qfKrqfRZswG
         naGmIIOvcU5DErlcpDLrzrz0VuHMWvAnIF0yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522837; x=1730127637;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ULGMTaWk9o/AEQ73xekKUtrsfU2argESkvYLJDyNso=;
        b=d3YBLdErpE1fNrw3g+dhoDV+9edT1VBlzbbBxSR+h2hlzP9spCMRXnxQn32DUqUi7j
         Sn4SZCXjTgyJ7PrfQLz1uqPLkTqR/aIqzzfzrZWPDF3HCj9yCkI1wRn7B6XVzzZdYj7E
         3mYrXOBKkRlnDs8Z9nIuZYjhaZqIcqrpTBCkUD5jnMr2uNjknhrOfx+bt/NTf03OP+Ln
         RMvRl65eppFB5jbeOTki4/y0CLuIrDYsKkk/mT1pjESSih6tn12iZ18hEWCxM5J97y4Q
         7IFOoSz5MLC2TSeg5xMvmIrteVDg0cJNN1h9TFgnfAzwOOy7az4zesPE45gVbkTbpcwn
         +65Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAwQ2F1FrK8ClILwM2QUdWnMqAn/ZXrDJqSMIX8ZOEso1bobyPJBsumIl43WhwEpJpZoc6JrZg7Ck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLXa0SI6y0focRcx2r+vK2seckHeV/nB9BZQ7HfaGLuDJIf/HQ
	7qxsXgZTJCudZPU1hG74UZEmdZc/ZcqhXPrLejl3IRB4VRKXr9piBhTq9Qp4yHiFo8eKD0tTp6J
	L
X-Google-Smtp-Source: AGHT+IG+q1h+4NzgzNFQayA78ik7NMSFYueExOLp3dTsCGZrX8ScjhZNN87Dz+Nb20PaCp1r/gF43Q==
X-Received: by 2002:a17:907:1c20:b0:a9a:a3a:6c48 with SMTP id a640c23a62f3a-a9a4c2c532fmr1806657766b.2.1729522835435;
        Mon, 21 Oct 2024 08:00:35 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:00:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Willi Junga <xenproject@ymy.be>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZxZskrKNuZB9etW9@macbook.local>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <10e0f567ab3be0eae4c6473326da3a6d369ba8ff.camel@infradead.org>
 <ZxZf4nHFhhfyMF12@macbook.local>
 <5970c852-8800-414a-83f9-66392bdbe016@citrix.com>
 <a43a44b86654e414907e44f4899761fe030b640a.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a43a44b86654e414907e44f4899761fe030b640a.camel@infradead.org>

On Mon, Oct 21, 2024 at 03:54:35PM +0100, David Woodhouse wrote:
> On Mon, 2024-10-21 at 15:51 +0100, Andrew Cooper wrote:
> > On 21/10/2024 3:06 pm, Roger Pau Monné wrote:
> > > On Mon, Oct 21, 2024 at 12:34:37PM +0100, David Woodhouse wrote:
> > > > On Fri, 2024-10-18 at 10:08 +0200, Roger Pau Monne wrote:
> > > > > When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
> > > > > repurposed to contain part of the offset into the remapping table.  Previous to
> > > > > 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> > > > > table would match the vector.  Such logic was mandatory for end of interrupt to
> > > > > work, since the vector field (even when not containing a vector) is used by the
> > > > > IO-APIC to find for which pin the EOI must be performed.
> > > > > 
> > > > > Introduce a table to store the EOI handlers when using interrupt remapping, so
> > > > > that the IO-APIC driver can translate pins into EOI handlers without having to
> > > > > read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> > > > > unconditionally when interrupt remapping is enabled, even if strictly it would
> > > > > only be required for AMD-Vi.
> > > > > 
> > > > > Reported-by: Willi Junga <xenproject@ymy.be>
> > > > > Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> > > > > Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
> > > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > Hm, couldn't we just have used the pin#?
> > > Yes, but that would require a much bigger change that what's currently
> > > presented here, and for backport purposes I think it's better done
> > > this way for fixing this specific bug.
> > > 
> > > Changing to use pin# as the IR offset is worthwhile, but IMO needs to
> > > be done separated from the bugfix here.
> > > 
> > > > The AMD IOMMU has per-device IRTE, so you *know* you can just use IRTE
> > > > indices 0-23 for the I/O APIC pins.
> > > Aren't there IO-APICs with more than 24 pins?
> > 
> > Recent Intel SoCs have a single IO-APIC with 120 pins.
> 
> And Xen offers a 32-pin one to guests IIRC. I should have said. 'you
> can just use IRTE indices 0-(N-1) for the I/O APIC pins'.

Indeed, my comment was about the hardcoding of 24 pins, as I recall
seeing IO-APICs with more pins.

> The point is the IRTE is per-device, unless the platform has more than
> one I/O APIC with the *same* requester-id.

Yup, just wanted to clarify whether there was a reason for you to
mention 0-23 explicitly, didn't mean to be pedantic (but possibly
sounded like that).

Thanks, Roger

