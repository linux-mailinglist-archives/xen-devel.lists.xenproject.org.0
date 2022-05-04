Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5B5196D8
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320062.540834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nd-0005iP-8J; Wed, 04 May 2022 05:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320062.540834; Wed, 04 May 2022 05:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nb-0005GQ-QO; Wed, 04 May 2022 05:16:51 +0000
Received: by outflank-mailman (input) for mailman id 320062;
 Wed, 04 May 2022 01:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4Gw-0000D6-Bu
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:57:46 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a4330d-cb4d-11ec-a406-831a346695d4;
 Wed, 04 May 2022 03:57:45 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id n18so178684plg.5
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:57:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a17090a7d0500b001d7faf357b7sm2048797pjl.4.2022.05.03.18.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:57:42 -0700 (PDT)
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
X-Inumbo-ID: 96a4330d-cb4d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rbuuZeQPYS/ZqiRJTOL0fJFLrNpJQKS6QwLbS0JMY/Y=;
        b=Aydv/AU/AZjVEPtiqBONRpzT2Ty39Vvxt2nRw4lRsRTiChjbuH3CBtpVpPkeZSBFK6
         zdgmOm2O/OwYN3+guV5vUjUfuHrQcdlBHjoZJkVx9D3VoYUSW8m0vG5AtNFTLXP40SJ0
         Ys4mhsjMHxsUEY5V0SeB81DJET0W6jrFHyAsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbuuZeQPYS/ZqiRJTOL0fJFLrNpJQKS6QwLbS0JMY/Y=;
        b=4gCLnUkpUP4jDEm8jzBwwanaD7N1HvZ3Xojdn7nhvG/UNi14gq2mh69zA1KV0LCEXt
         du43yIu9NmwK/F2Em1sDKslW96q25yfXQuFzjuzJhAhN1+aiZqKNfxKA20NxqiX8o+ON
         /KneBphI+RBWecUVi2SAW296GH5RKxDzpFO7182IG5wuxhVEVaOZVUdhkoeIUq+LAPEA
         HSbXj68UhDxBACH7u+ZHLYV1PO3uaCaxHdxyYQvvJqzjLmfc8qNfPGBgduHT5cGL1zfk
         IVvquRe924/YNYCkYXbntEnoU9wYsk7EknAmPYaKlSXWkhnCx2oW6gufNbegfqgu/8QJ
         VYvw==
X-Gm-Message-State: AOAM531v7wPWSqCNQ0NM1wDSM0atH5OcT0oMb86Gq70Tzef3SrKuZ2H1
	+k61gTXxNdmayiwFTaLNUX95Vg==
X-Google-Smtp-Source: ABdhPJz6tYNBnWbxdtttDcx79X7XJmalrOAZ2eOiqk6F7AwF/hqWiLs80f73ZpQqflYNA4mYhbV7PA==
X-Received: by 2002:a17:90a:bf0a:b0:1db:d98d:7ce9 with SMTP id c10-20020a17090abf0a00b001dbd98d7ce9mr7862640pjs.155.1651629463602;
        Tue, 03 May 2022 18:57:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	=?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
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
	Eric Dumazet <edumazet@google.com>,
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
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rich Felker <dalias@aerifal.cx>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 28/32] selinux: Use mem_to_flex_dup() with xfrm and sidtab
Date: Tue,  3 May 2022 18:44:37 -0700
Message-Id: <20220504014440.3697851-29-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3696; h=from:subject; bh=lo77E+k1d7CC41pTHDyzxO7V17zZAZU2RAD4DG2zlf8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqHYGDosyWmB9LoZ/xyfTluExkJdmxRYXDGGUpK LWQR5yOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahwAKCRCJcvTf3G3AJtEtD/ 9q7isByvmnLJbF2Mqtm1GQLY5WfrgpLpjGz0wPZPFjTuIQg5cBR9sDT+aFaBgykC00RI3PI08gsS9x JTi9K5ZLLk5xSHCb0CjZKLo+ARF0awusiFxdJwvbSdnvd44xlkRwQcTwLZJVGqr2yqy1jJvW1u/3Yh ZZdqt4uhJJpDu5ukdXw+OwIsu09yrTMufSFBgGUsU5+73BimHVDJD+/bAZBGxLMHaKK06iBuF62hS+ XVkvSjBaytrB7eplhA3FHdoU+z/LeETfQYkjmOeYJe6qC/4XyTzzuTjmlkj3sUYna+gIZzZHw5lCgK e8ZKUtmmyjY5P/B2T6F7kreBUKh5iZLQ2r0VwfwJfpJuk13DSHdvjCQuhl4Gt013zBd9fWhQZJesS5 o9IMVFaMGKiFrS1RpL2iZHNi9XVb32DwtShUKjyeEw7ioOL0wYGhna0Kp6zzMgnwjmSeJYnd7Rpifr zM2tyFEjE6tpop237tnM6UbRdzm3XRg4GDWTpvqG9hsvcQcDOk1Wp2/aCUi8Xgzl8dNl2Fr8PklFs5 z9ZW1ImUkK8q5k+Zy0o0VYflt1WZnHugXEEA8b/AT3xAXNqa3BayfVHOM7lLNNWJLV4rSY9HRRJDtf tRpTY3p7aW3hTdJeb21upjhDTPNqM9cBLjUh0Pb2AymaADYZ1hqLMPlC3M+Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying:

    struct xfrm_sec_ctx
    struct sidtab_str_cache

Cc: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Eric Paris <eparis@parisplace.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: "Christian Göttsche" <cgzones@googlemail.com>
Cc: netdev@vger.kernel.org
Cc: selinux@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/uapi/linux/xfrm.h    | 4 ++--
 security/selinux/ss/sidtab.c | 9 +++------
 security/selinux/xfrm.c      | 7 ++-----
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/include/uapi/linux/xfrm.h b/include/uapi/linux/xfrm.h
index 65e13a099b1a..4a6fa2beff6a 100644
--- a/include/uapi/linux/xfrm.h
+++ b/include/uapi/linux/xfrm.h
@@ -31,9 +31,9 @@ struct xfrm_id {
 struct xfrm_sec_ctx {
 	__u8	ctx_doi;
 	__u8	ctx_alg;
-	__u16	ctx_len;
+	__DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(__u16, ctx_len);
 	__u32	ctx_sid;
-	char	ctx_str[0];
+	__DECLARE_FLEX_ARRAY_ELEMENTS(char, ctx_str);
 };
 
 /* Security Context Domains of Interpretation */
diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
index a54b8652bfb5..a9d434e8cff7 100644
--- a/security/selinux/ss/sidtab.c
+++ b/security/selinux/ss/sidtab.c
@@ -23,8 +23,8 @@ struct sidtab_str_cache {
 	struct rcu_head rcu_member;
 	struct list_head lru_member;
 	struct sidtab_entry *parent;
-	u32 len;
-	char str[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, len);
+	DECLARE_FLEX_ARRAY_ELEMENTS(char, str);
 };
 
 #define index_to_sid(index) ((index) + SECINITSID_NUM + 1)
@@ -570,8 +570,7 @@ void sidtab_sid2str_put(struct sidtab *s, struct sidtab_entry *entry,
 		goto out_unlock;
 	}
 
-	cache = kmalloc(struct_size(cache, str, str_len), GFP_ATOMIC);
-	if (!cache)
+	if (mem_to_flex_dup(&cache, str, str_len, GFP_ATOMIC))
 		goto out_unlock;
 
 	if (s->cache_free_slots == 0) {
@@ -584,8 +583,6 @@ void sidtab_sid2str_put(struct sidtab *s, struct sidtab_entry *entry,
 		s->cache_free_slots--;
 	}
 	cache->parent = entry;
-	cache->len = str_len;
-	memcpy(cache->str, str, str_len);
 	list_add(&cache->lru_member, &s->cache_lru_list);
 
 	rcu_assign_pointer(entry->cache, cache);
diff --git a/security/selinux/xfrm.c b/security/selinux/xfrm.c
index c576832febc6..bc7a54bf8f0d 100644
--- a/security/selinux/xfrm.c
+++ b/security/selinux/xfrm.c
@@ -345,7 +345,7 @@ int selinux_xfrm_state_alloc_acquire(struct xfrm_state *x,
 				     struct xfrm_sec_ctx *polsec, u32 secid)
 {
 	int rc;
-	struct xfrm_sec_ctx *ctx;
+	struct xfrm_sec_ctx *ctx = NULL;
 	char *ctx_str = NULL;
 	u32 str_len;
 
@@ -360,8 +360,7 @@ int selinux_xfrm_state_alloc_acquire(struct xfrm_state *x,
 	if (rc)
 		return rc;
 
-	ctx = kmalloc(struct_size(ctx, ctx_str, str_len), GFP_ATOMIC);
-	if (!ctx) {
+	if (mem_to_flex_dup(&ctx, ctx_str, str_len, GFP_ATOMIC)) {
 		rc = -ENOMEM;
 		goto out;
 	}
@@ -369,8 +368,6 @@ int selinux_xfrm_state_alloc_acquire(struct xfrm_state *x,
 	ctx->ctx_doi = XFRM_SC_DOI_LSM;
 	ctx->ctx_alg = XFRM_SC_ALG_SELINUX;
 	ctx->ctx_sid = secid;
-	ctx->ctx_len = str_len;
-	memcpy(ctx->ctx_str, ctx_str, str_len);
 
 	x->security = ctx;
 	atomic_inc(&selinux_xfrm_refcount);
-- 
2.32.0


