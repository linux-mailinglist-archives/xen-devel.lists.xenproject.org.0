Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933F9A9F9ED
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 21:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971038.1359541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UUn-000785-DS; Mon, 28 Apr 2025 19:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971038.1359541; Mon, 28 Apr 2025 19:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9UUn-00075r-A2; Mon, 28 Apr 2025 19:50:29 +0000
Received: by outflank-mailman (input) for mailman id 971038;
 Mon, 28 Apr 2025 19:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2FI=XO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u9UUm-00075l-4g
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 19:50:28 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08150c84-246a-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 21:50:27 +0200 (CEST)
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
X-Inumbo-ID: 08150c84-246a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745869825; x=1746129025;
	bh=hn9xYnlQ4v+FxkuFOSAzLhJBKFCTWbY/Zna7O1RcDf4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=HVsnCQtbUfyShHa4KBnu+5eq3wvd2u2H8e084woQ/ZgK3g++5Q2XGU3Vq+g6nJ1Hl
	 4hW6JtibgIdAsqSBYzA3dY5qp9MkasJlqVOGXo9TVq9Dzqhrp2TlMJpUEzQyVydEUn
	 1nDjoCm/OP0GHn66u/WLjlUdqsPBTnYJmEQuaNkcyueaBB6pz7E08iJBGXeTZCYSr7
	 a/R1l0uVK5oNaTpDvWKt+6ZAZgQtMyZy5CSTMr3aWg3Ir5epfjSYqQj2yj0lSQ4CAn
	 8AKa6Hcja39LMvd74eypkPgsYBrGvEXBGOP15hsFRLb2YDreA0+yaW2O+id1Pg/zYy
	 rp+ShFBxkAZgQ==
Date: Mon, 28 Apr 2025 19:50:20 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, nicola.vetrini@bugseng.com, consulting@bugseng.com, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/3] x86/vmx: Replace __vmread() with vmread()
Message-ID: <aA/b+XVsKYMkc50/@kraken>
In-Reply-To: <badaead4-7eba-4796-8e96-96a95b36145a@suse.com>
References: <20250426072819.39455-1-dmukhin@ford.com> <badaead4-7eba-4796-8e96-96a95b36145a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a12e34076fcb398df8d7a8fcf1b7a1a26cfc4b94
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 01:58:56PM +0200, Jan Beulich wrote:
> On 26.04.2025 09:28, dmkhn@proton.me wrote:
> > @@ -1957,8 +1955,7 @@ void cf_check vmx_do_resume(void)
> >      hvm_do_resume(v);
> >
> >      /* Sync host CR4 in case its value has changed. */
> > -    __vmread(HOST_CR4, &host_cr4);
> > -    if ( host_cr4 !=3D read_cr4() )
> > +    if ( vmread(HOST_CR4) !=3D read_cr4() )
>=20
> It's unclear to me whether this constitutes a violation of Misra rule 13.=
2.
> There are two function calls in this expression. Both funcs are inline, a=
nd
> vmread() is even always_inline, but they're still function calls, which c=
an
> be carried out in either order. And neither can plausibly be pure, let
> alone const.

Thanks, I will revert that hunk.

>=20
> > @@ -1573,12 +1565,12 @@ static void cf_check vmx_get_nonreg_state(struc=
t vcpu *v,
> >  {
> >      vmx_vmcs_enter(v);
> >
> > -    __vmread(GUEST_ACTIVITY_STATE, &nrs->vmx.activity_state);
> > -    __vmread(GUEST_INTERRUPTIBILITY_INFO, &nrs->vmx.interruptibility_i=
nfo);
> > -    __vmread(GUEST_PENDING_DBG_EXCEPTIONS, &nrs->vmx.pending_dbg);
> > +    nrs->vmx.activity_state =3D vmread(GUEST_ACTIVITY_STATE);
>=20
> This struct field can now also shrink down to unsigned int (or uit32_t if=
 need
> be). Likely there are others (and maybe also plain variables). Which in t=
urn
> is an indication that, as was suggested before, this patch wants further
> splitting up. That'll also help with overall progress, as then what's
> uncontroversial and not in need of further adjustment can go in right awa=
y.

I'll will minimize the churn more in next iteration.

>=20
> Jan


