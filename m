Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FCC5196D0
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320045.540749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NK-0001Af-61; Wed, 04 May 2022 05:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320045.540749; Wed, 04 May 2022 05:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NI-0000ky-MR; Wed, 04 May 2022 05:16:32 +0000
Received: by outflank-mailman (input) for mailman id 320045;
 Wed, 04 May 2022 01:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47L-0007U4-Kl
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:51 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3467b003-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:50 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id k1so167938pll.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a62ee0b000000b0050dc762818bsm6935424pfi.101.2022.05.03.18.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:47:47 -0700 (PDT)
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
X-Inumbo-ID: 3467b003-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e+5qnKpu1VsQ22oucG43AL+WcjSiOIWtbY50R7ZcVWE=;
        b=g9AcrkR+3RVkYkCjXueQwetC04MS+NoxVmpAB9VicL40p720LPQhGGdx5xmKktKIDM
         zPigxQLAL6TBhbYLJe+5LnwPNyPpBp4uN8e2a1B/ZwWxWPLLj/iqfcDi30QcFjJ9kn/S
         1QG2VSMrqeLVVCmXWD35ETUMI7QbOsGkL0vw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e+5qnKpu1VsQ22oucG43AL+WcjSiOIWtbY50R7ZcVWE=;
        b=amjt22iF5IhpVxkEueHYdgaQxqKobSshIOpXHttbtJ7ET050O/dTYT30BUpihst8xg
         8Ahj5M7rxiYI5/i6AZlkZBXLafLD+yCORuhoCU+l6XdxI7LnBvTxCGVugDnQ7TYvmZse
         o8cqAG7N53+n7hnw2ygluCtloA2dJLhfRExAXYeOhZXnfU6OdDBrDx3aBBrjdUH17eRS
         EL0m632h30SqQ6IkSdlCzZvdgpYEGnu414VuVYzrlaH4UIoOeER+Ikd4E6kw/NktKX7s
         +Rlsp9+dMh/5SbxiriGa16QeGAVALKuuzQEy6aBRRhrxo5WgLigBDekC9QjASs9JrEsd
         Nj2Q==
X-Gm-Message-State: AOAM533aflmNj3HyQBMgxZynIpl1/kqmQGk10KJbOiq2K9ybmuG8jNfP
	aaK9HlMoMPy4qhzzY9eYG7HkUQ==
X-Google-Smtp-Source: ABdhPJxl7EiV8keIDc6EF0ePDWOyFM8DsnsLzOPF7upSDtXElO4KQwWeIT0ElEMEtCPMOLdFUp0h+w==
X-Received: by 2002:a17:902:a5c4:b0:15d:4ca:90cf with SMTP id t4-20020a170902a5c400b0015d04ca90cfmr19318951plq.133.1651628869364;
        Tue, 03 May 2022 18:47:49 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-xtensa@linux-xtensa.org,
	devicetree@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Gross <agross@kernel.org>,
	Andy Lavr <andy.lavr@gmail.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Cong Wang <cong.wang@bytedance.com>,
	Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Gow <davidgow@google.com>,
	David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>,
	Eric Dumazet <edumazet@google.com>,
	Eric Paris <eparis@parisplace.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	Felipe Balbi <balbi@kernel.org>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hulk Robot <hulkci@huawei.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	James Morris <jmorris@namei.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Keeping <john@metanate.com>,
	Juergen Gross <jgross@suse.com>,
	Kalle Valo <kvalo@kernel.org>,
	Keith Packard <keithp@keithp.com>,
	keyrings@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee.jones@linaro.org>,
	Leon Romanovsky <leon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
	Louis Peens <louis.peens@corigine.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	Rich Felker <dalias@aerifal.cx>,
	Russell King <linux@armlinux.org.uk>,
	selinux@vger.kernel.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 29/32] xtensa: Use mem_to_flex_dup() with struct property
Date: Tue,  3 May 2022 18:44:38 -0700
Message-Id: <20220504014440.3697851-30-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507; h=from:subject; bh=Sq6uxCkPHvMJ5JYb1gf1A6wcVxIwkSOLKZO2iCrXvzo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqHU+zS6KGRXLibFnc06yiYHvM6h9+r1i1/xDqh sS9tPM6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahwAKCRCJcvTf3G3AJio4D/ 9e7/PUFE5eJVA+iwP4RNPRrwfTbaso73y3UIDDhSBi7DWpVecGpxBZFhq8AZJnACJZ6+0txfLVZrgC Hf9yN6InooZL//+CTSXiiLI0odsJS5G7VPzg8jqFheAUvfc33Ayl7CE4IjUesDTHb8MJcD6pRcV301 BkdC9bu9R9O1wfXjDMG6LGijqVC44/VnATk0Fj2osA9aCT7hCW4+9Y2AhfOuja15+dIryUwqZtX2nq ec7DFRbWbwCMxIvSe2M9T/eENcPFBDRzyY24sIHLdTtdM3+mq1w0JC+v5z47HvtBxdp6Ab4AjGQ6AH +XYDv1NkFrQYotIcm5C43jbDrqJMKe7MsguTTl2SqeeyJm0j16c29CoaUYxAFDubw9ldqYXLp5WTjS purW5BkSiZew9UjQYOHstIZ3tkzqccDABlxOoJx6Jeg7kYmdQqE4PnV7je2MA/jAMh7Hm3WqyHFS4l uZ6AZ4qsuZ3GaLee5riE9Nh9OXqTK8uWuL7aIKJHegYL1BtPlvOB5J6yMZJ+U/rhYZD5ZxqQ0LXB2z BwWGEo9PhEtkSWKk2TiOybFLVH2xKxpJfcQV806Jj+7f6Kq059naUze9XagBDSL7sUoMR34BvbOeER oRxCHL5YzBGrQi45jMVYuRuMcPsrrlr2vvkyx+TWc4h0GZl7w6C6OGv59wRA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-xtensa@linux-xtensa.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/xtensa/platforms/xtfpga/setup.c | 9 +++------
 include/linux/of.h                   | 3 ++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
index 538e6748e85a..31c1fa4ba4ec 100644
--- a/arch/xtensa/platforms/xtfpga/setup.c
+++ b/arch/xtensa/platforms/xtfpga/setup.c
@@ -102,7 +102,7 @@ CLK_OF_DECLARE(xtfpga_clk, "cdns,xtfpga-clock", xtfpga_clk_setup);
 #define MAC_LEN 6
 static void __init update_local_mac(struct device_node *node)
 {
-	struct property *newmac;
+	struct property *newmac = NULL;
 	const u8* macaddr;
 	int prop_len;
 
@@ -110,19 +110,16 @@ static void __init update_local_mac(struct device_node *node)
 	if (macaddr == NULL || prop_len != MAC_LEN)
 		return;
 
-	newmac = kzalloc(sizeof(*newmac) + MAC_LEN, GFP_KERNEL);
-	if (newmac == NULL)
+	if (mem_to_flex_dup(&newmac, macaddr, MAC_LEN, GFP_KERNEL))
 		return;
 
-	newmac->value = newmac + 1;
-	newmac->length = MAC_LEN;
+	newmac->value = newmac->contents;
 	newmac->name = kstrdup("local-mac-address", GFP_KERNEL);
 	if (newmac->name == NULL) {
 		kfree(newmac);
 		return;
 	}
 
-	memcpy(newmac->value, macaddr, MAC_LEN);
 	((u8*)newmac->value)[5] = (*(u32*)DIP_SWITCHES_VADDR) & 0x3f;
 	of_update_property(node, newmac);
 }
diff --git a/include/linux/of.h b/include/linux/of.h
index 17741eee0ca4..efb0f419fd1f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -30,7 +30,7 @@ typedef u32 ihandle;
 
 struct property {
 	char	*name;
-	int	length;
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(int, length);
 	void	*value;
 	struct property *next;
 #if defined(CONFIG_OF_DYNAMIC) || defined(CONFIG_SPARC)
@@ -42,6 +42,7 @@ struct property {
 #if defined(CONFIG_OF_KOBJ)
 	struct bin_attribute attr;
 #endif
+	DECLARE_FLEX_ARRAY_ELEMENTS(u8, contents);
 };
 
 #if defined(CONFIG_SPARC)
-- 
2.32.0


