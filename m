Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10440903420
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737971.1144515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwBr-0007sR-Sa; Tue, 11 Jun 2024 07:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737971.1144515; Tue, 11 Jun 2024 07:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwBr-0007pb-Og; Tue, 11 Jun 2024 07:45:11 +0000
Received: by outflank-mailman (input) for mailman id 737971;
 Tue, 11 Jun 2024 07:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGwBr-0007Ml-6R
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:45:11 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87419b1d-27c6-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 09:45:10 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6b0783b6dd5so9547386d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 00:45:10 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b08d97d68csm3702646d6.128.2024.06.11.00.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 00:45:08 -0700 (PDT)
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
X-Inumbo-ID: 87419b1d-27c6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718091909; x=1718696709; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1wRuKc+h3Qi+BV6WCNGLiGZWMBEevyVedTfAwQoAfs=;
        b=jROWtDxHzHpv0dSNWW1VZRmIF3wG1AddvyqZEUZUMeZ2a31zDcVJtsgcbBD2rR9CbE
         550VTu9q4xUVOEFvSrn+U2iBVhNOY5gSRn84n9yg1i42TJae8V/QHtzA1ja/yDFxlqwX
         NGfmZqWUJalHChjuO//1DX2QbGIKButum+21A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091909; x=1718696709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1wRuKc+h3Qi+BV6WCNGLiGZWMBEevyVedTfAwQoAfs=;
        b=LOVKH1gR3P65QL5fEXAGbptwhsZetJnt4SW0tJJNp2hDyVS1346SfXW2Ov+sSgk1zF
         ytloDXrIakJUJHguwGP/0q81hvuXeCGM9bVG06E9kG3EOQKjn3/Dd6AYSkWJe3crxLHB
         2+DNqUTjjlERCVhDrFJKnycU7d0un7ZFZ8uu3GT6n0Feg0lt9G8+pKu7AxFFWtJXopKd
         Bz3i58wVeyg722htF1s46f44G6G0N6JUnY+4U5DqQ5+dC6iuVlpyXyp+GWRSmodLovoR
         o/1fPcGSB2x0R7PX90d7Pj4S4kq3XzbT17odrQT9H4B8rLVSTEZxJu0lwhL8w4yVRord
         Ks2w==
X-Gm-Message-State: AOJu0YxduKWF/hjaL49fu9umvcLrm35wZZvHrHzpCz2V3hXhPy3WrGLq
	eDeU8h1NoPv5I1+KkMEbekiOOyXzZfHX1WhDj2EsM5NfN0EfstIPqtUFUAN4DSE/U63v9VGCMPr
	S
X-Google-Smtp-Source: AGHT+IGHow0qnZOWhajZutBwKlWIj613DycXRylqVyrt4CX26nRsYL7wHi2Yw+9NWc8Bsp/kodgClg==
X-Received: by 2002:a05:6214:3389:b0:6ad:75ac:ab35 with SMTP id 6a1803df08f44-6b059b50ba0mr122931386d6.8.1718091909260;
        Tue, 11 Jun 2024 00:45:09 -0700 (PDT)
Date: Tue, 11 Jun 2024 09:45:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.19 v2] x86/pvh: declare PVH dom0 supported with
 caveats
Message-ID: <ZmgAg0Io0fSLl6s5@macbook>
References: <20240610085052.8499-1-roger.pau@citrix.com>
 <CA+zSX=Z3O_b44Jum3s9rRJ_h+BKjJzd11gAr249wFOxQCcFKEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zSX=Z3O_b44Jum3s9rRJ_h+BKjJzd11gAr249wFOxQCcFKEQ@mail.gmail.com>

On Mon, Jun 10, 2024 at 04:55:34PM +0100, George Dunlap wrote:
> On Mon, Jun 10, 2024 at 9:50 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > PVH dom0 is functionally very similar to PVH domU except for the domain
> > builder and the added set of hypercalls available to it.
> >
> > The main concern with declaring it "Supported" is the lack of some features
> > when compared to classic PV dom0, hence switch it's status to supported with
> > caveats.  List the known missing features, there might be more features missing
> > or not working as expected apart from the ones listed.
> >
> > Note there's some (limited) PVH dom0 testing on both osstest and gitlab.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes since v1:
> >  - Remove boot warning.
> > ---
> >  CHANGELOG.md                  |  1 +
> >  SUPPORT.md                    | 15 ++++++++++++++-
> >  xen/arch/x86/hvm/dom0_build.c |  1 -
> >  3 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 201478aa1c0e..1778419cae64 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >     - HVM PIRQs are disabled by default.
> >     - Reduce IOMMU setup time for hardware domain.
> >     - Allow HVM/PVH domains to map foreign pages.
> > +   - Declare PVH dom0 supported with caveats.
> >   - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
> >   - Increase the maximum number of CPUs Xen can be built for from 4095 to
> >     16383.
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index d5d60c62ec11..711aacf34662 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -161,7 +161,20 @@ Requires hardware virtualisation support (Intel VMX / AMD SVM).
> >  Dom0 support requires an IOMMU (Intel VT-d / AMD IOMMU).
> >
> >      Status, domU: Supported
> > -    Status, dom0: Experimental
> > +    Status, dom0: Supported, with caveats
> > +
> > +PVH dom0 hasn't received the same test coverage as PV dom0, so it can exhibit
> > +unexpected behavior or issues on some hardware.
> 
> What's the criteria for removing this paragraph?
> 
> FAOD I'm OK with it being checked in as-is, but I feel like this
> paragraph is somewhat anomalous, and would at least like to have an
> idea what might trigger its removal.

More testing is the only way this paragraph can be removed IMO.

For example I would be happy to remove it if dom0 PVH works on all
hardware in the XenRT lab.  So far the Linux dom0 version used by
XenServer is missing some required fixes for such testing to be
feasible.

Thanks, Roger.

