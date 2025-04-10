Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A9A83A2D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 09:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944926.1343226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2lvg-0007ds-Fy; Thu, 10 Apr 2025 07:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944926.1343226; Thu, 10 Apr 2025 07:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2lvg-0007bU-D9; Thu, 10 Apr 2025 07:02:28 +0000
Received: by outflank-mailman (input) for mailman id 944926;
 Thu, 10 Apr 2025 07:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSg0=W4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2lvf-0007bO-Jh
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 07:02:27 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf835d1e-15d9-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 09:02:22 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-224191d92e4so4119255ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 00:02:22 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22ac7cb548fsm23188215ad.188.2025.04.10.00.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 00:02:20 -0700 (PDT)
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
X-Inumbo-ID: bf835d1e-15d9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744268540; x=1744873340; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nIlDlGZoOPo0FSLciho/xKqBchnnUIgomTvhOHYOKiU=;
        b=hnFtT2klO0DhT+WoOlVuKMG5Un7EcxO/Ixg8BAZ1NvT9kFrytPktayMzmKJn1AtqUq
         8kkvz0P53mQP6bMWY/ZonR6lTybZ4NRCnV2UqNze5xoLqbKcYcq/zd1IWf+B+pjlBhYV
         E8CmNE7JTxb5HIRzwOf5seO7kP8OabSxyv0hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268541; x=1744873341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIlDlGZoOPo0FSLciho/xKqBchnnUIgomTvhOHYOKiU=;
        b=rlVbkpxUfR8PjLZssEvTT4Yzx5Ll1GrfCla/9wXuUYhWCF3NCcEZ4l8AisybprQBhp
         NJgyre4RgHbRJ2Ndbyxif89SVAsELxEPf0INbtoOnVtCi30E7VknSs9HHfPBWw/oN1Ui
         G1fASBbRMTtatWp8c2Jgujdp1eBsoWW0NjVrPX9yTpPT7csYYc+ryDATUR+VnZhWUMi0
         6z3f3KISZEwfzX+e4XoBNm0K0RyZ0xATsuqCA2swVMIlwgNyrNUWsy5F9i4g4zAhpo2M
         i3nwQcNh3WO0SHZ1Nawt82x243M2FgKWymDHoyKXwz+rpge6xInJIyaiRCOw8vWjj1Mn
         m93A==
X-Forwarded-Encrypted: i=1; AJvYcCV5NYlIJtoWlZSHL9RVDmXF/3cbTMIAG3K1cD2zHhQb/EXjv5HMtgE5K6S4aZDnqvL8kBx32aIEBrQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc5cMMXzvfmGtq70130u16SzEXNKTZDWoViich9+k4W6pktvlG
	R69KLDck9A+z+LIT74HzyCHFhLC3ah6Wd2pBH5fgd/+l/h2Z1/UhtLEOJ9rmtJYCKjm7AkY6uS7
	R
X-Gm-Gg: ASbGncsCCRtv/kAzOCOKXWSa+B42r2m2hIHFRtdyN1NgcDmPWLHRNrJ7X+QqHtT83St
	IFtqP8sP8mK89LE/tZUgoS8SI+DBZ7gckD11fnDhcWB2YasvkM2sFuPx9eT2bIMAtNDLjtzZ/B1
	q/gJTv4SQdHIPCbcn9Qxw62/TsF5pChy/P32nhfr0TzBACsRNQBtdgLCa09/RboI7pqj8K/VK8c
	wSlQTUqxP4T57j65eL0VGrER6irkfii/dZxxXpyjj6RCF1H6gNlyyfMkewxQGNmt7ksvfIOHSfY
	tG9tGl++paCWWcoe6dLqjG1JulcmkB6szCKJJlPbW5HNbw==
X-Google-Smtp-Source: AGHT+IEZubcjnTwG6f72/mgMc+e2V/Jp0iKbn7Hh8xVxGvEZ2tuKJpWEEbugtX+IG7SuBEb+7tUeDA==
X-Received: by 2002:a17:902:ea04:b0:216:794f:6d7d with SMTP id d9443c01a7336-22b42c46babmr29899855ad.48.1744268540690;
        Thu, 10 Apr 2025 00:02:20 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:02:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_ds9nW2FE3S2wDr@macbook.lan>
References: <Z_Y4xFzaltr_XKO4@macbook.lan>
 <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
 <Z_ZOWAttoFNoFYCV@macbook.lan>
 <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>
 <Z_Z3PYYSBH3QWioF@macbook.lan>
 <8709e7af-5827-4c96-9f6b-1f548045040d@suse.com>
 <Z_Z9unJ-wS2dXxUV@macbook.lan>
 <b1e8e761-ddf9-4e4f-b5bb-624b2e7d012c@suse.com>
 <Z_aTYmiOLEfKTend@macbook.lan>
 <d0d6cdf2-e436-4a72-8a02-5ec331cc950d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0d6cdf2-e436-4a72-8a02-5ec331cc950d@suse.com>

On Thu, Apr 10, 2025 at 08:27:49AM +0200, Jan Beulich wrote:
> On 09.04.2025 17:33, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 04:08:47PM +0200, Jan Beulich wrote:
> >> On 09.04.2025 16:01, Roger Pau Monné wrote:
> >>>  As I understand the checks done in
> >>> mmio_ro_emulated_write() are to ensure correctness, but carrying the
> >>> access even when the %cr2 check fail wouldn't cause issues to Xen
> >>> itself?
> >>
> >> Well, "wouldn't" is too strong for my taste, "shouldn't" would fit. The
> >> checking is there to avoid guests playing games. Whether that prevents
> >> merely in-guest just-bugs or actual XSAs we can't know until we find a
> >> case where the game playing might make us do something wrong. I expect
> >> it's unlikely for Xen itself to be affected. But an in-guest privilege
> >> escalation would already be bad enough.
> > 
> > I see.  That was kind of my understanding of the checks.  At least on
> > HVM it feels a bit weird to handle r/o regions this way.  It would IMO
> > be more natural to use an hvm_io_handler, but that's maybe because I'm
> > more familiar with those.
> 
> I guess this would be an option; I assume it's the way it is because PVHv1
> inherited it from PV, and PVHv2 inherited it from PVHv1.

I have a draft with this approach, and it seems quite better, as it
allows to get rid of hvm_emulate_one_mmio() and the special casing
done in hvm_hap_nested_page_fault().

Thanks, Roger.

