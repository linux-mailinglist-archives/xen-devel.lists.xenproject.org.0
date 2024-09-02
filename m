Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104E968B11
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788152.1197606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl91H-0004A2-NV; Mon, 02 Sep 2024 15:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788152.1197606; Mon, 02 Sep 2024 15:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl91H-00048E-KA; Mon, 02 Sep 2024 15:31:07 +0000
Received: by outflank-mailman (input) for mailman id 788152;
 Mon, 02 Sep 2024 15:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl91G-0003sM-Rl
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:31:06 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c4b1ec0-6940-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:31:02 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso3102983e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:31:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89890229b5sm577035866b.51.2024.09.02.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 08:31:00 -0700 (PDT)
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
X-Inumbo-ID: 5c4b1ec0-6940-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725291061; x=1725895861; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gGxtavDTNMBW1OZLzbdSmHTQIMoKsetx+bs/aYi8dI0=;
        b=DGNy4aTUypsL82T6KejX5C2RVV5mmi6caV1AwEJ9dF6KVf8sp5AsaJMRuIsnFJ70JP
         mTrXfvpKBP0Mm1Rc25I5zgNw02mTsGmyP8W2gFmiypGMvueoGexVEQQbtj7JioxcwQ34
         cV/YjP01RclxgTowdy6ZW+cWFokcPHGdcg3kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291061; x=1725895861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGxtavDTNMBW1OZLzbdSmHTQIMoKsetx+bs/aYi8dI0=;
        b=TyQ8LzO5lF8y7n9CEctx+S2yNWK1INhvujAwj2bJLhkt0B5ASmJ/XbppZqzh4k/ytW
         9u8Fvt7/8fHyEltYAFSUKmIfuBQDWCwA+EI9sHeMLUCrFqPHPlxEbC05ihM07NL+IPCO
         74IDbSm2Jlz8PM0griyEcz++GpQDM/GWLPS4LnciOxZzdtTTj6/4hPnP3j6C1Imutus8
         AksYg6sv5ZNGu6vh2JV6tB5WWQu7WHWtN7/xGZLzlNWFVNvPYiIm9fLdin43BwR8nubA
         upAdbqCAkOy5DXqjz6KjIiaLfcZ4xXNDVDUxP08vPk0LgjRFkMidJ17D2UcpQVOUXMzl
         VWHg==
X-Forwarded-Encrypted: i=1; AJvYcCWXYqqyLjPfSCfETPmAOlUwk2nwAhD/ORceHBcMF619mJ024dCPNjRs2vPlzNZ5OKHr4gEN/oJNvJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYIgoOsuvccP6ie7zbZBoNQkkmo86a0q1S2plivM30kjb1ZKKj
	80Ag6r3k7HAzMUl3u6bnmORHTq1tJ1KBe0s+arRmAZWMRRmzKSVGF9QRZvW0uCo=
X-Google-Smtp-Source: AGHT+IHuXDHZLZ5rulvMH/zozOy/fbO9vat72/RybL4Z1pZtsoZFNqKW/8BsPEFYCP3BBOUUqzjssQ==
X-Received: by 2002:a05:6512:1103:b0:530:e323:b1db with SMTP id 2adb3069b0e04-53546bb9ad6mr7181541e87.59.1725291060729;
        Mon, 02 Sep 2024 08:31:00 -0700 (PDT)
Date: Mon, 2 Sep 2024 17:30:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/cpu: revert opt_allow_unsafe from __ro_after_init to
 __read_mostly
Message-ID: <ZtXaM2ceAvKGrNqy@macbook.local>
References: <20240902150016.63072-1-roger.pau@citrix.com>
 <2a43b16e-8894-45a7-86d0-e78f52f18f34@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a43b16e-8894-45a7-86d0-e78f52f18f34@suse.com>

On Mon, Sep 02, 2024 at 05:16:05PM +0200, Jan Beulich wrote:
> On 02.09.2024 17:00, Roger Pau Monne wrote:
> > Making opt_allow_unsafe read only after init requires changes to the logic in
> > init_amd(), otherwise the following #PF happens on CPU hotplug:
> > 
> > ----[ Xen-4.20.0-1-d  x86_64  debug=y  Tainted:     H  ]----
> > CPU:    1
> > RIP:    e008:[<ffff82d040291081>] arch/x86/cpu/amd.c#init_amd+0x37f/0x993
> > [...]
> > Xen call trace:
> >    [<ffff82d040291081>] R arch/x86/cpu/amd.c#init_amd+0x37f/0x993
> >    [<ffff82d040291fbe>] F identify_cpu+0x2d4/0x4db
> >    [<ffff82d04032eeaa>] F start_secondary+0x22e/0x3cf
> >    [<ffff82d040203327>] F __high_start+0x87/0xa0
> > 
> > Pagetable walk from ffff82d0404011ea:
> >  L4[0x105] = 000000006fc2e063 ffffffffffffffff
> >  L3[0x141] = 000000006fc2b063 ffffffffffffffff
> >  L2[0x002] = 000000807c7ca063 ffffffffffffffff
> >  L1[0x001] = 800000006f801121 ffffffffffffffff
> > 
> > ****************************************
> > Panic on CPU 1:
> > FATAL PAGE FAULT
> > [error_code=0003]
> > Faulting linear address: ffff82d0404011ea
> > ****************************************
> 
> Hmm, I specifically looked at that code, but I can see how I screwed up.
> 
> > For the time being revert opt_allow_unsafe to be __read_mostly.
> 
> There's exactly one write that an AP can hit. Is it really worth moving
> back, rather than just doing
> 
> 	if (opt_allow_unsafe <= 0 && !cpu_has_amd_erratum(c, AMD_ERRATUM_121))
> 		opt_allow_unsafe = 1;
> 	else if ...
> 
> ?

I would rather move this logic so it's only the BSP that can set
opt_allow_unsafe, and the APs check they match the configuration set
by the BSP.  I think the resulting logic would be cleaner, but I
didn't want to do such a change as part of this fix.

Thanks, Roger.

