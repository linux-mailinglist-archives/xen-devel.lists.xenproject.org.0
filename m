Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7229305B7
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 15:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758470.1167947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSceP-0006WX-8M; Sat, 13 Jul 2024 13:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758470.1167947; Sat, 13 Jul 2024 13:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSceP-0006Tv-5P; Sat, 13 Jul 2024 13:18:57 +0000
Received: by outflank-mailman (input) for mailman id 758470;
 Sat, 13 Jul 2024 13:18:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9bh=ON=web.de=Markus.Elfring@srs-se1.protection.inumbo.net>)
 id 1sSceN-0006Tp-21
 for xen-devel@lists.xenproject.org; Sat, 13 Jul 2024 13:18:55 +0000
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72b2f91e-411a-11ef-8776-851b0ebba9a2;
 Sat, 13 Jul 2024 15:18:52 +0200 (CEST)
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqIB7-1rxdKv0GlH-00qCKl; Sat, 13
 Jul 2024 15:18:46 +0200
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
X-Inumbo-ID: 72b2f91e-411a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720876726; x=1721481526; i=markus.elfring@web.de;
	bh=Uc/1j0byJ3bja6L2DajnHc7fJ0Ad8rFraEJiCZAlxNE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=v18MvWA14jBze7ckXS1UR5OR0TCiCYVPzG4E7J38Y+JyZ/bNLf+GQ3PBTSeQAHiX
	 yZ5poyFziD4l1aEhYnwcJEgMu8Z4k7MG8ApNIocQ7i94JecNipLXsx1H4h9/5ZAJ2
	 QYQhzh/Mw5m33q1XEQapaC6qe5IwC53+Ga0HcfbT1GiEA28i5gnYQP65ZbHFLks/o
	 Vr63gSmcZixW/QzscBWka2sjIougOzcT+7EeTlcEMVVlrznhWP+PFyYQ0VfvGAKkG
	 pv/Vh2XnFTSYAOitbxIAFggtomDjYZACXwjaRUOkgY7juYQNTiDY9CV+4HryNDYq0
	 q5jSsKVpU25xqnKhZw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <add2bb00-4ac1-485d-839a-55670e2c7915@web.de>
Date: Sat, 13 Jul 2024 15:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wei.liu@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] xen-netback: Use seq_putc() in xenvif_dump_hash_info()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AIrV8FNxldBf3/OgDzktRpiIaej6QPYpC2zglGR/eidUfOHgox9
 TI2JV3ir65RmcgVVOglq7scUyOukDkTm5ay8GBZhmXZaWFc6ks8t3nZiUwLtKXgUvRcUoDJ
 B0aBelAXN/iOnU/ycfgbET0zdJwh7QsVK9Q+RwiEcOtBuyIzkHKILuD0AiFJs+XlO7trez/
 kCpK5OccjG3pxsQFKm1yA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jxI6I0rfSEk=;rQ4ywyxfN56rW1wln+LjKtUrHbX
 DPajc2pj9fYcgChCM13odsJprWwqDmDzG/6oyreimFWmpgka6DQ5xSFazZd2Y/tcjf7Kyl53x
 Zgg/sZoURTwejjunSJ94qusv76oJJZPmDzVDTWh3OTP8nZu9yVD1eMdffRP1h8iO8hdTWQBjI
 HsDuZ3VTg1c9vM5DxY8j2yl5GM8izEI91boElESrBNJTzlcbcnXBqe7iqJmz7PP3iSun08OHP
 adfvEZxqvNe3bUoASXbbFtewaZ5UaMn8pg4162VKCQD6jSv/D52h11w3kDUUd1lCWi+AZpO0Z
 2RU7lFU1WxyEtlxMa4HPDYDwb8vFtcEatfKAfjyhfOjeoB13xAJkfpWxQ1Pm1Vb3COHSiAZr3
 TTCrvk6SkQJ3RUcRLD8OIBWXtFtLgMB36XlfOOASfdtpKyTXb1ca68HUMm27TBoVJGxrjZoSB
 W2TptLWdZyz/ey+AYnW+T93Ru+D4Pi/MEj6vG38WZFk6gRxrZnpmSUQoWJsKry+DIqxC4Rq+E
 k6BvvAqSHwZKvFVTOT0n2JNZOOolcgNSl3L1d2gVKDwt7QcT/laKjx4Ew5zAQpIp/rG+L+v/d
 ALwxg5V59fLmbAHYmD+jtyFAt/7EZSnhwBqITHL3aI9GQlLzz7UhcHdTF92cNlzLmoT59Gnyo
 fdcJdK67ujx5f/Q3ShdFDZVXhZZP9W4spkM0Bcaw9u3aEchtoVCa84JAaHxDn2ckyZqtoelSN
 FHIDRJzuT835YA9pK7mFRrcmn92qieNMuZG7koR7BnJsWqY1mfyalzHFWJNSAsXb9GB+GoCq/
 fskNeLwv3Etevn+LBr8f7JbA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jul 2024 15:10:15 +0200

Single characters (line breaks) should be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/xen-netback/hash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash=
.c
index ff96f22648ef..2d77a7187e1e 100644
=2D-- a/drivers/net/xen-netback/hash.c
+++ b/drivers/net/xen-netback/hash.c
@@ -425,7 +425,7 @@ void xenvif_dump_hash_info(struct xenvif *vif, struct =
seq_file *m)
 		for (j =3D 0; j < n; j++, i++)
 			seq_printf(m, "%02x ", vif->hash.key[i]);

-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}

 	if (vif->hash.size !=3D 0) {
@@ -445,7 +445,7 @@ void xenvif_dump_hash_info(struct xenvif *vif, struct =
seq_file *m)
 			for (j =3D 0; j < n; j++, i++)
 				seq_printf(m, "%4u ", mapping[i]);

-			seq_puts(m, "\n");
+			seq_putc(m, '\n');
 		}
 	}
 }
=2D-
2.45.2


