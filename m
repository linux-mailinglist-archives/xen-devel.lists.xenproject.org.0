Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F61388C9D4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 17:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698173.1089597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpA1M-0008Jg-Dp; Tue, 26 Mar 2024 16:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698173.1089597; Tue, 26 Mar 2024 16:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpA1M-0008Ge-AH; Tue, 26 Mar 2024 16:51:32 +0000
Received: by outflank-mailman (input) for mailman id 698173;
 Tue, 26 Mar 2024 16:51:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w9WO=LA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rpA1K-0008GY-FP
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 16:51:30 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 166e6a14-eb91-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 17:51:28 +0100 (CET)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3c3ceeb2d04so1194241b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 09:51:28 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 z9-20020ac875c9000000b00430c76f0c86sm3823648qtq.80.2024.03.26.09.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 09:51:26 -0700 (PDT)
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
X-Inumbo-ID: 166e6a14-eb91-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711471887; x=1712076687; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjHGX484TMae616qYM8ci2l4h5LW2pC4715uDmVWPb8=;
        b=Ylky9z4L0acuLA31XEorux+xZ9tKFL/7KbVmFgDZbq8WyQOWFtB3knIxT+Pwklz6ed
         4ybrUEcJzwP0E7UDJrnDA/T4/ovar0P5Pn1CnZ+eexBgVQLfi6zj5hzyyLcez//if4pu
         7necTCEZKiVgCKgoRcR5TBicU/g+WzcWipzeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711471887; x=1712076687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjHGX484TMae616qYM8ci2l4h5LW2pC4715uDmVWPb8=;
        b=TcRyOj9Wk62FKQ3AJMt8LXuCuMOpMZn0njP+NKzrrv6AgxInWzQAYKNBh8I/qtHPc+
         r6C9MUAN5vXfs+KSdfRF9byy+5xBijKhy5lbweag5yIFagG74rNtFVnK6JsV6DfHDxb0
         sm5svpPIngSkAm4NaqsVfuHOojtde2xVU6ErO/PinKn4aTXSccTM5+CubUpK5RM+TDC4
         VrHgYJn3OTPm6J90U7BVG2JWvLSDYLsqujPNu1J6OfOb6tSPnB7RqAeBv22r5P6bw4sZ
         6ETQMtqIHWKA+lmTO2cswYfUsw2Nq6+FSbVMeK1ZjtD/LFvZeFxCyKWlXF4WUIAgKtSw
         LLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE71f7+HlTjmdbtghBvn5R6Q+H8DvZOvSEbfzo2B4ovKpE1sxzYQyUVd1V0bvAdMeONaffbbH3Jd+zcCacapJYZftA4A37Ya5lfwL64UM=
X-Gm-Message-State: AOJu0YzOuogeDT30I66qMzkSg/wM8fnBe64DR2WgOjCR7CZGnHNbt2vQ
	zeDs5qZL91g1suW3dsX1TfSbYKTXioYwXgttZyRwxCMg24HIucnlanPIayWLR1Q=
X-Google-Smtp-Source: AGHT+IFmHr35PwtSrzx9AmnO6/x//vXaJOGTolW0SIUcmldnxph3hqwZmR8LqJGbAeEXh173AaaYfQ==
X-Received: by 2002:a05:6808:3a0a:b0:3c3:a606:8084 with SMTP id gr10-20020a0568083a0a00b003c3a6068084mr4494980oib.46.1711471886855;
        Tue, 26 Mar 2024 09:51:26 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:51:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Matthew Barnes <matthew.barnes@cloud.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] tools: add x2APIC entries in MADT based on APIC ID
Message-ID: <ZgL9DH-Eft34ptbK@macbook>
References: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
 <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>
 <8895fcce-3738-4bd6-9127-56296369e3e6@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8895fcce-3738-4bd6-9127-56296369e3e6@cloud.com>

On Mon, Mar 25, 2024 at 02:30:35PM +0000, Alejandro Vallejo wrote:
> Hi,
> 
> On 14/03/2024 13:50, Jan Beulich wrote:
> > On 13.03.2024 16:35, Matthew Barnes wrote:
> >> libacpi is a tool that is used by libxl (for PVH guests) and hvmloader
> >> (for HVM guests) to construct ACPI tables for guests.
> >>
> >> Currently, libacpi only uses APIC entries to enumerate processors for
> >> guests in the MADT.
> >>
> >> The APIC ID field in APIC entries is an octet big, which is fine for
> >> xAPIC IDs, but not so for sufficiently large x2APIC IDs.
> > 
> > Yet where would those come from? I can see that down the road we will
> > have such, but right now I don't think we do. Without saying so, this
> > change could be mistaken for a fix of an active bug.
> 
> It's worth adding some context here.
> 
> You're quite right in that it's not immediately needed now, but with the
> work done on improving the state of CPU topologies exposed to guests[1]
> the strict binding between APIC ID and vCPU ID breaks. It's not hard to
> imagine sparsity in the APIC ID space forcing the maximum one to peak
> beyond 254. The generator present in that series tries to be
> conservative and avoid it, but general topologies can theoretically
> waste copious amounts of APIC ID space (i.e: by reserving more width
> than strictly required to represent IDs of a certain level), and
> exposing the host topology sensibly becomes difficult if we're subject
> to limitations the host does not have.

Most guest OSes will refuse to bring up APs with APIC ID > 254, unless
there's support for interrupt remapping or Extended Destination ID
[0].  So while adding the entries in the MADT is fine, I wonder how we
can sensibly test this.

IMO, we should first add support for Extended Destination ID, and then
expose APs with APIC ID > 254.

Have you been able to test this with APIC IDs > 254, and can confirm
that an OS is capable of bringing those APs up with the ID in the
x2APIC MADT entry?

I think at a minimum you need some changes to the vlapic code in Xen,
so that when a vLAPIC gets assigned an ID > 254 it automatically
switches to x2APIC mode, as vlapic_init() unconditionally inits the
lapic in xAPIC mode.  Otherwise the INTI-SIPI-SIPI sequence won't find
the intended destination.

Thanks, Roger.

[0] https://gitlab.com/xen-project/xen/-/issues/173

