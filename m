Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EB716EB7
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541398.844162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460U-0002pA-2Y; Tue, 30 May 2023 20:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541398.844162; Tue, 30 May 2023 20:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460T-0002le-VU; Tue, 30 May 2023 20:31:49 +0000
Received: by outflank-mailman (input) for mailman id 541398;
 Tue, 30 May 2023 20:31:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460T-0001yj-19
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:31:49 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff8aeea6-ff28-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 22:31:48 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 210F1320093A;
 Tue, 30 May 2023 16:31:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 May 2023 16:31:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:31:44 -0400 (EDT)
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
X-Inumbo-ID: ff8aeea6-ff28-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478705; x=1685565105; bh=LxAfFq0335
	m1ZlqqDrmxnqhMzXdNPPiOcKKMsIZRgGo=; b=aBkNicTIxTqaQMJAexZulqIRdm
	sIjZXtSOPgxSMACSgvF+9fjyKzTAG1i01eFAX1OK0NcsCEBDoXpuJyaQV6d/I0VA
	q/z3N4LwMEW1FIuYTzFbKbGtY+U3bZe1LREkgWbnGVo31RGnMs1i+RkUSauMA528
	b4f5/xVkZzCMR/eOmXM/no/o50kRvZdfkpjBHP+rZNTkawHhelZmjQubT6/xZFhM
	sB3+I0E3oDcdU9YB1PUvv3WTY3Cgz2c4tnkoPPKHzeYbYbxqStm6MaHhEQnNl0DE
	JrlecR96jAUXIBg4rTOGs1nHiRk+cCArx0I66C52cFKOY4AV+RksbuC93x9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478705; x=
	1685565105; bh=LxAfFq0335m1ZlqqDrmxnqhMzXdNPPiOcKKMsIZRgGo=; b=d
	sVyDy4dBBVGtlMpWhrLCib5j+MpYeJykog270K0270985oiQ+CD+XqCmJf5w8okS
	3WHwdWZsn/VRIjpx5J+h2FUQSjGYLcZmnx9dLpvjIHy8M4HDT4rnwvAyUMLNSXUX
	EgawqZuIFSn4KyYS3JrTDlQIPAUT/0+Gk/yu0UXMiPqrGZPZY/fjoU9AbdzThyf4
	L26yfyQlhx8iDEUWKiIYjUH1A3/OL9QGVvyrDGN/OqpWq3Tw25tgEbIpzAMPdc+h
	5peIq/Yrn5aH9irvh3og9e7PEFL6Qs5Di/lIAk/sYO/pP/cGvtLIZYFIXPWUwGqY
	ZbbD9fIEV7MXFyjcopT5A==
X-ME-Sender: <xms:MV12ZNrs4Z9KmViO-dI3XIzBAS1TrFl0swpM5VQmw0lxIXMYMcYH8g>
    <xme:MV12ZPrQ67qj8n8Ym7JcnhoeIbBOcqe5AUzEdZaRULY3Y2ljd_av-OWHIU7FzbFEt
    QjUStib5j_KJew>
X-ME-Received: <xmr:MV12ZKPuAN6Wkyrp02gS2tS2qthWhdXqYyKQGY2nnqs8ppDaU7tay_iYZjR-1GawLtG2ma21xI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:MV12ZI558_m5ZAeIugOGhFh509dG0GfvI0meCVPsv0GzuuTVlEP55Q>
    <xmx:MV12ZM4ZDJsH_r6GgjxCGg9stcnTa1DX0UyGw4N5CSip8_xY_eOlIw>
    <xmx:MV12ZAitJNIqv97FdHQsw70B7O5NYVmGarm35_SET05V6VqDlcbwrg>
    <xmx:MV12ZLaNM7ETgMhYzUUA-gFXBJlTSFaEx8TwyLr2GLFSH0w_bxJTiw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 04/16] device-mapper: Better error message for too-short target spec
Date: Tue, 30 May 2023 16:31:04 -0400
Message-Id: <20230530203116.2008-5-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously the error was "unable to find target", which is not helpful.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/md/dm-ioctl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index a1d5fe64e1d0d9d3dcb06924249b89fe661944ab..9f505abba3dc22bffc6acb335c0bf29fec288fd5 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1423,9 +1423,6 @@ static int next_target(struct dm_target_spec *last, uint32_t next, void *end,
 	*spec = (struct dm_target_spec *) ((unsigned char *) last + next);
 	*target_params = (char *) (*spec + 1);
 
-	if (*spec < (last + 1))
-		return -EINVAL;
-
 	return invalid_str(*target_params, end);
 }
 
@@ -1451,6 +1448,11 @@ static int populate_table(struct dm_table *table,
 	}
 
 	for (i = 0; i < param->target_count; i++) {
+		if (next < sizeof(*spec)) {
+			DMERR("%s: next target spec (offset %u) overlaps 'struct dm_target_spec'",
+			      __func__, next);
+			return -EINVAL;
+		}
 
 		r = next_target(spec, next, end, &spec, &target_params);
 		if (r) {
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


