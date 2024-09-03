Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EAA969722
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788829.1198306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOxv-0007VR-8Y; Tue, 03 Sep 2024 08:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788829.1198306; Tue, 03 Sep 2024 08:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOxv-0007Su-5K; Tue, 03 Sep 2024 08:32:43 +0000
Received: by outflank-mailman (input) for mailman id 788829;
 Tue, 03 Sep 2024 08:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5tXF=QB=bounce.vates.tech=bounce-md_30504962.66d6c9a7.v1-096c52b5589343dda023f5bc3b4cbfa2@srs-se1.protection.inumbo.net>)
 id 1slOxt-0007Gc-4U
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:32:41 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14ad7d22-69cf-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 10:32:40 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Wyf530sZpzLfH1Zl
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 08:32:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 096c52b5589343dda023f5bc3b4cbfa2; Tue, 03 Sep 2024 08:32:39 +0000
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
X-Inumbo-ID: 14ad7d22-69cf-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725352359; x=1725612859;
	bh=wCHqlXP1stAcHaoCgYEV5pAQXD3geJJLEaZMxxeyDjw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=oDskWkbRq/r9ALwTwdxdHLbmDeCym4uQec4ctw9mMfyW4HTtT7Vv03XIH1y29I9nk
	 dkt4kQJysy/lu8Dyjl+L23pCZoC4ig8q/gDtOs1iypsKQJsMhHtx5t8R7mpJhFQ/WQ
	 JrcTL5WOKAbOiGnC+YDP03XoNOSyCsQ13c/+uxy4WdoL/h0H0h2+dYk/Pith4w7UNk
	 OUJlNQwUv7rmhwGQnr+T18fZ1pV2wnKzj5c7TxERP3FjMdXbY4Y9QT2cVGYQTxRLYM
	 Csbrm9H5RkxYWHaepis/sxPZJe0xs1Vc75JxTlTbaQwMFSOHVRzuugrpykT+fHltUf
	 FAdKFtUxBkILw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725352359; x=1725612859; i=anthony.perard@vates.tech;
	bh=wCHqlXP1stAcHaoCgYEV5pAQXD3geJJLEaZMxxeyDjw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m+bo3O73UBL+Yf5J8fxETjkr2tMomeiy0eMEG5PUvTe9BKON2M8qtEmzlaxZB/tjw
	 opQodOmoh22zeWL/wqpFgnDxatXKGdOLg4ntTpHOBgBopYotgWCajVFJ+vJKu4WvS8
	 qO+p84tOxI+9ElcaUoimjtUWh0huHcFR7oxeQsS7ok/3daTKPasOFLBjj1Cy58Y7yj
	 GZXSNFPp/HsyqHuRobN2BbnC+0eo3OKSDf8QXNPH4oNkPgutI1F7bipp7MWNn639O/
	 m2NfjJZpicNFjK6kZdpohnOEIzm7gxsRsO4qhHren0QvdHOrDmQRiUkYwD9y9I1+LU
	 QOxND44I3dcFw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v3=203/3]=20libxl:=20Update=20the=20documentation=20of=20libxl=5Fxen=5Fconsole=5Fread=5Fline()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725352357728
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-Id: <ZtbJpXs92Lkh8Q0t@l14>
References: <cover.1725294334.git.javi.merino@cloud.com> <d41d73d56713685fb9ca7ab636898b54254ebdbc.1725294334.git.javi.merino@cloud.com>
In-Reply-To: <d41d73d56713685fb9ca7ab636898b54254ebdbc.1725294334.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.096c52b5589343dda023f5bc3b4cbfa2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 08:32:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Sep 02, 2024 at 05:38:39PM +0100, Javi Merino wrote:
> Despite its name, libxl_xen_console_read_line() does not read a line,
> it fills the buffer with as many characters as fit.  Update the
> documentation to reflect the real behaviour of the function.  Rename
> line_r to avoid confusion since it is a pointer to an array of
> characters.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

