Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F4A67027
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:46:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918834.1323464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTWE-0004qu-DR; Tue, 18 Mar 2025 09:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918834.1323464; Tue, 18 Mar 2025 09:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuTWE-0004ot-Am; Tue, 18 Mar 2025 09:45:54 +0000
Received: by outflank-mailman (input) for mailman id 918834;
 Tue, 18 Mar 2025 09:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuTWD-0004oc-Ae
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:45:53 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c779cddd-03dd-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 10:45:52 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22580c9ee0aso92462885ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:45:52 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6ba6a08sm89745875ad.154.2025.03.18.02.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:45:50 -0700 (PDT)
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
X-Inumbo-ID: c779cddd-03dd-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742291151; x=1742895951; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kcJfDp1kubcY99CAFEQZKIb2NzMfq+WAAe4yqKYHOCc=;
        b=RnkXSIZhxawmSxZ/bMfWDcoCSbnwBu+EUfjsGKuJ64Ukv5DZTmJFWY9rfKkiYRG1VD
         hljFuvjMu3jcgAmOIrrxUwPulaKKr8q1gh4yb3Tfe+4gJl051JZe6s0ziw06XbL0wOAl
         ZaaVIlUgRiDbwUiUa66fQRgyJOiQykvFrQ+/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742291151; x=1742895951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcJfDp1kubcY99CAFEQZKIb2NzMfq+WAAe4yqKYHOCc=;
        b=CbKtGo55fw04Bq1uAJnLjGpus16dPZcDofhpFuP/kzQdgCui+t1VIfLMRJfFyLT2Ch
         HGvM1PJA6g1ux38F7ntu0/GRQd7AjrU2WchWF5bjJv9oR11e9JBQcPMWd8n5LpfKhWxD
         5d8zIAZJ9uIVnN+mNxgAZ6Gz3wzEIykJnA2sXjXwpxpKJKnVGe6jv++kQxFe7bbD59Nf
         LqPE2pTWz0zFJUEVAXCAbLQwl0GCjs8NCcKRQ1yEPo7nwkkhWvso+4uZEwuyC667ZoG5
         Pgvgt74e3JxeJzKY+Y5aaPo6NSKEGx9MbSTAryQB2mEkyfDTiIwE7rZvCjHph8pZguaJ
         kzfg==
X-Gm-Message-State: AOJu0YyFS06BzYmlPNdMxyKM9euLSzQRjW35bzDELsA4rwYBvJdBrLiw
	6pLPAwf+jNp26Aum0mfFmLEy8rfwCTyZTJ6atDbgIQqmiGDa/pqydvcYsdkTCyo=
X-Gm-Gg: ASbGncuKbj3gKxLgaxejEbGbPBv45JU4K+Iwtx0FE/tNhjOXX3YS/btXn2A2NvDDdyL
	a0DY8/LtgqsZvHzHR+u/yrGLXwGmkBfPOJYwGYQ7YYPYytcCHSnRIIk2e3E6R8Bz2qFcX1IrPgH
	eKEQbzgJ+69yh5pjrzWpMGKnGg9cfni7RXqU1C3X46RZWd7+osVHU43rsw4ZD1cTEbhqukxSUOn
	ehGkxaumHu3odWH0ygbMVEwWln3ms1IXpwptMUcD0oGWxgLFhbZxLBai46sEAXDKaB6F4htUJM4
	kHI1peUJZ2WPeC/dF/S2Kj+5sZD+8NpKZ2qWPquTKrdy1wn386vhFIscyTan3/j/KQ==
X-Google-Smtp-Source: AGHT+IHMCrjVI4/vxH0M4gpQacxLSnTx/w+Szvmxya4Gremt9U+7HyFU4Dxy1/3nFa3sL7LvgQeClw==
X-Received: by 2002:a17:903:1b27:b0:224:5b4:b3b9 with SMTP id d9443c01a7336-225e0af57d2mr181181745ad.33.1742291151114;
        Tue, 18 Mar 2025 02:45:51 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:45:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 7/8] automation/console.exp: do not assume expect is
 always at /usr/bin/
Message-ID: <Z9lAylFTyLA5SIzU@macbook.local>
References: <20250317121616.40687-1-roger.pau@citrix.com>
 <20250317121616.40687-8-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2503171647450.3477110@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2503171647450.3477110@ubuntu-linux-20-04-desktop>

On Mon, Mar 17, 2025 at 04:48:05PM -0700, Stefano Stabellini wrote:
> On Mon, 17 Mar 2025, Roger Pau Monne wrote:
> > Instead use env to find the location of expect.
> > 
> > Additionally do not use the -f flag, as it's only meaningful when passing
> > arguments on the command line, which we never do for console.exp.  From the
> > expect 5.45.4 man page:
> > 
> > > The -f flag prefaces a file from which to read commands from.  The flag
> > > itself is optional as it is only useful when using the #! notation (see
> > > above), so  that other arguments may be supplied on the command line.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Do you have a link to a successful Gitlab and Cirrus CI?

Yes.  They are here:

https://cirrus-ci.com/build/4981406134173696
https://gitlab.com/xen-project/people/royger/xen/-/pipelines/1719913362

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks, Roger.

