Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DAA5CAB8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908766.1315868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2OJ-0005d1-TN; Tue, 11 Mar 2025 16:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908766.1315868; Tue, 11 Mar 2025 16:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2OJ-0005ak-Px; Tue, 11 Mar 2025 16:23:39 +0000
Received: by outflank-mailman (input) for mailman id 908766;
 Tue, 11 Mar 2025 16:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ts2OI-0005ae-80
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:23:38 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ee41d3f-fe95-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 17:23:36 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac29fd22163so414726266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 09:23:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac29f5d2638sm368012966b.160.2025.03.11.09.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 09:23:35 -0700 (PDT)
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
X-Inumbo-ID: 2ee41d3f-fe95-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741710216; x=1742315016; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WpPpXJmI/SEixnjKAFHqu4EO/svQtAxWHpGumrSnDJA=;
        b=N9WT9Hq+MdsAEFcCV9wd+LElpWIM+PBv7lLH1GVo6fiu81maSoTJ1fctQgjlCRNrWb
         SntckVMpOwNwArOwHIbBcAS6cvObW7AhLW21aY2+MHLAzclruegsDmiQaGkHlQi8QI+w
         3/tfwxMREQD7Y0aphzctrnIvlqCMNwK6xRCvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710216; x=1742315016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpPpXJmI/SEixnjKAFHqu4EO/svQtAxWHpGumrSnDJA=;
        b=NivLlEfOrZ218wCXqhtjPBI9o5SB7wTPJbF2vVjChgr1kjGfRlpdIn4qXQehpLrjHY
         AcF5UVibvmKjMD05aSOJsj/iPO/SqQ8amb9gdUc88W4Yo+/34i7hzHb6mFr2E93+KCm3
         FWHgMFE12Daf2xBd1OrWplxvR9s8WlkqlNp5KZgdiGQMg+praAUtBO9UIFr7CLusIGHQ
         JgLqFBIkeLbOz5kCINylnD3SpMNV0IK+AtoeMgc+fy5FkZjcyL/WI89FKp3AnvWIuD5N
         7uKTFLbQQn2J4GKoyiUkYA5tfEWeHHJsMuEn3360RklOiWLoINlg8gX8Dmg3aZ1bQQ1I
         ObWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMKCSinX1cNHYVv3Mx+HuoA1Jk7SwYmJYC940beRthhptJA4IVeNMbRTrI5P6CjZnJNdCqGyv8xpo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4irT7nbKk3oiu0UoHqpS0/6GE0GuZPZ7Ov96DopU21DnstOmJ
	uqBwGm6L8IsaWnMilYKyZeYUhobb0Yk1/Go8JWizKxAhHJRNDIrhv7sjww1ONKU=
X-Gm-Gg: ASbGncthuZRvhPyyOsv++tvTRGCv/EEjv3BojdnTMBCoHpyqFk8mNWO92Uj6XFGvh0M
	BN7B1bm3p7cCH2iS7sWG3nGc9m6trmiicvOTsqUuzcfI9YRu42mRgqH1CILiW9uuQFAGc0GWaSr
	Uqw2pmaWy894Ohf24ohxz7VCOulcmBKtPnAd0I0C+GF7x/YoNQqBDKUe0IMbWgys2HPl8OXzHZC
	Q8ndMMlhUPoEmmBkQWtTBy4iQodfhbhgGLAJ5gwvCwMsmy62z4n60wgK6EqNOiObDSLWJSxSEpJ
	G6pMorwJvv6mG957vXX/we19i0EOra1YYPiPCmLPnXXzHoLKyCtAvw8=
X-Google-Smtp-Source: AGHT+IGkL1bWY+gYf1DyJ8T9mQDt5ejbNf64OwD2+bljX3Ityn2Ukf9maOhjHfig6Q/ow1BM/70Gow==
X-Received: by 2002:a17:907:7e9d:b0:ac2:b415:6768 with SMTP id a640c23a62f3a-ac2b4156827mr649972966b.48.1741710215643;
        Tue, 11 Mar 2025 09:23:35 -0700 (PDT)
Date: Tue, 11 Mar 2025 17:23:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
Message-ID: <Z9BjhklU61maFKjo@macbook.local>
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
 <Z9AwsrDBELe2UREz@macbook.local>
 <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>
 <Z9BZ-V8fWHOAwMJ7@macbook.local>
 <de418de2-b059-4f1e-92b0-42a236208b14@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de418de2-b059-4f1e-92b0-42a236208b14@suse.com>

On Tue, Mar 11, 2025 at 04:45:04PM +0100, Jan Beulich wrote:
> On 11.03.2025 16:42, Roger Pau Monné wrote:
> > On Tue, Mar 11, 2025 at 02:53:04PM +0000, Alejandro Vallejo wrote:
> >> On Tue Mar 11, 2025 at 12:46 PM GMT, Roger Pau Monné wrote:
> >>> On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
> >>>> The logic has too many levels of indirection and it's very hard to
> >>>> understand it its current form. Split it between the corner case where
> >>>> the adjustment is bigger than the current claim and the rest to avoid 5
> >>>> auxiliary variables.
> >>>>
> >>>> Add a functional change to prevent negative adjustments from
> >>>> re-increasing the claim. This has the nice side effect of avoiding
> >>>> taking the heap lock here on every free.
> >>>>
> >>>> While at it, fix incorrect field name in nearby comment.
> >>>>
> >>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >>>
> >>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Thanks.
> >>
> >>> I think it would be nice to also ensure that once the domain is
> >>> finished building (maybe when it's unpaused for the first
> >>> time?) d->outstanding_pages is set to 0.  IMO the claim system was
> >>> designed to avoid races during domain building, and shouldn't be used
> >>> once the domain is already running.
> >>>
> >>> Thanks, Roger.
> >>
> >> As a matter of implementation that's already the case by toolstack being "nice"
> >> and unconditionally clearing claims after populating the physmap.
> > 
> > I see.  Another option would be to refuse the unpause a domain if it
> > still has pending claims.  However I don't know how that will work out
> > with all possible toolstacks.
> > 
> >> However, I agree the hypervisor should do it on its own. I didn't find a
> >> suitable place for it. 
> > 
> > You could do it in arch_domain_creation_finished().
> 
> Except that better wouldn't be arch-specific.

Sorry, I should better have said: you could do it at the same place
where arch_domain_creation_finished() gets called in
domain_unpause_by_systemcontroller().

Thanks, Roger.

