Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BACA82147
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 11:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943702.1342363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2S1U-00023H-BO; Wed, 09 Apr 2025 09:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943702.1342363; Wed, 09 Apr 2025 09:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2S1U-00020f-7s; Wed, 09 Apr 2025 09:47:08 +0000
Received: by outflank-mailman (input) for mailman id 943702;
 Wed, 09 Apr 2025 09:47:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2m=W3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2S1S-00020W-7u
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 09:47:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 977aeb65-1527-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 11:47:04 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso1239874366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 02:47:04 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acaa1cb3d8fsm66954466b.106.2025.04.09.02.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 02:47:02 -0700 (PDT)
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
X-Inumbo-ID: 977aeb65-1527-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744192023; x=1744796823; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAI0Lj/7QofvEJEyvOUntjvPc6gepPg0bWYw4CwaBxU=;
        b=A46N3XsmNJLyMPZ6Pr5Oxm5rAXihLY6vWpYOnPc3be4EXtoYAbHRf2ZCS+MClp2b+L
         cqvOSxq+HFI7nDdcS6pVmxYYXDGKBimHBzCauvFgY0FuAJSih7ZkrAcneXAYojpxF689
         MYEG4jCx/KwOh7tan3sRhLb3TM1bXq6Trb91w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744192023; x=1744796823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAI0Lj/7QofvEJEyvOUntjvPc6gepPg0bWYw4CwaBxU=;
        b=MmMqyv8QbOVEs44NQb6eABLVhm0Pzz0qhpXspWcr4WbZDj2NFybBbY5ClGQzyMOFir
         WxOhOd6kU22kVWBVihF4DRHJzgtXe+vMLeuE5I5SfJRJNNovURA7YSoQleW8gU6D3OSP
         NluSn6lvAl397QiLYkDr+pgmM4cwsMlrm46S2z4mJXQRkrBGjkjf7EYuEiuYStjVGXk9
         igQCalLy2lC7yaUov0LcBKQ3O4hKdjEiI6fk2BWYmBYpivpjZDcl69GJ9yt0HZuQNDuI
         FgdvDrSmSN/bOFTsX9FyeoGUDR1u8k8DVVivDp4CXrA+exZoB7zeWVYSpWrSmvAVEK1o
         TOKw==
X-Gm-Message-State: AOJu0YwtbsjYjo9QmuTdv1b/SzUb98JoxwHjFlZpjqcRj8fIdOnnbykT
	8Rg8e12XnzaWaEdfxjJMJK+vQsFUw/Dv0jHCGIak5Q0w1jly9v9GVOqPfq2WDwA=
X-Gm-Gg: ASbGncsLdt3VwD0cQLoJb2hJyWMEQ5uMO5UtOHOYltkEd8iksknDxiyRUZR8vhDRqzR
	/sS7ipa3weg2/PhuhyWZmiUoWNpAEfG6Quf5FwxC1lIahf6Xfx0eibvjaXUZSzC2D0i47EkXZkl
	Lyao7kh92d9gV5HH0z6rEjtGtiTsvholkCpA+iGHGCzs4Lz+JYzWIadN+awkL95DTN6yyDUIDtP
	SFFErNqwkdJYDVrxw06MffN/XLuiLeM2OGFAjm9fvVnYt0AtXSBOO9QS+y+iTpfO/6qpgP1NytW
	YufSaBa+JJSxTO7M7WNKoDff73wvtJzgMBETExXWdssS1g==
X-Google-Smtp-Source: AGHT+IFbCNuJeWEAd5BMgruXrKEi+95Yk9ycwjDxRkzAOPAi9Iz+0tobYbeY5T9pJ/DrGAjIcFj2nQ==
X-Received: by 2002:a17:906:6a11:b0:ac7:e80a:7fc9 with SMTP id a640c23a62f3a-aca9b6628a5mr252871166b.31.1744192023345;
        Wed, 09 Apr 2025 02:47:03 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:47:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_ZCFTcrmnr0ihlg@macbook.lan>
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <13127adf-4feb-4039-b859-27d68bef751d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13127adf-4feb-4039-b859-27d68bef751d@citrix.com>

On Tue, Apr 08, 2025 at 03:00:28PM +0100, Andrew Cooper wrote:
> On 08/04/2025 10:31 am, Roger Pau Monne wrote:
> > When running on AMD hardware in HVM mode the guest linear address (GLA)
> > will not be provided to hvm_emulate_one_mmio(), and instead is
> > unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> > always report an error, as the fault GLA generated by the emulation of the
> > access won't be ~0.
> >
> > Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> > when the guest is PV.
> >
> > Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I think there are several bugs here.
> 
> We do get %cr2 reliably for PV and Shadow guests.
> 
> Intel EPT may or may not give us GLA.  e.g. writes for pagetable A/D
> updates don't get GLA.
> 
> Defaulting to ~0 isn't ok.  We need some kind of GLA-valid signal,
> except for HAP guests, it isn't even the GLA we care about, it's the GPA
> which identifies the MMIO region.
> 
> We shouldn't terminate the emulation if there's no GLA to check.  In the
> case that we don't have a GLA, we should translate the memory operand
> and cross-check the GPA.  We'll definitely have one of the two to hand.

I guess I will have to switch to a more complex approach for HVM and
use logic similar to hvmemul_write() to figure out the mfn, and
compare it with the fault provided one.

Thanks, Roger.

