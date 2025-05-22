Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6656AC10F1
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 18:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994380.1377410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8j3-0000nf-0k; Thu, 22 May 2025 16:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994380.1377410; Thu, 22 May 2025 16:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI8j2-0000kp-UJ; Thu, 22 May 2025 16:24:56 +0000
Received: by outflank-mailman (input) for mailman id 994380;
 Thu, 22 May 2025 16:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI8j1-0000kZ-G6
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 16:24:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b95ce56-3729-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 18:24:55 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a36f26584bso2915897f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 09:24:55 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a36c6eeaf8sm16032214f8f.48.2025.05.22.09.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 09:24:54 -0700 (PDT)
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
X-Inumbo-ID: 4b95ce56-3729-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747931094; x=1748535894; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+VbyuGdmApotSy2XpQAnkCSLpSiOSHc4CYf4Pg7DI7c=;
        b=WxorxFL4UBqknxGCD4rLygLH2Go7lczWR/euD/xh+7TZd3eU9E7/w1UQK4zif25nCK
         MOHNUfd8hccPXLhSU5HRUwAomMJ3ge9kK9GD9iU594TLCvGbBtzDl7lIzrDTxhTbjx3f
         VQadLTgcMmg8jVcP4uWyAOsHQ4LxyCnTMuNXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747931094; x=1748535894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VbyuGdmApotSy2XpQAnkCSLpSiOSHc4CYf4Pg7DI7c=;
        b=kEFMnmCi2svKHNOm9ym7Hph1emwojZa4irZIzxXrsUcThvDaIvNTgMbdRJQ/ggI5bD
         o670CaSqD+pofxsIL/fweFeFPkSH1YUA+cyCTRZBdcxJ0o5sS8U8dsDMJXdTHqkcFOYX
         eC+epoH0Xu9gHYTum8+WNnTUKijRa/e+YAFgTIyZaKUqBcM64JnRmcL2GEEAZrdtTxay
         sD+ejgcHQ/EngoccJ+5m6SVxp//5bh94j33PrbMxq/uobZaRth2HqzaiLAXVG5qS2qYG
         sspbBCzdF2dCpkv3TaQRDPGilICQfriBsg0Cj18ReDvYBqkggHkbz6h+C9FdrUHuiqnu
         GxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPTwCzPr8558L+gGU5cv1xbBT9tdiFkYMR7BFHl33gPUtZ4v5tpdTWCJPICex3SnuPMD6jN0JPxr8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3dl+xbDEaa9TzCYvjvfuoYieyuqmfXu+KnLh4LkQCuxJkDZU/
	kUjSdf6rDj77dL9rwO0Vh6Wvyp1nURXRmhdYRwHZoRnFzQcPAANucyKwf+JH4XjC4BY=
X-Gm-Gg: ASbGnctC+PAlfzHwwZnjGRd3vLnIK5feCSmrx7K0MyacpItDR+n7iWDxfckHkwlgvDn
	q8gBb4JdRu6wV0uGYmVWgAUGzdfF5i9pv1G1FEdLFp+hmPalMKT+8heiT1ljksXN9mULe34FUqj
	RW+CYCTv63Qwu+eajT+zE3zf9pmO6oaBry99dggKBlGO1chYp8X6l80Y8D4aELmkoNBu9oZI6ol
	7lhukHcuGjoGCJ72l65jK9KEt7YLjzqVNBZAoUUpIVnRcchQbIUjRwQ2DbQGF469dwLUOJkrcyY
	OEjcML3el6tYdOuo9ERg5snBfDYUIrPWiHPP29M00PZ5uIw17cUgL5kKNqAMUwbDy+guSzI0mRH
	jYiJfa9O+WmRekqwHhPI=
X-Google-Smtp-Source: AGHT+IF/W4PeCp4SCSV1X9CAzRjwurVV2GhB7kVIveKPIPmcVj7PEY+Bhw9c7zrQNLVv6YvD2388Fg==
X-Received: by 2002:a5d:64eb:0:b0:3a3:6e85:a523 with SMTP id ffacd0b85a97d-3a36e85a8e2mr15340386f8f.42.1747931094488;
        Thu, 22 May 2025 09:24:54 -0700 (PDT)
Date: Thu, 22 May 2025 18:24:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
Message-ID: <aC9P1T4hCKbAdTVB@macbook.local>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
 <3f274948-92bb-40c4-bcaf-7b538300140a@suse.com>
 <aa1105d7-758d-416e-84e7-c7492f4bd177@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa1105d7-758d-416e-84e7-c7492f4bd177@amd.com>

On Thu, May 22, 2025 at 11:44:24AM -0400, Stewart Hildebrand wrote:
> On 5/22/25 10:59, Jan Beulich wrote:
> > On 22.05.2025 16:03, Roger Pau Monne wrote:
> >> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
> >> index 26bb7f6a3c3a..39fd5a16a4aa 100644
> >> --- a/xen/arch/x86/pci.c
> >> +++ b/xen/arch/x86/pci.c
> >> @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
> >>  
> >>  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> >>  {
> >> +    /*
> >> +     * Refuse to map BARs at position 0, those are not initialized.  This might
> >> +     * be required by Linux, that can reposition BARs with memory decoding
> >> +     * enabled.  By returning false here bar->enabled will be set to false, and
> >> +     * bar_write() will work as expected.
> >> +     */
> >> +    if ( mfn_eq(start, _mfn(0)) )
> >> +        return false;
> > 
> > Is this really x86-specific?
> 
> No, I think Arm would benefit from this check too. I'm in favor of
> moving the check to common.

I think on ARM pci_check_bar() is more strict, and doesn't really need
this check since it explicitly checks whether the BAR falls inside of
a bridge window.

So unless you have a bridge window at mfn 0 this won't make a
difference.  And if you have a bridge window at mfn 0 you really want
to be able to position BARs at address 0.

Thanks, Roger.

