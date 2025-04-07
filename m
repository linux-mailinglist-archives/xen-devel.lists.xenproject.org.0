Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB1EA7E947
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940791.1340437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qpM-0004E1-2s; Mon, 07 Apr 2025 18:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940791.1340437; Mon, 07 Apr 2025 18:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1qpM-0004B6-02; Mon, 07 Apr 2025 18:04:08 +0000
Received: by outflank-mailman (input) for mailman id 940791;
 Mon, 07 Apr 2025 18:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pNbr=WZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u1qpK-0003ol-FZ
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:04:06 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1704f0f-13da-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 20:04:05 +0200 (CEST)
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
X-Inumbo-ID: b1704f0f-13da-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744049044; x=1744308244;
	bh=4pDQwjqkqIY+kyCeSIzcQU4HMllyi29QZKHatR12yZM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ry+TVDpku/WEmyWfavzm04ipRVa37mDMcvUvz2nYZj73Ajlm68M56Zk/iYLWTh9++
	 B1aWJrznggqXYek29yga/HfvqbXlKnyJu+oygyhUIvlWr+HyATTZDyE5zoMjMYTLJ8
	 93lsC++SUtBizHcszT5HGwH5ZnPuFRWsUVHDnw3VCKtwHj7y4Qo2vkg7Nmd9bSiIKX
	 Wja49eh/3ObysY5mQTlA5LUCL0P0tYf0LUfwk9ST1FTtZCqtcjetGSrRqPp4w9rH6y
	 KV9jE7BJ6SooKOMIx8wp1RP9bqlLPVRzDUGhb3B1d1sI04j+Vb9xdCUF3RipiZz9fE
	 EWgMgupOF6aOA==
Date: Mon, 07 Apr 2025 18:03:58 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v3] x86/vmx: Rework VMX wrappers using `asm goto()`
Message-ID: <7P_vEygPylSPMxeF5xJ_Hvqfh766s1bpMhzu_hXX3CP9qMloLPlw1Y4TkPEuM_bWH3-ewQ4ABwW-Cz_igwahGKHGkgz65LT_OfSUXpoaEts=@proton.me>
In-Reply-To: <059fb994-e5e1-43e2-98ee-d7ae44137892@citrix.com>
References: <20250405012729.3109108-1-dmukhin@ford.com> <059fb994-e5e1-43e2-98ee-d7ae44137892@citrix.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ee9fdca067dfa0cca3b786e9481568ef378aaf6f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 7th, 2025 at 2:46 AM, Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:

>=20
>=20
> On 05/04/2025 2:27 am, dmkhn@proton.me wrote:
>=20
> > diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/incl=
ude/asm/hvm/vmx/vmx.h
> > index affb3a8bd6..6aa6e1f212 100644
> > --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > @@ -294,28 +294,30 @@ extern uint8_t posted_intr_vector;
> >=20
> > static always_inline void __vmptrld(u64 addr)
> > {
> > - asm volatile ( "vmptrld %0\n\t"
> > - /* CF=3D=3D1 or ZF=3D=3D1 --> BUG() */
> > - UNLIKELY_START(be, vmptrld)
> > - _ASM_BUGFRAME_TEXT(0)
> > - UNLIKELY_END_SECTION
> > - :
> > - : "m" (addr),
> > - _ASM_BUGFRAME_INFO(BUGFRAME_bug, LINE, FILE, 0)
> > - : "memory" );
> > + asm goto ( "vmptrld %[addr]\n\t"
> > + "jbe %l[vmfail]\n"
>=20
>=20
> This should be without \n too, as it's the last line of assembly.
>=20
> I've fixed on commit.

Thanks!

>=20
> ~Andrew

