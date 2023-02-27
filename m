Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D86A4FB3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 00:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502979.775064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWn1U-0002S0-Jr; Mon, 27 Feb 2023 23:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502979.775064; Mon, 27 Feb 2023 23:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWn1U-0002PV-H2; Mon, 27 Feb 2023 23:35:12 +0000
Received: by outflank-mailman (input) for mailman id 502979;
 Mon, 27 Feb 2023 23:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnJS=6X=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1pWn1T-0002PM-5q
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 23:35:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d941f02-b6f7-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 00:35:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA771B80DBF;
 Mon, 27 Feb 2023 23:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A5CC433EF;
 Mon, 27 Feb 2023 23:35:04 +0000 (UTC)
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
X-Inumbo-ID: 5d941f02-b6f7-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677540904;
	bh=1utzo10uAmMF/26nJZf2EhfUMs6ZWXfW3bGazBQ+oR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IxDESo6p78DEc2xrjH44dO6Rvu5BFSD0/YufMoLBkYiH3Wu3V3+RT4qYjhaBUfSfb
	 3qFFCl+FooJHouSg+7fBZzbwvUNrdBlc6z3SfLs+5AJz1ishoJTAl2g485oPAmsFmv
	 e+h5kLIqQ0yYrb8pcKm/0nzBKwD+5WtPKulU6eXlEDfr7w6SH7tvqWuEi9+ICr5J3x
	 pCum5p60LUbPrrp+xYYN92NvSf8iibCjb/OEYFxdZ3/qrZWjJkSsqHOKqLReltQIEH
	 KXsUvU2h8sPbNFuBtlOqdW+mMeldD3xyDMzBTIiAX1yRpy88RQeGjHMK/SoQXU1N7Z
	 zIDz4AMZ9eg6Q==
Date: Mon, 27 Feb 2023 15:35:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen-netback: remove unused variables pending_idx and
 index
Message-ID: <20230227153503.3bc54eaf@kernel.org>
In-Reply-To: <f3f8584e-e97d-abe9-5749-da5bf3587a57@suse.com>
References: <20230226163429.2351600-1-trix@redhat.com>
	<f3f8584e-e97d-abe9-5749-da5bf3587a57@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2023 09:29:30 +0100 Juergen Gross wrote:
> On 26.02.23 17:34, Tom Rix wrote:
> > building with gcc and W=3D1 reports
> > drivers/net/xen-netback/netback.c:886:21: error: variable
> >    =E2=80=98pending_idx=E2=80=99 set but not used [-Werror=3Dunused-but=
-set-variable]
> >    886 |                 u16 pending_idx;
> >        |                     ^~~~~~~~~~~
> >=20
> > pending_idx is not used so remove it.  Since index was only
> > used to set pending_idx, remove index as well.
> >=20
> > Signed-off-by: Tom Rix <trix@redhat.com> =20
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>

Applied, thanks!

