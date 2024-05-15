Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017088C63DA
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722109.1125989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7B5g-0006co-V8; Wed, 15 May 2024 09:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722109.1125989; Wed, 15 May 2024 09:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7B5g-0006aP-Rz; Wed, 15 May 2024 09:38:28 +0000
Received: by outflank-mailman (input) for mailman id 722109;
 Wed, 15 May 2024 09:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqhY=MS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7B5f-0006LE-Vb
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:38:28 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e12df604-129e-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:38:27 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-43dff9b28f6so37824781cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 02:38:26 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54d85a0sm80129021cf.23.2024.05.15.02.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 02:38:24 -0700 (PDT)
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
X-Inumbo-ID: e12df604-129e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715765906; x=1716370706; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DV+GBFpznnQ0ghbtfomW5vQYJJo5lnkwSFr/X/117Oc=;
        b=hQDoic9o0Y6ZQVOCHum4QM89W9f4EnR/srWQW6Sql8cp2+WvZayH/B5+HKJi9uG/Wt
         QHXXqZlVZNrMkE4+84AtB4Of+P0Ru8id31sOZTTesZuJNSXibmoqyONW/3YZH83ucxjV
         Z6S4yB0L6f6C8x6Ux+qb55OdXG9N3Nme7NqX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715765906; x=1716370706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DV+GBFpznnQ0ghbtfomW5vQYJJo5lnkwSFr/X/117Oc=;
        b=s/S1lumTnnGfCTDAX4ZTFHajSXR1g8uFYsXo5nniMcrVKfoAfUavW/F8qokGhVrN6d
         nKylpgIEOmlJLbM1wHEnJcSWV0yHGFKGxMHdaNIo8ZU9M7voShJ3fertH/H3nukuDbud
         9ICceviEOvJ/iG7I6K/v5CstA7r/cbTZ3v+d7DDerUjt1ka30PjJKDHTOdBbT66smS8e
         OWlJ2CiqB+l8pDWG+dEO37X8vOkonGHqCfTZ6Sa2DtkE2slj8cJeUzaJFzfQ4H+U+3Fq
         8jUKvPaDea+f9vfENHNAH4jz+GJZUasOxy2mlHKcZiwyoTcfbJIAgj522I1Z8FAzbj9j
         Z5dA==
X-Gm-Message-State: AOJu0YxIea+nZyOS4xqy36K3Is83ZmWMjizGJ9Ep/z4my83K88bbwLIZ
	UJVUh8euu4Vc9V8ufx4OnQuQMvp8Um3sfYwG/wwVj2/wl4XCLqVi8lS3ycIN94g=
X-Google-Smtp-Source: AGHT+IE4qpNQLP7Qrdr/KkjUz/cXjiOCBegz/8tBIcUTDv91glNe6ed6KyqlrMXI0lTSXCDb2F45Rg==
X-Received: by 2002:a05:622a:490:b0:43b:14a:f9ac with SMTP id d75a77b69052e-43dfcdb68fbmr248721281cf.14.1715765904790;
        Wed, 15 May 2024 02:38:24 -0700 (PDT)
Date: Wed, 15 May 2024 11:38:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>,
	Elias El Yandouzi <eliasely@amazon.com>
Subject: Re: [PATCH V3 (resend) 14/19] Rename mfn_to_virt() calls
Message-ID: <ZkSCju4RicXRuAvu@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-15-eliasely@amazon.com>
 <ZkOHHtRPTqC4Zvnp@macbook>
 <df8cc51d-60ea-452b-809e-c75aab957929@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df8cc51d-60ea-452b-809e-c75aab957929@suse.com>

On Tue, May 14, 2024 at 06:22:59PM +0200, Jan Beulich wrote:
> On 14.05.2024 17:45, Roger Pau Monné wrote:
> > On Mon, May 13, 2024 at 01:40:41PM +0000, Elias El Yandouzi wrote:
> >> Until directmap gets completely removed, we'd still need to
> >> keep some calls to mfn_to_virt() for xenheap pages or when the
> >> directmap is enabled.
> >>
> >> Rename the macro to mfn_to_directmap_virt() to flag them and
> >> prevent further use of mfn_to_virt().
> > 
> > Both here and in the following patch, I'm afraid I'm unsure of it's
> > usefulness.  I'm leaning towards this being code churn for very little
> > benefit.
> 
> I expect this patch is a response to an earlier comment of mine. I'm
> rather worried that at the time this series actually goes in, un-audited
> mfn_to_virt() uses remain (perhaps because of introduction between patch
> submission and its committing). Such uses would all very likely end in
> crashes or worse, but they may not be found by testing.

I see, would be good to note the intention on the commit message then.

> > Also, I'm not sure I see how the patch prevents further usage of
> > mfn_to_virt(), as (for Arm) the existing macro is not removed.  If
> > anything I would prefer a comment clearly stating that the macro
> > operates on directmap space, and avoid the name change.
> 
> But Arm isn't switched to this sparse direct map mode, I think? At which
> point uses in Arm-specific code continue to be okay.

Right, it's just that Arm will have both mfn_to_virt() and
mfn_to_directmap_virt() which seems a bit confusing when they are
actually the same implementation.

Thanks, Roger.

