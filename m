Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D613683F873
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jan 2024 18:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672859.1046961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rU8f6-0001k5-5b; Sun, 28 Jan 2024 17:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672859.1046961; Sun, 28 Jan 2024 17:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rU8f6-0001iV-2n; Sun, 28 Jan 2024 17:09:40 +0000
Received: by outflank-mailman (input) for mailman id 672859;
 Sun, 28 Jan 2024 17:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k35g=JG=web.de=Markus.Elfring@srs-se1.protection.inumbo.net>)
 id 1rU8f4-0001iN-DW
 for xen-devel@lists.xenproject.org; Sun, 28 Jan 2024 17:09:38 +0000
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03ad6345-be00-11ee-8a43-1f161083a0e0;
 Sun, 28 Jan 2024 18:09:36 +0100 (CET)
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuFD5-1rDqKJ2XxF-00uach; Sun, 28
 Jan 2024 18:09:34 +0100
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
X-Inumbo-ID: 03ad6345-be00-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1706461774; x=1707066574; i=markus.elfring@web.de;
	bh=skl6m8d4+uXGtWa5IbVdYrFKC3oF+ITHrCIEfSyrSJw=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=JTzbCmuQAOJ1kPZq5j1qaYAsHcjBkpcnu2qhErvAN2LpefDUUeM8b2YxSueGD71B
	 j3eef9Aa7lTg7dMClGwevaaI/naVIePVANvgwvsxllGUm2u4KQBiBZpEHsN3Ge9ET
	 /olSkTUN96PGcHvaKkcFYx3KkJXJx/ggDHvxAy2e0PpH0dgdZ4koTAtljuvqJIqJD
	 I95lUgxOg94U1tQgmlZ0bc5OwJ57nktLwYazqriKFh6Ef/EBYKc2zFaKNOnos3iVR
	 K/J/lW4DLGoS6zIj6opNVr9FEH4OAba3LSfjiW4G6hk871iGmBZHEC0Kp5XTe6oqA
	 BY/3ZEr14c52yJwQug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <41e333f7-1f3a-41b6-a121-a3c0ae54e36f@web.de>
Date: Sun, 28 Jan 2024 18:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] xen/privcmd: Use memdup_array_user() in alloc_ioreq()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7yhNhlRvw29pkPL2ElLfqurRFvlr5JJnJHUrCA7cARjU+fJm2cn
 3ujTOQNviQlobkUnrNwknyt+XzrmHGGoXkQ4NrRjmuViRPoSvBYWkVfI3o9bqxr9CK9PxHo
 DF+/WB0T4smezgtgZs2nDtVFzun5IFBJdLTaFJKZ7V3FEOVV6NN3keRdYqGfzR/fGr7aePR
 BEM+3ALcJia7TLbSBgNMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K4Ht/mjTrr0=;HvmWwv7eLngddWj6ev5tcIOfD/L
 fuWb7rfhHAnB5LpBTTNR4OiesAjJUwwhF3MgQbNIdh+LbcEt98tGW9hBMFrE4T9+ZOwwh7dNM
 Px5t7eSuh2tc0vc5ehXthTGamsAK27FgVmIET5sZ0xX53ynF5qk+KANhqwFS9J4KaytBdiyzg
 5MecokBmUjUMZRyto8m/3sEMeyJdiro2ayMQRmUPeig2dp1b9Lk1hleCypE54v/xYr06s5tT1
 fHhppLdShkYf+MkmlTvSThJgBKbvbVKNrVKlk3UG/G9hNvKOgc/uOs7YO8CVEzOxVAUdqO+8J
 aTvGFwWoReQVtnpBTCv8i/tTZ6IBMvROCP+P9Z8aa85abNLVwxN++gm2uIFa1mXSZlzTZz3R5
 TzlCcJJWnEwiKHLB9F32pv+12mWVOGknoyV8AFJgGkrnJZ1RHDMpzTC3Alkf2rTh7hjw24O2X
 xqopT23zNzYz0rm6dpeNS8RQC2XaGBv42mGl0eplnas0/1ULxR3knkays35S5ZDW4McERbseK
 RnA6KkFawxQnVWLubFpKwQXSI22Q+wu6Uin9GEX7xhQhvjYNEuz8VGuIWZcHAuSBhCVgyMlZv
 90XQm4cXaT1TkJQrX0sllUEyVXNlImxf9PyYOLXoXib/kmHFCzOh7hU8EwFul1A4Lk3ZeLFiF
 qtoGJcHiZaRJm/tdCNNYdEf3OYMmQPYAwZWDZ1o8QfgIKpOu3Ke8Mr1czn0PdHKFzTNcVGcON
 m3wEZkY3VCt8/7W5e/fNnNX2fng1WzGrkFxEo7ARFoInHcrawQWU2Pig5connBaeO2Eo4ekbb
 GMzlFi2hhJmlwBpDmvIlTtNDIk1owuaHJrM8VyKxNS3hd8JFvIL3wmurSeo5XBIEAM9HRfrUD
 ZpFSaYxoZAGCDIySsAXMoO0QCuC7WYH1v10S3OYTwozdNHejdJEHqWYrh3/b438sDAwKqfdv4
 3J8eOg==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jan 2024 17:50:43 +0100

* The function =E2=80=9Cmemdup_array_user=E2=80=9D was added with the
  commit 313ebe47d75558511aa1237b6e35c663b5c0ec6f ("string.h: add
  array-wrappers for (v)memdup_user()").
  Thus use it accordingly.

  This issue was detected by using the Coccinelle software.

* Delete a label which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/xen/privcmd.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 35b6e306026a..2c8f6d047c11 100644
=2D-- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1223,18 +1223,13 @@ struct privcmd_kernel_ioreq *alloc_ioreq(struct pr=
ivcmd_ioeventfd *ioeventfd)
 	kioreq->ioreq =3D (struct ioreq *)(page_to_virt(pages[0]));
 	mmap_write_unlock(mm);

-	size =3D sizeof(*ports) * kioreq->vcpus;
-	ports =3D kzalloc(size, GFP_KERNEL);
-	if (!ports) {
-		ret =3D -ENOMEM;
+	ports =3D memdup_array_user(u64_to_user_ptr(ioeventfd->ports),
+				  kioreq->vcpus, sizeof(*ports));
+	if (IS_ERR(ports) {
+		ret =3D PTR_ERR(ports);
 		goto error_kfree;
 	}

-	if (copy_from_user(ports, u64_to_user_ptr(ioeventfd->ports), size)) {
-		ret =3D -EFAULT;
-		goto error_kfree_ports;
-	}
-
 	for (i =3D 0; i < kioreq->vcpus; i++) {
 		kioreq->ports[i].vcpu =3D i;
 		kioreq->ports[i].port =3D ports[i];
@@ -1256,7 +1251,7 @@ struct privcmd_kernel_ioreq *alloc_ioreq(struct priv=
cmd_ioeventfd *ioeventfd)
 error_unbind:
 	while (--i >=3D 0)
 		unbind_from_irqhandler(irq_from_evtchn(ports[i]), &kioreq->ports[i]);
-error_kfree_ports:
+
 	kfree(ports);
 error_kfree:
 	kfree(kioreq);
=2D-
2.43.0


