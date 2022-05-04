Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9F5196CE
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320044.540736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NH-0000mG-M2; Wed, 04 May 2022 05:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320044.540736; Wed, 04 May 2022 05:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NG-0000MJ-Ul; Wed, 04 May 2022 05:16:30 +0000
Received: by outflank-mailman (input) for mailman id 320044;
 Wed, 04 May 2022 01:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47I-0007U4-Gb
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:48 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 328da9af-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:47 +0200 (CEST)
Received: by mail-pg1-x530.google.com with SMTP id g3so22040pgg.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j17-20020aa783d1000000b0050dc7628166sm6962339pfn.64.2022.05.03.18.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:47:45 -0700 (PDT)
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
X-Inumbo-ID: 328da9af-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tt+uE/qYWOs3CEanZOjmvMoORa5i/xMNqAO3DwAd5m4=;
        b=YmT1lNTRttmLRyn/WOgpT0DAFWD3BvjkOIsApwxFa4B3Com0bh2yQqIJO66Wiak8Tt
         rwU+QSbZtL4swuVhrV8kkivMWLyJT9AqfxXpJ4Lm9ZibQLMBbHjNrpcN7FDNu1QRPCS+
         uiBQnyfLBZT2SNnaE6twmHxSxmZ2FlIbgcsF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tt+uE/qYWOs3CEanZOjmvMoORa5i/xMNqAO3DwAd5m4=;
        b=Pq+y38erQEjwn18MEH/HBEiEyG+KRYw55e22sgzxjpaCPVyNr87fy5onSO2hjRg51d
         1j7Y8g8L70W61iE51LpEBjsB6/L3TV/u4cXHP5aXS6cvgKqJ8eVJ+5QwQE5b7dqRXzMa
         17yJ1iycY5NBCt1vp/EDBdULYSn4bkQJgtgCQAOpC5B6Dv3YAnrZr/r8DiQYRuSXIAgH
         bHb+eK3cVSW80ZSq4iLqULcBFlWpftMTLyvWyPCP+203cRyUEm6/FiYJSGQ8nbqKLa0y
         HJlKoG+oOE5auhxqba4DBCqw+T5HVlRBdc5OyGM6sOeQhtYGcEzeQ+QIMZiMLEoBBFH7
         HokA==
X-Gm-Message-State: AOAM532I1aTbSYiooWL56mKoZPglZ5ysgmVR9tzpvnHV7GBA/uU6+d1I
	bOsvtevnnDLJWmzY/JR4WdXX6Q==
X-Google-Smtp-Source: ABdhPJxm8oQpe82/AlfHpo86YsbZI42gD8lqIDet1sGBcYjpwPke9wpE0Wpp3R+D8mPYMYqjJQCKXw==
X-Received: by 2002:a65:490d:0:b0:39e:58cb:b1eb with SMTP id p13-20020a65490d000000b0039e58cbb1ebmr16428991pgs.390.1651628866265;
        Tue, 03 May 2022 18:47:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lavr <andy.lavr@gmail.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
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
	David Howells <dhowells@redhat.com>,
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
	linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
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
Subject: [PATCH 21/32] soc: qcom: apr: Use mem_to_flex_dup() with struct apr_rx_buf
Date: Tue,  3 May 2022 18:44:30 -0700
Message-Id: <20220504014440.3697851-22-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; h=from:subject; bh=f797ezn2sQWsQcALbTjtcz0/uVJxqqsdCbEE9J5EL4c=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqFcya5M1Ba7xKOXe16qG7jIlVI8ph+ibFXwwOp nrqS7nGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahQAKCRCJcvTf3G3AJhB6D/ 4mAanYpWDhhzP0wFox6ZgqAP9umNDzMV7dRX4Y08wPvedXkTuo/N0jclu6EdK/Bs4KaQilIZSFkLno xsM8xXSf4UqStJoT27N7DzjgnXKUJuyB5HZu1PfC+8PJ3QEnqiU5wE/l/2KdIJiAa7Xrj82dQB2cOe f9cgwxVbs3UnZy77Wv+k8FP5dMShK5yfzH0kpSd88R+/mDgZ6PLzi6zr8ZQiGCGdehQ7yp7ahiIA+i aAsDm3/+QhB0XaYdbqgAm2IAn+ouEdBPFgeXFzXqJwdi8AEfwBoByO06B8F23M3UCLdd6ZTRuaYeVQ kIZhzXstlVWDB9mIUnTP7dpfIY0lC+xzWyCLtZeT4bAvCwQB9CAAEWnSx7qfxwfOCYH1OjKUWJ+Xo4 5bWdci/vlaLQLD13TFP2X8QMY+seDM4SmnQAjgo5eITKrQ8RREz044kssPiR5qrnynNMOFWoNryxir 5TxsUJqEcElCuxyYstu2GZWqRpIeTKHVnaCu6XWtUkfQXhXikks9R9eVs6gSl+qIiVvgsVs7Tv/R9N rFtDfCJB155p3+TaJfCxSA/1e92fAlkjvrq+Ar3n/Jqs+/JGlPFT7Zy0qsgxzMjclrsboCWAvbLZZ2 OSexYpHjEn8jykFiHVbn1z48UtV3JdplNzCir+Gph+mH4axRJfHc0k7gYzyA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/soc/qcom/apr.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 3caabd873322..6cf6f6df276e 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -40,8 +40,8 @@ struct packet_router {
 
 struct apr_rx_buf {
 	struct list_head node;
-	int len;
-	uint8_t buf[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(int, len);
+	DECLARE_FLEX_ARRAY_ELEMENTS(uint8_t, buf);
 };
 
 /**
@@ -162,7 +162,7 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 				  int len, void *priv, u32 addr)
 {
 	struct packet_router *apr = dev_get_drvdata(&rpdev->dev);
-	struct apr_rx_buf *abuf;
+	struct apr_rx_buf *abuf = NULL;
 	unsigned long flags;
 
 	if (len <= APR_HDR_SIZE) {
@@ -171,13 +171,9 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
 		return -EINVAL;
 	}
 
-	abuf = kzalloc(sizeof(*abuf) + len, GFP_ATOMIC);
-	if (!abuf)
+	if (mem_to_flex_dup(&abuf, buf, len, GFP_ATOMIC))
 		return -ENOMEM;
 
-	abuf->len = len;
-	memcpy(abuf->buf, buf, len);
-
 	spin_lock_irqsave(&apr->rx_lock, flags);
 	list_add_tail(&abuf->node, &apr->rx_list);
 	spin_unlock_irqrestore(&apr->rx_lock, flags);
-- 
2.32.0


