Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419625D3D0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:41:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7HD-0006m6-UJ; Fri, 04 Sep 2020 08:40:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qam=CN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kE7HC-0006lz-Q4
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:40:54 +0000
X-Inumbo-ID: 99bb47e0-4fa3-4434-a17d-9d577e1a351d
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99bb47e0-4fa3-4434-a17d-9d577e1a351d;
 Fri, 04 Sep 2020 08:40:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id u18so5285961wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=U6bsazh80Yvg1pEGmhf4OTDyfR/0MSP7ClpDo249/z0=;
 b=ceroS0qb/A+FHF4Z3F36iq9HglNI6xWYA+W6Uvc8wHCG1tBfDOe33BLQ85qfMDHCXb
 so9WAwV6XsFiwsrEi7cWw9wM53HDUWx0Je3D74SYWWupKCBS7oTbcJ2iujVbKfFINEL1
 xiPTmG9ekrjj9QKOxGNMOIoJXNn2zHto0u/48p3NfG3+L8Zmo1cy36I5EsUH5OnmkdlJ
 TbziAt3w2Sfhpg+VIoVRRUT6zbbgIfLf5kX2oB2EdRDeDT13aWo+wFOLPzwIDk8X65Ts
 9B9zb5Cc9kjhyYlIvUH/S+oxUcqbR+p2cxEVcVXXlLEnAcX8H1alhfUDh5E9nNJ6zQ+7
 LMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=U6bsazh80Yvg1pEGmhf4OTDyfR/0MSP7ClpDo249/z0=;
 b=VbQvgB+/J5DtSFU5gyvPwYb5gXSKWzKrVR7t1p4UQkJ/+/d16Iw7BXxtP273YhQ/mE
 yxb0rpLcyIOf1WWTntjbm+Ay/lcndbnyMcNWNacIafPXq28kxiaA9BVxv89i0/ESnsSZ
 5Q/fBE9kIsvWxgdt/zxW2zeVu5O8q3vphbCTcUV/Yz4o51OHyZYIK17/kSD8NP6qjD7P
 kuK/qdjlB4bfzG4fuu6CMkydcF/O6/ugK8icwABf7QG+46/N/XWIFUuaCEhbDZZYay10
 muv2XYm4IWgl3KjenYILRHwGdPlytYzhjBJmvQGOv2IcOiJ1ii49BUM3QXAgFMgVnjmd
 fnqA==
X-Gm-Message-State: AOAM531ihWny5FbFD9IOlVG3qrlYGyT0dmNCERqKRTrNb5WMwM8vOT1V
 YLlipqk61V2hEdNyFJj1XS0=
X-Google-Smtp-Source: ABdhPJz18KoQXCzrwopIoj0QfQ427e2c5LRw+opgMDfaTH6JTZXEgE8BZAmSlUK+gnbocSUyJ71+Mg==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr6316609wmi.135.1599208853017; 
 Fri, 04 Sep 2020 01:40:53 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:4c49:1021:43cd:65b7])
 by smtp.gmail.com with ESMTPSA id a74sm10137929wme.11.2020.09.04.01.40.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 01:40:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>, "'Wei Liu'" <wl@xen.org>,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Jun Nakajima'" <jun.nakajima@intel.com>,
 "'Kevin Tian'" <kevin.tian@intel.com>,
 "'George Dunlap'" <George.Dunlap@eu.citrix.com>
References: <96a4cc9b-b1fd-494c-9e99-6d3ca733dea9@suse.com>
 <3587573b-2eeb-48fa-b397-65fb94f360c8@suse.com>
In-Reply-To: <3587573b-2eeb-48fa-b397-65fb94f360c8@suse.com>
Subject: RE: Ping: [PATCH v3] x86/HVM: more consistently set I/O completion
Date: Fri, 4 Sep 2020 09:40:54 +0100
Message-ID: <001e01d68297$1ae535b0$50afa110$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKLGnh8NTAXxwELiAxasezQUK7x/AJwv8HCp9tzDLA=
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 04 September 2020 09:16
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper =
<andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Jun Nakajima =
<jun.nakajima@intel.com>; Kevin Tian
> <kevin.tian@intel.com>; George Dunlap <George.Dunlap@eu.citrix.com>
> Subject: Ping: [PATCH v3] x86/HVM: more consistently set I/O =
completion
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
>=20
> Paul (in particular)?
>=20

Sorry... been on my TODO list since you posted it. Will try and take a =
look today.

  Paul


