Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7AA1046C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 11:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871145.1282183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeK3-0000Gw-LF; Tue, 14 Jan 2025 10:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871145.1282183; Tue, 14 Jan 2025 10:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXeK3-0000Ep-HW; Tue, 14 Jan 2025 10:38:59 +0000
Received: by outflank-mailman (input) for mailman id 871145;
 Tue, 14 Jan 2025 10:38:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXeK2-0000Ej-CU
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 10:38:58 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1783583-d263-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 11:38:56 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso7521606a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 02:38:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9060042sm616105166b.34.2025.01.14.02.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 02:38:55 -0800 (PST)
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
X-Inumbo-ID: c1783583-d263-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736851136; x=1737455936; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHSX59mn7d2/0XriJfrNxm2tWLEgbWfxepi7Or6imqk=;
        b=rVZPdaISs36yNtst8k3MNBDAtn0ytiay8KIRl2CF7y2YME+muqe3InSf3AraoIgoT0
         1TWNIUJCjY9V9N/NS9UjJhea79kQzk2Dc8gQQheYGRtSnlrY0uNYPIiqataBIxzhNjrC
         w3qIxyWkgMm3VqQLVeJFuW0QmzX4q841F0PDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851136; x=1737455936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHSX59mn7d2/0XriJfrNxm2tWLEgbWfxepi7Or6imqk=;
        b=lE+owovih0SvyqetJvLOzuCeA/5szSlcoRAtEqnsb7chQ8B3MOz6cGwWsSgvFY4Xye
         yw9J+3egb2GUCwpPpkD6wD2KnQWV45bH7RUNvDbb8UFb59uYDJ+/ahzT1ZAtm+Kp9caB
         ObTvL37K1OKDmbUwuNBico72GvLszIp4ANWlh98xYDZLIyPWRULe46Tn1ZeHgi7h1XN/
         Mk2KBVSjqGHnE38ALfUVr4pHS+DIbgYvtXkiHKu2hfnjMb7kYhAMefng/mBxGHUIT6QZ
         isSq6JMrEcYueCQ7TJts7ddshTq3htd3Cli12MY9ASUIZi3F6Ls5RJmnsdnSO/15mVX0
         movA==
X-Gm-Message-State: AOJu0YwQy+VuGl5qYHulL6Ra142++coZPH3ASn+EnLe8gxIu6mEoQau+
	eoOVmjlyJN1cE0U62jQ1r4pTY4hsIS+7GB+tbIo+gPO8xmyjqx9F7CTBpLogE8I=
X-Gm-Gg: ASbGnctXTy9liyFAFDfg0wo1jF05Sm0I7JS5RGc9Hwzzgldtky2AVi1maSxbWEWONFP
	e10yjWzkiiA32vvZyMtB6b5d/2I8T2hIwrkBB9FTWK82D8HUzVDA7NCCwqBxlyL1TsicET4E+Sd
	7sAtz/+tc/2MMuNQ4tx4yi4h3KJKF1f8dqz6XJpZGEDeO8LPXLJcI9xfz6TrCWbHvwGuPmQNRKT
	ZcBSbQ9GV/+s9IN5Eo9KbcBkY0ZQpGmemitPw4AEYfmqGbjKS4QFEze/huukyopsA8=
X-Google-Smtp-Source: AGHT+IH1xS2EKDWf6Rz5eriCzytkoFdAOGrGwBglDK1tZvJ+azZ32D6CX700BAV2Kys8zZg8Qo0SlQ==
X-Received: by 2002:a05:6402:5194:b0:5d0:fb56:3f with SMTP id 4fb4d7f45d1cf-5d972e0e341mr59033855a12.12.1736851136083;
        Tue, 14 Jan 2025 02:38:56 -0800 (PST)
Date: Tue, 14 Jan 2025 11:38:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] intel/msr: Fix handling of MSR_RAPL_POWER_UNIT
Message-ID: <Z4Y-voWhP1aItFK3@macbook.local>
References: <0ac778dbcc7ab383447abe672225ff77b0d4802e.1736793323.git.teddy.astie@vates.tech>
 <Z4YvKdwtHjmJUVF3@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4YvKdwtHjmJUVF3@macbook.local>

On Tue, Jan 14, 2025 at 10:32:25AM +0100, Roger Pau Monné wrote:
> On Mon, Jan 13, 2025 at 06:42:44PM +0000, Teddy Astie wrote:
> > Solaris 11.4 tries to access this MSR on some Intel platforms without properly
> > setting up a proper #GP handler, which leads to a immediate crash.
> > 
> > Emulate the access of this MSR by giving it a legal value (all values set to
> > default, as defined by Intel SDM "RAPL Interfaces").
> > 
> > Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')

Nit: I think we usually use 12 hex character hashes, the above one is
11 characters long.

> 
> Hm, 

Seems like I've sent this too early.

I wanted to say I wasn't convinced this is a fix for the above, but I
can see how the change can be seen as a regression if Solaris booted
before that change in behavior, so I'm fine with leaving the "Fixes:" tag.

Thanks, Roger.

