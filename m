Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DF8C0ED5
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 13:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719197.1121810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51wg-0006eL-RN; Thu, 09 May 2024 11:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719197.1121810; Thu, 09 May 2024 11:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51wg-0006bM-O2; Thu, 09 May 2024 11:28:18 +0000
Received: by outflank-mailman (input) for mailman id 719197;
 Thu, 09 May 2024 11:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Rdn=MM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s51wf-0006bG-Nl
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 11:28:17 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39d2cdd5-0df7-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 13:28:15 +0200 (CEST)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-47eee2a2a87so253854137.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 04:28:15 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df56d1915sm7028931cf.87.2024.05.09.04.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 04:28:13 -0700 (PDT)
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
X-Inumbo-ID: 39d2cdd5-0df7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715254094; x=1715858894; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pOCjym16+RdPYo3c/L1pOeEY5AawlMiKptW3c5QhqG4=;
        b=QdqKImOzgiMUhsN2++MhctZJbT1nTQzEg4WjcQTX+UqEV9a5D8xYSy02+CGC+ZvQZG
         3FZ95NWSIEAJNEHcxw4amYnHjJLVX7jMYj0dsUnHvTjTcbtjpiBa08amqpunSsZ5ua7d
         JHeLs7QIWHNElL0Z3+k8gyJVpfSqYOFC+n6+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715254094; x=1715858894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOCjym16+RdPYo3c/L1pOeEY5AawlMiKptW3c5QhqG4=;
        b=BaAfv7xJspjsKC+CWcRtKoVhiVYH82G4fUQF3BXuB4iKOL4cOU+qaUW7weEgGK4UwE
         7KYdZxXnezc0nFc0G7RFnQyXqJd7Z9ZeMeuAk3HvC1l7WpG4oxjEp+zaV/e+t62p98Sa
         kMRLsVeT3UpiQfj3Ya3RLhYxS0a7rAlNjGTdd1fLSJYw7SN6s55KiQmidF/KKRdkRa3N
         fIMVOQF2oR94yymq8K7cYMGggRrx+d7lQs0ZPQCgMTl3NypkOw1B2vvrhjTbYLFPNmlf
         Z/8vGER4UFCoNhq+EfYtMuCXr0RDVWk+ijhkzAiNtfRTDrJgl/AAYpwW2fmdblmHorpl
         UHYw==
X-Forwarded-Encrypted: i=1; AJvYcCW3VufR1wW+jstqTEdkEP4Vf76PppRhOoFQL2k6Z5A+V85L34TGY2NomnwG8e80qsVzYPWZSterPMWlbB4WPuSLV66esLrf08owsHdGa2s=
X-Gm-Message-State: AOJu0YxsMbo/MCXqonXrTIvMQchM7KMeQ1w6cCOwBichjXG7wogyb8qo
	lAFepdGtQQ3/yxjV/P38/0Sc4HQFa6LxSQ2lGI7L+fpNHd2cfxyyMChn3YrSbBw=
X-Google-Smtp-Source: AGHT+IEgPvSMBPtpv9kf4y2Uy8xaL+az55dduRrPZtkFAC8981a2BkpkRsshy4r9k4ZXa2J3cl8Geg==
X-Received: by 2002:a67:f405:0:b0:47c:1251:cf25 with SMTP id ada2fe7eead31-47f3c2dff19mr5223145137.12.1715254094428;
        Thu, 09 May 2024 04:28:14 -0700 (PDT)
Date: Thu, 9 May 2024 13:28:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Message-ID: <ZjyzTCOSeNvPq2Np@macbook>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
 <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
 <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org>
 <ZjyFxrvHJ04ZlBGg@macbook>
 <bd463f7a-eadf-441f-96e3-3a39f647f160@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd463f7a-eadf-441f-96e3-3a39f647f160@xen.org>

On Thu, May 09, 2024 at 10:50:56AM +0100, Julien Grall wrote:
> 
> 
> On 09/05/2024 09:13, Roger Pau Monné wrote:
> > On Wed, May 08, 2024 at 11:11:04PM +0100, Julien Grall wrote:
> > Also the interactions with the remote domain would need to be audited,
> > as the remote domain shattering the superpage would need to be
> > replicated in the mapping side in order to account for the changes.
> 
> ... I don't understand this one. How is this different from today's where a
> domain can foreign map a 2MB which may be using a superpage in the remote
> domain?

Hm, right, I was wrong with that I think, as long as proper references
as taken for the superpage entries it should be fine.

> >  Not sure all paths will be easy to
> > audit for preemption if it's more than relinquish_p2m_mapping() that
> > you need to adjust.
> 
> I thought about it yesterday. But I came to the conclusion that if we have
> any concern about removing 1GB foreign superpage then we would already have
> the problem today as a domain can map contiguously 1GB worth of foreign
> mapping using small pages.

Yeah, but in that case addition or removal is done in 4K chunks, and
hence we can preempt during the operation.

OTOH for 1GB given the code here the page could be freed in one go,
without a chance of preempting the operation.

Maybe you have to shatter superpages into 4K entries and then remove
them individually, as to allow for preemption to be possible by
calling put_page() for each 4K chunk?

Thanks, Roger.

