Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61775196D1
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320049.540768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NP-0002G6-7T; Wed, 04 May 2022 05:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320049.540768; Wed, 04 May 2022 05:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NN-0001dS-QD; Wed, 04 May 2022 05:16:37 +0000
Received: by outflank-mailman (input) for mailman id 320049;
 Wed, 04 May 2022 01:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4C5-0008Vg-UZ
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:52:45 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b25c7e-cb4c-11ec-a406-831a346695d4;
 Wed, 04 May 2022 03:52:44 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id 6so2144pgb.13
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:52:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a637d41000000b003c14af5063esm13641114pgn.86.2022.05.03.18.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:52:43 -0700 (PDT)
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
X-Inumbo-ID: e3b25c7e-cb4c-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xT+5hQcq61BvthAgaoVmL+Iixyk9Kz6M9vS9nNgwYZE=;
        b=foxymm92zvgmK0ETJD/OF52F7nwlYYgJQ8oVdho7r9BzWtgtuSGYfDYK5MhNshEOoZ
         2wn0h0u9CPuexCbq87DKe80piTtxK5R6ZpJwSBGXRNF7rOHEPYzOtCIu9lKjSdiUbhe+
         r2DkWtw3UKhrg5w4I5ukgiJdOnG5MzFcAx9yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xT+5hQcq61BvthAgaoVmL+Iixyk9Kz6M9vS9nNgwYZE=;
        b=Ej/NX4k2cHepcyQKn330sRS+z2I0Wc/VSQC5SnEh+juypLzcp92uOLgqKAbgpf9F7D
         mcBizMiCM4JvC4HeDNS33ptC69evMiHB8NBhFC2FembNtViK816XAhM0XePKxAbEJ9b2
         K56+wzHWs7aKoM3a82c3kQQ00MccC+fahmEb52Gki0ct4XJyHG2vAhOtsQRMbZcImanS
         GiYhNDT4yDxDzNfsuSUW7U4rd1yOmQsVwbAr0rtFp1Ig3LEErE+rDv1WvTefC5TQKOa5
         6CVs14ZPzs0D901QvOqD5hb0Vve+idStDrq/dlj9F/nPfTIr7k59gAAOLJdIUwu1byLw
         Q/Ag==
X-Gm-Message-State: AOAM5327+nQ0InZNKZ9fn0C4Ba5HEDVcVuUcs4bn/Q4GXSRlmiWGr3l1
	YkNiRWRGXc0OR7VatZw7NfnflQ==
X-Google-Smtp-Source: ABdhPJzg0KwFLixG8Pstl42rdZ/PTRxkyHAZczqCheTOMrqPGfLT6/zfzGOMo4pLCA8igqbxzHRxPA==
X-Received: by 2002:a63:6fc4:0:b0:393:9567:16dc with SMTP id k187-20020a636fc4000000b00393956716dcmr15834959pgc.593.1651629163469;
        Tue, 03 May 2022 18:52:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Luca Coelho <luciano.coelho@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-wireless@vger.kernel.org,
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
Subject: [PATCH 08/32] iwlwifi: mvm: Use mem_to_flex_dup() with struct ieee80211_key_conf
Date: Tue,  3 May 2022 18:44:17 -0700
Message-Id: <20220504014440.3697851-9-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; h=from:subject; bh=kqrSs6qCwh+Lec2OX97eOmuBYGTxbYZO/oveyYvsSyU=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqCYob8Le101GWyzNPT8SUQLcWbnMdLaBLnNMKi PFuQ5FWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHaggAKCRCJcvTf3G3AJrrrD/ 41pLe3vLmy1DT131k402AnWkbvKKTeLHCfdZOZOBG/caJXqmnpOxwil6RAxg5u6hN5hKr+gqoQg3jM PjxMAKOnj4UigmA4/hMbFkpe2UAFQce0nHR1yDX9KirGdKMvnAq1KmeZTOvAK12ubsFuw1otFOoOY9 il9bAkoOcb67DGRv3WnjeBeJAIZesPeob+hkdIGXBLwjDM9HsKNWnS0CO4faN9H2UB5yHtan5AE3fY ejNDT+faux7HktJ5LMXGuFK8hNTMT6DzsBUJMh/VqnJUQfz4J8NZnt1C2fhjm2UKTMJJXaSL2VTIls +E869VhJZmwXhnjNOoXxgs2ypZPdZn7bJMJt9MVXQCWOJ/r5Z4HL//NjQwlMsxa5eN/OtY6fhuJmQa Kt081e3mYWawz+yHoGLyrxfgEVcaxPetNNZbtFWAguSAm+2kDAVJoYtbd1P/PeFNxjV9iclz5KMbsR vfwg2FoAJ4/UE7uv/e9hwMg874lDgZBVxecyw2BfPg0CFqa9KiQ4QmpYRs8HaRBhJQv/jDtfxWqnVh RhanF8E/YIf8Mwjneo+/nQykVNYJP+mnin2t2PXGGQTtyZfdgc4mogRxpnvnUcDOoGAndvfOm8tHL7 lnC6lEffqiIvIoLzddv1Yrb2IU0R/a/tFtHusn7zJ+WlS695vP3r1pDWMDUg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Luca Coelho <luciano.coelho@intel.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Gregory Greenman <gregory.greenman@intel.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c | 8 ++------
 include/net/mac80211.h                       | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/sta.c b/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
index 406f0a50a5bf..23cade528dcf 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/sta.c
@@ -4108,7 +4108,7 @@ int iwl_mvm_add_pasn_sta(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
 	int ret;
 	u16 queue;
 	struct iwl_mvm_vif *mvmvif = iwl_mvm_vif_from_mac80211(vif);
-	struct ieee80211_key_conf *keyconf;
+	struct ieee80211_key_conf *keyconf = NULL;
 
 	ret = iwl_mvm_allocate_int_sta(mvm, sta, 0,
 				       NL80211_IFTYPE_UNSPECIFIED,
@@ -4122,15 +4122,11 @@ int iwl_mvm_add_pasn_sta(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
 	if (ret)
 		goto out;
 
-	keyconf = kzalloc(sizeof(*keyconf) + key_len, GFP_KERNEL);
-	if (!keyconf) {
+	if (mem_to_flex_dup(&keyconf, key, key_len, GFP_KERNEL)) {
 		ret = -ENOBUFS;
 		goto out;
 	}
-
 	keyconf->cipher = cipher;
-	memcpy(keyconf->key, key, key_len);
-	keyconf->keylen = key_len;
 
 	ret = iwl_mvm_send_sta_key(mvm, sta->sta_id, keyconf, false,
 				   0, NULL, 0, 0, true);
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 75880fc70700..4abe52963a96 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1890,8 +1890,8 @@ struct ieee80211_key_conf {
 	u8 hw_key_idx;
 	s8 keyidx;
 	u16 flags;
-	u8 keylen;
-	u8 key[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u8, keylen);
+	DECLARE_FLEX_ARRAY_ELEMENTS(u8, key);
 };
 
 #define IEEE80211_MAX_PN_LEN	16
-- 
2.32.0


