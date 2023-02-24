Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B96A1F18
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501226.772879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaSK-0003iF-Ns; Fri, 24 Feb 2023 15:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501226.772879; Fri, 24 Feb 2023 15:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVaSK-0003gU-Kx; Fri, 24 Feb 2023 15:57:56 +0000
Received: by outflank-mailman (input) for mailman id 501226;
 Fri, 24 Feb 2023 15:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+11/=6U=citrix.com=prvs=4121c3e27=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVaSJ-0003gH-L3
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:57:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8d8428-b45b-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 16:57:49 +0100 (CET)
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
X-Inumbo-ID: fb8d8428-b45b-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677254269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mGK4sVuywPtn9RlB8nuTz5RshNsNbm0fHTmP0XqHyqg=;
  b=XPN7Z3mxZUWbhgOfH9s5mvTZn3zAIWgYoj7tc4FRWHAphby57HhBIw93
   FbrdDyBixNpDV/VLFkdiZhetxiJqha6UsZIEUcbpdiIkTpdRoqu0bs5si
   iLGpD+tKGHnEWTMBTCCgm2AJe1nSqz1y2gv23vJBKOdngZccfZ7JgfXb2
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98838575
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4OTNNK2onlQncLM+kPbD5edxkn2cJEfYwER7XKvMYLTBsI5bpzZTn
 2odW2zQb/yDMWenLdx3Od/l/R5S68fczt4xGgQ6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLktO7
 94KGAo3SB24276Q46mxCfRhiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJUFxRbF+
 T+uE2LRGj4QaYOW1Rq5zG/0mv+MwTPCX9IWG+jtnhJtqALKnTFCYPEMbnOguuWwgEO6X9NZK
 mQX9zAooKx081akJvH0RxCiqWSIlgIdUdFXVeY97WmlwaPO7wGULmMNVDJGZZots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAtuoe55ttp11SWE4glSfTu5jHoJd3u6
 x+grDIclYUpt+gG7Pnn23PciXGxq5ecG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4ctPupd6Oxwl8AM8OgJsdiFBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05k2XvGLhHjuJ6lnFWKYbvqXfTlUnP7FZjTCTNFedt3KWmM4jVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQliEJTPPriv85Y/XrfacmJb9JQJV6e5LUUJJ9Y0wMy4V47go
 hmAZ6Ov4ACv1S2fcVXWOy8LhXGGdc8XkE/X9BcEZT6As0XPq672hEvDX/PbpYUaydE=
IronPort-HdrOrdr: A9a23:9OzmFKP/kTxIFsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98838575"
Date: Fri, 24 Feb 2023 15:57:37 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 6/7] automation: Remove testing on Debian Jessie
Message-ID: <Y/jecZi6gKVN18r1@perard>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <20230221165542.7642-7-anthony.perard@citrix.com>
 <04e6ccb1-919f-671e-6d70-15a74e01bbb4@citrix.com>
 <7ec61260-0fec-25e2-6fa7-ec1d86e8067d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ec61260-0fec-25e2-6fa7-ec1d86e8067d@citrix.com>

On Tue, Feb 21, 2023 at 06:01:19PM +0000, Andrew Cooper wrote:
> On 21/02/2023 5:59 pm, Andrew Cooper wrote:
> > On 21/02/2023 4:55 pm, Anthony PERARD wrote:
> >> Jessie as rearch EOL in 2020.
> >>
> >> Even if we update the containers, we would still not be able to reach
> >> HTTPS webside with Let's Encrypt certificates and thus would need more
> >> change to the container.
> >>
> >> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > How is this interact with the other patches in the series?
> >
> > I presume we do want to take patch 4 and rebuild the containers, for the
> > older branches.  And that's fine.
> >
> > And IMO we should be dropping jessie testing, so this is almost fine for
> > staging.
> >
> > Except, jessie-32 is the only x86-32 build test we've got, so I think we
> > want to replace it with a newer container before dropping the jessie*.

Actually, we have two mores: debian-unstable-32-* and
debian-stretch-32-*. So an old distrib and a very new. So there's
probably no need to add more.

> Further to this, I really don't think we need to have a 4-wide matrix of
> {clang,gcc}{debug,release} for just a 32bit tools userspace.  Debug
> clang+gcc will do, and save on some testing cycles.

I guess we could remove debian-{stretch,unstable}-32-{clang,gcc}. I'll
add a patch for that.

> ~Andrew
> 
> >
> >> ---
> >> Notes:
> >>     HTTPS would fail unless we commit "automation: Remove expired root
> >>     certificates used to be used by let's encrypt", that is. Patch still in
> >>     the series, and fix Jessie.
> > If we're dropping the jessie containers, do we really need that change
> > too?  Because we really shouldn't be playing around with URLs on older
> > branches.

No, there's no need to change it. It's just a bit confusing to both
update and delete. In the patch that remove the debian-jessie jobs, I
kind of want to also remove the dockerfile, but if the dockerfile is
updated in the series it is weird to remove it in that same series.

Thanks,

-- 
Anthony PERARD

