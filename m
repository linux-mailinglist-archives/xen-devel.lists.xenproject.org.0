Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A18A818E2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 00:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943254.1342072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2HdU-0006w1-VV; Tue, 08 Apr 2025 22:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943254.1342072; Tue, 08 Apr 2025 22:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2HdU-0006uc-SU; Tue, 08 Apr 2025 22:41:40 +0000
Received: by outflank-mailman (input) for mailman id 943254;
 Tue, 08 Apr 2025 22:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xbCh=W2=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2HdT-0005LN-A8
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 22:41:39 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2296687-14ca-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 00:41:38 +0200 (CEST)
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
X-Inumbo-ID: a2296687-14ca-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744152097; x=1744411297;
	bh=dOBBKa2L9t432R5U1Yz3Ss1+Xk9FJFVPhxFW/eIjIrE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dUZVlolEG081GrTKc+0I2sTSRpk8aNfjIZsNmen1w6eWIoWWI27Q7q6rahyUVO+/R
	 PYHjdMeTqecESfhR9hNuHlL/1kWPy7Uq4Ex7BFihyezgTv2T7Kx8749384qAyJm1/Z
	 tk2wjx63njGmQMEPDVUCnrBui9FmEP4Y4KdCfClrjKkVyGXFHfkKcCgBx6cHe4f9D3
	 mMRHPOUeNrzuWFU1XpZcpfSK1/JyblWJhCKT02H9IWZFugvRXUhE4eXmk3GsuQ4hSD
	 nETIVfSo9LWPmC+GdadJKDv7R5/2BlcKBwCnt9q/9jhF2mPvVwcsAzVTM33rJbpk/h
	 H27szQ6ORUrew==
Date: Tue, 08 Apr 2025 22:41:31 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] x86/domain: revisit logging in arch_domain_create()
Message-ID: <2DS8HQG9miOxRrT8-LZJM00_UwGcB9LmB_M5OOgbqtThRhz-fqCA0oaSyUvNYIqMcIDh8gkW3n5ExQlX_D0t_dBbogGrcSDyjVADXu4s080=@proton.me>
In-Reply-To: <667775a5-48ba-47ca-8c73-eb95c35de381@suse.com>
References: <20250404232145.1252544-1-dmukhin@ford.com> <667775a5-48ba-47ca-8c73-eb95c35de381@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7d4cae77307fa6ec53f9e088711591fd90326c99
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 7th, 2025 at 7:21 AM, Jan Beulich <jbeulich@suse.com> wrot=
e:

>
>
> On 05.04.2025 01:21, dmkhn@proton.me wrote:
>
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -791,13 +791,14 @@ int arch_domain_create(struct domain *d,
> > {
> > if ( !opt_allow_unsafe )
> > {
> > - printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
> > - " for security reasons.\n");
> > + printk(XENLOG_G_ERR
> > + "%pd: cannot create domain on this CPU due to security reasons\n",
> > + d);
> > return -EPERM;
>
>
> I was about to give an ack, but here and ...
>
> > @@ -807,16 +808,20 @@ int arch_domain_create(struct domain *d,
> >
> > if ( emflags & ~XEN_X86_EMU_ALL )
> > {
> > - printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
> > - d->domain_id, emflags);
> > + printk(XENLOG_G_ERR
> > + "%pd: invalid emulation bitmap: %#x\n",
> > + d, emflags);
> > return -EINVAL;
> > }
> >
> > if ( !emulation_flags_ok(d, emflags) )
> > {
> > - printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> > - "with the current selection of emulators: %#x\n",
> > - d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
> > + printk(XENLOG_G_ERR
> > + "%pd: cannot create %s %sdomain with emulators: %#x\n",
> > + d,
> > + is_hvm_domain(d) ? "HVM" : "PV",
> > + is_hardware_domain(d) ? "hardware " : "",
> > + emflags);
> > return -EOPNOTSUPP;
> > }
>
>
> ... here I question the re-wording: Xen could very well create domains in
> these cases. It merely refuses to for one reason or another. In the
> latter case the re-wording may be kind of okay, because code elsewhere ma=
y
> need updating. In the former case, however, the situation is a pretty
> clear cut. It doesn't need to be the original wording, but minimally in
> what you suggest it needs to be "s/cannot/will not/" or some such.

I see, that makes sense. Fixed.

>
> Plus a nit: In the revision log you say "shortened message text where
> possible", yet then you swapped in "due to" for the prior "for" in the
> former of the two cases discussed here. That's clearly longer, without
> (imo) gaining us anything. Similarly it's unclear why you replaced "DomU"=
.

re: message rewording: kept "for".

re: domU: I removed it because my understanding is that w/ eventual
introduction of a split between control domain and hardware domain
there might be another change here.

Kept "domU".

>
> Jan

