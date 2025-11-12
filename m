Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEF5C51B08
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159669.1487981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8Cn-0003JB-He; Wed, 12 Nov 2025 10:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159669.1487981; Wed, 12 Nov 2025 10:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8Cn-0003GR-EZ; Wed, 12 Nov 2025 10:36:01 +0000
Received: by outflank-mailman (input) for mailman id 1159669;
 Wed, 12 Nov 2025 10:36:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LXb0=5U=bounce.vates.tech=bounce-md_30504962.6914630c.v1-b47811629e5f415c9e9276478d1b43fa@srs-se1.protection.inumbo.net>)
 id 1vJ8Cm-0003GH-6m
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:36:00 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fbe819c-bfb3-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:35:58 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d60DX37GNzPm0ZmB
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 10:35:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b47811629e5f415c9e9276478d1b43fa; Wed, 12 Nov 2025 10:35:56 +0000
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
X-Inumbo-ID: 5fbe819c-bfb3-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762943756; x=1763213756;
	bh=uopzZcAexBVhZB+T7b3Dzoc1+hwrJIO3k293J16pMOk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WR9We+54ceraJ1wknJjr4ITHgSF8etRoiVJtPcfcAW0guu75S90bFlN04eEg350Bf
	 Xrwh++RbjMXQajjnxcpAyXEGjE3H+lUCKtc8q7jwgMZnfYTvIjFfaOna0RZDW1HbgE
	 zBTcic0lj08WjlQuKT9c3JFOfErywr7qdNKQdKq0VYopEZkfshU6zVvqMDAWrCyVdI
	 sprDrxbgYVD2oXrtp88Vh5pHxwbTsgYwwZvcta/WNqXH2yLFzX29zTTNwLDOQJQ2ZQ
	 GxiWZgnyuGNqn5npXrtum5U4lzDeRlUKvnArZ/BBis5ldqydozklI4zwe69YyHjPZx
	 bzXAdFQTNf1Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762943756; x=1763204256; i=teddy.astie@vates.tech;
	bh=uopzZcAexBVhZB+T7b3Dzoc1+hwrJIO3k293J16pMOk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mPDlsLTc0dY+GrvN5AigmqVPlq3q574D/0ACQ9P986AyGr82l7LWkW4uNw+sURHTZ
	 6sY/9T+j2pVAi/r94TgIObBm3+ggujchXOrzUUcw6vke1kvuWkpsek0NbTHepb/iGC
	 sVwxHhTlMl11+iV8PBRlIk+IN9SFEHwiryUutYos54Ox3kCbdLFHJ9MLz1lnRNWJ9H
	 u3EipM9+MqvQd0Wys/1r9ceySqMc9Jp73TOYnPFTbbkPYSO6CqRF4+Of4q33mQYA9Q
	 hgLzEXS1rsgGLBcniOjzd0aKNe50e3ItmHYeiRHwo6jGSqFyrCFaMQPsBed1NmmpL+
	 rEj8ZVrI/ZO/g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20for-4.22]=20x86/hvm:=20Introduce=20force=5Fx2apic=20flag?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762943754497
Message-Id: <c1d2fece-02fe-4c3a-b08b-ac8525277787@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>
References: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
In-Reply-To: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b47811629e5f415c9e9276478d1b43fa?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 10:35:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 29/10/2025 =C3=A0 19:26, Teddy Astie a =C3=A9crit=C2=A0:
> Introduce a new flag to force the x2APIC enabled and preventing a
> guest from switching back LAPIC to xAPIC mode.
> 
> The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
> architectural MSR of Intel specification.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> This feature can be useful for various reasons, starting with SEV as
> it is complicated (especially with SEV-ES) to handle MMIO, and legacy
> xAPIC is one thing that needs MMIO intercepts (and Linux uses it during
> boot unless x2APIC is initially enabled, even if it switches to
> x2apic afterward). It could also be interesting to reduce the attack
> surface of the hypervisor (by only exposing x2apic to the guest).
> 
> As it can allow to have MMIO-less guest (using PVH), perhaps it can
> be enough for avoiding the problematic cases of virtualized INVLPGB
> (when we have it).
> 
> In my testing, Linux, FreeBSD and PV-shim works fine with it; OVMF
> freezes for some reason, NetBSD doesn't support it (no x2apic support
> as Xen guest). HVM BIOS gets stuck at SeaBIOS as it expects booting
> with xAPIC.
> 
> On Intel platforms, it would be better to expose the
> IA32_XAPIC_DISABLE_STATUS architectural MSR to advertise this to
> guest, but it's non-trivial as it needs to be properly exposed
> through IA32_ARCH_CAPABILITIES which is currently passed-through.
> 
>   docs/man/xl.cfg.5.pod.in              |  7 +++++++
>   tools/libs/light/libxl_types.idl      |  1 +
>   tools/libs/light/libxl_x86.c          |  4 ++++
>   tools/xl/xl_parse.c                   |  1 +
>   xen/arch/x86/domain.c                 |  2 +-
>   xen/arch/x86/hvm/hvm.c                |  2 ++
>   xen/arch/x86/hvm/vlapic.c             | 23 ++++++++++++++++++++++-
>   xen/arch/x86/include/asm/domain.h     |  2 ++
>   xen/arch/x86/include/asm/hvm/domain.h |  3 +++
>   xen/include/public/arch-x86/xen.h     | 12 +++++++++++-
>   10 files changed, 54 insertions(+), 3 deletions(-)
> 

I guess for now, it would be preferable overall to :
- just add a way to enable it by default, not lock in it in x2apic mode
- the ability to lock it down (i.e disable xAPIC at compile time) could 
be introduced separately

I'm not completely decided on the naming of the option, maybe something 
like :
x2apic_mode =3D <default> | <pre_enable> (or just enable ?)

`default` will keep the current behavior, or force x2apic if xAPIC is 
disabled at compile time; `pre_enable` will enable it by default, but OS 
may be able to go back to xAPIC mode if supported.

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



