Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124D7111BE
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 19:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539780.840989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2EVr-0000jU-6L; Thu, 25 May 2023 17:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539780.840989; Thu, 25 May 2023 17:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2EVr-0000gX-2f; Thu, 25 May 2023 17:12:31 +0000
Received: by outflank-mailman (input) for mailman id 539780;
 Thu, 25 May 2023 17:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN8z=BO=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q2EVp-0000gR-9F
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 17:12:29 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5231282a-fb1f-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 19:12:27 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-19edebe85adso969320fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 10:12:26 -0700 (PDT)
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
X-Inumbo-ID: 5231282a-fb1f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685034745; x=1687626745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8r4ODEq2+fLCDOwkU0I9uMZzQGsmacbN0I7clioZxg=;
        b=hlN2P2+4u+i/qYY499lGWAoyNY/dboRXOhJznjo9Nm7b8P8cZFR+c+0fCkL2rW25CD
         +hZ5J0+Ex4V3ScR/Xe/US44TDdlNVBI/xdsG40Ua1AXHZ442jMGry74GV2BfJq0J5IYV
         u7lelVrP8y0maLYqq75TrtqE6TS9ejRf7OJtZV90tVtzTBQB8gLHvCfhdBCn30nX09L2
         ck5ghpRGKOeV6W36JYgZ3HGXIa/8ueDRuLasr3XHrrQINIR3LY+3Qk5dm5YcGu7+Oweg
         Z/YZFzs6cf7vI3ciL7ceyYyXeS7nwrYpgRm5g9mSuxHdlnBWIXgAoNtf5095aMXhJIqs
         nB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685034745; x=1687626745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8r4ODEq2+fLCDOwkU0I9uMZzQGsmacbN0I7clioZxg=;
        b=ZWeXtbH6ew++Z41Tf06sSqUJaK28Uv8mHLr8MihTS3g7IyLuxz66X3kN92MPmzLnbD
         0DI4mhYdnueK+lTYrrJvxqCWslaFBsP/wrurAuLtjsHHPrN/lDt21vEhWtbOM7/st8H8
         zcpdMK2XRObL91Hj4tZeOUx7yzaDKMki2nDxwZUOfCh+k/pEyNgygH9YVluwGGMgVrI4
         UkCv/h8UWjizrc7SlREAo4xswxdMNiASUWfOyt2ueTHMETPe0as/0xgNOW9j3BKM6HGu
         yko6TJsaP6bfiPxBQ14k2QG6bPgEbSpmFi3w50mB4sbYAgVZeVYKTNhOpUt3fkHTu5qV
         j9lQ==
X-Gm-Message-State: AC+VfDwRMnjSoQ96sydMr/k5NPP8MLaxr6qi6c3e5Re9aW263A5e0NmX
	74e4mig0j99Dxpy5I1FpX0m2pVFb3PSqH0/QXwE=
X-Google-Smtp-Source: ACHHUZ7vTuIkb3AY2emRZbpynC4n929WANyhiAk9Z8pBe93X++8c36ksUYj3vhKz06//2+LG6F86/hC/ahr56+n93g0=
X-Received: by 2002:a05:6871:505:b0:19a:1694:f03f with SMTP id
 s5-20020a056871050500b0019a1694f03fmr1875889oal.47.1685034745319; Thu, 25 May
 2023 10:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-3-vishal.moola@gmail.com> <20230525085819.GW4967@kernel.org>
In-Reply-To: <20230525085819.GW4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 10:12:14 -0700
Message-ID: <CAOzc2pw63URkr08q4_VP+3wbRDnFjyUE8zxQrvQtnJ5kbtGhFg@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] s390: Use _pt_s390_gaddr for gmap address tracking
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 1:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, May 01, 2023 at 12:27:57PM -0700, Vishal Moola (Oracle) wrote:
> > s390 uses page->index to keep track of page tables for the guest addres=
s
> > space. In an attempt to consolidate the usage of page fields in s390,
> > replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> >
> > This will help with the splitting of struct ptdesc from struct page, as
> > well as allow s390 to use _pt_frag_refcount for fragmented page table
> > tracking.
> >
> > Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> > before freeing the pages as well.
>
> Wouldn't it be easier to use _pt_pad_1 which is aliased with lru and that
> does not seem to be used by page tables at all?

I initially thought the same, but s390 page tables use lru.

