Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF2182F08A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667791.1039412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkQ7-0004P9-8W; Tue, 16 Jan 2024 14:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667791.1039412; Tue, 16 Jan 2024 14:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkQ7-0004M4-4b; Tue, 16 Jan 2024 14:28:03 +0000
Received: by outflank-mailman (input) for mailman id 667791;
 Tue, 16 Jan 2024 14:28:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kz0G=I2=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rPkQ5-0004Lu-7v
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:28:01 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71c59623-b47b-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 15:27:59 +0100 (CET)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169]) by mx.zohomail.com
 with SMTPS id 1705415275604379.00670761475044;
 Tue, 16 Jan 2024 06:27:55 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5f2aab1c0c5so85411367b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 06:27:55 -0800 (PST)
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
X-Inumbo-ID: 71c59623-b47b-11ee-98f1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1705415277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VoUz92F0yuDfDl624k3iz0hJIOH2pmyWXfiuismhze10rLyJ0AjfOSbKhI5byGgqLsT91o8QcE6+xBsJkmdXMcfq4nK0Dr71Hr/w0AkGxd6A971hCFHJZpWbMdqyVdxjDI6cCctNuG4uPPNnq+Ly/kX1H9uOw21lI64XmAxjkOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1705415277; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ACBLp6PzRnK+HS+Py+JpvflIap02I3QAeZBERgjSg+k=; 
	b=Kndq6DqHN1bTtBpWDy4kljYVwlF08Q2vgtrvijMaIJX+ZNfdCZ62W+c/AvAqd78D4DmKqVO38ll7vJ89EvN805S6WM08/qRLzyoiU0LD0v+vga/3Rd/RxP4Sk7wv+chivh+MedvvoTFGPywjvMuXqqQz6aJbcLhqSCS79n0H/jI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1705415277;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ACBLp6PzRnK+HS+Py+JpvflIap02I3QAeZBERgjSg+k=;
	b=IHaf2Nm/F8ii0zH6cenONHWJXudAGbXCb4Noh7PjzCj+tVuKHujZ8Mudya6cbBct
	TYjscPMBVlGJ2PyYaYQIJ4A9JgyaSGkeSzydyrfFED5hf5fRDCqTfBmDWLppfkRWt3R
	0oeMaB2rsGgWzeWrLCTAL9syPueuBRdurwEUL5f0=
X-Gm-Message-State: AOJu0Yx/8yf7F4jbnq0wOni+J2yiyTPZW7uVqXZnmj6PU2mUJkxb98Oo
	MIrDHrFIbX2Vlz8tyyUNMgxB5xds8alJCJUdTuI=
X-Google-Smtp-Source: AGHT+IG9BMkuhAZhUhTlukx3F8N7lIbgpIJaeY0T9nHo5mckpwfDkh7CRwhm2QgATjBWiwvCAiZPTccT+msIJGwvKNE=
X-Received: by 2002:a25:bec7:0:b0:dc2:a46:3d29 with SMTP id
 k7-20020a25bec7000000b00dc20a463d29mr1395469ybm.9.1705415274442; Tue, 16 Jan
 2024 06:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20240111231323.4043461-1-andrew.cooper3@citrix.com> <20240111231323.4043461-4-andrew.cooper3@citrix.com>
In-Reply-To: <20240111231323.4043461-4-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jan 2024 09:27:18 -0500
X-Gmail-Original-Message-ID: <CABfawhnbOQk=t5VkByjez+HVfE6Y3tGshxOODMu6icvKuU8AYg@mail.gmail.com>
Message-ID: <CABfawhnbOQk=t5VkByjez+HVfE6Y3tGshxOODMu6icvKuU8AYg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] x86/vmx: Disallow the use of inactivity states
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>, George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 6:13=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> Right now, vvmx will blindly copy L12's ACTIVITY_STATE into the L02 VMCS =
and
> enter the vCPU.  Luckily for us, nested-virt is explicitly unsupported fo=
r
> security bugs.
>
> The inactivity states are HLT, SHUTDOWN and WAIT-FOR-SIPI, and as noted b=
y the
> SDM in Vol3 27.7 "Special Features of VM Entry":
>
>   If VM entry ends with the logical processor in an inactive activity sta=
te,
>   the VM entry generates any special bus cycle that is normally generated=
 when
>   that activity state is entered from the active state.
>
> Also,
>
>   Some activity states unconditionally block certain events.
>
> I.e. A VMEntry with ACTIVITY=3DSHUTDOWN will initiate a platform reset, w=
hile a
> VMEntry with ACTIVITY=3DWAIT-FOR-SIPI will really block everything other =
than
> SIPIs.
>
> Both of these activity states are for the TXT ACM to use, not for regular
> hypervisors, and Xen doesn't support dropping the HLT intercept either.
>
> There are two paths in Xen which operate on ACTIVITY_STATE.
>
> 1) The vmx_{get,set}_nonreg_state() helpers for VM-Fork.
>
>    As regular VMs can't use any inactivity states, this is just duplicati=
ng
>    the 0 from construct_vmcs().  Retain the ability to query activity_sta=
te,
>    but crash the domain on any attempt to set an inactivity state.
>
> 2) Nested virt, because of ACTIVITY_STATE in vmcs_gstate_field[].
>
>    Explicitly hide the inactivity states in the guest's view of MSR_VMX_M=
ISC,
>    and remove ACTIVITY_STATE from vmcs_gstate_field[].
>
>    In virtual_vmentry(), we should trigger a VMEntry failure for the use =
of
>    any inactivity states, but there's no support for that in the code at =
all
>    so leave a TODO for when we finally start working on nested-virt in
>    earnest.
>
> Reported-by: Reima Ishii <ishiir@g.ecc.u-tokyo.ac.jp>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

