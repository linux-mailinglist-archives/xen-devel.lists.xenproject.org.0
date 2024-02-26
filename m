Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A7866C95
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685327.1065864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWXK-0008J9-Us; Mon, 26 Feb 2024 08:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685327.1065864; Mon, 26 Feb 2024 08:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWXK-0008GY-Qh; Mon, 26 Feb 2024 08:40:34 +0000
Received: by outflank-mailman (input) for mailman id 685327;
 Mon, 26 Feb 2024 08:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reWXJ-0006Aw-GG
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:40:33 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4265e3d-d482-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 09:40:32 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512fce83ab5so747857e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:40:32 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 u23-20020a05620a121700b00787c6703539sm1911883qkj.90.2024.02.26.00.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 00:40:31 -0800 (PST)
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
X-Inumbo-ID: b4265e3d-d482-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708936832; x=1709541632; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5kyqQoWbLZsYMyfSMJ/kNXUWlgNoyKQjlC4kJIst9os=;
        b=B49y7yawvvSuUVx/gb899sgfC0Yz6DhcMWlWNWxyYTDGEtYy1VsoRxkDHh0oj5jytb
         Q2v7/zlxmMP0jSbE6wmVScM0YvXMCYqexiTM7y4kY/LErkGiLHYc7L3SrF2gPrZlbuIi
         GFlhnvZRpNbk+vfNOFn2icqxcjSeqxF6/iWUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708936832; x=1709541632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kyqQoWbLZsYMyfSMJ/kNXUWlgNoyKQjlC4kJIst9os=;
        b=TGIT4Ya1ZUSCurmM7dnoQL0HnHPp6xe/ku1fP+U0DpITNzyoE31GS2I7OfhFo/n8es
         BtMyLaX2aph7klMlj82TctdWaieX61iNLRwziu2BnZA1YYDwYvq9mLRKS6gjFSCF+mvL
         ahjfRp+UR7WFV8+gZNvBzj9KjJldCBgMh0dZCOK4dUNtd7zI5aSAtyL0DIdhNyl1taVQ
         c/DsC2xh3f3Owog89CItM/jNZ2XdOFjAA9EqmY1VE5T2Q4nUuVtcZV47Y+cpvrZqFfYE
         EJpdThnC7IStNjaWcmm9ZrQYQ4Z1MRHFQVXVtDggwBz5tr0CqNI05dzbPEQPjJOZIJxS
         WO8g==
X-Forwarded-Encrypted: i=1; AJvYcCXCadjba/3ukGIYp2qLRFXVFQu4m5SgZ0/9Rj2pECN3zhdOImISPjEU1dYF01aTZnqRnILMOqTgYPGCLFT6MPXvXdLBStaxf5tzGu2mpDM=
X-Gm-Message-State: AOJu0Yzr+819Pwo3kuMckaQ6kdeoKes3Y0R/bxgGrr+Y9ejkckXTyIir
	syYwetRGZWMO6aUIh5T3Xyg20N6h6ZJt7fTQ+viNH6M9nFfv9lRSBWOLarZcpsc=
X-Google-Smtp-Source: AGHT+IGYlrGjJgARVjSOmRn+owZS/BLi7nJzvRHrKvzbIiXhVhwvFkI6za/oBbroS3dcjufQP/ehwQ==
X-Received: by 2002:a05:6512:3a8e:b0:512:9c37:97fc with SMTP id q14-20020a0565123a8e00b005129c3797fcmr4564109lfu.57.1708936832336;
        Mon, 26 Feb 2024 00:40:32 -0800 (PST)
Date: Mon, 26 Feb 2024 09:40:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/5] xen/livepatch: fixes for the pre-apply / post-revert
 hooks
Message-ID: <ZdxOcc1O35lkTS4L@macbook>
References: <20231130142944.46322-1-roger.pau@citrix.com>
 <6143d253-1d5c-48c8-81b9-3652b21dd9c0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6143d253-1d5c-48c8-81b9-3652b21dd9c0@suse.com>

On Fri, Feb 23, 2024 at 11:48:10AM +0100, Jan Beulich wrote:
> On 30.11.2023 15:29, Roger Pau Monne wrote:
> > Hello,
> > 
> > The follow series contain a misc of fixes mostly related to the usage of
> > the pre-apply / post-revert hooks.  The norevert test is also fixed to
> > work as I think was expected.  Finally both the no{apply,revert}
> > tests are fixed to build properly, as the files where previously
> > unhooked from the build system completely.
> > 
> > I'm unsure how useful the apply and revert hooks really are, as without
> > calling the internal apply/revert functions the state of the payload
> > structure is quite likely inconsistent with the code expectations.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (5):
> >   xen/livepatch: register livepatch regions when loaded
> >   xen/livepatch: search for symbols in all loaded payloads
> >   xen/livepatch: fix norevert test attempt to open-code revert
> >   xen/livepatch: fix norevert test hook setup typo
> >   xen/livepatch: properly build the noapply and norevert tests
> 
> With the R-b-s that have arrived, could you clarify in how far these
> can be committed out of order?

All can be applied out of order, except for the last one, that's
"xen/livepatch: properly build the noapply and norevert tests" as
applying that will enable the tests in osstest, and those will fail
without all the previous adjustments.

I was about to send v2 with the requested changes, but will wait for
you to commit 2/5 and 4/5.

Thanks, Roger.

