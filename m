Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756525BA375
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 02:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407736.650331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYz5r-0000uz-LZ; Fri, 16 Sep 2022 00:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407736.650331; Fri, 16 Sep 2022 00:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYz5r-0000rW-Ia; Fri, 16 Sep 2022 00:20:31 +0000
Received: by outflank-mailman (input) for mailman id 407736;
 Fri, 16 Sep 2022 00:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VamP=ZT=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1oYz5p-0000rQ-Rz
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 00:20:29 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e3589dd-3555-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 02:20:28 +0200 (CEST)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1oYz5k-0005Wp-61; Fri, 16 Sep 2022 01:20:24 +0100
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
X-Inumbo-ID: 5e3589dd-3555-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=d.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=z/Oshp60xl+JFflm5d7YrYXSrZUKWk3su2XBZzLs6xg=; b=fThbEwtInDzE
	VPr606US+xM8zo4ebdUq7DILg+vydSFEtIE9oul7XeRjMzgbOOXvZZg0Saj5ugEVlSC05OvM7p9/W
	tjcrxwepPXpC7kFCPmnYLJEg2F7ZtKS3kaXWrN3LE5UmQdStseUCMBuPVwsAHfdpwM0q/+A14KHf6
	d/VuuRVKv2+/9VZUxBTWChgfPzjNOOACjWQybcnUOUXrouyJ60d4Be7vsYW1JKdYA1P/SGn1uvS73
	ICCtEEg2dFrk/7Fb8FeZsPc4tHPHTlNtrXnP0PtM3c8KGOvvCEDZvWUJ61DRZurdEk4Ozs9yaZLmA
	qLiu4eT0l7DP/B8TyOZEZw==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <25379.49467.262316.722608@chiark.greenend.org.uk>
Date: Fri, 16 Sep 2022 01:20:11 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
    xen-devel@lists.xenproject.org,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH] libvirt: disable Werror for non-libvirt flights
In-Reply-To: <YyNJHURbDNeeZhEf@MacBook-Air-de-Roger.local>
References: <20220913100328.27771-1-roger.pau@citrix.com>
	<YyMyc0O9N9l1NzEZ@perard.uk.xensource.com>
	<YyNJHURbDNeeZhEf@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/df/dfe474b8ea4127edd09b653f3faec3f3.pem

Roger Pau Monn=E9 writes ("Re: [PATCH] libvirt: disable Werror for non-=
libvirt flights"):
> I don't mind using -Dwerror=3Dfalse if that's considered better. Ian,=
 do
> you have an opinion?

No, I don't think I do.  I think it depends on what kinds of things
are likely to change, or go wrong, in libvirt.

-    *)        libvirt_build_runvars+=3D" make_njobs=3D1";;
+    *)        libvirt_build_runvars+=3D" make_njobs=3D1 meson_options=3D=
-Dwerror=3Dfalse autogen_options=3D--disable-werror";;

I wonder if it would be better to abstract this away and instead have
a runvar like "libvrit_build_werror=3Dfalse".  But maybe that is
gold-plating it.

If you choose to keep that the way it is, then for either version of
this patch:

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>


--=20
Ian Jackson <ijackson@chiark.greenend.org.uk>   These opinions are my o=
wn. =20

Pronouns: they/he.  If I emailed you from @fyvzl.net or @evade.org.uk,
that is a private address which bypasses my fierce spamfilter.

