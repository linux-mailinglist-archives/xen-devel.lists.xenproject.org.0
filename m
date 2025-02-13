Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B1A35098
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 22:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888049.1297466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tigyd-0007d2-3T; Thu, 13 Feb 2025 21:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888049.1297466; Thu, 13 Feb 2025 21:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tigyd-0007Zl-0Z; Thu, 13 Feb 2025 21:42:31 +0000
Received: by outflank-mailman (input) for mailman id 888049;
 Thu, 13 Feb 2025 21:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bpFt=VE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tigyb-00079S-Aw
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 21:42:29 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6be5fa4e-ea53-11ef-9aa4-95dc52dad729;
 Thu, 13 Feb 2025 22:42:28 +0100 (CET)
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
X-Inumbo-ID: 6be5fa4e-ea53-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=2qw2m6vqxfgkzbtoh6zluc7vxq.protonmail; t=1739482947; x=1739742147;
	bh=GAFsJOZtkwG1qNYvADyAt8xNakp6O8sDnp2eXzebO78=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DFWN8Yzyo5xES6UbBy6sCngTB5zVUrvbnUU8j6vsVgHzfHfvMCu6jz4Dsvz019F5X
	 At8NF6g/DzhAWTH8LBnYHyOnyyyyj3Xl1Djfgqs2nXWbDtR08W80mv/y2iyvrgYGnG
	 vsj0D8hKKfleSCTIAGZdeQIJEcEEM6+lBvMa0JbXOmPeGSp+r2KUl0s7W6cBaW8mnA
	 yi0/1EGD/g7/9Uuvu/EWhZr1S7Qi0+oY+eCUFMLC1D2OYVQi4XKV13vuwwVpwM5uGp
	 jpcVpkKm7GJb+KoqHnWYiHfZJhFr4ZS+n1IklkBX/RddwADhXEvEqrH/wvZ3zjhD+g
	 IQ28qhsOMIjDQ==
Date: Thu, 13 Feb 2025 21:42:22 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/console: print Xen version via keyhandler
Message-ID: <PptSlkSshZ5N9uuAypCrdfsL0wJCvn_Xj3pTB_CbTPeDVXVHNaUnfsELa-nodP6hULBnxxbPpZhYbWgmygRGQQyKglspRfz8xnnuhY8eRg8=@proton.me>
In-Reply-To: <75db93fa-ba17-44ae-b41a-c36afd9b49ca@suse.com>
References: <20250213082639.119796-1-dmkhn@proton.me> <75db93fa-ba17-44ae-b41a-c36afd9b49ca@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cab66887c31a89cc3cf59ba9749420f65854c35e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Thursday, February 13th, 2025 at 1:10 AM, Jan Beulich <jbeulich@suse.com=
> wrote:

>=20
>=20
> On 13.02.2025 09:28, dmkhn@proton.me wrote:
>=20
> > --- a/xen/include/xen/version.h
> > +++ b/xen/include/xen/version.h
> > @@ -29,4 +29,7 @@ int xen_build_id_check(const Elf_Note *n, unsigned in=
t n_sz,
> > static inline void xen_build_init(void) {};
> > #endif
> >=20
> > +void xen_print_version(void);
> > +void xen_print_build_id(void);
>=20
>=20
> Hmm, I'm sorry, as I should have thought of this earlier already: What ex=
actly
> is the significance of the xen_ prefixes here? We're in Xen sources after=
 all.

I followed the rest of the code in version.{h,c} which has `xen_` prefixes.

I moved new definitions w/o prefix to xen/include/xen/lib.h where most
of the debug tracing facilities are declared in v3.

>=20
> Jan

Thanks,
Denis


