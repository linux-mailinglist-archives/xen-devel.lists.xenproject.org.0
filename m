Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFA937A67
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 18:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761145.1171140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUqAr-0006nM-Vm; Fri, 19 Jul 2024 16:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761145.1171140; Fri, 19 Jul 2024 16:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUqAr-0006kb-T2; Fri, 19 Jul 2024 16:09:37 +0000
Received: by outflank-mailman (input) for mailman id 761145;
 Fri, 19 Jul 2024 16:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DsCa=OT=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sUqAq-0006kS-LD
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 16:09:36 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49c512ce-45e9-11ef-bbfd-fd08da9f4363;
 Fri, 19 Jul 2024 18:09:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721405370197363.9369552082903;
 Fri, 19 Jul 2024 09:09:30 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e026a2238d8so2127906276.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 09:09:29 -0700 (PDT)
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
X-Inumbo-ID: 49c512ce-45e9-11ef-bbfd-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1721405371; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D4F0XK7cdd/mv0z53PeFdezJVscDVugoTxyfIaOMyc0dGn6n2WWr6y/xombgNLS6bXK/Ai5retY25sjczetP0u9no6BQFMdsoLts5ZbUjhiKh2ZM8qy/kvcTGIYnBv2f/Vb5rHJXD3TvWkQ4hBGBLnbHJF2DgEAr+D7zXaw4X7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721405371; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gwqbqtHCZgoj8RT1GA/9N7f8kzTOeXXpyebls8KObrU=; 
	b=F13HKnedmMwbQH2IyrpO7hHme4Q32PJqR0RD0NHRgZN71yfhoBy3OYZsvF8nFy6RdHd2UdUg8Htj0g3Pd5DmtJLFv+L2dad/gBcT66+Xm3znGYwbB4MnzJTxeulpAImZ2+p8RO9mIbTS98ww4cbPuQeBnnxpWUfT80rHD21ASjU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721405371;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gwqbqtHCZgoj8RT1GA/9N7f8kzTOeXXpyebls8KObrU=;
	b=CLMhnBntyogWNjLi3ppn2GSdQWUFwjGwl9RHSillO0EDTq7WE/QVrLwUDoe6/dkQ
	sdk/LGPE7/757ZEiayvTP/J6RctZ+4sxTBt2ucLtq4qxiQ5/doa6lBU2ja5pXud/08K
	ATJ305xEGNHKgZz3sZPA8wr4fLKhXF3/44Nt3daw=
X-Gm-Message-State: AOJu0YxmsvoZw0Wkj36JIAUGR6Sx4dZ0h80UjetFpUBxV9ANHP5a+vGB
	C/26NilDsA3Jpxc7fLU8groPFVfDNUQTMqjfwQ5PmEQqHPLJzwZMxqsMSGi5bPG12hfdtb0pYXh
	eBBmjAdRdDnr3L4jLxXumYk6ulws=
X-Google-Smtp-Source: AGHT+IGIwL5vcamb/waCgpTBzGm0eTemh/8kJ3Q7NfxqUqBz/CA2NKZnx7bkjWYY6bAJLjrxKQgUhP+2y4ZgE/akMa8=
X-Received: by 2002:a05:6902:2088:b0:e02:b51f:830f with SMTP id
 3f1490d57ef6-e087045a554mr106407276.41.1721405369388; Fri, 19 Jul 2024
 09:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com> <D2SUHZ78N3M5.231Q6OE5GA3GE@cloud.com>
In-Reply-To: <D2SUHZ78N3M5.231Q6OE5GA3GE@cloud.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Jul 2024 12:08:53 -0400
X-Gmail-Original-Message-ID: <CABfawhnKQG8T1K+rOdsq9vWFfm_Ba0NgPciQ0CRvZFoZQY5h9w@mail.gmail.com>
Message-ID: <CABfawhnKQG8T1K+rOdsq9vWFfm_Ba0NgPciQ0CRvZFoZQY5h9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Add scripts/oss-fuzz/build.sh
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 1:36=E2=80=AFPM Alejandro Vallejo
<alejandro.vallejo@cloud.com> wrote:
>
> On Tue Jun 25, 2024 at 11:47 PM BST, Tamas K Lengyel wrote:
> > The build integration script for oss-fuzz targets. Future fuzzing targe=
ts can
> > be added to this script and those targets will be automatically picked =
up by
> > oss-fuzz without having to open separate PRs on the oss-fuzz repo.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> >  scripts/oss-fuzz/build.sh | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100755 scripts/oss-fuzz/build.sh
> >
> > diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> > new file mode 100755
> > index 0000000000..2cfd72adf1
> > --- /dev/null
> > +++ b/scripts/oss-fuzz/build.sh
> > @@ -0,0 +1,23 @@
> > +#!/bin/bash -eu
>
> The shebang probably wants to be "/usr/bin/env bash" to account for syste=
ms
> that don't have bash specifically there.
>
> With that "-eu" would need to move down a line to be "set -eu"

Thanks but this script is specifically made for just one environment
and does not need to account for other systems.

Cheers,
Tamas

