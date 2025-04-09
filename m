Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8BA82270
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943840.1342463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SqA-0002pJ-AS; Wed, 09 Apr 2025 10:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943840.1342463; Wed, 09 Apr 2025 10:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2SqA-0002nl-5v; Wed, 09 Apr 2025 10:39:30 +0000
Received: by outflank-mailman (input) for mailman id 943840;
 Wed, 09 Apr 2025 10:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2m=W3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2Sq8-0002JG-Mq
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:39:28 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8774429-152e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 12:39:27 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3035858c687so5257370a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 03:39:27 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-306dd12b5eesm1231147a91.29.2025.04.09.03.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 03:39:25 -0700 (PDT)
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
X-Inumbo-ID: e8774429-152e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744195165; x=1744799965; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j527NqmxjCqp1u7Gu3iwQjA+YGeIMKNlX4I8/b5c8HU=;
        b=BrfFCvsm38fmgyqGSeFwuQRMQFcqoWj31733eOf3vaPXiWeudeKsTwxQLwIobBhbD8
         l/y+UX7qbOOVfXk7oUkWNbeCYREyZWcXWgdk2itw/jklDKwgq6CALzwNbeX/z7umUc0w
         QWWVn/AXNhQnYiljLNtProS15zo6osAv/hulE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195165; x=1744799965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j527NqmxjCqp1u7Gu3iwQjA+YGeIMKNlX4I8/b5c8HU=;
        b=tHsgSlzCEaMUEStf3y9nDXB6+0ehyjFKtx8yhprZ0g/X2iiXpnDwC4yB17OffAMaVT
         kveNgGAswpTIi+3trYpU0NGvt55jEZYzXyb1SFsQeUBynitznaCP7nfP4/NK7AJ/LZB8
         9R/Kl8+xQNeCU9ISp6NhYs0M+VJNYdzh/4UosbqdkjLnsj1B1jM/nuVsm7pQSfIRCm1m
         ngvYOQ/UjCgHb00T9cVUYLHfpZgR1V8H9ZDECVJQlwiVDxxVqV8vPi+HoKCBJROIzbNU
         HleeWaejWwdINVzehiYNNHWFo8baNljlwEPNeDL3oLhCdgR9Kkzqc2q3897qMDy6Ci9L
         rkdA==
X-Forwarded-Encrypted: i=1; AJvYcCXetaIBmE+BGWFTJZq6ZRh0JiV72ea8X2LM1UB84zva9dMGfhN0aAgxvQMlQrX9Lih91YaPUuIgzP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpsLBukGmZqfqPSV/MByPyFNsqP6bh3BTNvlENnyG0V/7QWdvB
	vdsITeSGDnvqRDsLhyq8IURoIZ+PLe8DGpqAqtNkYS0Q0x87KqAcXaHgF7i9uUYubhQZTTHK9nx
	G
X-Gm-Gg: ASbGncuHoNZ044YzPXmKPKuClaWB7JtKydAdE7qehvtLfVgfvoTq4U8MWQJ1ImxAa6P
	99smu6BHoLVfeULSCwmN4wZb/3s8UpaKwtM56x9c7MN729Y1ICtNTa0eQf7P47tOFB1wIo/4r/1
	tV1SNbzFzq7QL5oxY3IbDj+BSVzrEfSudHxqOcscj8biuL10uczJQBdmToExvUKG36P/g68xllz
	yR04PMCmzhpWnWBYxDKQKL97d/39LqV8m6eGNzTY6OjznNh/6tiTH+QilniT4DpkcUMLOkzOrYP
	B7dV0xaFvLldghqxabObAsDFWuHRuXuSul7fZyThU7OioK9pQbA=
X-Google-Smtp-Source: AGHT+IEowAyzRCUsJhdo42HBX78aSW+opqCT00Thm34zTuuP6P2v92XhZN5N6Q/YNh1hT+S3/z6aEg==
X-Received: by 2002:a17:90b:3509:b0:301:98fc:9b2f with SMTP id 98e67ed59e1d1-306dbb8b953mr3449545a91.1.1744195165520;
        Wed, 09 Apr 2025 03:39:25 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:39:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_ZOWAttoFNoFYCV@macbook.lan>
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
 <Z_Y4xFzaltr_XKO4@macbook.lan>
 <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>

On Wed, Apr 09, 2025 at 12:00:16PM +0200, Jan Beulich wrote:
> On 09.04.2025 11:07, Roger Pau Monné wrote:
> > On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
> >> On 08.04.2025 11:31, Roger Pau Monne wrote:
> >>> When running on AMD hardware in HVM mode the guest linear address (GLA)
> >>> will not be provided to hvm_emulate_one_mmio(), and instead is
> >>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> >>> always report an error, as the fault GLA generated by the emulation of the
> >>> access won't be ~0.
> >>
> >> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
> >> generally whenever .gla_valid isn't set).
> > 
> > Oh, yes, good catch.  I didn't notice that one.  We should move all
> > those checks to use a paddr rather than a gla.
> 
> Really that function could just be passed the offset into the page.
> 
> >>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> >>> when the guest is PV.
> >>
> >> This narrows checking too much, imo. For VT-x we could continue to do so,
> >> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
> >> the gla_valid flag visible there.
> > 
> > I don't think we should rely on the gla at all in
> > mmio_ro_emulated_write(), and instead just use the physical address.
> 
> But you can't validate a physical address against a CR2 value. And I view
> this validation as meaningful, to guard (best effort, but still) against
> e.g. insn re-writing under our feet.

But we have the mfn in mmio_ro_ctxt, and could possibly use that to
validate?  I could expand the context to include the offset also, so
that we could fully validate it.

Thanks, Roger.

