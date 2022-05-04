Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13575196DA
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320063.540845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nf-0006Ey-Gf; Wed, 04 May 2022 05:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320063.540845; Wed, 04 May 2022 05:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Ne-0005hg-0n; Wed, 04 May 2022 05:16:54 +0000
Received: by outflank-mailman (input) for mailman id 320063;
 Wed, 04 May 2022 01:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4Gx-0000DU-F7
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:57:47 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 975afaa6-cb4d-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:57:46 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id r9so16887863pjo.5
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:57:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a170903240d00b0015e8d4eb265sm7031136plo.175.2022.05.03.18.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:57:44 -0700 (PDT)
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
X-Inumbo-ID: 975afaa6-cb4d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01xJZEdKekiitPaj8shKdCy94myHgVaNNGs/evnqdOM=;
        b=SvMNDAvPtTxF809bZoNNzl6o2LENxUqxJ8mipssp3LG3CBJ8QbgPBB5oXpfBBM0oF0
         mrxvm9m9xVoCbf+yK4esflyfRaDRIsoJWH6TXY5t/ov9rXMP+/iMpbnHqj0C62OZCoN6
         UGJtRe8MarqA1Hj1HXhO/p0X4vXAnV3Tj8zaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01xJZEdKekiitPaj8shKdCy94myHgVaNNGs/evnqdOM=;
        b=m3/1atxdd1Qi+b9mne1pMud3zIFCZD/oXbGMs6NPIS5Hm7FubRRZhs3IJ2Oapok8tP
         qWQqcrYc5TMPbdcMs8Rv5beutXuC1ZYiRLEb4HjdpQhjJvKbfpfPAofX3ywH4TRz1Fyb
         Qeg/RImDVFHI4YpqhRsqR7rdbVrUudQKbi1DmUTDV077SE+3PkoIXra3EmPFta6RrOWb
         LEjCMjsLoTOPr2yjNjagJwMGY/hIZ5e+iXrnzzNBqHIqP4W8qbAj5tHTqeHlta9H4sIb
         Wpu9NY42FZrJ4673Se32FrBVxkY52PLEb093S1UyOimFFZI0ivNJ6HTsP0JzDzDhtkmv
         cRHw==
X-Gm-Message-State: AOAM530gxQZ4hLvjlW0qey7c1ZjxhfryYNhLufamm1V3UEGb6TaAMGfl
	iro4ChzX9ySPgJ0FV/vJEELfug==
X-Google-Smtp-Source: ABdhPJy/3qlQKz4CGd/TL5fBHV8zpb68+maLc3mzl++Mz3XNXj92dha7r1Tz2gSmcMtLt6kUnUaPzQ==
X-Received: by 2002:a17:902:9a4c:b0:158:b6f0:4aa2 with SMTP id x12-20020a1709029a4c00b00158b6f04aa2mr19404150plv.163.1651629464772;
        Tue, 03 May 2022 18:57:44 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
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
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>,
	Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Gow <davidgow@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>,
	Eric Dumazet <edumazet@google.com>,
	Eric Paris <eparis@parisplace.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	Felipe Balbi <balbi@kernel.org>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hulk Robot <hulkci@huawei.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
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
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	llvm@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
	Louis Peens <louis.peens@corigine.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	Rich Felker <dalias@aerifal.cx>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	selinux@vger.kernel.org,
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
Subject: [PATCH 27/32] KEYS: Use mem_to_flex_dup() with struct user_key_payload
Date: Tue,  3 May 2022 18:44:36 -0700
Message-Id: <20220504014440.3697851-28-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2171; h=from:subject; bh=+EMqJweUKHRI+p140UR53z0ouyFfaCeLO7XO6/7BouU=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqGhXIUX0opXFG+79dwIKeyeoTVzZjDz3s4gqRG WcoAdoCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahgAKCRCJcvTf3G3AJpigD/ 9+hUDrqvhbexCJ+LI5xyfbONc0He6AfGv1OpoTuMyM/EDr+8Hlw69lTHvEd33pGAWnTcfLgvPFr5do SNqT7Ky9GohochNniXjI7VRAtZrFkRiG4130PztKwnvQ1ESHLdO+N8oQLoe0xNaVekFqVoLBQkU9ev NHp8YraJs7P1h9w8Pzngx6LtwE4pUvGsFmXmsBhmx5Uk1uiQ2UWzwtYPWYzdgEo1mTJ+BX1FT2/meR Eat9ZR2zS06PJ4uns7jc0qp4FerfBCuZHWMHvuzUrZLKj8YxmjyZPUn166vO9ypE2CX9eBtY3kFi3n EmX0Ryqm38lbokKGz+VyWMmMBepuljd3Kfm8eTAac9jztiqctLEmKqxMqXkQxGfDluj5udRd3fZOOR lag1NSmzJGGy19dHbynOZKZH+nGjFmGobp3C/7rBrswBDkGAbM9kHRt0+D9nPRbomIChQdinr+YNdi taMC+Zbtg73jiBg4SNGk9uXdxHdHcrvUozaxfZNwaBq19qR/CzNl695UzIFzTsoHUgCgp8UNwQOrIX 147/aQi6XAgsy4OrML7xnIyf5cn/Lol5s3J5+7HAqw9FmH4FhWg/atdWEZT71eREnRWKn+j7VQWUSS sH4Cq8R0Hlz39XjL9tHdhH6lg4wbDgAXnwYK6YZ7bEVdBr2fYMufUIc2hMWw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: David Howells <dhowells@redhat.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
Cc: keyrings@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/keys/user-type.h     | 4 ++--
 security/keys/user_defined.c | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/keys/user-type.h b/include/keys/user-type.h
index 386c31432789..4e67ff902a32 100644
--- a/include/keys/user-type.h
+++ b/include/keys/user-type.h
@@ -26,8 +26,8 @@
  */
 struct user_key_payload {
 	struct rcu_head	rcu;		/* RCU destructor */
-	unsigned short	datalen;	/* length of this data */
-	char		data[] __aligned(__alignof__(u64)); /* actual data */
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(unsigned short, datalen);
+	DECLARE_FLEX_ARRAY_ELEMENTS(char, data) __aligned(__alignof__(u64));
 };
 
 extern struct key_type key_type_user;
diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
index 749e2a4dcb13..2fb84894cdaa 100644
--- a/security/keys/user_defined.c
+++ b/security/keys/user_defined.c
@@ -58,21 +58,18 @@ EXPORT_SYMBOL_GPL(key_type_logon);
  */
 int user_preparse(struct key_preparsed_payload *prep)
 {
-	struct user_key_payload *upayload;
+	struct user_key_payload *upayload = NULL;
 	size_t datalen = prep->datalen;
 
 	if (datalen <= 0 || datalen > 32767 || !prep->data)
 		return -EINVAL;
 
-	upayload = kmalloc(sizeof(*upayload) + datalen, GFP_KERNEL);
-	if (!upayload)
+	if (mem_to_flex_dup(&upayload, prep->data, datalen, GFP_KERNEL))
 		return -ENOMEM;
 
 	/* attach the data */
 	prep->quotalen = datalen;
 	prep->payload.data[0] = upayload;
-	upayload->datalen = datalen;
-	memcpy(upayload->data, prep->data, datalen);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(user_preparse);
-- 
2.32.0


