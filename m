Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A38A904F6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956188.1349674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53Cm-0007HC-Vz; Wed, 16 Apr 2025 13:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956188.1349674; Wed, 16 Apr 2025 13:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53Cm-0007E7-Sx; Wed, 16 Apr 2025 13:53:32 +0000
Received: by outflank-mailman (input) for mailman id 956188;
 Wed, 16 Apr 2025 13:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2cbw=XC=atlas.cz=arkamar@srs-se1.protection.inumbo.net>)
 id 1u53Cl-0006at-C1
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:53:31 +0000
Received: from gmmr-4.centrum.cz (gmmr-4.centrum.cz [2a00:da80:1:502::8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf83926-1aca-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 15:53:29 +0200 (CEST)
Received: from gmmr-4.centrum.cz (localhost [127.0.0.1])
 by gmmr-4.centrum.cz (Postfix) with ESMTP id 1869911C24B
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 15:53:28 +0200 (CEST)
Received: from antispam39.centrum.cz (antispam39.cent [10.30.208.39])
 by gmmr-4.centrum.cz (Postfix) with ESMTP id 162472023012
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 15:53:28 +0200 (CEST)
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
 by antispam39.centrum.cz with ESMTP; 16 Apr 2025 15:53:27 +0200
Received: from arkam (ip-213-220-240-96.bb.vodafone.cz [213.220.240.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id 8550480911AC;
 Wed, 16 Apr 2025 15:53:27 +0200 (CEST)
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
X-Inumbo-ID: 2cf83926-1aca-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1744811608; bh=mOJi3ULIs6S9O57TJ4KmwFOJWvhHrsVQiIfVdvf40wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RaHc1mWKy7sjYT1nowppfylloj95wowcY3xUi1JChHr5bx04qhidWORWHHsFkKB1U
	 0cJKHHuWcbiS//5UXr/keo+Wjhh6u+DlsKnaSb8zf0Z6zGz1bwkOawADRFYuAIA9Wa
	 az6jEzrxs5I0r5Ye/kIE/SGhz7lZ6u7XYsbs0UFo=
X-CSE-ConnectionGUID: Mln02DEDTaycyQEoKV972g==
X-CSE-MsgGUID: kN5ul4MZQEKiIS9TdEEyWw==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EHAAAqtf9n/03h/y5aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQAmBOAMBAQEBCwGJeZFxA4t2hjOGDoVbgX4PAQEBAQEBAQEBC?=
 =?us-ascii?q?UQEAQGFBwKLLCc2Bw4BAgQBAQEBAwIDAQEBAQEBAQEBDQEBBgEBAQEBAQYGA?=
 =?us-ascii?q?QKBHYU1U4JiAYN/AQEBAQIBIw8BRhALDQEKAgIfBwICVgaDFYIwAREjsVt6g?=
 =?us-ascii?q?TIaAmXccAKBI2OBKoEaLgGITwGFbIR3QoINhD8+gQUBhxiCaQSCLYEXlBCNO?=
 =?us-ascii?q?FJ7HANZLAFVExcLBwWBKUMDgQ8jTgUwHYF6g3OFNoIRgVwDAyIBgxV1HIRsh?=
 =?us-ascii?q?FYtT4MzgWgdQAMLbT03FBsGnHwBWSInOIElFcc5gxyBCYROnRUzl3ADkmQuh?=
 =?us-ascii?q?2WPcnmpM4FuAoINMyIwgyNRGY5HIctZgTICBwEKAQEDCYI7jWGBSwEB?=
IronPort-PHdr: A9a23:rB4ocBeT2Fj2wyLStyGyCRB0lGM+5djLVj580XLHo4xHfqnrxZn+J
 kuXvawr0ASTG92DoKge1beM+4nbGkU+or+5+EgYd5JNUxJXwe43pCcHROOjNwjQAcWuURYHG
 t9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oI
 xi7oxvdutMKjYd+Jao91AXFr3pIduhI2GhlOU+dkxHg68i/+5Ju7z5esO87+c5aVqX6caU4T
 bhGAzkjLms4+s7luwTdQAWW/ncSXX0YnRVRDwXb4x/0Q4/9vSTmuOVz3imaJtD2QqsvWTu+9
 adrSQTnhzkBOjUk7WzYkM1wjKZcoBK8uxxyxpPfbY+JOPZieK7WYMgXTnRdUMlPSyNBA5u8b
 4oRAOoHIeZYtJT2q18XoRejGQWgGObjxzlVjXH0wKI6yfwsHw/G0gI+Ad8ArXfarNv6O6gOT
 O+7w6vHwC7fb/5Vwzrx9JTEfgwjrPyKQLl+cdDRyU4qFw7dlFuft5DlPymI3esCqWeb6fRlV
 eGygGMgsQ5xuDuvyd0piobTnIIY0UrL9Tl9wIkvPt20UlJ0YN+9HZZWqiqVOJd4TNk4TGF0p
 CY11KcGuZijcSUWx5kqyBHRZfKDfoWL4hzuWumfLSl4iX9qZL+zmgu+/0a+x+HiVsS50UhGo
 jZFn9TOqnwByx/e59WHRPZg/kms3yuE2QPL6uxcLk05lLDXJ4Ahz7MwjJYfr1rPEy/slEj0j
 qKablso9vWm5uj9fLnquIOQO5VqhgzxLqgigMiyDOU+PwMTRWaU4/6826fm/UDhRbVKieA5n
 bfBvZDBIMQbura5AwhI0oY/8xq/Dymp0NAfnXQfI1JFfQuLj5PsO1HSOPD0EOuzj06wnzh1w
 fDGIqfhAojILnTZjLjgfK5x609ayAUt0dBS/51ZB7AbLP7tWkL8tMbUAgEnPwG02erqCtdw2
 psbWW2VA6+ZNK3SsUWP5uIqO+SDfpUVuDXnJPgg/fHul2Q0lkUBfamtx5QXc2q0EehnIkmBe
 3rjns8BEXsWvgo5VOHqi0ONUSBSZ3a0Ra4z/Ss7CIW7AofYRYCsgKeM0z2hHp1TfGxJFleME
 XLwe4WeR/gMcD6SItNmkjEcW7mhSosh1RWutQLhyrpnKOTU+jcCup3+ytd6/fDcmQs19TxuA
 MSRy3uNQH1snmMUWz8227hyoEN+x1qCyqV4gOJXFcZV5/xXVgc2L5ncz/Z1C9zqQALOYs+JS
 Eq6QtWhGTwxStMxw9kTY0dyAtmiixXD0jGpA78LjbOEGJ80/rjb33jrKMZx02zG27U5j1k6X
 stPMnWribR89wjLAo7EiEGZl6esdaQB0y/B7WmDzW2TvEFeTQF/S7nFXXEYZkvQt9j54VnCT
 7C2BbQ9LgRB0dKCKrdNatDxglRJWvHjNM3DbG2vhWe/GxKIy6iIbIrrYGUdwD7dBFILkg8N+
 3aGLRI+BiCjo23AEDNuCUjjY0T28elxsH+7VFM7zxmWb0190Lq44hwVhfOGS/MUxbIEozwsq
 y5pHFamwd3aEcaPpw1kfKlEe9My/E9H1X7Ftwx6JpGgK6FihlgDcwV4pk/hzQ93BZlAkcUxs
 nMqwxR9KbiC3FNCaTyYx5bwNaPTKmXo+xCvcaHWiRni14Oz87sT6Pkn42riuAquBgJ27HRj1
 8h90n2S/JzGAQMeF5XrXRBk2QJ9ouTibzUnr73d095vef29qDzL3tszLOI5zh+7OdxNZvDXX
 DTuGtEXUpD9YNchnEKkO1ddZLg6yQ==
IronPort-Data: A9a23:pAIPxq2XSE7AvH5IEPbD5Sxwkn2cJEfYwER7XKvMYLTBsI5bpzwOy
 GpJD2nTO/qDMzH9LdlwYNy/8R4PscSAy4I3HQI63Hw8FHgiRegppDi6wuUcGwvIc6UvmWo+t
 512huHodZ1yEzmF4E/wb9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtcAbeORXUXU5
 Lsen+WFYAX4g2ItbDpOg06+gEoHUMra6W5wUmMWOqgjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqfgqk
 YkQ6sbgIeseFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 PgecGohQzy/jvO90YuWTcpS15t5I5y+VG8fkikIITDxAvNjWpXfW/ySo9RV2isqm8UIFuS2i
 8gxNWQpNkmdJUcVZxFIV/rSn8/x7pX7WzRCq1uQrLAf6nTXxRc326qF3N/9I4TVFJwIxRfGz
 o7A12ffXwweaPmt8Bem81OX19PDsA7qZ51HQdVU8dYv2jV/3Fc7CxAIVF39q+O+hlW9SvpWM
 UlS8S0rxYAt9UivX/H8WROiqXKJtxJaXMBfe8UquF+lyafO5QudQG8eQVZpbN0gqd9zQDkC1
 UGAlNCvAiZg2JWcSmqY3rOVqy6ifCYSMGkObDMFSg1D5MPsyKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarT1VLImTW3vbDSUxU4oA7QWwqN6gJ/eZ7gbpaj6XDF4vtaaoWUVF+Mu
 D4Dgcf2xOQPC4yd0S+AWuMAGJm36Pufdj7Rm1hiG98m7TvFxpK4VdwOpmsjeQEzaJtCJmCBj
 FLvhD69LaR7ZBOCBZKbqarqYyj25cAMzejYa80=
IronPort-HdrOrdr: A9a23:O5DWYajdvBx/8rMLyYk+pBXutXBQXtcji2hC6mlwRA09TyVXra
 +TddAgpHrJYVEqKRUdcLG7Scu9qBznn6KdjbN9AV7mZniAhILKFvAA0WKB+Vzd8kTFn4Y36U
 4jSchD4bbLY2SS4/yX3DWF
X-Talos-CUID: 9a23:fUGq6mCSgmxYPLH6Ewxj8hZONu0JTnTMx2bpDkibNzc2ErLAHA==
X-Talos-MUID: 9a23:X4pqhQSXDz+mun8oRXTvomx/MJtN0Z2DK0EsqsQ6t+SpJBNvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.15,216,1739833200"; 
   d="scan'208";a="107915396"
Date: Wed, 16 Apr 2025 15:53:25 +0200
From: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>
To: Matthew Wilcox <willy@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	x86@kernel.org, xen-devel@lists.xenproject.org,
	linux-arch@vger.kernel.org
Subject: Re: Regression from a9b3c355c2e6 ("asm-generic: pgalloc: provide
 generic __pgd_{alloc,free}") with CONFIG_DEBUG_VM_PGFLAGS=y and Xen
Message-ID: <2025416135325-Z_-2VTPsw81jMgCm-arkamar@atlas.cz>
References: <202541612720-Z_-deOZTOztMXHBh-arkamar@atlas.cz>
 <Z_-lj5kCg084MXRI@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_-lj5kCg084MXRI@casper.infradead.org>

On Wed, Apr 16, 2025 at 01:41:51PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 16, 2025 at 02:07:20PM +0200, Petr Vaněk wrote:
> > I have discovered a regression introduced in commit a9b3c355c2e6
> > ("asm-generic: pgalloc: provide generic __pgd_{alloc,free}") [1,2] in
> > kernel version 6.14. The problem occurs when the x86 kernel is
> > configured with CONFIG_DEBUG_VM_PGFLAGS=y and is run as a PV Dom0 in Xen
> > 4.19.1. During the startup, the kernel panics with the error log below.
> 
> You also have to have CONFIG_MITIGATION_PAGE_TABLE_ISOLATION enabled
> to hit this problem, otherwise we allocate an order-0 page.

Indeed, the issue disappears when I disable
CONFIG_MITIGATION_PAGE_TABLE_ISOLATION.

> > The commit changed PGD allocation path.  In the new implementation
> > _pgd_alloc allocates memory with __pgd_alloc, which indirectly calls 
> > 
> >   alloc_pages_noprof(gfp | __GFP_COMP, order);
> > 
> > This is in contrast to the old behavior, where __get_free_pages was
> > used, which indirectly called
> > 
> >   alloc_pages_noprof(gfp_mask & ~__GFP_HIGHMEM, order);
> > 
> > The key difference is that the new allocator can return a compound page.
> > When xen_pin_page is later called on such a page, it call
> > TestSetPagePinned function, which internally uses the PF_NO_COMPOUND
> > macro. This macro enforces VM_BUG_ON_PGFLAGS if PageCompound is true,
> > triggering the panic when CONFIG_DEBUG_VM_PGFLAGS is enabled.
> 
> I suspect the right thing to do here is to change the PF_NO_COMPOUND to
> PF_HEAD.  Probably for all of these:
> 
> /* Xen */
> PAGEFLAG(Pinned, pinned, PF_NO_COMPOUND)
>         TESTSCFLAG(Pinned, pinned, PF_NO_COMPOUND)
> PAGEFLAG(SavePinned, savepinned, PF_NO_COMPOUND);
> PAGEFLAG(Foreign, foreign, PF_NO_COMPOUND);
> PAGEFLAG(XenRemapped, xen_remapped, PF_NO_COMPOUND)
>         TESTCLEARFLAG(XenRemapped, xen_remapped, PF_NO_COMPOUND)
> 
> Could you give that a try?

Yes, I could. Changing PF_NO_COMPOUND to PF_HEAD in those lines resolves
the issue for me.

Petr

