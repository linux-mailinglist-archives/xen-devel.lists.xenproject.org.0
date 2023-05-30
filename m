Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E940716EC6
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541400.844182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460b-0003bK-Qk; Tue, 30 May 2023 20:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541400.844182; Tue, 30 May 2023 20:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q460b-0003Xs-N2; Tue, 30 May 2023 20:31:57 +0000
Received: by outflank-mailman (input) for mailman id 541400;
 Tue, 30 May 2023 20:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QB4=BT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q460Z-0001iX-SU
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:31:55 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 032840c1-ff29-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 22:31:54 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CC58F3200907;
 Tue, 30 May 2023 16:31:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 30 May 2023 16:31:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 16:31:50 -0400 (EDT)
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
X-Inumbo-ID: 032840c1-ff29-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1685478711; x=1685565111; bh=+cZsXk5aGi
	IWIF6vp9UgbBTuPJSW9vQMqM9Fi3GWErs=; b=b1X2ZZBno2R9/Fq0Y4byMWClkM
	yztjlEXBXhErAHMyu5pxVYfR1cLCApT4g/uUiO8kteIoPOYfwcM0QS5x9QWviai0
	+l213muvhmIojTILm+7p2eZtNtybubHmo4N4zNfbU1BjaH8lPNaOphi2xkYZuv4e
	h9L6gqPCJK3eOF1vIMloUMmjbsguyKqi2f1W5Tt/wuZ0+GYvxCApjlVAavetYN/A
	7tGd5rz/o5D0PfB0ZRMW60nhh19bpt9llkSd4Y6Kat2KL+JrOgTCciUHA3vZPkBb
	IVcmnbvx3CmJqx5G5vutH15atOF/5DmD2t9dwwAa4lNLI929ZeF3n8ClPHNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1685478711; x=
	1685565111; bh=+cZsXk5aGiIWIF6vp9UgbBTuPJSW9vQMqM9Fi3GWErs=; b=U
	P15hdGQ/gq4QBXzqjvd7c1poQOzI9V99fFI4wL2BV4l6rOOg1UHF/IH0Rvn8DD2t
	8inNtSYO4AkLeCdh5u8DSWVX/Y3zi6mmFEbSB6KWnmKzE/gaGSfbS0/UhxzMo5IL
	2kibkVKxrhJBYHcxY0e9g8+oJElSF3YfB39B1l6n3IKWdY+LTIfj2T0Ioc7C6O44
	lgjwvbG10GpFJ0/Ji6FLUTiSnJaiSTElzXZUfNjXE4ABmx+5vaVNfCETg0Sz7mcl
	+DhnaD34G3OifmWX9w/p4yj414+40b2No5vBXQ/3zcAauZ+scwTIQY4dPuM5DQKT
	JWusrvBDFegrRj+Ts3bOw==
X-ME-Sender: <xms:N112ZEkhJpIZ7sLxFuxFFSwbSmLhk75Rnsa-ScNsVUmuvj8FVpJtZA>
    <xme:N112ZD3eZcFAVDADdKfjGL7hNa5Hcl_AmD1vrCoS3wziIIqaageEay8l6FlPFORfH
    Ky8LRm1oDRdNq8>
X-ME-Received: <xmr:N112ZCrGppu6Q7U999Ru6xZ8dvBvBdlKGA_a67mCNAqJcyLUqBe4Tn9Tbh1ALocpktA-UwH8SxU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedune
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:N112ZAmIp3tGSyM63XF_iXHtC5OoUY3xfa3aSgMOpNWLJu57t7p0uw>
    <xmx:N112ZC3GHJ0_WhL1IkAhFBNahfeTS_YrY6vMkb918mL-qpm2nE-7eA>
    <xmx:N112ZHtrr_ccteqCN72Ytr8N4S4W1zp2eWJbXm3c0ikWA6uzYDIlyg>
    <xmx:N112ZDKNm5Vd0MyFHjWUee7VcjpX3kbLQNgUdSlw4MDRL5cW7QQH6Q>
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
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH v2 06/16] device-mapper: Avoid double-fetch of version
Date: Tue, 30 May 2023 16:31:06 -0400
Message-Id: <20230530203116.2008-7-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530203116.2008-1-demi@invisiblethingslab.com>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The version is fetched once in check_version(), which then does some
validation and then overwrites the version in userspace with the API
version supported by the kernel.  copy_params() then fetches the version
from userspace *again*, and this time no validation is done.  The result
is that the kernel's version number is completely controllable by
userspace, provided that userspace can win a race condition.

Fix this flaw by not copying the version back to the kernel the second
time.  This is not exploitable as the version is not further used in the
kernel.  However, it could become a problem if future patches start
relying on the version field.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/md/dm-ioctl.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 491ef55b9e8662c3b02a2162b8c93ee086c078a1..20f452b6c61c1c4d20259fd0fc5443977e4454a0 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1873,12 +1873,13 @@ static ioctl_fn lookup_ioctl(unsigned int cmd, int *ioctl_flags)
  * As well as checking the version compatibility this always
  * copies the kernel interface version out.
  */
-static int check_version(unsigned int cmd, struct dm_ioctl __user *user)
+static int check_version(unsigned int cmd, struct dm_ioctl __user *user,
+			 struct dm_ioctl *kernel_params)
 {
-	uint32_t version[3];
 	int r = 0;
+	uint32_t *version = kernel_params->version;
 
-	if (copy_from_user(version, user->version, sizeof(version)))
+	if (copy_from_user(version, user->version, sizeof(user->version)))
 		return -EFAULT;
 
 	if ((version[0] != DM_VERSION_MAJOR) ||
@@ -1922,7 +1923,10 @@ static int copy_params(struct dm_ioctl __user *user, struct dm_ioctl *param_kern
 	const size_t minimum_data_size = offsetof(struct dm_ioctl, data);
 	unsigned int noio_flag;
 
-	if (copy_from_user(param_kernel, user, minimum_data_size))
+	/* Version has been copied from userspace already, avoid TOCTOU */
+	if (copy_from_user((char *)param_kernel + sizeof(param_kernel->version),
+			   (char __user *)user + sizeof(param_kernel->version),
+			   minimum_data_size - sizeof(param_kernel->version)))
 		return -EFAULT;
 
 	if (param_kernel->data_size < minimum_data_size) {
@@ -2034,7 +2038,7 @@ static int ctl_ioctl(struct file *file, uint command, struct dm_ioctl __user *us
 	 * Check the interface version passed in.  This also
 	 * writes out the kernel's interface version.
 	 */
-	r = check_version(cmd, user);
+	r = check_version(cmd, user, &param_kernel);
 	if (r)
 		return r;
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


