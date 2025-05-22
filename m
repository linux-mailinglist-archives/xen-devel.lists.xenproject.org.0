Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC96AC1303
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 20:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994550.1377496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIALC-0001Hw-6N; Thu, 22 May 2025 18:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994550.1377496; Thu, 22 May 2025 18:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIALC-0001FG-31; Thu, 22 May 2025 18:08:26 +0000
Received: by outflank-mailman (input) for mailman id 994550;
 Thu, 22 May 2025 18:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=45pF=YG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uIAL9-0001FA-Ja
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 18:08:24 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bed4d3e0-3737-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 20:08:21 +0200 (CEST)
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
X-Inumbo-ID: bed4d3e0-3737-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747937300; x=1748196500;
	bh=reUAAhVWVNWDEvGUgHpJqYIYTgi/PaLrMgGyf/TKwe4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=DQHklkfNFePrpeCGOJACqLidARCgjsVIrbUt+xpg09XtYi51gv6RVE+R4YoswGsau
	 Vn1T9CBK9rCP74YNSp49BxlS9V3v9HKriDGdyEEJ5Pjje7m4f2sCU2r9DUNbuGmgRJ
	 AC3tV+LzLSSvs94vEhIZFJfKYvpqsS0upDrbyy6UdFaTcwg8NBucMfqSajBC/FlJTq
	 8tNYGaX9rYn9HsoaJlXUFhG4dj0Ki4Yz5p46dSKCahDIU5Dily89e41qDoxX2D5wDb
	 CAoFBUeCzqQm5X/5YrbJkU6VyPB2b5RTAiLVWFOIWuiAXmIE6hssWfAV9rK7N/hp9D
	 wbt6bXnKwNLFw==
Date: Thu, 22 May 2025 18:08:13 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 3/3] xen/domain: introduce CONFIG_MAX_DOMID
Message-ID: <aC9oCJB/xt3xM6VX@kraken>
In-Reply-To: <3b203f39-756b-4fb3-b0e5-0f790701c23a@suse.com>
References: <20250521000024.2944685-1-dmukhin@ford.com> <20250521000024.2944685-4-dmukhin@ford.com> <54945bd5-333e-4ffd-8ff1-bb89d22c7ef4@suse.com> <aC5rRwyN51pdRRCM@kraken> <3b203f39-756b-4fb3-b0e5-0f790701c23a@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5581f2ba9d0e0f4f2bd2882fab2b9e0270f5ab79
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 09:01:51AM +0200, Jan Beulich wrote:
> On 22.05.2025 02:09, dmkhn@proton.me wrote:
> > On Wed, May 21, 2025 at 09:31:34AM +0200, Jan Beulich wrote:
> >> On 21.05.2025 02:00, dmkhn@proton.me wrote:
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -331,10 +331,9 @@ static int ffa_domain_init(struct domain *d)
> >>>       * reserved for the hypervisor and we only support secure endpoi=
nts using
> >>>       * FF-A IDs with BIT 15 set to 1 so make sure those are not used=
 by Xen.
> >>>       */
> >>> -    BUILD_BUG_ON(DOMID_FIRST_RESERVED >=3D UINT16_MAX);
> >>
> >> Why's this being moved to common code? It certainly may have a purpose=
 here
> >> (which I'm simply unaware of); I don't see what purpose it has in comm=
on
> >> code.
> >
> > My understanding having DOMID_FIRST_RESERVED compile-time checks in one=
 place
> > is good for testability: the check in question also applies to x86.
> >
> > I will drop that hunk.
>=20
> And also the other one, unless you can explain what exactly you're checki=
ng.
> The connection between DOMID_FIRST_RESERVED and UINT16_MAX is at best
> indirect, through domid_t. Yet if domid_t was widened (possible in princi=
ple,
> but breaking the ABI) that check would end up wrong without the compiler
> noticing (unless DOMID_FIRST_RESERVED was also bumped, which however is a=
n
> independent thing).

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 82b9c05a76..452d9f63dc 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -572,7 +572,7 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 #endif
=20
 /* Domain ids >=3D DOMID_FIRST_RESERVED cannot be used for ordinary domain=
s. */
-#define DOMID_FIRST_RESERVED xen_mk_uint(0x7FF0)
+#define DOMID_FIRST_RESERVED xen_mk_uint(0xFFFF7FF0)
=20
 /* DOMID_SELF is used in certain contexts to refer to oneself. */
 #define DOMID_SELF           xen_mk_uint(0x7FF0)


The above patch ^^ pretty much passes the compilation on x86.
The compile time check in question currently exists for Arm only but could
catch such mistake when the limit is bumped (if any), it is easy to
spot.

>=20
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
> >>>  =09  Amount of memory reserved for the buddy allocator to serve Xen =
heap,
> >>>  =09  working alongside the colored one.
> >>>
> >>> +config MAX_DOMID
> >>> +=09int "Maximum number of user domains"
> >>> +=09range 1 32752
> >>> +=09default 32752
> >>> +=09help
> >>> +=09  Specifies the maximum number of domains a user can create.
> >>
> >> My prior comment remains: The description and help needs to be accurat=
e, in
> >> order to not cause any confusion. In a true dom0less environment I'm n=
ot
> >> sure the "user" can create any domains (post boot, that is). And when =
there
> >> is Dom0 (or late hwdom), the number specified already isn't the number=
 of
> >> domains one can create (again, post boot, which is how I understand "u=
ser
> >> domains"). If someone picked 1 as the value here, it's unclear to me h=
ow
> >> late hwdom or dom0less would work in the first place.
> >
> > Do you think something like the following will be more accurate?
> >
> >     config MAX_DOMID
> >        int "Maximum number of domains"
> >        range 1 32752
> >        default 32752
> >        help
> >          Specifies the maximum number of domains: dom0 or late hwdom,
> >          predefined domains, post-boot domains, excluding Xen system do=
mains
> >          (domid >=3D DOMID_FIRST_RESERVED).
>=20
> Especially the mention of DOMID_FIRST_RESERVED is too much of an implemen=
tation
> detail here, imo. Beyond that - maybe, but I'm not overly happy this way =
either.

Will the following description will be satisfactory?

config MAX_DOMID
       int "Maximum domain ID"
       range 1 32752
       default 32752
       help
         Specifies the maximum domain ID (dom0 or late hwdom, predefined
         domains, post-boot domains, excluding Xen system domains).

>=20
> As an aside - MAX_DOMID and "Maximum number of domains" are conflicting
> with one another, too: Do you mean "maximum ID" or "maximum number of"? T=
he two
> are different by 1.

That would be "maximum ID", thank you.

>=20
> Jan


