Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346060D2C2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 19:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430036.681485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onO3B-0006qn-2t; Tue, 25 Oct 2022 17:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430036.681485; Tue, 25 Oct 2022 17:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onO3B-0006o8-07; Tue, 25 Oct 2022 17:49:17 +0000
Received: by outflank-mailman (input) for mailman id 430036;
 Tue, 25 Oct 2022 17:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rbF=22=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1onO39-0006o1-B8
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 17:49:15 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5649a301-548d-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 19:49:14 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id o70so15589347yba.7
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 10:49:14 -0700 (PDT)
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
X-Inumbo-ID: 5649a301-548d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c9JWNp/nLmkGAWQf3V/yqrLvd25bACgBvOhcSzQASLs=;
        b=Z5QDDhoWnZ0ye5YiPUVmPdWWgMvMPoklJjVoDiEkBqNIA8UT9LAjDRexKoDSxIcqhM
         kZnboNWdphcMY+ppOtnpbIeagqftZ4vct5waQg1lPpxhBhj0Es6e/ER6wMDxCSvvDhST
         vjs70rFaolf7bXFXdYrNcAcrQCP5kLpDc/Z4JDAoMdwAlK4cPeZ2FJ0zJZR3CHCj/2Oj
         TlwFdRw0n3jsxEsouh9D7v24yNE5BA4fm3wCHLQJil5nGtEDQ0BNmTsg7leVyMkxj8xd
         jtmwi/WXuiJ+gGSxAaXrm3ZcNLitQUhNmccxrDz7O6u0U223C0OdK8dt8tYBcr9VOWzd
         C8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9JWNp/nLmkGAWQf3V/yqrLvd25bACgBvOhcSzQASLs=;
        b=7KpdTNqMO01KIQOdO8TDOFArdaD3cflAHCQbjLfmHiP6G0FuKFIk7sEv/YCqXxM+cw
         lhGhimrP4GzkowpEVk7eVmBXvN6f7XxMdBfWh1z2+J2Iy5SuiTS3GshBUHAF8LY7V/v3
         syoSxBSdztWmVbslE+2pvWGmkV9/ZHdBci8rziKlwpwvAORVYxT+xRqbXMY7ASrWT/GD
         DkAsNM8Hk5tGKPSiuA60Xcz24aYOUn7ORuLEpGINS8dOzdab7I+umm2U/p+GE53TZ8l6
         r3ZRl2oz/mhzlgTlsP0ozDVBqmuxFvm66DQ626BrvKVB8DbhR4R6aZhMzFDOzo5RVNNb
         Elgg==
X-Gm-Message-State: ACrzQf1ypS811WnDSZ19IM2FgBuTaZYZYHTi5r/4hvFWDWEqGsl570N2
	/ETzUjIfPK2z+/msi1sdCeesRCOmhLkDfPPmY6M=
X-Google-Smtp-Source: AMsMyM4OkFCukfqmXtKP2m8La76FFvY7YCqfNUclxl96Rf94ohdFlVoXtVKtki4rw8ye2zVIFlkVCE/jtutirT523L8=
X-Received: by 2002:a25:ea08:0:b0:6bc:436f:6798 with SMTP id
 p8-20020a25ea08000000b006bc436f6798mr36481345ybd.31.1666720153292; Tue, 25
 Oct 2022 10:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <854cdedcdd2bfff08ea45a3c13367c610d710aaf.1666630317.git.tamas.lengyel@intel.com>
 <Y1eamiBY0d+julWk@Air-de-Roger>
In-Reply-To: <Y1eamiBY0d+julWk@Air-de-Roger>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 25 Oct 2022 13:48:36 -0400
Message-ID: <CABfawhk=Awfxu6iBpBtpNF_qKsEW3tMMG4EJzH3okZzdyyESxg@mail.gmail.com>
Subject: Re: [PATCH] xen/x86: Make XEN_DOMCTL_get_vcpu_msrs more configurable
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Content-Type: multipart/alternative; boundary="000000000000ad55e005ebdf8640"

--000000000000ad55e005ebdf8640
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 4:13 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
wrote:
>
> On Mon, Oct 24, 2022 at 12:58:54PM -0400, Tamas K Lengyel wrote:
> > Currently the XEN_DOMCTL_get_vcpu_msrs is only capable of gathering a
handful
> > of predetermined vcpu MSRs. In our use-case gathering the vPMU MSRs by
an
> > external privileged tool is necessary, thus we extend the domctl to
allow for
> > querying for any guest MSRs. To remain compatible with the existing
setup if
> > no specific MSR is requested via the domctl the default list is
returned.
>
> I'm afraid I would benefit from some extra description about why you
> need to introduce a separate hook instead of using the existing
> do_rdmsr hook in arch_vpmu_ops (which is already hooked into
> guest_rdmsr()).
>
> Are the MSRs you are trying to fetch not accessible for the guest
> itself to read?

No, the reason we need this different hook is because do_rdmsr assumes the
guest is reading the MSRs that are currently loaded. For external tools
where v !=3D current the vpmu context needs to be saved by pausing the vcpu
first and then the MSR content returned from the saved context.

 Tamas

--000000000000ad55e005ebdf8640
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br><br>On Tue, Oct 25, 2022 at 4:13 AM Roger Pau Mon=
n=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a=
>&gt; wrote:<br>&gt;<br>&gt; On Mon, Oct 24, 2022 at 12:58:54PM -0400, Tama=
s K Lengyel wrote:<br>&gt; &gt; Currently the XEN_DOMCTL_get_vcpu_msrs is o=
nly capable of gathering a handful<br>&gt; &gt; of predetermined vcpu MSRs.=
 In our use-case gathering the vPMU MSRs by an<br>&gt; &gt; external privil=
eged tool is necessary, thus we extend the domctl to allow for<br>&gt; &gt;=
 querying for any guest MSRs. To remain compatible with the existing setup =
if<br>&gt; &gt; no specific MSR is requested via the domctl the default lis=
t is returned.<br>&gt;<br>&gt; I&#39;m afraid I would benefit from some ext=
ra description about why you<br>&gt; need to introduce a separate hook inst=
ead of using the existing<br>&gt; do_rdmsr hook in arch_vpmu_ops (which is =
already hooked into<br>&gt; guest_rdmsr()).<br>&gt;<br>&gt; Are the MSRs yo=
u are trying to fetch not accessible for the guest<br>&gt; itself to read?<=
br><br></div>No, the reason we need this different hook is because do_rdmsr=
 assumes the guest is reading the MSRs that are currently loaded. For exter=
nal tools where v !=3D current the vpmu context needs to be saved by pausin=
g the vcpu first and then the MSR content returned from the saved context.<=
br><div><br></div><div>=C2=A0Tamas<br></div></div>

--000000000000ad55e005ebdf8640--

