Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47745196C8
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320024.540647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N7-0006bS-0e; Wed, 04 May 2022 05:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320024.540647; Wed, 04 May 2022 05:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N6-0006Ns-L5; Wed, 04 May 2022 05:16:20 +0000
Received: by outflank-mailman (input) for mailman id 320024;
 Wed, 04 May 2022 01:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47A-0007U4-Ty
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:40 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df7430c-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:40 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id j6so16129857pfe.13
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b0050dc762816bsm6923568pfi.69.2022.05.03.18.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:47:37 -0700 (PDT)
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
X-Inumbo-ID: 2df7430c-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/zjSzrQhFPsEVokcSsrv18uPDt/e1w8KitHmUEp+EKs=;
        b=mT+0HB76IN8PFmOQ4RQ3Shsn/xpSWIw4uZtDzm+qPL1ltT6DXjm7Tp880YLv6NTlX2
         jzlnck4Hcy2b22tjZHTFIsFigeOwa/p0jwatnoLYw/6ZPZFoRjVJYcegxFjMo85nErfR
         VdOWk3eGpgUIVPQ45lqiYFZPzg8bYlpkvYlx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/zjSzrQhFPsEVokcSsrv18uPDt/e1w8KitHmUEp+EKs=;
        b=hgDqft2slnu8FVh3VbVEVkVjahO9V0qincdjYBTHOeYCfLIh8HMur9Dx4UmdUT+pff
         iPGbU1ZMo9xykNhTDx9+FU7ON+jgqVwxjZREiyoGQJTg7XYwQSwHYqCm/plHaHcYEypc
         /+fZo3+QE9YIne9TUKCckCHmQLkoamlGJFz8399+CKKq3XWpATWVQqGFcZfPB5IcUjEQ
         XA8nMeDcI836pCmJrne7SMQFQ+Di4cI5r/zxGH7QHR/yL/L/ScPYN5dgJv4f8DgCTfyK
         QpyRoWwnQuBP7NAxnokfujtjBFAyELv/6Bepl6HuMJ/t0r0aLZUEJxLqPVZxQFIdhwnA
         ojMw==
X-Gm-Message-State: AOAM53368V3GZP6HCksMpycIQ0IiDrGZ6y90xsPP4Yf8tRyp1sEIZSN6
	i1dIqMyHeMzpFE9bnwbA79jzIw==
X-Google-Smtp-Source: ABdhPJxhtwXtLVIUcB2US4slqD0XToxtoZJgPLmnCR1fqgUmJy/AmZ3otgqvCCOEdhxOZsYp+oeMXA==
X-Received: by 2002:a63:3409:0:b0:3ab:4d72:1f0a with SMTP id b9-20020a633409000000b003ab4d721f0amr15975186pga.420.1651628858527;
        Tue, 03 May 2022 18:47:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Luca Coelho <luciano.coelho@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andy Lavr <andy.lavr@gmail.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Gross <agross@kernel.org>,
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
	Johannes Berg <johannes@sipsolutions.net>,
	John Keeping <john@metanate.com>,
	Juergen Gross <jgross@suse.com>,
	Keith Packard <keithp@keithp.com>,
	keyrings@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
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
Subject: [PATCH 06/32] iwlwifi: calib: Prepare to use mem_to_flex_dup()
Date: Tue,  3 May 2022 18:44:15 -0700
Message-Id: <20220504014440.3697851-7-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4285; h=from:subject; bh=3rsHreun4MVxtWWXTu1WNAZSbES1/vQKrpGvwiRs9tU=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqBVRPLVwI+Gac+Hu63Hjdxl/T8wFFeQtpYoExL lGTHr0KJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHagQAKCRCJcvTf3G3AJls/D/ 437IfHiRN/O/WyQZtpBUHVGUgP169cUmMhP62Pg0E7Hm7/o39zhQLTQ6d/zK2YTBo7GmHkrgW8+U89 K5ocyNlNeKiAOXNNyYjAKY0hINeYBOJbO+yP8Qb7dZ/ehdVAMXsZ5FjQQj2vRKXsiXBoCT4SNc7+7q 9k8nWm0scS/uHdUFonlvWzm3U/glq/QdTO6+M+RL75mqVm3Z2pZVYd2zeERbawqDVM7cuH2Zg17Avr WdhGyjfTAsPULi+qZBWVUvqc6X+iQ4DfUXZsJix/xvmINZyl3qG1d9TC92K8dHMKiRgdQpvnR+FE6Q WFBlvLGlrizcMolOVSXOkMFCRZ74YilAy+JISkDbLH5XPWP7v8ecKO+KApQCuxSqbyQ5G2zKND3+pY XoycBgIvvVGCy6VqLKW/gevPTpcBLR3Co4zh7nUKJffVspyQUE2M+5pLQBir/tmUVL54XdaUlMD4Tn pwD2p93A7KSHATImTFhq4PX2SS6jGi0V6Il1OHQS6pknXDGlaqxdwNO9EjP+edRb938jKgEGXypou9 S7mjGxWZ8I5Vu1E04fw2ClHZt4VH4Yas0mafjkRAPt2hiDdKF7TGiEg+awmLwQxN4tzHXDSsSGnmAv D9O1AcRWlYNF1HE1jUt/Y9dXMSZUe1atungkrYoabVpF4z5SrVEEglZiUKow==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for replacing an open-coded memcpy() of a dynamically
side buffer, rearrange the structures to pass enough information into
the calling function to examine the bounds of the struct.

Rearrange the argument passing to use "cmd", rather than "hdr", since
"res" expects to operate on the "data" flex array in "cmd" (that follows
"hdr").

Cc: Luca Coelho <luciano.coelho@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Johannes Berg <johannes.berg@intel.com>
Cc: Gregory Greenman <gregory.greenman@intel.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Andy Lavr <andy.lavr@gmail.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intel/iwlwifi/dvm/agn.h   |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/calib.c | 10 +++++-----
 drivers/net/wireless/intel/iwlwifi/dvm/ucode.c |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/agn.h b/drivers/net/wireless/intel/iwlwifi/dvm/agn.h
index abb8696ba294..744e111d2ea3 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/agn.h
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/agn.h
@@ -112,7 +112,7 @@ int iwl_load_ucode_wait_alive(struct iwl_priv *priv,
 			      enum iwl_ucode_type ucode_type);
 int iwl_send_calib_results(struct iwl_priv *priv);
 int iwl_calib_set(struct iwl_priv *priv,
-		  const struct iwl_calib_hdr *cmd, int len);
+		  const struct iwl_calib_cmd *cmd, int len);
 void iwl_calib_free_results(struct iwl_priv *priv);
 int iwl_dump_nic_event_log(struct iwl_priv *priv, bool full_log,
 			    char **buf);
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/calib.c b/drivers/net/wireless/intel/iwlwifi/dvm/calib.c
index a11884fa254b..ae1f0cf560e2 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/calib.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/calib.c
@@ -19,7 +19,7 @@
 struct iwl_calib_result {
 	struct list_head list;
 	size_t cmd_len;
-	struct iwl_calib_hdr hdr;
+	struct iwl_calib_cmd cmd;
 	/* data follows */
 };
 
@@ -43,12 +43,12 @@ int iwl_send_calib_results(struct iwl_priv *priv)
 		int ret;
 
 		hcmd.len[0] = res->cmd_len;
-		hcmd.data[0] = &res->hdr;
+		hcmd.data[0] = &res->cmd;
 		hcmd.dataflags[0] = IWL_HCMD_DFL_NOCOPY;
 		ret = iwl_dvm_send_cmd(priv, &hcmd);
 		if (ret) {
 			IWL_ERR(priv, "Error %d on calib cmd %d\n",
-				ret, res->hdr.op_code);
+				ret, res->cmd.hdr.op_code);
 			return ret;
 		}
 	}
@@ -57,7 +57,7 @@ int iwl_send_calib_results(struct iwl_priv *priv)
 }
 
 int iwl_calib_set(struct iwl_priv *priv,
-		  const struct iwl_calib_hdr *cmd, int len)
+		  const struct iwl_calib_cmd *cmd, int len)
 {
 	struct iwl_calib_result *res, *tmp;
 
@@ -69,7 +69,7 @@ int iwl_calib_set(struct iwl_priv *priv,
 	res->cmd_len = len;
 
 	list_for_each_entry(tmp, &priv->calib_results, list) {
-		if (tmp->hdr.op_code == res->hdr.op_code) {
+		if (tmp->cmd.hdr.op_code == res->cmd.hdr.op_code) {
 			list_replace(&tmp->list, &res->list);
 			kfree(tmp);
 			return 0;
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/ucode.c b/drivers/net/wireless/intel/iwlwifi/dvm/ucode.c
index 4b27a53d0bb4..bb13ca5d666c 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/ucode.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/ucode.c
@@ -356,18 +356,18 @@ static bool iwlagn_wait_calib(struct iwl_notif_wait_data *notif_wait,
 			      struct iwl_rx_packet *pkt, void *data)
 {
 	struct iwl_priv *priv = data;
-	struct iwl_calib_hdr *hdr;
+	struct iwl_calib_cmd *cmd;
 
 	if (pkt->hdr.cmd != CALIBRATION_RES_NOTIFICATION) {
 		WARN_ON(pkt->hdr.cmd != CALIBRATION_COMPLETE_NOTIFICATION);
 		return true;
 	}
 
-	hdr = (struct iwl_calib_hdr *)pkt->data;
+	cmd = (struct iwl_calib_cmd *)pkt->data;
 
-	if (iwl_calib_set(priv, hdr, iwl_rx_packet_payload_len(pkt)))
+	if (iwl_calib_set(priv, cmd, iwl_rx_packet_payload_len(pkt)))
 		IWL_ERR(priv, "Failed to record calibration data %d\n",
-			hdr->op_code);
+			cmd->hdr.op_code);
 
 	return false;
 }
-- 
2.32.0


