Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F15196C9
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320029.540671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N9-0007BD-3a; Wed, 04 May 2022 05:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320029.540671; Wed, 04 May 2022 05:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N8-0006rL-JR; Wed, 04 May 2022 05:16:22 +0000
Received: by outflank-mailman (input) for mailman id 320029;
 Wed, 04 May 2022 01:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47C-0007U4-SV
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:42 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f325e7f-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:42 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso3382pjb.5
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a634d55000000b003c14af50617sm13533557pgl.47.2022.05.03.18.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:47:39 -0700 (PDT)
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
X-Inumbo-ID: 2f325e7f-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7uM3xoAcE7zuGNsfEYVdWWhl8RQOVkTgxnXHqQm9tk=;
        b=Ttm1udnLhK1uzAB04KBRSr/POGM0kwPI1bs4XPEU6UEtgK8/23ubm+dxeV4+X853RT
         0+Il5Jok8kr0+FDj5VV/8TyC5lx1HeS1NOnJkl2lVk9pme8hyn7Y1lYALOBUqbtoGYi3
         cAWN4x8Bl4pcx02o/CTto17Eyhwd5u2uMzQSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7uM3xoAcE7zuGNsfEYVdWWhl8RQOVkTgxnXHqQm9tk=;
        b=CzF2swXzJxePme2qfhya1OY4oF5kEILB4G12AyhLWa63zgs4oIrCIZU6uc+d9sLObX
         bZrvAZRSykJ+1UJV9978No7zrqjX+cGa6GE9OUHcKJgNzqciZO5HUizMoD0G0h/GVgFz
         U+w+EcQkg5hKz4mzIId0Ekv9UbGd/na+JfYTzsmbyPQQTrqInt711XAx3+aNPnq9V0Ky
         9rU9+ytLOplygSfGzUBfJwlII3pDBaqbtUqfNZqZgbhMKrdrS+pH4IZQci/pn7MrzaqF
         uFx8OoywBPFs8HeRFlEgTK22DKyWDc1ZIQ5OdXJZbCIeVgCzIVUt3gJBA/pyG2Tf+UeN
         0VRA==
X-Gm-Message-State: AOAM530GZPF4oFwGeYtu6aIosPGZSiB9zOFfZTUUNkJH8y7m6r8iNLT+
	zQDJ4CMdUmbot0e3hdIBab1zpQ==
X-Google-Smtp-Source: ABdhPJxiRXcmbs8jLBX+uUybbobrWQal42E5OsdXgAFm4WZnFq+xnafC0he6L5xAcHtlxnI8HYhS1A==
X-Received: by 2002:a17:90b:3742:b0:1d9:5dc6:dede with SMTP id ne2-20020a17090b374200b001d95dc6dedemr7813310pjb.92.1651628860398;
        Tue, 03 May 2022 18:47:40 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
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
	David Howells <dhowells@redhat.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>,
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
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	James Morris <jmorris@namei.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
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
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
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
Subject: [PATCH 11/32] nl80211: Use mem_to_flex_dup() with struct cfg80211_cqm_config
Date: Tue,  3 May 2022 18:44:20 -0700
Message-Id: <20220504014440.3697851-12-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217; h=from:subject; bh=rRfAu1/k1e5caQg21/8VBHhysNqsP1FR5GA2AHrLW6w=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqDYqJpVuI+Da24TYyn7rK2cAZcih+2ZRWaGUhg VviQcPmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHagwAKCRCJcvTf3G3AJjdwD/ 9GoZycFvhK6h6fbIQwuLO60vgqzr+JFBMz2boSXTBJSryctNsbZrwuvUuiBZUKC1y9sGE+SgzQm0T7 WzDZtyTlGmT1CZjKFpgdCfMbuMLVROkIwwyYoraeYFirZmIIRURYhLoAsJh4ZeL+hi8jOWnaV5ClMm GpAX4WW1YsM9YRJimQri0QE7pLQKGb80KxVsDgul4e0OUj1wYZTYbTgr98Zpysc1nSby6oGnxfPJ5B GvVh8QA/SYaCCMlYyUKr3bjTLrKOZ0NSnt6bAW38OpCXj8344D0TsfmO6tGo0jkheFbpEhSFjRi0Lj 1/+lxcBQ3jvc7zB+0Q5hpVWgX0kC+MxgbmIRdXF66gXOY9KMZzGl6dt9Fdm0xQWH6kFZlX7zpOBeHx To/pgX+EVE7aw6zudBInH3vlkkTYIklAIL/O9ajINZfL2HKHTp1XgnQdpa0KDyxqJilBhkXXekcKjn s7KJFzs28RJWqn+YgyJ+4W4uA6XLQvHdqVGZu5zS748KLU05KkgCeTW+Wm195aiMdUvqPG1QyqpCX5 1oMep8SXDkjOyDi6DnWcfFivJfrpKBqXU3oWsvXdBRhX+fVXmfr/E7qrARl1smC7xBgqWCcJf152Rh nwFocx9Hoo9dTUkHbkM4z/OFi36I6ENfaPOS+x9fFE1riA7xPsrh1gW6nwwA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/wireless/core.h    |  4 ++--
 net/wireless/nl80211.c | 15 ++++-----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/net/wireless/core.h b/net/wireless/core.h
index 3a7dbd63d8c6..899d111993c6 100644
--- a/net/wireless/core.h
+++ b/net/wireless/core.h
@@ -295,8 +295,8 @@ struct cfg80211_beacon_registration {
 struct cfg80211_cqm_config {
 	u32 rssi_hyst;
 	s32 last_rssi_event_value;
-	int n_rssi_thresholds;
-	s32 rssi_thresholds[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(int, n_rssi_thresholds);
+	DECLARE_FLEX_ARRAY_ELEMENTS(s32, rssi_thresholds);
 };
 
 void cfg80211_destroy_ifaces(struct cfg80211_registered_device *rdev);
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 945ed87d12e0..70df7132cce8 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -12096,21 +12096,14 @@ static int nl80211_set_cqm_rssi(struct genl_info *info,
 
 	wdev_lock(wdev);
 	if (n_thresholds) {
-		struct cfg80211_cqm_config *cqm_config;
+		struct cfg80211_cqm_config *cqm_config = NULL;
 
-		cqm_config = kzalloc(struct_size(cqm_config, rssi_thresholds,
-						 n_thresholds),
-				     GFP_KERNEL);
-		if (!cqm_config) {
-			err = -ENOMEM;
+		err = mem_to_flex_dup(&cqm_config, thresholds, n_thresholds,
+				      GFP_KERNEL);
+		if (err)
 			goto unlock;
-		}
 
 		cqm_config->rssi_hyst = hysteresis;
-		cqm_config->n_rssi_thresholds = n_thresholds;
-		memcpy(cqm_config->rssi_thresholds, thresholds,
-		       flex_array_size(cqm_config, rssi_thresholds,
-				       n_thresholds));
 
 		wdev->cqm_config = cqm_config;
 	}
-- 
2.32.0


