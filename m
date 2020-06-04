Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380D1EE2CB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 12:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgnSQ-0002Ow-BC; Thu, 04 Jun 2020 10:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EphU=7R=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgnSO-0002Or-OF
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 10:50:44 +0000
X-Inumbo-ID: 3d0a2df2-a651-11ea-81bc-bc764e2007e4
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d0a2df2-a651-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 10:50:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j10so5547653wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=nUFyO32duoOSfs+J/3Tj+DbYbB4ZRTeXA2objZH1viU=;
 b=KTty5MTz6rh24hiJjjvJpDqqqamqP00bb75wpNNsCRCfzgxMwgUJ7cpDCEXQYEOmKx
 mGXxY0+rhe0FbxIm1L0/YDS2DlOwVjptqARdnUwdy+EU63UsGO3meFwcK1+BQygg5vZf
 VI1mWZzCPeKx0F00OfegMeAEB0KmeilCeTwvGsXsC8dvzV1xBJv23MTzcJ3kNF8u/s4G
 7aQBqscvgTTPiX/OiS//Hfok2AfDIZKFLZ8q7fV4muvAJQwh/mJdAx0nW4zg+CDHjpKQ
 TeQOVxqUjsfWwb9WPLkXPrgFKhR6cSHv83ZBngFyz6W2uHQtLSZA9Ib72rPgiOauxeiy
 haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=nUFyO32duoOSfs+J/3Tj+DbYbB4ZRTeXA2objZH1viU=;
 b=eE+9C61pzENVryzuJ+FOtapDAqDY01yUzuygoqrySHY8QYqm4h3y/2mZgCloEeOA2t
 wFmfDKRSy4bUao/0QNv/lQL88nTGpZbKuoH0S3QIkuiHMJHPbrLI3SWFHnubYSrMaL9G
 Z9QMaVi8LcbRA22cJhhS0zjnBVIEfbjNMW2VvXKz8NbB2j1UgFf52IDve95djleXg3SM
 2wvmmpx/l/1ouBFKv9AUyOc8z7suwYx0fzguUfuTDFB3fUhQYca/5AHYLqI8fo+i2+gs
 mKoHv6wzhhwP7N6MTbXA+2Vsbpz4rCXxYdmlIvI+aF+6LSPg57ntrhPev1NxpXtui2gc
 ebdQ==
X-Gm-Message-State: AOAM5316A5xUneUDeE8z0444Fb8G/RoHXvRKps2dn+Mr4ifhGBQZ5Kjn
 84T061K29ZNjonAArqs9/wc=
X-Google-Smtp-Source: ABdhPJy5dPNM2tGSqf+FwA/Rxze+LaLDvtwAbx5siXV5WGg8ViuwjroM0J0giqPhKaVHi81yrxp5WA==
X-Received: by 2002:adf:a1c1:: with SMTP id v1mr3941049wrv.205.1591267843180; 
 Thu, 04 Jun 2020 03:50:43 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id d16sm6822665wmd.42.2020.06.04.03.50.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 03:50:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <1591224108-564-1-git-send-email-igor.druzhinin@citrix.com>
 <006401d63a44$a27349e0$e759dda0$@xen.org>
 <4d1da8eb-a06e-c97a-09a0-e84070dc5ec8@suse.com>
In-Reply-To: <4d1da8eb-a06e-c97a-09a0-e84070dc5ec8@suse.com>
Subject: RE: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT
 faults immediately
Date: Thu, 4 Jun 2020 11:50:40 +0100
Message-ID: <000f01d63a5d$fe3787f0$faa697d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKnLWBT9mNjQEOL+u7d2oiXq95SHgJRYkBUAnFt9OGnAEkYcA==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 04 June 2020 11:34
> To: paul@xen.org
> Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>; =
xen-devel@lists.xenproject.org;
> andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com; =
george.dunlap@citrix.com
> Subject: Re: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc =
NPT faults immediately
>=20
> On 04.06.2020 09:49, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Sent: 03 June 2020 23:42
> >> To: xen-devel@lists.xenproject.org
> >> Cc: jbeulich@suse.com; andrew.cooper3@citrix.com; wl@xen.org; =
roger.pau@citrix.com;
> >> george.dunlap@citrix.com; paul@xen.org; Igor Druzhinin =
<igor.druzhinin@citrix.com>
> >> Subject: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc =
NPT faults immediately
> >>
> >> A recalculation NPT fault doesn't always require additional =
handling
> >> in hvm_hap_nested_page_fault(), moreover in general case if there =
is no
> >> explicit handling done there - the fault is wrongly considered =
fatal.
> >>
> >> This covers a specific case of migration with vGPU assigned which
> >> uses direct MMIO mappings made by XEN_DOMCTL_memory_mapping =
hypercall:
> >> at a moment log-dirty is enabled globally, recalculation is =
requested
> >> for the whole guest memory including those mapped MMIO regions
> >
> > I still think it is odd to put this in the commit comment since, as =
I
> > said before, Xen ensures that this situation cannot happen at
> > the moment.
>=20
> Aiui Igor had replaced reference to passed-through devices by =
reference
> to mere handing of an MMIO range to a guest. Are you saying we =
suppress
> log-dirty enabling in this case as well? I didn't think we do:

No, but the comment says "migration with vGPU *assigned*" (my emphasis), =
which surely means has_arch_pdevs() will be true.

>=20
>     if ( has_arch_pdevs(d) && log_global )
>     {
>         /*
>          * Refuse to turn on global log-dirty mode
>          * if the domain is sharing the P2M with the IOMMU.
>          */
>         return -EINVAL;
>     }
>=20
> Seeing this code I wonder about the non-sharing case: If what the
> comment says was true, the condition would need to change, but I
> think it's the comment which is wrong, and we don't want global
> log-dirty as long as an IOMMU is in use at all for a domain.

I think is the comment that is correct, not the condition. It is only =
when using shared EPT that enabling logdirty is clearly an unsafe thing =
to do. Using sync-ed IOMMU mappings should be ok.

  Paul



