Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74748987114
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805154.1216193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlW3-0005Z8-2y; Thu, 26 Sep 2024 10:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805154.1216193; Thu, 26 Sep 2024 10:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlW2-0005XC-Vm; Thu, 26 Sep 2024 10:14:30 +0000
Received: by outflank-mailman (input) for mailman id 805154;
 Thu, 26 Sep 2024 10:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7Yn=QY=bounce.vates.tech=bounce-md_30504962.66f53401.v1-0e515bb817dd4bde849ec0da55019e40@srs-se1.protection.inumbo.net>)
 id 1stlW1-0005X5-L0
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:14:30 +0000
Received: from mail136-20.atl41.mandrillapp.com
 (mail136-20.atl41.mandrillapp.com [198.2.136.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c40525f-7bf0-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:14:27 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-20.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XDqFs6ptNzCfBb2p
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 10:14:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0e515bb817dd4bde849ec0da55019e40; Thu, 26 Sep 2024 10:14:25 +0000
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
X-Inumbo-ID: 1c40525f-7bf0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727345666; x=1727606166;
	bh=t2ClioiobIx8sORcFDyjTmKyeW+IX3Hdgvdic7NBgp0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=pFUPgA8nKEx01y9aUaSnd+dVbk3HS/DxLLthtVc39ggaRvWL7zLzlrQRV7QHmyK2N
	 /7Ui4Z9p+5+OHhvbNV2NTUbsHqKnojY4ZnPUegia8HrDxEXzTxbAs+JGP5SyPFhVRz
	 RTcZzbEjX512nSE1q3tfdSczZpesnhqt538wPdD6eWiUVSpcb6+jLXL00BSNsQRkFB
	 DlsINgswXPIulLBJp1FOAiffSTLwg0DmYsIOqn0mpf7mQkYhEUR+nEZ7D/DgL6yAHN
	 +aVCgbT9Wgb5WAZ0Iw/5HpIPLqERTqvMI91dwE5azweBFHgfNwDuFvO8BhEatGVXT0
	 l8w960is2pRnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727345665; x=1727606165; i=anthony.perard@vates.tech;
	bh=t2ClioiobIx8sORcFDyjTmKyeW+IX3Hdgvdic7NBgp0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=pegrsmOW0UEDI9BmCJs532BpMEjhjpJcOdMuH5NoowQBcfxXIsaepG6uUJ4OjLQSU
	 kspkoJ7JaiyMim2dkY/ijYi/N0+9CHzTH5b3vzgnJnGlfyIEVHFn+MvAAOAg3NX4Mn
	 YME+llV+tFXJTgiYrJ4GlytXx3r9b970j/kUL37wGPT2Uq1AMJ4Qg3rZhScsDemPK6
	 dk6dcV+/yza4e8EwMwsCgGyomui/eVMORkBvL7Rtlm2/t8Gtc2sq4G1I6m103U/0p3
	 Y0SybHVkNLQT7IgdVfGiXN7TkuGSxvsgv9JzFGPX/nRXumQwq9qGXf3U0a6GXVSZUN
	 j94XmpeGPnE3w==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[PATCH=200/2]=20Xen:=20Update=20sector-size=20handling=20in=20block=20backend?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727345665088
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org
Message-Id: <20240926101334.2388-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0e515bb817dd4bde849ec0da55019e40?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240926:md
Date: Thu, 26 Sep 2024 10:14:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The specification have been clarified regarding what "sector" is in Xen PV
block protocol by Xen commit 221f2748e8da ("blkif: reconcile protocol
specification with in-use implementations") and "feature-large-sector-size"
have been removed.

https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=221f2748e8dabe8361b8cdfcffbeab9102c4c899

This update the header and the backend.

Thanks,

Anthony PERARD (2):
  include: update Xen public headers io/blkif.h
  hw/block/xen-block: Update sector-size handling

 hw/block/dataplane/xen-block.c      | 31 ++++++++++++-----
 hw/block/xen-block.c                |  8 ++---
 include/hw/xen/interface/io/blkif.h | 52 +++++++++++++++++++++--------
 3 files changed, 65 insertions(+), 26 deletions(-)

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

