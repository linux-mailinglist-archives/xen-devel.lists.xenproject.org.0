Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05E5196D4
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320052.540796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NW-0003sY-4w; Wed, 04 May 2022 05:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320052.540796; Wed, 04 May 2022 05:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NU-0003KT-Rx; Wed, 04 May 2022 05:16:44 +0000
Received: by outflank-mailman (input) for mailman id 320052;
 Wed, 04 May 2022 01:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4C7-0008Vg-Mc
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:52:47 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4826b9c-cb4c-11ec-a406-831a346695d4;
 Wed, 04 May 2022 03:52:46 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id a191so31722pge.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:52:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a17090ab90800b001d9780b7779sm1993305pjr.15.2022.05.03.18.52.44
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
X-Inumbo-ID: e4826b9c-cb4c-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ifZyQ0FGREg3J5AlhSr1XwF8hVhKkYa2p2S/5EeDNQo=;
        b=oI9BqoXIzDP9CoImflntgKhs0kNacYAtoqQVKtiTaZQIfSzE3upaJIyWSMVlJB9jX5
         Uzgry9KW4Gc+1VYbvAKoSW8Y7tDSPleB46+D+uoXs4vfR0muKw9a9urjnLYWGuq+yUxW
         TpztkzpLBXFj1c/3e7LzufWdk2zzK47xh6GHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ifZyQ0FGREg3J5AlhSr1XwF8hVhKkYa2p2S/5EeDNQo=;
        b=8OwWXFoCNPioaa+Ou+MczVcYDO4JnP3MXMwex8p2mQCBVVDuOH1LeRX/KuWb2MG9tS
         ub5F8/R9ZtnKifcq5Du/YhYFroBPmSGvavGbvBuHvxHKkcJQC6Pyp4HucbUchpt6aKcq
         u53zZjGwEr6fC+o6oBg9Ry9nM388Eq6/z1PpUvRU/KxMES32doN0CqU5umLMZZOp/RBU
         E2e5KGlQZMoXm4MgKOUOyPcuFSsnol6f9cRaP+kCKhmsz5Y8qNa8l4sygL+k1FrGEL4Z
         stsYJOL2Vmcu/J4wP9auOw9jVTuCK1XpYqhUdHZ3OVaTPX/tX6L008gyq/lHzcr5I1YX
         qblA==
X-Gm-Message-State: AOAM532T1FCbmrk9Ec6zDHkR7GtfznqGbKjjxvsBXr27S7VoW+VvvVZR
	C6/ZlR1RcBhCq6XkHB8FHYDXrw==
X-Google-Smtp-Source: ABdhPJwZiz3yJY+jd4qKaXewy5LDTdfohDV0JwoDG1EH0nOIyFnsz5yLMaixtkbCgQQyU/bziKLmbA==
X-Received: by 2002:a63:48f:0:b0:3ab:3b1f:7e7f with SMTP id 137-20020a63048f000000b003ab3b1f7e7fmr16090583pge.164.1651629164850;
        Tue, 03 May 2022 18:52:44 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org,
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
Subject: [PATCH 19/32] afs: Use mem_to_flex_dup() with struct afs_acl
Date: Tue,  3 May 2022 18:44:28 -0700
Message-Id: <20220504014440.3697851-20-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; h=from:subject; bh=saaNwrN23mX+OUTBowMD9D5OUm7L78VX128VXuwjwK4=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqFfM0vuwTYMUTv7e3BZX/iyY3njPgklra+Pkd2 Z4Ou11+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahQAKCRCJcvTf3G3AJnn8D/ 0T93KRcb7qCWTB465n1/YTnsBy2jNLz/U2OLVBzcDFt0AYoA7buN0/1goMxvPhSLi6bjE8UGxc7Fm2 xx2FN5ysX9H/h+AK/cJ3DkHLeBbkc/PToOz1Rhf5ASBW2+V7+qa6CVBSwtSMKSrvj1IM0/N6ioBB18 MCYPkmQ5qhj0A1T1FA5/P3wK+c+Ifo0Yti2zuuDAIo5vSlw/g2lJmCFOlKoVoRmzWGn3UyVXJ9I2UQ xKVYebiH78lPg6s6N8CPVfENvu4vx//FaBlyLvf4NFhRMP18HACQP44Qc0JxstvU7LUJDijflXIFRi grE+kmE6e8bz3l6xfmcLLCVVxLK6kcbN3OPR+1k6kH5962HfiJPZd9T/oRuzkyyoFrBDpqQaKr2g97 9t3Z++vXgvnHcsU1cXdQfiWNAJpoV7p0N66Awn9yJJxP+n2LKF+1g7vkk1gkZ2hlcco2zbVq1FoTnd Kq1+DAU+g1ED0hIHLj9KRfnow47QSvPnc3E3GtLGWqIqKnDHNqPKkcdMSkOm3B6mDT3H0KPxEPrXSQ e1b3nOgGEcTvPf2Pm2gSCNuMfjkK4yrpVG4rvDniz6n+9MLWIpAAWJQjbptVRYhcyt8n75fxNua/sq zBQRxeXk3BLz5v/Hfp5qbE1czFgBcqhDqrr0pErXoP5/DINTx+J9WdEMY0DQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/afs/internal.h | 4 ++--
 fs/afs/xattr.c    | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 7a72e9c60423..83014d20b6b3 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1125,8 +1125,8 @@ extern bool afs_fs_get_capabilities(struct afs_net *, struct afs_server *,
 extern void afs_fs_inline_bulk_status(struct afs_operation *);
 
 struct afs_acl {
-	u32	size;
-	u8	data[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, size);
+	DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
 };
 
 extern void afs_fs_fetch_acl(struct afs_operation *);
diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
index 7751b0b3f81d..77b3af283d49 100644
--- a/fs/afs/xattr.c
+++ b/fs/afs/xattr.c
@@ -73,16 +73,13 @@ static int afs_xattr_get_acl(const struct xattr_handler *handler,
 static bool afs_make_acl(struct afs_operation *op,
 			 const void *buffer, size_t size)
 {
-	struct afs_acl *acl;
+	struct afs_acl *acl = NULL;
 
-	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
-	if (!acl) {
+	if (mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL)) {
 		afs_op_nomem(op);
 		return false;
 	}
 
-	acl->size = size;
-	memcpy(acl->data, buffer, size);
 	op->acl = acl;
 	return true;
 }
-- 
2.32.0


