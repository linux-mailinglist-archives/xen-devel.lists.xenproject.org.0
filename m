Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260CAA73048
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929086.1331719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txldl-0004RT-C7; Thu, 27 Mar 2025 11:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929086.1331719; Thu, 27 Mar 2025 11:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txldl-0004Pi-8n; Thu, 27 Mar 2025 11:43:17 +0000
Received: by outflank-mailman (input) for mailman id 929086;
 Thu, 27 Mar 2025 11:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txldj-0004Fn-7N
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:43:15 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa54ba9b-0b00-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 12:43:14 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22622ddcc35so24559835ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:43:14 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-227811da9dbsm126788935ad.179.2025.03.27.04.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 04:43:12 -0700 (PDT)
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
X-Inumbo-ID: aa54ba9b-0b00-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743075793; x=1743680593; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5rX326vMt/Axc/TQkWmgoCc2dVeRmgvPE8s/wnC/VY=;
        b=jhejgIACcaXk6e188pJGJWG0rSGJn7VOYQ/WElGjWkCduqmaEsEqKnu6Hv3gKZ9x9Y
         UFf314ciyAmH8mbR9E8lZPf8qCf4jjfpvxfIns1b9/w2y4MT57N26VPBTLuNd/CJHd3f
         GQ94+62q/fEMY9bnZ5itnlg3rz0lHr8B84wOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075793; x=1743680593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5rX326vMt/Axc/TQkWmgoCc2dVeRmgvPE8s/wnC/VY=;
        b=cWFezEGZTHkC/mf5qwVO5A9MONXVxGvjMLycG6MqPL4kMYiv5obAExUEkjt4t4FfdG
         GJ5qEKr1x95QiDprp3te3G7wg+GujOtvocC9wjzlRWkws1xbt58/hp1Ay8Pr7y8ir9rS
         9DBjdsc9NvLRO+xzT5EUPSC6KNw5Sd+8WUm4aFAE4DshEpbI4V3qUosBrVZFlWul7Ck8
         LlNoloXnCnTPD/MoVGguoG6GOS7C2ak4EmssKA+LhUp4GcLb/lmwN/Zuons5syP8yabN
         I912VAcrZL6X4kSbGmlZVWZyg2XAhcM9WkhuGyw0Ejl3W7s7w/rR3fCanBS6J+BKB5dp
         H69w==
X-Gm-Message-State: AOJu0YzdiGnYhgC9QchDlH0kM3je5DxnjbhXplWLo7MieSuMyTsdEGyF
	qT7gDYuaqCIqZUsbuz5Wll1vv/sFlCUFnCxhol75/+C/rNvA6TKs2dHUCWXfYknURgVNYFjaYnl
	0
X-Gm-Gg: ASbGncs+7IwZOFmB5FPBIzx+kfMj3dvuFb9GenJn8bI8xKWyXVXqr9q9RFKjB+vct49
	Ww5vbtppSdp4qQeXQkBvlaSfYhXOgH/DL4ft9mVjs0ZpyQoflBtieb1t+MieNW0kcigBZtuf1Wz
	5kEhUnxs5ThDwt1SPU3YKDAWhvGu09lyNC4RmShclPRGUc5XClkRwOdqsd6JK049OH0IlC3G56/
	P3fYi/Lx4H1WGeyC7vH41iz/L3ovG93+NR2QNgDeDfwuEv5wxCY9QzgNOVXxob6cS42/l0YnAyc
	VPq5p+jvFeXo34iceE7Pfyb0iupRd2f8ePGXDpgFJ6ZZN/6yPQ==
X-Google-Smtp-Source: AGHT+IF8NkAvSQUkveGwCTT/MOBv3KhOK/3az4xErymcdNzD7U/5s0X0IfxTEmEfUsd2T0bIsgEcCQ==
X-Received: by 2002:a17:902:f684:b0:224:584:6f04 with SMTP id d9443c01a7336-228048b1ecfmr32609175ad.18.1743075792603;
        Thu, 27 Mar 2025 04:43:12 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:43:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
Message-ID: <Z-U5y3jaw1FeRO_X@macbook.local>
References: <b590b590-764a-4dfe-9e13-975122790329@suse.com>
 <Z-UToaPviR7b73iG@macbook.local>
 <307f7c6e-bb31-4c0a-890e-a21b7a4e178f@suse.com>
 <Z-UquDQHtnFMJ4se@macbook.local>
 <17ddf002-8305-4c14-8fbc-3c3be418bba2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17ddf002-8305-4c14-8fbc-3c3be418bba2@suse.com>

On Thu, Mar 27, 2025 at 11:54:09AM +0100, Jan Beulich wrote:
> On 27.03.2025 11:38, Roger Pau Monné wrote:
> > On Thu, Mar 27, 2025 at 10:24:02AM +0100, Jan Beulich wrote:
> >> On 27.03.2025 10:00, Roger Pau Monné wrote:
> >>> On Tue, Mar 25, 2025 at 08:17:04AM +0100, Jan Beulich wrote:
> >>>> Handling of both grants and foreign pages was different between the two
> >>>> paths.
> >>>>
> >>>> While permitting access to grants would be desirable, doing so would
> >>>> require more involved handling; undo that for the time being. In
> >>>> particular the page reference obtained would prevent the owning domain
> >>>> from changing e.g. the page's type (after the grantee has released the
> >>>> last reference of the grant). Instead perhaps another reference on the
> >>>> grant would need obtaining. Which in turn would require determining
> >>>> which grant that was.
> >>>>
> >>>> Foreign pages in any event need permitting on both paths.
> >>>
> >>> I've been wondering about this, and AFAICT the PV equivalent of this
> >>> function (the tail of get_page_from_gfn()) is much more limited in
> >>> that it just allows access to domain owned RAM or MMIO that has a
> >>> backing page (I expect mostly for the low 1MB?).
> >>>
> >>> However for HVM domains we allow to take references to foreign mapped
> >>> pages and taking references to MMIO pages is not permitted.
> >>>
> >>> Should the tail of get_page_from_gfn() also be adjusted to make use of
> >>> the newly introduced get_page_from_mfn_and_type(), thus unifying the
> >>> logic for both PV and HVM?
> >>
> >> There's no (proper) use of P2M types in PV, so I don't think using this
> >> function is viable for PV. In particular we'd never observe p2m_foreign
> >> in PV, if I'm not mistaken.
> > 
> > Indeed, p2m types are just occasionally faked for PV, like in
> > get_page_from_gfn().
> > 
> >>> Could possibly be done in a separate change, I'm just trying to
> >>> understand why we have this seemingly different handling for PV vs
> >>> HVM.
> >>
> >> The difference is because access to foreign pages was hacked in to work
> >> for PVH in a much different (and imo yet more hacky) way than it was
> >> made work far longer ago for PV. The crucial part of that is in
> >> get_page_from_l1e(), so get_page_from_gfn() isn't that relevant there
> >> (I think).
> > 
> > OK.  I'm kind of surprised we need foreign handling for HVM and not
> > for PV in get_page_from_gfn(), as even with specific handling of
> > foreign pages in get_page_from_l1e(), the former is used in a lot of
> > places that don't seem obviously tied or gated to a call to
> > get_page_from_l1e().
> > 
> > For example the XEN_DOMCTL_getpageframeinfo3 usage of
> > get_page_from_gfn() will have different results when used against a
> > foreign page depending on whether the caller is a PV or an HVM
> > domain.
> 
> Which imo is an unintended side effect of how foreign page support was added
> to p2m_get_page_from_gfn(). Considering what XEN_DOMCTL_getpageframeinfo3 is
> used for, I don't think foreign pages were intended to ever be observed there.
> A guest controlling another guest isn't assumed to be migrated, aiui.
> 
> I expect more uses of get_page_from_gfn() can be found where foreign pages
> better wouldn't have "success" returned. Yet any of this is mere fallout from
> some callers apparently needing that case to work, and hence why logic was
> hacked into there. Maybe get_page_from_gfn() should take another P2M_FOREIGN
> flag, which only callers caring about foreign pages would set?
> 
> Imo none of this is directly relevant for the patch at hand here - fast and
> slow paths differing is a problem no matter what. In fact I'm surprised no
> issues were ever reported that could be attributed back to that anomaly.

Sorry, indeed, I didn't meant to imply that your patch caused any of
this.  It's just weirdness that I've observed while looking into this,
and couldn't explain myself.  I think the change is fine, but I find
this slight behavior differences between PV and HVM confusing to say
the least.

IOW: I'm unsure why foreign pages need to be handled here
for HVM and not for PV.  As you say this is probably due to the
different implementation of foreign pages in PV vs HVM.  In any case,
such diverging behavior should be fixed in a separate patch (if it
does need fixing in hte first place).

Thanks, Roger.

