Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E139F8E27
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 09:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861717.1273786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYcc-00037r-Pf; Fri, 20 Dec 2024 08:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861717.1273786; Fri, 20 Dec 2024 08:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOYcc-00034b-MK; Fri, 20 Dec 2024 08:44:34 +0000
Received: by outflank-mailman (input) for mailman id 861717;
 Fri, 20 Dec 2024 08:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWOG=TN=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOYcb-00033z-IP
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 08:44:33 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d5a6e9-beae-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 09:44:32 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 20 Dec 2024 09:44:31 +0100
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
X-Inumbo-ID: a1d5a6e9-beae-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734684272; x=1766220272;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=MhFL34B+Wvm9oSwNNFdcMDYglsbCPPNQyJ/6awuEq94=;
  b=0dUuxBZHU2FvXzzjp0mY/PJmRyvM0yrkeOb69nX+a4URc6XEGRhJPMzv
   HLx+RumhOHp/kWVNHQ+FmKSIAeHUoTlpXO86YlgakCA5FD7CNVe7BXnsL
   PyLOT5uw5vdyLFv7jQ+lxDvlUTh2MR8TbcO8PkHBZRIbN1+yvPIXlv/S3
   k=;
X-CSE-ConnectionGUID: 3lLPQu7pSRCtQmZ3lBE9rQ==
X-CSE-MsgGUID: F0kXtgcrRpeBqb+3wzvApQ==
X-IronPort-AV: E=Sophos;i="6.12,250,1728943200"; 
   d="scan'208";a="28266527"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <2024122042-guidable-overhand-b8a9@gregkh>
Content-Type: text/plain; charset="utf-8"
X-Forward: 88.183.119.157
References: <20241219092615.644642-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-1-ariel.otilibili-anieli@eurecom.fr>
 <20241219224645.749233-2-ariel.otilibili-anieli@eurecom.fr> <2024122042-guidable-overhand-b8a9@gregkh>
Date: Fri, 20 Dec 2024 09:44:31 +0100
Cc: linux-kernel@vger.kernel.org, "Jan Beulich" <jbeulich@suse.com>, stable@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
To: "Greg KH" <gregkh@linuxfoundation.org>
MIME-Version: 1.0
Message-ID: <2f7a82-67652e80-9181-6eae3780@215109797>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/1] =?utf-8?q?lib=3A?= Remove dead code
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Friday, December 20, 2024 08:09 CET, Greg KH <gregkh@linuxfoundation=
.org> wrote:

> On Thu, Dec 19, 2024 at 11:45:01PM +0100, Ariel Otilibili wrote:
> > This is a follow up from a discussion in Xen:
> >=20
> > The if-statement tests `res` is non-zero; meaning the case zero is =
never reached.
> >=20
> > Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca=
5f0@suse.com/
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
> > --
> > Cc: stable@vger.kernel.org
>=20
> Why is "removing dead code" a stable kernel thing?

Hello Greg,

It is what I understood from the process:

"Attaching a Fixes: tag does not subvert the stable kernel rules proces=
s nor the requirement to Cc: stable@vger.kernel.org on all stable patch=
 candidates." [1]

Does my understanding make sense?

Regards,
Ariel

[1] https://docs.kernel.org/process/submitting-patches.html

>=20
> confused,
>=20
> greg k-h


