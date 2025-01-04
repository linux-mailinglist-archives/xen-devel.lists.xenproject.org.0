Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A50A011F6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864973.1276242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuEt-0003aJ-4Q; Sat, 04 Jan 2025 02:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864973.1276242; Sat, 04 Jan 2025 02:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuEt-0003YG-10; Sat, 04 Jan 2025 02:50:11 +0000
Received: by outflank-mailman (input) for mailman id 864973;
 Sat, 04 Jan 2025 02:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuEs-0003Y4-28
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:50:10 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9be0c8d5-ca46-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 03:50:08 +0100 (CET)
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
X-Inumbo-ID: 9be0c8d5-ca46-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735959008; x=1736218208;
	bh=W7J6i5x/8Ek+dqAE7fl5KSCrApZ7gxyKuVWCeMHtz6Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QFtnOOkQsj8uAFCHDj5cW+sy7z6ujk5JpY5fvdo2uqwDsJH8lLWdMAClVwQxbtc2E
	 OBmXUBJLFgIywjIiga6wx4W4b/BQ4S0fiNMZcZsdEPKryFuCTv1omJaeH2Cfyl1DD7
	 2Aia51NBFBO8aUUKxVQQeRRkPq2FKZZtAKHPr2hY2M0LUK1Ye03ulZeuDawjK2K6pf
	 zLrozT5YeSp8OIhKNurdj71zZ32ixfo/shKypsbBgW8DSRxJRKVpBbw52bWj4HP+nj
	 0UDSD5Sw6GX8+Q2dkmYmBA6XO4sr007N2ZWqVKNtixCkOKehn6WNmCSmGxKgpYO4K0
	 OCL4Ct2uIYY4A==
Date: Sat, 04 Jan 2025 02:50:04 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 10/35] xen/domain: add get_initial_domain_id()
Message-ID: <xFirAmBGiUy3kGF6yY5yOXOiymKw0LP81JxwOFPYwKTDOSrF8vRWwg8nQ2X11tyDlLwt9bVrWHp0_MDmBi7Ujaq9v5f-dloBxeXlRjqoxVQ=@proton.me>
In-Reply-To: <d3280b62-1bd5-4684-bf8c-be0d6d4ee842@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-10-e9aa923127eb@ford.com> <d3280b62-1bd5-4684-bf8c-be0d6d4ee842@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6f5540a4639ab86268e368440f78a22bcbe25081
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 5:50 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > Move get_initial_domain_id() to a public API and enable for all archite=
ctures.
> > That is pre-requisite change for console focus switch logic cleanup.
>
>
> Yet then how does this fit with dom0less, let alone hyperlaunch,
> where multiple domains may be created right when Xen starts?

I see it now, thanks; fixed in v3.

>
> Plus, if you make this generic, shouldn't Arm also be adjusted to
> use this function (if nothing else then to avoid things going out
> of sync later on)?

Yes, Arm port should have been adjusted; thanks a lot!
Addressed.

>
> > @@ -2229,6 +2230,15 @@ int continue_hypercall_on_cpu(
> > return 0;
> > }
> >
> > +domid_t get_initial_domain_id(void)
> > +{
> > +#ifdef CONFIG_X86
> > + return pv_shim_initial_domain_id();
> > +#else
> > + return 0;
> > +#endif
> > +}
>
>
> Imo this either wants to use CONFIG_PV_SHIM instead, eliminating the
> need for the pv_shim_initial_domain_id() stub.

Fixed.

>
> Jan



