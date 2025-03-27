Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F129A72DE9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928936.1331573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkdb-0006VW-T1; Thu, 27 Mar 2025 10:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928936.1331573; Thu, 27 Mar 2025 10:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkdb-0006U6-QI; Thu, 27 Mar 2025 10:39:03 +0000
Received: by outflank-mailman (input) for mailman id 928936;
 Thu, 27 Mar 2025 10:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txkda-0006U0-Bm
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:39:02 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af23253a-0af7-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 11:38:56 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224171d6826so20807355ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 03:38:56 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3039e10b783sm1853477a91.22.2025.03.27.03.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 03:38:54 -0700 (PDT)
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
X-Inumbo-ID: af23253a-0af7-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743071935; x=1743676735; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxtHe4u5eCyaWIxQJjvAyCAim8X3pqotR+wuwkdJ0H4=;
        b=vPS9stMoWV7NcKH5Fds6HsGzEn8NHxkPFtSBZbhpuSw1ulTiXIOkssa08675Cnf0lx
         12z8elleaF62sRZPESYKM6tk2VwE3fRFzJKS7vsTzfE8OEalnfkCQ5Jo4Kv+u/WD/Ls9
         tAUDEhxHUv9pP6Pki5TQr+8EK16aD0IOn44TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743071935; x=1743676735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxtHe4u5eCyaWIxQJjvAyCAim8X3pqotR+wuwkdJ0H4=;
        b=aOdoRmIuhoFwtwPIdykd+l0CpVJqQ7XyUEnIM+DVVeeIMSt9u//Z9Zsf7lIKchIgaa
         6okOfv2um963bGgGRWvwXmeZ2uIuw6gZdpGyiASyAt1AAOzbjwuDXLoF9rcWGxVW+P9a
         0WsjiNupiNFuXzw+PlDS5M9HIsu5DuTa5pTJ8W8SEijykgDZMA/DEIS/okKhIMA9EZkl
         3bnvFH9l8yJKx88Kg9acx9Puzi2r1Bcm/y/nwcHqfhNpA279FTnl5HG7coULxZIYgSLa
         X1y/pwHPGJ+/ImrC7ewtSbXYiZDaLSDdmbfwuegN5heHSlRUtSI/eF5kn0MWT5NxfsUs
         NNeg==
X-Gm-Message-State: AOJu0Yy4AN3BnicY1/8OEq+l3bgq1APSXdnUJRya2KBz9pHkiyGpaFRH
	P8ktYTqGVxYQEpsEwz7pDCu7hXgg8QwCdrdmk+oaDM2H0y9nmjVN0iuWaEyPcHI=
X-Gm-Gg: ASbGncvpmaH33SSR64qQReaepQmgN3USi8GkLNexdX9IVvAjeG7qnZZLZhs8gpppuaz
	nSoa/5xtpr0ocs3myfwZABVHjMfbyqOEwM4Rv3gMYi9xNcE2KMO4u9UW9reOcUwMv+a0MIY/tbU
	SRO2ZvNffUab7lKttncmg67sYsTb6TCF81asRg/mThQblK9GzT/ilDMteoPAXn3m2LPEqWnCsc4
	P6athr2Ved1sNJjR8mqEkBkuK0XnNo2DRNMZKNs8SzyxrPg36YwwcuAMXzU0LF+qYva44YqYmyR
	MGWaclJ1JLhr1Y3pUzSmm5NGlFQiMw03vI/Yp48qmc0rm63mmQ==
X-Google-Smtp-Source: AGHT+IHwWzEcjXbRmozyPhM4mxFKrMiR6mwQQ/hRmz2tSBylI14BHxJAMBrRULE7h55lrG6lrApQDQ==
X-Received: by 2002:a17:90b:2e8d:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-303a7c5c9edmr4134777a91.6.1743071935097;
        Thu, 27 Mar 2025 03:38:55 -0700 (PDT)
Date: Thu, 27 Mar 2025 11:38:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/P2M: synchronize fast and slow paths of
 p2m_get_page_from_gfn()
Message-ID: <Z-UquDQHtnFMJ4se@macbook.local>
References: <b590b590-764a-4dfe-9e13-975122790329@suse.com>
 <Z-UToaPviR7b73iG@macbook.local>
 <307f7c6e-bb31-4c0a-890e-a21b7a4e178f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <307f7c6e-bb31-4c0a-890e-a21b7a4e178f@suse.com>

On Thu, Mar 27, 2025 at 10:24:02AM +0100, Jan Beulich wrote:
> On 27.03.2025 10:00, Roger Pau Monné wrote:
> > On Tue, Mar 25, 2025 at 08:17:04AM +0100, Jan Beulich wrote:
> >> Handling of both grants and foreign pages was different between the two
> >> paths.
> >>
> >> While permitting access to grants would be desirable, doing so would
> >> require more involved handling; undo that for the time being. In
> >> particular the page reference obtained would prevent the owning domain
> >> from changing e.g. the page's type (after the grantee has released the
> >> last reference of the grant). Instead perhaps another reference on the
> >> grant would need obtaining. Which in turn would require determining
> >> which grant that was.
> >>
> >> Foreign pages in any event need permitting on both paths.
> > 
> > I've been wondering about this, and AFAICT the PV equivalent of this
> > function (the tail of get_page_from_gfn()) is much more limited in
> > that it just allows access to domain owned RAM or MMIO that has a
> > backing page (I expect mostly for the low 1MB?).
> > 
> > However for HVM domains we allow to take references to foreign mapped
> > pages and taking references to MMIO pages is not permitted.
> > 
> > Should the tail of get_page_from_gfn() also be adjusted to make use of
> > the newly introduced get_page_from_mfn_and_type(), thus unifying the
> > logic for both PV and HVM?
> 
> There's no (proper) use of P2M types in PV, so I don't think using this
> function is viable for PV. In particular we'd never observe p2m_foreign
> in PV, if I'm not mistaken.

Indeed, p2m types are just occasionally faked for PV, like in
get_page_from_gfn().

> > Could possibly be done in a separate change, I'm just trying to
> > understand why we have this seemingly different handling for PV vs
> > HVM.
> 
> The difference is because access to foreign pages was hacked in to work
> for PVH in a much different (and imo yet more hacky) way than it was
> made work far longer ago for PV. The crucial part of that is in
> get_page_from_l1e(), so get_page_from_gfn() isn't that relevant there
> (I think).

OK.  I'm kind of surprised we need foreign handling for HVM and not
for PV in get_page_from_gfn(), as even with specific handling of
foreign pages in get_page_from_l1e(), the former is used in a lot of
places that don't seem obviously tied or gated to a call to
get_page_from_l1e().

For example the XEN_DOMCTL_getpageframeinfo3 usage of
get_page_from_gfn() will have different results when used against a
foreign page depending on whether the caller is a PV or an HVM
domain.

Thanks, Roger.

