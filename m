Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679E5196D2
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320048.540760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NN-0001eV-3V; Wed, 04 May 2022 05:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320048.540760; Wed, 04 May 2022 05:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NL-00019I-02; Wed, 04 May 2022 05:16:35 +0000
Received: by outflank-mailman (input) for mailman id 320048;
 Wed, 04 May 2022 01:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4C5-0008Vf-Qc
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:52:45 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a46777-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:52:44 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so14823pjh.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:52:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a62e310000000b0050dc76281d2sm7165111pfh.172.2022.05.03.18.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:52:42 -0700 (PDT)
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
X-Inumbo-ID: e3a46777-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KYZx+y1oKNSP1oqgJrB6Tz6rT9EWA8WKaERG51foz1A=;
        b=bz1Sh9MVCXyP0oQlo8D6xVMzQ27pV4R6B//UGDTL8nzMS3F7Sze+JRYFVh2IBIaTFl
         BrDTiNFs4Nw3sFWGEkG5ftS8E8tnvlsvZL9PIbvMFVJ2Ru0EtHqoxpqbupakHeJmxqdO
         iZ/yeqiNZ245qldJTLvXJrPu0t4+xuvhNmFB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KYZx+y1oKNSP1oqgJrB6Tz6rT9EWA8WKaERG51foz1A=;
        b=6jhQdmwyS7DaNkjisqbSo5Tp37RoF1zEWXYNYD3pgkIjTt/SUi6QJ1ikvslE9Xl4oB
         eHQpaeDcUwLXjJhIE2ZVmoDs2aK4S9o51MLCBynxHvsr4/im4islngvQl92pm99iAf+X
         WAm/zZOV85QK2Bp8TvOrTG6lqfJy+xtDeU/LxkhXD7QBUITzrGVqqfyB7tvM0yHTPqKd
         kyV4EupwL8A91d5ElBqHWw7ECuUg/BHE570njlQ3J0xjVm4SkqtlKCEsvme8OK8TACD6
         CxwdEmw5lHk9Z9889F6k2fBORyv8rXkEDVLG/XKIYGMUAB1ZXHGsp68c03uZhHTaEVWu
         V6NA==
X-Gm-Message-State: AOAM530jP4LEhYPsLSihR/h7Lgp26ZFM4npl1Jy6KpDFY7w6n4JlG/tc
	fa7FNvWHd4SORBINUQMVGf1YPg==
X-Google-Smtp-Source: ABdhPJzn4mkWoLO9GkvHCb0f9HPITkXNkv0C1WpBFBFfJEBtcJV5kgYulneag//rfVNwLsJ0LGVqMg==
X-Received: by 2002:a17:90b:1251:b0:1d7:f7ae:9f1 with SMTP id gx17-20020a17090b125100b001d7f7ae09f1mr7834178pjb.65.1651629163350;
        Tue, 03 May 2022 18:52:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hulk Robot <hulkci@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	netdev@vger.kernel.org,
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
	Xiu Jianfeng <xiujianfeng@huawei.com>
Subject: [PATCH 15/32] 802/garp: Use mem_to_flex_dup() with struct garp_attr
Date: Tue,  3 May 2022 18:44:24 -0700
Message-Id: <20220504014440.3697851-16-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; h=from:subject; bh=g6mLY++H2BfqQCK003F0EjItFkVyhehgYOIo/aZQtaQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqEjjw/bjk+w/BAp5zZGN/lLOysTcemUiPR49xS rdNJyZqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahAAKCRCJcvTf3G3AJkdZD/ 9ULlU2HE7dyOGGZcxoTDzzzQ0RkAnTOaJ+RVqmjII2Tv1VoPm6QRB0LGPVIKf/ajMgajI22eW2yGjV dV/acgUammYsccOQLPxTPzsPUVFZFU0hxMis5Oq9JqjehQPY4nErl1wT/Zymsur2YjD5pHbuIEHC00 ++wwwIwEXX7l/PdVNJ+PMRIdE9atC0npYUgWrpfpDQWjeDdc8adknigoQ33ZyiQZNgrZVYTO9/59Qg 8KXYHO+zkVTrXNgaZRW0wDjH3ltz+pKJr0geOSSbUhz6LlZjAauJ/rC2ZsYG+CUN5gZKKeQGMACl+O utmoGfrkJAMo4fchbVPoySQfEI4RycU3tPyq3AjrjHPoEOk1up5kNYJrBZjwNIsdxzt2klrR6QtXyt bfI8wU27DsqhelPlsyi6UMtKYVW917c/eUpFGiSJstE8AvpEEc7fwbwOkpO95+zogvhdjqrPwm0ODF hO4WSuDl0qqoSCqmphywXtHTbvP3/SyHQqpHk+XFWlqObHfRedTUudfAq0fRt/wpoTokjndugHxbB3 vPHZIR/QvpGV0TdPvLZ2ykBHieWoDTJLdsmeVjUv1/KqeUr4N1QQRZM24ry1hMmkrjPTDYRPSVjN1n 2Idl5GOStpor5uc8wuqfeiXlQfP7X+6iC5KJi+Kgwt8eOaWFgTn89ibYrF3g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Hulk Robot <hulkci@huawei.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/net/garp.h | 4 ++--
 net/802/garp.c     | 9 +++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/include/net/garp.h b/include/net/garp.h
index 4d9a0c6a2e5f..ec087ae534e7 100644
--- a/include/net/garp.h
+++ b/include/net/garp.h
@@ -80,8 +80,8 @@ struct garp_attr {
 	struct rb_node			node;
 	enum garp_applicant_state	state;
 	u8				type;
-	u8				dlen;
-	unsigned char			data[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u8, dlen);
+	DECLARE_FLEX_ARRAY_ELEMENTS(unsigned char, data);
 };
 
 enum garp_applications {
diff --git a/net/802/garp.c b/net/802/garp.c
index f6012f8e59f0..72743ed00a54 100644
--- a/net/802/garp.c
+++ b/net/802/garp.c
@@ -168,7 +168,7 @@ static struct garp_attr *garp_attr_create(struct garp_applicant *app,
 					  const void *data, u8 len, u8 type)
 {
 	struct rb_node *parent = NULL, **p = &app->gid.rb_node;
-	struct garp_attr *attr;
+	struct garp_attr *attr = NULL;
 	int d;
 
 	while (*p) {
@@ -184,13 +184,10 @@ static struct garp_attr *garp_attr_create(struct garp_applicant *app,
 			return attr;
 		}
 	}
-	attr = kmalloc(sizeof(*attr) + len, GFP_ATOMIC);
-	if (!attr)
-		return attr;
+	if (mem_to_flex_dup(&attr, data, len, GFP_ATOMIC))
+		return NULL;
 	attr->state = GARP_APPLICANT_VO;
 	attr->type  = type;
-	attr->dlen  = len;
-	memcpy(attr->data, data, len);
 
 	rb_link_node(&attr->node, parent, p);
 	rb_insert_color(&attr->node, &app->gid);
-- 
2.32.0


