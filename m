Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB528CE586
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 14:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729522.1134710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUQ2-0005nU-16; Fri, 24 May 2024 12:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729522.1134710; Fri, 24 May 2024 12:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAUQ1-0005lz-Ta; Fri, 24 May 2024 12:53:09 +0000
Received: by outflank-mailman (input) for mailman id 729522;
 Fri, 24 May 2024 12:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LySr=M3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAUQ0-0005lt-F3
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 12:53:08 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90b266ac-19cc-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 14:53:06 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e6f33150bcso90738441fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 05:53:06 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a08ab81sm1542635f8f.39.2024.05.24.05.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 05:53:05 -0700 (PDT)
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
X-Inumbo-ID: 90b266ac-19cc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716555186; x=1717159986; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fv9tvMzcEEK8t6/deedDI7o04tn2bqSoB87nl6HbIC4=;
        b=bXCFHitsPnvm+imLzr4/yh5J9MG7duWNI6KPe8CNshThGJeMi/gMVJZoyrYoWjz9Zp
         9t10ptVTy9JoilK2Bushs8YufJR0xA1HrvraZZxh8RNOEM/IlVN3VdCMUi3tq7Skgm0q
         57Sb+LRzads2gNUsmj4rPsojVqLaoGKK8UCtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716555186; x=1717159986;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv9tvMzcEEK8t6/deedDI7o04tn2bqSoB87nl6HbIC4=;
        b=LddsE+K5auuyjVCiGBj8+kqeQwF4IbNCLVSZnM7+21+4BytLpg8YMWl5i38mNVzltq
         szN1LpKcOulTRImTlpwA0JhQD4tJ/nhN6hFVwmJDbwL5Ue71JzEM9GhiRSp8PGbpsaLw
         V3RaDBQXicVr3G6EnT05uhVCMVmKvF3muNIq2PdxV7+Sa9Zg8LOIF+OmmUvbahW93I4E
         Kp/vhWTcGXz4uSkEfq8qYUtWQRmf2QTarsPCUm5GN70+BpMO9cVyAsJEQVLNfXp+MDju
         qx0Tp72rVte9XLKhvwCQjAV1C+TgKOLFSTNQxj0wO+22bWdgil2uINDg4x4JaJfuc/RG
         wJDA==
X-Gm-Message-State: AOJu0YzT6raHBEyTXa+00LkJcLfAQJEQlXcO1d07aGTxE6oOwCZ5W80t
	Q9DIOYny/zq47td0qvo/1pS6BaPriyn2k4Wj9KctLyLQiFXBaYVO3wFP9eAyIwc=
X-Google-Smtp-Source: AGHT+IFw6JSGevYtv9reLfexATI1GsqRB+8/kqwEt5fP6ePiGiw1LNLd+1bLKYbQB/wOAjMnsTP3+Q==
X-Received: by 2002:a2e:84c6:0:b0:2d6:dba1:6d37 with SMTP id 38308e7fff4ca-2e95b073d7cmr14585991fa.11.1716555185531;
        Fri, 24 May 2024 05:53:05 -0700 (PDT)
Date: Fri, 24 May 2024 14:53:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/8] x86/vlapic: Move lapic_load_hidden migration
 checks to the check hook
Message-ID: <ZlCNsKmXKCFC4AZz@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9Xy7W30WWZlb6-@macbook>
 <a1f7a182-4cf2-4fd1-ba8f-5b12a34b1af0@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1f7a182-4cf2-4fd1-ba8f-5b12a34b1af0@cloud.com>

On Fri, May 24, 2024 at 12:16:00PM +0100, Alejandro Vallejo wrote:
> On 23/05/2024 15:50, Roger Pau Monné wrote:
> > On Wed, May 08, 2024 at 01:39:22PM +0100, Alejandro Vallejo wrote:
> >> While at it, add a check for the reserved field in the hidden save area.
> >>
> >> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >> ---
> >> v2:
> >>   * New patch. Addresses the missing check for rsvd_zero in v1.
> > 
> > Oh, it would be better if this was done at the time when rsvd_zero is
> > introduced.  I think this should be moved ahead of the series, so that
> > the patch that introduces rsvd_zero can add the check in
> > lapic_check_hidden().
> 
> I'll give that a whirl.
> 
> > 
> >> ---
> >>  xen/arch/x86/hvm/vlapic.c | 41 ++++++++++++++++++++++++++++-----------
> >>  1 file changed, 30 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> >> index 8a244100009c..2f06bff1b2cc 100644
> >> --- a/xen/arch/x86/hvm/vlapic.c
> >> +++ b/xen/arch/x86/hvm/vlapic.c
> >> @@ -1573,35 +1573,54 @@ static void lapic_load_fixup(struct vlapic *vlapic)
> >>                 v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
> >>  }
> >>  
> >> -static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> >> +static int cf_check lapic_check_hidden(const struct domain *d,
> >> +                                       hvm_domain_context_t *h)
> >>  {
> >>      unsigned int vcpuid = hvm_load_instance(h);
> >> -    struct vcpu *v;
> >> -    struct vlapic *s;
> >> +    struct hvm_hw_lapic s;
> >>  
> >>      if ( !has_vlapic(d) )
> >>          return -ENODEV;
> >>  
> >>      /* Which vlapic to load? */
> >> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> >> +    if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL )
> >>      {
> >>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
> >>                  d->domain_id, vcpuid);
> >>          return -EINVAL;
> >>      }
> >> -    s = vcpu_vlapic(v);
> >>  
> >> -    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
> >> +    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) )
> > 
> > Can't you use hvm_get_entry() to perform the sanity checks:
> > 
> > const struct hvm_hw_lapic *s = hvm_get_entry(LAPIC, h);
> > 
> > Thanks, Roger.
> 
> I don't think I can. Because the last field (rsvd_zero) might or might
> not be there, so it needs to be zero-extended. Unless I misunderstood
> what hvm_get_entry() is meant to do. It seems to check for exact sizes.

Oh, indeed, hvm_get_entry() uses strict checking and will refuse to
return the entry if sizes don't match.  There seems to be no way to
avoid the copy if we want to do this in a sane way.

Thanks, Roger.

