Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF89F8E7C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 10:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861743.1273816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYsv-0007Ds-Gq; Fri, 20 Dec 2024 09:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861743.1273816; Fri, 20 Dec 2024 09:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYsv-0007B2-EG; Fri, 20 Dec 2024 09:01:25 +0000
Received: by outflank-mailman (input) for mailman id 861743;
 Fri, 20 Dec 2024 09:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWOG=TN=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOYst-0007An-Cz
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 09:01:23 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbd9c6e7-beb0-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 10:01:22 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 10:01:21 +0100
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
X-Inumbo-ID: fbd9c6e7-beb0-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734685282; x=1766221282;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=3cDZTH3cvRhkQzEcJFEiStos4UDvJ0eUCTYXRT9Ws1k=;
  b=ulFwtttF04iv8AJWk8EAndxkqoSWg2iQgFSCj9XftXf7og52tbKQvru5
   F9GPylcmWp8w+rvaMECwSnUCxV5rBiYqhHI0xMUeEbxg0skafd7gstvk9
   payVaOIV+nG5arX1GemVNj3OuPA7YSD0WAvsGibDo+PKe0+tIveoI5z9h
   s=;
X-CSE-ConnectionGUID: iv3DghtwRHS6pJQXUjVQ6A==
X-CSE-MsgGUID: rgbF/hAgTNiEl2a9YjEAiw==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; 
   d="scan'208";a="28266625"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <2024122052-laurel-showbiz-4d7b@gregkh>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-2-ariel.otilibili-anieli@eurecom.fr>
 <2024122042-guidable-overhand-b8a9@gregkh>
 <2f7a82-67652e80-9181-6eae3780@215109797> <2024122052-laurel-showbiz-4d7b@gregkh>
Date: Fri, 20 Dec 2024 10:01:21 +0100
Cc: linux-kernel@vger.kernel.org, "Jan Beulich" <jbeulich@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
To: "Greg KH" <gregkh@linuxfoundation.org>
MIME-Version: 1.0
Message-ID: <2f7a83-67653280-a2f5-5cf12280@54008765>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/1] =?utf-8?q?lib=3A?= Remove dead code
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Friday, December 20, 2024 09:53 CET, Greg KH <gregkh@linuxfoundation=
.org> wrote:

> On Fri, Dec 20, 2024 at 09:44:31AM +0100, Ariel Otilibili-Anieli wrot=
e:
> > On Friday, December 20, 2024 08:09 CET, Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> >=20
> > > On Thu, Dec 19, 2024 at 11:45:01PM +0100, Ariel Otilibili wrote:
> > > > This is a follow up from a discussion in Xen:
> > > >=20
> > > > The if-statement tests `res` is non-zero; meaning the case zero=
 is never reached.
> > > >=20
> > > > Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683=
d4ca5f0@suse.com/
> > > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > > > Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.=
fr>
> > > > --
> > > > Cc: stable@vger.kernel.org
> > >=20
> > > Why is "removing dead code" a stable kernel thing?
> >=20
> > Hello Greg,
> >=20
> > It is what I understood from the process:
> >=20
> > "Attaching a Fixes: tag does not subvert the stable kernel rules pr=
ocess nor the requirement to Cc: stable@vger.kernel.org on all stable p=
atch candidates." [1]
> >=20
> > Does my understanding make sense?
>=20
> I'm confused, what are you expecting to happen here?  Why is this eve=
n
> marked as a "fix"?
>=20
> > [1] https://docs.kernel.org/process/submitting-patches.html
>=20
> Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rule=
s.html

I am, Greg; thanks for the heads up.
>=20
> for the stable kernel rules.
>=20
> Again, you have a "cc: stable@..." in your patch, why?

Removed stable from the thread.
>=20
> thanks,
>=20
> greg k-h


