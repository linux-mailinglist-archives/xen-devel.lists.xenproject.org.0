Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FA9A37EE6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889894.1298938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxin-00079t-HL; Mon, 17 Feb 2025 09:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889894.1298938; Mon, 17 Feb 2025 09:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxin-000770-Du; Mon, 17 Feb 2025 09:47:25 +0000
Received: by outflank-mailman (input) for mailman id 889894;
 Mon, 17 Feb 2025 09:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glRE=VI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tjxil-00076I-ER
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:47:23 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dac0fd7-ed14-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 10:47:22 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-22114b800f7so21023425ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:47:20 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7326be5e5absm3287777b3a.25.2025.02.17.01.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 01:47:18 -0800 (PST)
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
X-Inumbo-ID: 2dac0fd7-ed14-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739785638; x=1740390438; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dHpYTQcbWYD4ld66I9Jt3eBNR4AVjt9+y3PGOgAXdKQ=;
        b=adeMNBEyQcW83h2I7WVrE6tlGB71zYHDvJ8mjqnxH4QwN2tmXo/QR3V8eEAxerAF5/
         YP/97DZq2rqiRHUKmyiTmrrlDxzq8SgoCSaobz0SecaOqOmqpsdXvWyvh9blMIe2cSnG
         rzPnL1u5cxZr8qAsZLKGOW4iRPEDcnaKm44HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785638; x=1740390438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHpYTQcbWYD4ld66I9Jt3eBNR4AVjt9+y3PGOgAXdKQ=;
        b=fiyu1yvlW1yE6zYr6RtKEALnjY6ZJxTHsE0RXmUNU1kF77VUELMGpQYTFfYbg7ADq+
         CZHnV8n1gfR4YCEkwkxhTZuxP9mL8hEAJrLZjUWhG/f0m5CIR7NI6EwwnwnEJzSCjVHv
         I7w5FtfikkE3HEDTYr1Ajld42VuThWJFFfBtlIesHdlTSFtNJS94WBb01h5qLxrmSLjc
         ooK3v7+s2fM474hYz1DhwsxYdhakgd1yIW4fEsIkTbunHN+WOSgjFj770SJjFJqZUzIl
         h0bT6qAU94O1+iE5IyNTuJ+k1x/je0syza0fRGfOhOeTzVefL+cBZ7k1g+yP/XQTEJp7
         hesg==
X-Forwarded-Encrypted: i=1; AJvYcCV91diGGJqV4an/wQp2pLLHJeWtB0qrOkHa/FS/GYpkJh1k72idUr1/167ePIPaHoBwvgs9KdW6GrI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykgGYs0t8l1hd5S829Qf0lF6JuA+ibcOR7UFIKxGh3fhN5Q4Rm
	PG7KRY9tkRzbRwP5bE1PeB6kB6+yW1zfwfzdCo5SLS7Dox3Bi23bnc2PJtdVT5s=
X-Gm-Gg: ASbGnctWPMBjC6lAaMUyn0grFOVTLgzGPqmF2lkpq5hMIVoCF1m1nL/ygoZIovs+Fgj
	idFHRTxXMrtzJS4jfxJiugGodrSSl9jkuFVzmHyfe+m/AR1uFhCgHGI8Pz3yxY9a8g2HR72rTQo
	6JmTFHDrgUAhprx9rEqS6j3wkJRKqQMslY+xnS0f6KTe6Hd8L/K8IftT7z2VjLUlPyZGhm/u6HX
	ryi/cwZ7GvTx9dvj2Fc2EUDCWezxSAC2f4aGEDCpjX0ePi+qmzjCBlNCV2faww6d947nTc1sFZR
	HD7nUJD55IzTzCYzYOOE
X-Google-Smtp-Source: AGHT+IE17M9rj3xqd2dXT9g+mXYVXhwH1DWTvocdbJ4Kcfr4dSoYOriLOlF83jWLnLXyWAdwWxCqsQ==
X-Received: by 2002:a05:6a00:b92:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-732617e1054mr10498978b3a.13.1739785638523;
        Mon, 17 Feb 2025 01:47:18 -0800 (PST)
Date: Mon, 17 Feb 2025 10:47:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
Message-ID: <Z7MFoZAJw3ITRtUK@macbook.local>
References: <20250212153800.5159-1-roger.pau@citrix.com>
 <5bd90a77-eb82-438f-8f78-bfcf98507d58@suse.com>
 <Z69Ltd5cvwMuoYVa@macbook.local>
 <dc2bf5f6-d6cd-4f54-b981-5c44b72be57d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc2bf5f6-d6cd-4f54-b981-5c44b72be57d@suse.com>

On Mon, Feb 17, 2025 at 09:49:18AM +0100, Jan Beulich wrote:
> On 14.02.2025 14:57, Roger Pau Monné wrote:
> > On Fri, Feb 14, 2025 at 02:01:09PM +0100, Jan Beulich wrote:
> >> On 12.02.2025 16:38, Roger Pau Monne wrote:
> >>> There's also the following restriction noted in Intel VT-d:
> >>>
> >>>> Software must not program paging-structure entries to remap any address to
> >>>> the interrupt address range. Untranslated requests and translation requests
> >>>> that result in an address in the interrupt range will be blocked with
> >>>> condition code LGN.4 or SGN.8. Translated requests with an address in the
> >>>> interrupt address range are treated as Unsupported Request (UR).
> >>>
> >>> However this restriction doesn't apply to the identity mappings possibly
> >>> created for dom0, since the interrupt address range is never subject to DMA
> >>> remapping.
> >>
> >> Coming back to this also with your on-demand-p2m-populating patch in mind:
> >> I'm having some trouble following your comment on this quotation. The doc
> >> text is quite clear that page table entries must not point at the interrupt
> >> address range. They don't make an exception for identity mappings. And we
> >> don't know how the IOMMUs internally work, e.g. what sanity checks they do
> >> (and what failure thereof would result in).
> > 
> > My understanding is that address translation will never happen for the
> > interrupt address range, so whatever gets mapped on that range will
> > never be translated by the IOMMU.  Hence for the specific case here,
> > there will never be untranslated request that result in an address in
> > the interrupt address range, because translation is not done for input
> > addresses in the interrupt address range.
> > 
> > Sorry, hope the above makes sense, I'm having a hard time trying to
> > write down what I understand happens when the IOMMU handles accesses
> > to the interrupt address range.
> > 
> > Maybe a diagram would be easier.  This is my understanding of how
> > translation works in the IOMMU:
> > 
> >  input address -> translation -> output address
> > 
> > However input addresses that are in the interrupt address range are
> > not subject to translation, and hence there's no output address that
> > can be subject to the quoted VT-d paragraph.
> 
> I agree this is a possible (and plausible) interpretation of that text.
> I'm merely unconvinced it's the only possible one.

The AMD-Vi specification mentions the following regarding the
interrupt address range:

> 2.1.4.2 Interrupt Address Range
>
> Accesses to the interrupt address range (Table 3) are defined to go
> through the interrupt remapping portion of the IOMMU and not through
> address translation processing. Therefore, when a transaction is being
> processed as an interrupt remapping operation, the transaction
> attribute of pretranslated or untranslated is ignored.
>
> Software Note: The IOMMU should not be configured such that an address
> translation results in a special address such as the interrupt address
> range.

Which I interpret in the same way as VT-d: input addresses that belong
to the interrupt address range are not subject to translation.  Output
addresses that belong to the interrupt address range are not allowed,
otherwise the IOMMU will raise a fault.

I've added the following chunk to Xen:

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b84a..20aa46e305a3 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -480,6 +480,9 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( rc )
         panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
 
+    rc = rangeset_add_range(map, 0xfee01, 0xfeeff);
+    BUG_ON(rc);
+
     /* If emulating IO-APIC(s) make sure the base address is unmapped. */
     if ( has_vioapic(d) )
     {

And run a basic test on each server microarchitecture (AMD Naples to
Genoa, Intel Haswell to Emerald Rapids) available on XenRT, everything
seems to be OK, no IOMMU faults, but still running.

Would you agree to allowing mappings to the interrupt address range if
the above test raises no issues?  I know it's not every possible piece
of hardware out there, but it's quite good coverage.

IMO Xen should allow the creation of mappings on the interrupt address
range, otherwise I don't see how we can deal with Thinkpad issue.  And
this issue we known about, but sadly we have no visibility of what
firmware might put in that range.

Thanks, Roger.

