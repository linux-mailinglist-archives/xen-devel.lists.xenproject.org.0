Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8E89D9A5
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 15:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702435.1097433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruB5f-00043N-23; Tue, 09 Apr 2024 13:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702435.1097433; Tue, 09 Apr 2024 13:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruB5e-00041V-Vl; Tue, 09 Apr 2024 13:00:42 +0000
Received: by outflank-mailman (input) for mailman id 702435;
 Tue, 09 Apr 2024 13:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUYQ=LO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruB5d-00041P-QJ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 13:00:41 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa9e201-f671-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 15:00:40 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-434942fb16aso6292691cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 06:00:40 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 bw9-20020a05622a098900b004330090b874sm4591966qtb.95.2024.04.09.06.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 06:00:38 -0700 (PDT)
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
X-Inumbo-ID: 2aa9e201-f671-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712667640; x=1713272440; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jp7ePbOq5Too2kljLeo9eJtK4Q2BYrdPJ3bM0Q7O9yM=;
        b=gHrK5TESXZAdTdCEk7kTrgld94cT71HJ6FJNBT8Ui1wl0JWCEMy1WtrwPjam40i1F8
         eNYGhhN/IC1ZZ3X95ES/k9FtWjH/xUHozrRhDPHZ5XHdvS3Lj2vk0YmYxg/cxSOur2pp
         WCRZfTkcjnGXQ83hCkKiM4aNGFbX9/4YJm0/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667640; x=1713272440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jp7ePbOq5Too2kljLeo9eJtK4Q2BYrdPJ3bM0Q7O9yM=;
        b=ZspHL64pyyZ1Pi8myPpREgbDmpqo2i3x4dx6cdSshChQxmjqVvGfuycN/forM6wDVb
         obpQac9ipPvrNrqlB/l0Lqi7UpBtUByGXnrwYQ7Tb5BjWQikdV6DgRAGqMd8sxN6qXLe
         odr7+veLW/yq+A7gvgFeCTSOEJ0Ju9/G6GlFaZmIxTrihm05/F8kKFh0bW2OGxhts8+0
         smoYIH0xFuNkzsDcV+iJhIQltVzscsFclZpNUEh3TXlHWAhE6baaS7fPtLwjbwy1lGNU
         ckverHsoKN43fun8Qm2q4Y/YBlVYtQzevqBaIo22KPbeCsd+KOuWL1Z/6ny3ueK3lx5s
         mNrA==
X-Gm-Message-State: AOJu0YwSXsD+Sox1SdlTh/SZbjS9XZoxhhQEoC4W76QJrM5g7a/ShhoN
	LtQhvN01Zjl81DcBbo5xDbmCVWy+WOxq37ayn8btmZ7TihRPiNhta+cbMkrO+Jo=
X-Google-Smtp-Source: AGHT+IFasTIEvevMIuXbDVOua1018VNM7+linF2e1Ry4PD8OeNumaJOa+3cl2uhGEJEdTyA2NMl6lg==
X-Received: by 2002:a05:622a:1915:b0:432:b389:7c42 with SMTP id w21-20020a05622a191500b00432b3897c42mr13127697qtc.16.1712667638318;
        Tue, 09 Apr 2024 06:00:38 -0700 (PDT)
Date: Tue, 9 Apr 2024 15:00:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/alternatives: fix .init section reference in
 _apply_alternatives()
Message-ID: <ZhU79AYGpEUivzaO@macbook>
References: <20240409125046.60382-1-roger.pau@citrix.com>
 <c7d7452f-7a3c-4269-9e68-081e2c38aea1@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7d7452f-7a3c-4269-9e68-081e2c38aea1@citrix.com>

On Tue, Apr 09, 2024 at 01:56:16PM +0100, Andrew Cooper wrote:
> On 09/04/2024 1:50 pm, Roger Pau Monne wrote:
> > The code in _apply_alternatives() will unconditionally attempt to read
> > __initdata_cf_clobber_{start,end} when called as part of applying alternatives
> > to a livepatch payload.
> 
> When CET-IBT is active.
> 
> In practice this narrows the impact to ADL/RPL and SPR/EMR.

Oh, yes, forgot to add that.

> 
> > That leads to a page-fault as
> > __initdata_cf_clobber_{start,end} living in .init section will have been
> > unmapped by the time a livepatch gets loaded.
> >
> > Fix by adding a check that limits the clobbering of endbr64 instructions to
> > boot time only.
> >
> > Fixes: 37ed5da851b8 ('x86/altcall: Optimise away endbr64 instruction where possible')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> In hindsight I really should have tried livepatching when I was doing
> the IBT work, but that was also done under an embargo deadline.
> 
> I'm happy to tweak the commit message on commit.

Sure, please go ahead.

Thanks, Roger.

