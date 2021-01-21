Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5DC2FF1D6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 18:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72283.130020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2djv-0003h3-7I; Thu, 21 Jan 2021 17:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72283.130020; Thu, 21 Jan 2021 17:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2djv-0003ge-45; Thu, 21 Jan 2021 17:27:23 +0000
Received: by outflank-mailman (input) for mailman id 72283;
 Thu, 21 Jan 2021 17:27:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfWZ=GY=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l2dju-0003gZ-Co
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 17:27:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c570980e-7131-40bd-bf1d-60c4cf52797d;
 Thu, 21 Jan 2021 17:27:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DB07AAAE;
 Thu, 21 Jan 2021 17:27:18 +0000 (UTC)
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
X-Inumbo-ID: c570980e-7131-40bd-bf1d-60c4cf52797d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611250038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tb4NzhL5Jd+MuLHGtq9TlXpkGp+8lxx9zzhOYoqEPn4=;
	b=gc4xa6OfYYbRIdGgfefvS1It1p74SBrKupFryX812fOmy1eiAvnvUCQq0e58LZBQe3M11W
	bf89FaMcb4U8+9HXcKxboiZ3Xz4GiyoxCq7PnvULCGwz8AVbsB4yV1/mdWlfnPvF0wARZy
	AO/3j+oIQ2gb09meXLMvuIabjcGBQCI=
Message-ID: <dcbc529ceb9bd69dbcaa3cc6b0a5b7add6a25de3.camel@suse.com>
Subject: Re: [PATCH v4 5/5] xen/cpupool: make per-cpupool sched-gran hypfs
 node writable
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 21 Jan 2021 18:27:16 +0100
In-Reply-To: <20210118115516.11001-6-jgross@suse.com>
References: <20210118115516.11001-1-jgross@suse.com>
	 <20210118115516.11001-6-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Q6OMDP6ZGGj+09WvLyCg"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-Q6OMDP6ZGGj+09WvLyCg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-01-18 at 12:55 +0100, Juergen Gross wrote:
> Make /cpupool/<id>/sched-gran in hypfs writable. This will enable per
> cpupool selectable scheduling granularity.
>=20
> Writing this node is allowed only with no cpu assigned to the
> cpupool.
> Allowed are values "cpu", "core" and "socket".
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

This holds with Jan's proposed adjustments.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Q6OMDP6ZGGj+09WvLyCg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAJuXQACgkQFkJ4iaW4
c+4OAw//TDMqJBwE4NKCfTt8jdCIuGHTn9lvCoZ/Ib0LqgM77OsEFPYiSBuZ5pP4
JjIIOXVRc2fzr5kuERtLe55mxVTUU1E7uFy9+q1+y1zU7iSySSM/mPqdo0B0kwTm
yh0wqTjvx8E4jcfd4qx4T128hAoUQlJG9A2p3ysgGs1zAu5QWpfG0vx1HZwP3Gfu
auxhTLaxvpma1Iywq1+kvIJPgb+7B1VIGbGpe6MRJ1ARyJTnL4Ed1HZ7r2E7wDB2
iVXG1E94hNBGDZx+QjBa6m46Aw97u0MB8ijkPicGIgOoLKhlWvwlmrPoQFwVKcTl
O2Fi4EDm/LdyKPwNR6IQq3OToBp5pq2jjV5lxqXpGj/bqq6uNcuVNigLp4aX4KXr
El89JrxYIi93kJUScTC+Z40qGJdG65v0LLcU0DwhyHHtX+CT01wmmlMaptuuVEW3
bVXy5tHaXKYUQXhlOVN3oQNt0h9JmBgxTf/wQHRYZLXaPGiovV8JS2LComNGHbuy
U5AN8MKyh5H5V54Q0AT8s/Bf9+dRiUqPcSiV4OqG6W2CSNSMZbSOSKbwuw1+/7H1
O+J+to64h45EURaSjTb0xkKI9EDTgZoiIJCj+sybeLYC+rNPSfCoev8cv3TSoYy5
peHxejeniBjZpCR4Noh9mnjawv/03rs4LaMjF4QljohTIgQhPJ0=
=1OLl
-----END PGP SIGNATURE-----

--=-Q6OMDP6ZGGj+09WvLyCg--


