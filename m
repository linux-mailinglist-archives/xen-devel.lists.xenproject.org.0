Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC7B01487
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 09:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040572.1411983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua88Z-0006pJ-7Q; Fri, 11 Jul 2025 07:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040572.1411983; Fri, 11 Jul 2025 07:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua88Z-0006ns-4n; Fri, 11 Jul 2025 07:25:39 +0000
Received: by outflank-mailman (input) for mailman id 1040572;
 Fri, 11 Jul 2025 07:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qtn+=ZY=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ua88W-0006nm-UE
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 07:25:38 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c192225-5e28-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 09:25:35 +0200 (CEST)
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
X-Inumbo-ID: 3c192225-5e28-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1752218734; x=1752477934;
	bh=QO5ktJlzNlbYRAsNYToIuHG61wIIYZBdTRNQD2y3Sew=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dBpWSotSzgD4VJpAmCswUM0Kji/et/+YCjXIO7tXXl9jXI8aI/wmDFaUI54Tdt1PH
	 0FNv9uRAvuetl8nbh7ShphmT2xDpv5LQ/3mH9N4Gx1zXqCf4NzGcTUiVHyWHnyLya1
	 XiaAp+L+3yvRPWO0owYwi3bNh7XbDUgqwHLyesTt9UIyWK1xFCXjYpJYRExqGxRSTy
	 Jkw+utp3NuoRMZ6AVkpNG6ElouzHTnPWNGLkxCtJ6JlfMimuHJRaH3lwIRRR+E1dXe
	 OkmJ2T2hhltpA5n49F6qbGVJR9KYCJlBqc/xx5ijPZFnhPqcvFPSjBAdxA21UKaZXJ
	 cu6dEAPu1QJxw==
Date: Fri, 11 Jul 2025 07:25:29 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] xen/console: introduce domain_console struct
Message-ID: <aHC8ZBcRAId5wYoZ@kraken>
In-Reply-To: <f0d82045-4492-4d13-b0b1-97f95ad81727@suse.com>
References: <20250710013421.2321353-1-dmukhin@ford.com> <6e3600ad-f53c-4e9a-9713-4301b5bd0a6a@suse.com> <aHBj4IZdD50LWSgF@kraken> <f0d82045-4492-4d13-b0b1-97f95ad81727@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ac7b5905173269e9b78fa99d3df6f4b30ddcc5e5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 07:59:27AM +0200, Jan Beulich wrote:
> On 11.07.2025 03:07, dmkhn@proton.me wrote:
> > On Thu, Jul 10, 2025 at 01:16:24PM +0200, Jan Beulich wrote:
> >> On 10.07.2025 03:35, dmkhn@proton.me wrote:
> >>> @@ -877,6 +873,16 @@ struct domain *domain_create(domid_t domid,
> >>>
> >>>      /* All error paths can depend on the above setup. */
> >>>
> >>> +    BUILD_BUG_ON(DOMAIN_CONSOLE_BUF_SIZE <=3D 0);
> >>
> >> While the "equals 0" case can in principle happen, the "less than" par=
t
> >> is dead code (and hence this needs checking differently): The type of
> >> DOMAIN_CONSOLE_BUF_SIZE is an unsigned one, so wrapping through 0 will
> >> yield huge positive values.
> >>
> >>> +    err =3D -ENOMEM;
> >>> +    d->console =3D xzalloc_bytes(DOMAIN_CONSOLE_SIZE);
> >>
> >> As previously indicated, new code ought to use the xv*alloc family of
> >> functions, which deliberately doesn't include any ..._bytes() forms.
> >> Note how instead there is xvzalloc_flex_struct() for situations like
> >> the one here.
> >
> > Looks like xvzalloc_flex_struct() is not used anywhere in the code base=
...
>=20
> And what do you mean to tell me by that? xvmalloc_flex_struct() is used,
> and x[mz]alloc_flex_struct() uses are still in need of conversion (which
> is going to be a slow-going process).

Just an observation; I was not aware of these APIs and I was not aware that
there's some slow-going process of switching to preferred use of
xvzalloc_flex_struct().

>=20
> Jan


