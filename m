Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F465196DF
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:17:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320073.540900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nq-0000Wp-Ag; Wed, 04 May 2022 05:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320073.540900; Wed, 04 May 2022 05:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7No-0008Mf-Tb; Wed, 04 May 2022 05:17:04 +0000
Received: by outflank-mailman (input) for mailman id 320073;
 Wed, 04 May 2022 01:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4H0-0000D6-4v
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:57:50 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 986eb06b-cb4d-11ec-a406-831a346695d4;
 Wed, 04 May 2022 03:57:48 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so3028087pjb.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:57:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a17090a2ec300b001cd4989ff50sm2000264pjs.23.2022.05.03.18.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:57:46 -0700 (PDT)
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
X-Inumbo-ID: 986eb06b-cb4d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lxy/SBBLbAnketd1perUQv/dnI2mQxvvkPs8DufKeQc=;
        b=i0Oww6FXAlmLjZL2Xo7+cZyQbZSuVhJcrUz8A4NqwsB3mnE9GxrQbFM3pG+OqIOvr/
         bRoZsADS+tsQKhBZ6qjjGQ8wPq6NgM7w5LLDy+9US9EqrP5Wl9gOulV8iAxG2VM68w2h
         ys5/rKlySYl9/8SCzquZGEIldbBkfJX1v+C7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lxy/SBBLbAnketd1perUQv/dnI2mQxvvkPs8DufKeQc=;
        b=EdVd9xBsBghjWCO/6BEus3D5/GlqaJufiu6wXcOo8Ccquewd8q54Rj1veXpQOkts0l
         OjmUYkKbRJEce0HFhgKmzs/BA16KuDn6DZo4fvUB0F/YS1KAkaLnTPqD+XzhhlJRWRSb
         3zJ0Z1QqG/dpVwGfTcYJzmOU5evz1uTs5f28wjPQkrDp2Bv8MjRu7ckq41xtVy6mPDnc
         ARthPSifuN7OHlVTGXBC0ML0F4x9DjAQUfDAmLz8Z21EGb3SMdaYPGj+voNDzWPs/5wl
         wWtLjtfNso4oW4DXBSL21tboFHKE6DL3RKg2mZPsZUOnWnmj2naKTuM7GN/5F3fhUZBs
         TFjA==
X-Gm-Message-State: AOAM530EFvac6KvlJ+5uV7Zd1iRGA0fM5zhrWclEclH8ehb7nYvtZPwI
	UwkL6SuzVLgKUt+WscSyENj7zQ==
X-Google-Smtp-Source: ABdhPJwkCJiyloqnUC98ULA8VGwgD2gCblOMTFYJlDNNyWPyHvD0nLQtaW1YAKVPNQXc+1bJk4N22Q==
X-Received: by 2002:a17:903:2281:b0:15e:95f7:37d1 with SMTP id b1-20020a170903228100b0015e95f737d1mr16432450plh.18.1651629466697;
        Tue, 03 May 2022 18:57:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
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
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 31/32] xenbus: Use mem_to_flex_dup() with struct read_buffer
Date: Tue,  3 May 2022 18:44:40 -0700
Message-Id: <20220504014440.3697851-32-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; h=from:subject; bh=Af40/wtrXz82sQZ3gkXc9sqO1MKE/dCxzKzVkZCyPBE=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqH+KXwBf+62Kz/ptxhFXwkt9WosiEBHko2iuOB 0fcNum2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahwAKCRCJcvTf3G3AJvLPD/ 9BhjziZJhS9xD2GsjrelNYz/xp7Z6XtKNgFRofwy/p+e4IFCpDHMNYQmpP3WVjlkD9FyouGOGLk+Sf 0i6cJgn02GGl9DKJH1kqxbUikzY6c8wzuc6v3W7+teBaTIZXxJ4Bg0xxroKqmZVZTUvN34ouMFIb2p ++rnq2J7531VZeebMPx+6kezaUVTaUGe1VFKBUuccT4/6mp2R8HqzWVgmSai8ZyNi4Z0nnObREm+rJ u1d6VjniOCRmOGgG7QCuuF+cUE4d+Isa6moThhkOv0m//DMJYGT/djpuk6W+kWlcJs+nrsoX1AByJu zD1O0Fk/hh4ooTDaA3lQmWtVq+gJIaYvCBILFRlDcGFC0oo/EM3wXTGcFGjgMgTNiEXK62PdLF9dZf kRieucxaOIdVPYz+BN9o4ps+oSWfIYaQYOYAOwTAA01RA6l3cElUd3dfgBE1lOqQNUDIkcTD8rOm+l 8JdhxGwQaeetRebI0mGQru7qvbnW4s+raN3cR8JtJ36LlEBzqobHNRhVRK3K2dZQhOPhKgr3OWpCOE anL307TAv51pZ7CNDf9iEaZPdoVXALMDtkTpnwemX7C4Lc94fH0b/AmlH5YOCpb8DGFa9BJnGzvzbc FPmLrSOPa5hu9l1uVEcpEaQHDzIfRLtxISX0mmsQ1VLswRk+mwBJcKd8a+7w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/xen/xenbus/xenbus_dev_frontend.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index 597af455a522..4267aaef33fb 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -81,8 +81,8 @@ struct xenbus_transaction_holder {
 struct read_buffer {
 	struct list_head list;
 	unsigned int cons;
-	unsigned int len;
-	char msg[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(unsigned int, len);
+	DECLARE_FLEX_ARRAY_ELEMENTS(char, msg);
 };
 
 struct xenbus_file_priv {
@@ -188,21 +188,17 @@ static ssize_t xenbus_file_read(struct file *filp,
  */
 static int queue_reply(struct list_head *queue, const void *data, size_t len)
 {
-	struct read_buffer *rb;
+	struct read_buffer *rb = NULL;
 
 	if (len == 0)
 		return 0;
 	if (len > XENSTORE_PAYLOAD_MAX)
 		return -EINVAL;
 
-	rb = kmalloc(sizeof(*rb) + len, GFP_KERNEL);
-	if (rb == NULL)
+	if (mem_to_flex_dup(&rb, data, len, GFP_KERNEL))
 		return -ENOMEM;
 
 	rb->cons = 0;
-	rb->len = len;
-
-	memcpy(rb->msg, data, len);
 
 	list_add_tail(&rb->list, queue);
 	return 0;
-- 
2.32.0


