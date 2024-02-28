Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E386AC65
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 11:54:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686467.1068548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHZK-0004UJ-Uy; Wed, 28 Feb 2024 10:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686467.1068548; Wed, 28 Feb 2024 10:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHZK-0004Sj-S9; Wed, 28 Feb 2024 10:53:46 +0000
Received: by outflank-mailman (input) for mailman id 686467;
 Wed, 28 Feb 2024 10:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqYS=KF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfHZJ-0004Sb-Co
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 10:53:45 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3d461a8-d627-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 11:53:44 +0100 (CET)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-42e75559043so23467441cf.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 02:53:44 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 o6-20020ac85546000000b0042e637083b7sm4406140qtr.26.2024.02.28.02.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 02:53:42 -0800 (PST)
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
X-Inumbo-ID: a3d461a8-d627-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709117623; x=1709722423; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IELvhF5UbL2ab4kEVnUWT0FKk9lvIAUI7sawg12kAUI=;
        b=qUB6m/S7rf0mTYki+XwBUzFrfhxRhzFsmS+M4aD7iFbwl8S8LP5v1LO84YwWeK9Ge3
         84q7E9U05OcXXubUzoNzKD4LqoqJRK/CKii1jbwE1GCEJcFLrVMBtFDrqKBaqCr95SUI
         FWMVt64X/hgK4wr6eqp/vGPunK+1E3HaaIUnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709117623; x=1709722423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IELvhF5UbL2ab4kEVnUWT0FKk9lvIAUI7sawg12kAUI=;
        b=mKUGzSgCtf7UsO+Apo3WFqbhOHliPeozkujlVR5pnS3rUEUr2A0TX0TiH9pDrah3mC
         e80Yh1APKFZ1D5OC0YftUlDPUKR7eo7mB5j6P5ETf+gbrdfjdHsKZPiFr1Kj/bk2GFEO
         LAS/tPWCZ7K9QzRpHt75PXYDJShHltM8erakNzL5MmaB1SBJatNQZNbTPdgLblFvbMLl
         h4n4++rWsBaPMvtT44VAe3HpUS+XNxRL2fiZ5U0GRwk33Bk/9mhDDY1WFGr4a3vT3Ggm
         7kaqRbUhhiEOlUyzrvOiMyRYPe7j8ebvcBCCCqwZFky9BskbVxNkAlRSJXnqBKrBjUnS
         MwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwVMK0zGFDFpnkyVMXu8h5x8FdCM9Y4QdHZ+LhM7yCOSs3zym6cZclY6fusRiiGSgtUh0ZYmnGK8i6vemU1zUuYCpOea0FDSMrM0VSA1A=
X-Gm-Message-State: AOJu0YwAlj+fiI4d1XGeS0d824zQRVnE5voDp6oAgIlwAcSc4yDZqscG
	rMqYb+E+nRR54wEL9tYeaRMh+iaiiC+ngeH57VuU3sGoy6yHjNGHLnz0xAgI11E=
X-Google-Smtp-Source: AGHT+IHTCZPI5CFIphc/e97qp66O1hKmxtfW9gMoc6vkiYwH3cAhC427f812NDtWw3NCcnSLvnl6IQ==
X-Received: by 2002:ac8:7490:0:b0:42e:7036:9bef with SMTP id v16-20020ac87490000000b0042e70369befmr11259645qtq.38.1709117622975;
        Wed, 28 Feb 2024 02:53:42 -0800 (PST)
Date: Wed, 28 Feb 2024 11:53:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
Message-ID: <Zd8QtCwp75Phjluc@macbook>
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-2-roger.pau@citrix.com>
 <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com>
 <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
 <2f68276d-0b10-4cec-8636-5456314c194e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f68276d-0b10-4cec-8636-5456314c194e@suse.com>

On Fri, Feb 23, 2024 at 08:43:24AM +0100, Jan Beulich wrote:
> On 22.02.2024 19:03, Tamas K Lengyel wrote:
> > On Thu, Feb 22, 2024 at 5:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 22.02.2024 10:05, Roger Pau Monne wrote:
> >>> The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
> >>> can be achieved with an atomic increment, which is both simpler to read, and
> >>> avoid any need for a loop.
> >>>
> >>> The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
> >>> instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.
> >>>
> >>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> albeit ...
> >>
> >>> --- a/xen/arch/x86/mm/mem_sharing.c
> >>> +++ b/xen/arch/x86/mm/mem_sharing.c
> >>> @@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct page_info *pg)
> >>>
> >>>  static shr_handle_t get_next_handle(void)
> >>>  {
> >>> -    /* Get the next handle get_page style */
> >>> -    uint64_t x, y = next_handle;
> >>> -    do {
> >>> -        x = y;
> >>> -    }
> >>> -    while ( (y = cmpxchg(&next_handle, x, x + 1)) != x );
> >>> -    return x + 1;
> >>> +    return arch_fetch_and_add(&next_handle, 1) + 1;
> >>>  }
> >>
> >> ... the adding of 1 here is a little odd when taken together with
> >> next_handle's initializer. Tamas, you've not written that code, but do
> >> you have any thoughts towards the possible removal of either the
> >> initializer or the adding here? Plus that variable of course could
> >> very well do with moving into this function.
> > 
> > I have to say I find the existing logic here hard to parse but by the
> > looks I don't think we need the + 1 once we switch to
> > arch_fetch_and_add. Also could go without initializing next_handle to
> > 1. Moving it into the function would not really accomplish anything
> > other than style AFAICT?
> 
> Well, limiting scope of things can be viewed as purely style, but I
> think it's more than that: It makes intentions more clear and reduces
> the chance of abuse (deliberate or unintentional).

I'm afraid that whatever is the outcome here, I will defer it to a
further commit, since the purpose here is to be a non-functional
change.

Thanks, Roger.

