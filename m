Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7D426A1BA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 11:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI6zE-0002PY-Jx; Tue, 15 Sep 2020 09:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TRuO=CY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kI6zE-0002PS-06
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 09:10:52 +0000
X-Inumbo-ID: 80e14922-effa-467a-bffc-af706c4efac8
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80e14922-effa-467a-bffc-af706c4efac8;
 Tue, 15 Sep 2020 09:10:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y15so2664019wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2020 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Fh1eJKjzOxmSnqKB709f4go553jMqdCynOAJWkWWJ2A=;
 b=iXgWJc4igLk7czSTbqF2SGXv3PPNcPoScrZvpJVo6UV/LQVFQl9cRDNFNfOA+9eyeg
 5DCxLQJLHJPV4OTKs6L64cjIK/YAEfsrj7z4ftOji9kdSYkSRFPZbJrMOGwhvMRnCEKG
 CMm1Qg3jLzBOi0XCqAmkda7a7kryCDnBB87S2ybFn2BYSnp+g2MCgpaxIzLDx+LLgxQQ
 vCy6fK7oHrzMjTOREmt+7PBSpe3ncjXrTWk6stvlVHsaJRyEw7zOOaearhVksVcCrT8m
 gg5BxmdIlzLmJMFVbRK1p6ELCaxXC5cPzUDHDxfoHdmWi29taUB6oawJC9CnOYwJECl4
 HsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Fh1eJKjzOxmSnqKB709f4go553jMqdCynOAJWkWWJ2A=;
 b=Z4EdbSHCR2xKMGYZ8ZQ5CbJNWxh9WAGoHxGQZ4WDVGlWUxvf6BqwcA3w+W1A75MMKg
 Qn6l0UelPqtUu21jC3Du0RBwzwPG4MNBy8vvKo6SpjrRQsVUh0MwaCj4CYo/yq4aEmfL
 kgf4XW/0c+dldy4m6K3m68OmUnTYa/QrnsTI/6r9p1Sv0TaNKYwPSjBJx1VOw7frtlaq
 LBWe00X9HkZM6+BpMqAClL2x4NhgpQg2qi/yY9ZwWcarimwy+iEMJIHIDy5sul4Y9vPr
 szHLSkHqRij/dZcYJ5QWdbLtZaVj+kGlKSY2KGf+9XG66+ZQX5y+SRJocj72hRD+f1Ch
 2s8g==
X-Gm-Message-State: AOAM532Yc03FT38cRfJ5DI10ajpz921nAaEgQHVpaq/9Xqx/6mr/GQvu
 Rt6OG4atU2Siz4WK1lcx84g=
X-Google-Smtp-Source: ABdhPJxWtpRMshLB5fOQKq2n8UjV6m7bKe6uo0KeIE7ZymW759VQKvxHvkaf4k/y8cKdQkGA2S+GVQ==
X-Received: by 2002:a1c:7f8b:: with SMTP id a133mr3817897wmd.155.1600161050107; 
 Tue, 15 Sep 2020 02:10:50 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id c14sm24410849wrv.12.2020.09.15.02.10.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 02:10:49 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "'Wei Liu'" <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>,
 "'George Dunlap'" <George.Dunlap@eu.citrix.com>
References: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
 <940134ca-9917-7260-679a-a14ac4e5d099@suse.com>
In-Reply-To: <940134ca-9917-7260-679a-a14ac4e5d099@suse.com>
Subject: RE: [PATCH v3] x86/HVM: more consistently set I/O completion
Date: Tue, 15 Sep 2020 10:10:48 +0100
Message-ID: <002501d68b40$1a60af00$4f220d00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKLGnh8NTAXxwELiAxasezQUK7x/AHZTlidp/F++DA=
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 15 September 2020 09:26
> To: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant =
<paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>; Jun
> Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; =
George Dunlap
> <George.Dunlap@eu.citrix.com>
> Subject: Re: [PATCH v3] x86/HVM: more consistently set I/O completion
>=20
> On 27.08.2020 09:09, Jan Beulich wrote:
> > Doing this just in hvm_emulate_one_insn() is not enough.
> > hvm_ud_intercept() and hvm_emulate_one_vm_event() can get invoked =
for
> > insns requiring one or more continuations, and at least in principle
> > hvm_emulate_one_mmio() could, too. Without proper setting of the =
field,
> > handle_hvm_io_completion() will do nothing completion-wise, and in
> > particular the missing re-invocation of the insn emulation paths =
will
> > lead to emulation caching not getting disabled in due course, =
causing
> > the ASSERT() in {svm,vmx}_vmenter_helper() to trigger.
> >
> > Reported-by: Don Slutz <don.slutz@gmail.com>
> >
> > Similar considerations go for the clearing of vio->mmio_access, =
which
> > gets moved as well.
> >
> > Additionally all updating of vio->mmio_* now gets done dependent =
upon
> > the new completion value, rather than hvm_ioreq_needs_completion()'s
> > return value. This is because it is the completion chosen which =
controls
> > what path will be taken when handling the completion, not the simple
> > boolean return value. In particular, PIO completion doesn't involve
> > going through the insn emulator, and hence emulator state ought to =
get
> > cleared early (or it won't get cleared at all).
> >
> > The new logic, besides allowing for a caller override for the
> > continuation type to be set (for VMX real mode emulation), will also
> > avoid setting an MMIO completion when a simpler PIO one will do. =
This
> > is a minor optimization only as a side effect - the behavior is =
strictly
> > needed at least for hvm_ud_intercept(), as only memory accesses can
> > successfully complete through handle_mmio(). Care of course needs to =
be
> > taken to correctly deal with "mixed" insns (doing both MMIO and PIO =
at
> > the same time, i.e. INS/OUTS). For this, hvmemul_validate() now =
latches
> > whether the insn being emulated is a memory access, as this =
information
> > is no longer easily available at the point where we want to consume =
it.
> >
> > Note that the presence of non-NULL .validate fields in the two ops
> > structures in hvm_emulate_one_mmio() was really necessary even =
before
> > the changes here: Without this, passing non-NULL as middle argument =
to
> > hvm_emulate_init_once() is meaningless.
> >
> > The restrictions on when the #UD intercept gets actually enabled are =
why
> > it was decided that this is not a security issue:
> > - the "hvm_fep" option to enable its use is a debugging option only,
> > - for the cross-vendor case is considered experimental, even if
> >   unfortunately SUPPORT.md doesn't have an explicit statement about
> >   this.
> > The other two affected functions are
> > - hvm_emulate_one_vm_event(), used for introspection,
> > - hvm_emulate_one_mmio(), used for Dom0 only,
> > which aren't qualifying this as needing an XSA either.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Tested-by: Don Slutz <don.slutz@gmail.com>
> > ---
> > v3: Add comment ahead of _hvm_emulate_one(). Add parentheses in a
> >     conditional expr. Justify why this does not need an XSA.
> > v2: Make updating of vio->mmio_* fields fully driven by the new
> >     completion value.
> > ---
> > I further think that the entire tail of _hvm_emulate_one() =
(everything
> > past the code changed/added there by this patch) wants skipping in =
case
> > a completion is needed, at the very least for the mmio and realmode
> > cases, where we know we'll come back here.
>=20
> Does one of the two of you have an opinion on this aspect?
>=20

It seems reasonable that we only want to execute the tail once but I'm =
unsure of the consequences of deferring it until I/O emulation is =
complete.

  Paul

> Jan


