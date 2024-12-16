Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093269F3078
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857956.1270165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNA8m-0003MD-U0; Mon, 16 Dec 2024 12:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857956.1270165; Mon, 16 Dec 2024 12:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNA8m-0003Je-RC; Mon, 16 Dec 2024 12:24:00 +0000
Received: by outflank-mailman (input) for mailman id 857956;
 Mon, 16 Dec 2024 12:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNA8m-0003JY-Az
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:24:00 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fcd946b-bba8-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:23:58 +0100 (CET)
Received: from quovadis.eurecom.fr ([10.3.2.233])
 by drago1i.eurecom.fr with ESMTP; 16 Dec 2024 13:23:58 +0100
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
X-Inumbo-ID: 9fcd946b-bba8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734351838; x=1765887838;
  h=from:in-reply-to:references:date:cc:to:mime-version:
   message-id:subject:content-transfer-encoding;
  bh=YmkfCn6dKxIG8ZjVDvxpedYpcnK0kYr3+Ph2sFjyHm8=;
  b=s/1rl30ZhKfuWyxT2vB6x4Lb9qeRUMPMVid7l2feVKCz/7sjTm/gWeR/
   mffAPuTOzNsjfZlZ1uh4zDkW3f8PUP3bhwBfhmPG2c+4odEhXK2Xaq+sC
   8yUv2YeQjzbT3ShhRT3Ha7VnF0zJNgh232kqS1Ko4GTxDSQXOrwwVqwzq
   M=;
X-CSE-ConnectionGUID: Q8Zog9VKRnySGLxjIycwzw==
X-CSE-MsgGUID: XWAlPsmtR8ibmcv8ZRuunQ==
X-IronPort-AV: E=Sophos;i="6.12,238,1728943200"; 
   d="scan'208";a="28195949"
From: "Ariel Otilibili-Anieli" <Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <92fdf726-504b-4d3b-8043-d736b275d8d0@suse.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 149.5.228.1
References: <20241216120359.10469-1-andrew.cooper3@citrix.com> <92fdf726-504b-4d3b-8043-d736b275d8d0@suse.com>
Date: Mon, 16 Dec 2024 13:23:58 +0100
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Xen-devel" <xen-devel@lists.xenproject.org>
To: "Jan Beulich" <jbeulich@suse.com>
MIME-Version: 1.0
Message-ID: <2f7a88-67601c00-f147-208cdcc@54224017>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?tools/misc=3A?= Drop xensymoops
User-Agent: SOGoMail 5.11.1
Content-Transfer-Encoding: quoted-printable

On Monday, December 16, 2024 13:09 CET, Jan Beulich <jbeulich@suse.com>=
 wrote:

> On 16.12.2024 13:03, Andrew Cooper wrote:
> > This script is not referenced by the build system, and has escaped =
all Python
> > compatibility work; it's still using print statements.
> >=20
> > Also, the regex it uses ties it to a 32bit build of Xen, which was =
dropped in
> > Xen 4.3, 11 years ago.
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
>=20

Acked-by: Ariel Otilibili-Anieli <Ariel.Otilibili-Anieli@eurecom.fr>


