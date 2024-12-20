Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D99F8F1C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 10:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861773.1273846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOZRI-0004iV-P2; Fri, 20 Dec 2024 09:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861773.1273846; Fri, 20 Dec 2024 09:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOZRI-0004fO-M6; Fri, 20 Dec 2024 09:36:56 +0000
Received: by outflank-mailman (input) for mailman id 861773;
 Fri, 20 Dec 2024 09:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWOG=TN=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOZRH-0004fI-Ct
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 09:36:55 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f28238db-beb5-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 10:36:54 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 10:36:53 +0100
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
X-Inumbo-ID: f28238db-beb5-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734687414; x=1766223414;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=VH4YGcgb9p64u5EEltPGqnwSQiOBvYjcKhF+XUbUJ8M=;
  b=s+JqHj3agyGpgeFFAxpvVj66Dgr+tUVsOC6fWawj2NZpeLN6nkS1lfkl
   X+jK4EySBAz3VpGK1EFz6gokCkCx8ZsppD3Ox0a97yXfnhE48P2+ZfbW9
   SsvdvGzUcu97dMjFBuJyxwMAuok6qq+xVZO0h5Gtz6/LseD2LiKFGIfom
   c=;
X-CSE-ConnectionGUID: PdNeQV8xRfqy8xfPiJnWAg==
X-CSE-MsgGUID: fpJ+SUzHQVaLbXaCME9h6Q==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; 
   d="scan'208";a="28267110"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <2f7a83-67653280-a2f5-5cf12280@54008765>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-2-ariel.otilibili-anieli@eurecom.fr>
 <2024122042-guidable-overhand-b8a9@gregkh>
 <2f7a82-67652e80-9181-6eae3780@215109797> <2024122052-laurel-showbiz-4d7b@gregkh> <2f7a83-67653280-a2f5-5cf12280@54008765>
Date: Fri, 20 Dec 2024 10:36:53 +0100
Cc: linux-kernel@vger.kernel.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
To: "Greg KH" <gregkh@linuxfoundation.org>
MIME-Version: 1.0
Message-ID: <2f7a89-67653a80-c09b-70827e80@197000382>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/1] =?utf-8?q?lib=3A?= Remove dead code
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Friday, December 20, 2024 10:01 CET, "Ariel Otilibili-Anieli" <Ariel=
.Otilibili-Anieli@eurecom.fr> wrote:

> On Friday, December 20, 2024 09:53 CET, Greg KH <gregkh@linuxfoundati=
on.org> wrote:
>=20
> > On Fri, Dec 20, 2024 at 09:44:31AM +0100, Ariel Otilibili-Anieli wr=
ote:
> > > On Friday, December 20, 2024 08:09 CET, Greg KH <gregkh@linuxfoun=
dation.org> wrote:
> > >=20
> > > > On Thu, Dec 19, 2024 at 11:45:01PM +0100, Ariel Otilibili wrote=
:
> > > > > This is a follow up from a discussion in Xen:
> > > > >=20
> > > > > The if-statement tests `res` is non-zero; meaning the case ze=
ro is never reached.
> > > > >=20
> > > > > Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e96=
83d4ca5f0@suse.com/
> > > > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > > > > Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eureco=
m.fr>
> > > > > --
> > > > > Cc: stable@vger.kernel.org
> > > >=20
> > > > Why is "removing dead code" a stable kernel thing?
> > >=20
> > > Hello Greg,
> > >=20
> > > It is what I understood from the process:
> > >=20
> > > "Attaching a Fixes: tag does not subvert the stable kernel rules =
process nor the requirement to Cc: stable@vger.kernel.org on all stable=
 patch candidates." [1]
> > >=20
> > > Does my understanding make sense?
> >=20
> > I'm confused, what are you expecting to happen here?  Why is this e=
ven
> > marked as a "fix"?

My understanding was that, for one-liners, the reference commit should =
be included; and CC stable.
> >=20
> > > [1] https://docs.kernel.org/process/submitting-patches.html
> >=20
> > Please read:
> >     https://www.kernel.org/doc/html/latest/process/stable-kernel-ru=
les.html
>=20
> I am, Greg; thanks for the heads up.

Now I got the procedure; thank you.
> >=20
> > for the stable kernel rules.
> >=20
> > Again, you have a "cc: stable@..." in your patch, why?
>=20
> Removed stable from the thread.

Hello again, Greg;

I should have said it upfront, for us to understand one another.
I have just checked, this thread is about v2 of the patch (with stable =
in CC); and v1 (without) was already accepted by  Andrew Morton [1].

If anything else I need to do, let me know.

Have a good day,
Ariel

[1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tre=
e/patches/lib-remove-dead-code.patch
> >=20
> > thanks,
> >=20
> > greg k-h


