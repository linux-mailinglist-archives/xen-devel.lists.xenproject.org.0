Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E85196D5
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320051.540789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NU-0003Oe-GJ; Wed, 04 May 2022 05:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320051.540789; Wed, 04 May 2022 05:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NS-0002k6-LY; Wed, 04 May 2022 05:16:42 +0000
Received: by outflank-mailman (input) for mailman id 320051;
 Wed, 04 May 2022 01:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4C6-0008Vg-Vj
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:52:47 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4796d04-cb4c-11ec-a406-831a346695d4;
 Wed, 04 May 2022 03:52:46 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id x12so18421pgj.7
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:52:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa781d5000000b0050dc7628163sm6921886pfn.61.2022.05.03.18.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:52:44 -0700 (PDT)
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
X-Inumbo-ID: e4796d04-cb4c-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=szeqM9M0yrMyJS9vcuYR4tTzvEASeBs+sh1JgS4qPAo=;
        b=SNMym2HDPaFxMLeJFcK68nelvSK8kE0Z3iij6ppE4Nnk5PkLPyihqCWqJWEyxTK+Ad
         Wlo0fMMZpa7cEJ44ZnUWiYYlbNhSmn3I+2rzPJ3v+90je6UlKRw4Aqz10rVm1pygvoeV
         KVh5PeFOgavCCRafhGFy8OhJb2FMOsRW4OkVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=szeqM9M0yrMyJS9vcuYR4tTzvEASeBs+sh1JgS4qPAo=;
        b=3RJUiXYOZN1RyZOgCsuOnxS/1CXfwRanj5YH60A5g1VLQqv2t2GgxfQ4dL92NuIlCv
         Ktz2SGDh2kB957z0riXO0oajfB2ctF+pWbI1cricYaEUz8o9V0rQcAvzgOMIt7nzcgiQ
         SVPyCIkmzLd7KXf7oVFgdIHaEY1uMKF3l2Jhcme2OzPSHQk/Q8diU4BBgpFM7a/P9g4i
         Eco4L0GIMC4U8rHxaVAQ07FhzhwQyxQe/KHU49/qahY6pSHT46ivBh7Y2PSlNGweHUK0
         wg7epj65jNQVBkSbmTphkt2yzGIBZ0DQLk7tJRiPv6yKlNCR1/gvbIjdGp950wLJlqGt
         KtFQ==
X-Gm-Message-State: AOAM531r3tdG9PZeRQFXsH0av5AfXPVFf13e/b+Az4ICKkdF95v8aS/2
	QMl4AwoJNKGnK6JPKMgCFGop2A==
X-Google-Smtp-Source: ABdhPJwdis58CLkd0sjK8SnsRx0Cj4uwRmI1rQtZqa6dArHava5h0MqK56bFRFrLStS8ZAx2UHCkJQ==
X-Received: by 2002:a65:614e:0:b0:380:bfd9:d4ea with SMTP id o14-20020a65614e000000b00380bfd9d4eamr15889135pgv.92.1651629164801;
        Tue, 03 May 2022 18:52:44 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Gross <agross@kernel.org>,
	Andy Lavr <andy.lavr@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Haiyang Zhang <haiyangz@microsoft.com>,
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
	Johannes Berg <johannes@sipsolutions.net>,
	John Keeping <john@metanate.com>,
	Juergen Gross <jgross@suse.com>,
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
Subject: [PATCH 05/32] brcmfmac: Use mem_to_flex_dup() with struct brcmf_fweh_queue_item
Date: Tue,  3 May 2022 18:44:14 -0700
Message-Id: <20220504014440.3697851-6-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2425; h=from:subject; bh=LUlPP0dMftItb3yi/Nge8ZTfomS6k0b5Ud+psHgt9Uk=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqBCnVywLtiCXwEUYb08oAOpk1h97YdS8IXrTwN m34sdVuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHagQAKCRCJcvTf3G3AJokcD/ 944yjyiL4MM2Llyg3BhqwjaPE/1VNwGW9grsHKNIASpW8lInBdW90HjydT+vZ0wCt1VpknFi2upnQI XFtVoH0BT1G9pp4WHMjMMAaSqS3XB0bqdYs4DVvPzTKh5kGr5jX6k9+GTSve/itnWwnYDdM80IlUNt S0IhtkWMACqLlgyqGlt11fTu2Zpj0mRgIVFYh1FPaQRGj+skxj5+tzJqnIxOvBBPtzMq5leG8tzvRp gGF1ADH/0BhWsidIuY5CltVSgionGZ0at33CGy6Yb686fc3WZxfkwUqwKd4kWy0/RHSdYt4O0S9KnY r3h5ztCJtoyE+LsOyQfAjweyIO2LhMxNdieb0lZcJ/4W95rILXttIhcQ8iyf4yAsY69UgQuHPKDcAf nBH2PYzGNfEsEHmEr7bOtF2WG7xXUZXn6gi1luh2tpxiaDAkWSbwC0/Hg4An1+r4RDKB8TaO47Qgsp PG9QvJ1Ej3BAp6hSui4/P+qsMcNSEBBM0dZS2Ro11mi+jDDxK5En0Xgd/el0xn+qwqq+NFNlC0jKcW /QhhJ9GSxPsZzAT51pgi/Q//ZlDNoXI6Xmoho22SXd2se2PmaeWQDnuPK8bWnerpItxcrS1KP5jR9H przw+F/g76E2CP74njdcHJE58D4/zsqYKWbbLWi2QfpgIWTEZ+hV+/A44Ihw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Arend van Spriel <aspriel@gmail.com>
Cc: Franky Lin <franky.lin@broadcom.com>
Cc: Hante Meuleman <hante.meuleman@broadcom.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-wireless@vger.kernel.org
Cc: brcm80211-dev-list.pdl@broadcom.com
Cc: SHA-cyfmac-dev-list@infineon.com
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/fweh.c   | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
index bc3f4e4edcdf..bea798ca6466 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.c
@@ -32,8 +32,8 @@ struct brcmf_fweh_queue_item {
 	u8 ifidx;
 	u8 ifaddr[ETH_ALEN];
 	struct brcmf_event_msg_be emsg;
-	u32 datalen;
-	u8 data[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, datalen);
+	DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
 };
 
 /*
@@ -395,7 +395,7 @@ void brcmf_fweh_process_event(struct brcmf_pub *drvr,
 {
 	enum brcmf_fweh_event_code code;
 	struct brcmf_fweh_info *fweh = &drvr->fweh;
-	struct brcmf_fweh_queue_item *event;
+	struct brcmf_fweh_queue_item *event = NULL;
 	void *data;
 	u32 datalen;
 
@@ -414,8 +414,7 @@ void brcmf_fweh_process_event(struct brcmf_pub *drvr,
 	    datalen + sizeof(*event_packet) > packet_len)
 		return;
 
-	event = kzalloc(sizeof(*event) + datalen, gfp);
-	if (!event)
+	if (mem_to_flex_dup(&event, data, datalen, gfp))
 		return;
 
 	event->code = code;
@@ -423,8 +422,6 @@ void brcmf_fweh_process_event(struct brcmf_pub *drvr,
 
 	/* use memcpy to get aligned event message */
 	memcpy(&event->emsg, &event_packet->msg, sizeof(event->emsg));
-	memcpy(event->data, data, datalen);
-	event->datalen = datalen;
 	memcpy(event->ifaddr, event_packet->eth.h_dest, ETH_ALEN);
 
 	brcmf_fweh_queue_event(fweh, event);
-- 
2.32.0


