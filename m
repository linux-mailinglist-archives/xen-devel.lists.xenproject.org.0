Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD55196C3
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320023.540638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N6-0006NH-7v; Wed, 04 May 2022 05:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320023.540638; Wed, 04 May 2022 05:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N5-0006Ec-RV; Wed, 04 May 2022 05:16:19 +0000
Received: by outflank-mailman (input) for mailman id 320023;
 Wed, 04 May 2022 01:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47A-0007U4-Al
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:40 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d8ca463-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:39 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so2750449pjb.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 ij16-20020a170902ab5000b0015e8d4eb200sm7024989plb.74.2022.05.03.18.47.36
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
X-Inumbo-ID: 2d8ca463-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xU+lft0xYFj1fS1yuTZSbozxjgBGk0a+m2yFd6VoFH8=;
        b=a+tRkUtoblEDLjvFId++UphGjoZEaQCYI3Vk83Wii7jOQPjtu5Lszr9szx/ri1HX51
         wV1jt/Of6XxA4HH6Vf9VLVYuUYeTQ2uz41Vd4xndvpOP8cB9qurXZHACinwkcuuAVoNS
         S4kXDV6k7pYw97SFuBD/SAZ91ynDl2QAdaG/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xU+lft0xYFj1fS1yuTZSbozxjgBGk0a+m2yFd6VoFH8=;
        b=fktl6Yv3Nm3QkSrb7p49UsoedJnB+T1LtCoWrC5aMnua+A7CliP10R0kINaiOIdNJe
         cDWYpgWPWJo6S1XkPix5ntPsEr+ewj30JFmd6Lt9MgS8Wm6TKT2i4h90YBqZGXaqU2e6
         9CzzDAtzn+tqEKRFXSorQNvE0OUppCaqmnUkpVgxArrrBYXjja9qrXTRLrFTff36VW5c
         H9LAeFS4x+Feygm3sFnSO7Aup5VmJ3wjCHwVC9a/VjeQC9puby9mmd90G+Y6HtY668xL
         wW3C7gVp12nwF8LUZ0zAQxkKDpmMUSOPDz5gMW7nu1QB/U3B/SyrQ8T6RgzvwQd9w3CE
         Z0uQ==
X-Gm-Message-State: AOAM533h1rB0hsaftIEPXgWtL1YV2Xfo/fysjXDl/KZ1isfFvrR2LZ/3
	BIjlTjV3W04WrA/aexlNOfx1Hg==
X-Google-Smtp-Source: ABdhPJxAtBZ9EXzckbFxXEo5UZhmn/LsbzwXw7S3livWp9IXdIuEWTNc+6eQzBZkUiCIn0RCFgRUjw==
X-Received: by 2002:a17:90a:8407:b0:1d9:ab62:bd3c with SMTP id j7-20020a17090a840700b001d9ab62bd3cmr7874329pjn.139.1651628857838;
        Tue, 03 May 2022 18:47:37 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Andy Lavr <andy.lavr@gmail.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
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
Subject: [PATCH 07/32] iwlwifi: calib: Use mem_to_flex_dup() with struct iwl_calib_result
Date: Tue,  3 May 2022 18:44:16 -0700
Message-Id: <20220504014440.3697851-8-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2309; h=from:subject; bh=WpodBqq01jqwxM1KRcJO62uugaWovPAJ5k8Asd34efc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqCGKNTo/e4rYqRS6JHFIWEcMsPl6ZUWQBFBFL/ Wqla2nSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHaggAKCRCJcvTf3G3AJvqCD/ 9KMmQRVL3p5s+EO2ziT+OnA/bWRcfyVrpdD2apYiZrAvV6jv+ChcK5o9LNvgU6liqmGQvBK56XO3bQ qrNnEnu62KEpY0aEShwY6YNXdwdTLw3FEMK42jV6f34XbajiPo0MoQoS/x/QSbL1eIG6JO5d4TRjIe 0/Q48qkArPdlLvI5pKeSr1lsEVPndfc9NGHCI6nA2+bBonwbXOWfAC7HZPfrpPcmTgLfoKTkBLXai4 ePDPJtwC3/jzsxtTC7J9DHOmQvRPHeYKpPXefkrkgeOaZf2ToPQ3uG49rEHXnkAeJVNemhQ1DJPNcQ HudzUsakTefZTR7ato8r+9r+0+ie8aFfQEAagdWcpPFVR9EyXHXbSWIWZPdHaXSsvv+zcH2BVwp+lX PHt2bIY0X/x3Uouh1It3/uSZlg30A1qnqeXxqNsMc6p4qaHY4pJywV1EkrsZwZd1PdBaiWc6LsdWnm g/rpEfcleSaFr5QGOmd7i7ErfwdtNTNDj5n6eo7f/rD6qfq1dEAIa3IkdH7xRECGPpT/2qd+a747A7 vm2gjfh13/ghhPAbVTSZORt9oZN46upeJxwm83wHp0XHC4gVbEH+bjDqXYQAWbhNyUaOA8Ua7uIonu l7HgMXAQ7eoMMallt3TbHeAxvHxkwxcyt1LUHi517rK5CcCYO26DROhVZXYw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Avoids future false-positive warning when strict run-time memcpy()
bounds checking is enabled:

memcpy: detected field-spanning write (size 8) of single field "&res->hdr" (size 4)

Adds an additional size check since the minimum isn't 0.

Reported-by: Andy Lavr <andy.lavr@gmail.com>
Cc: Luca Coelho <luciano.coelho@intel.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Gregory Greenman <gregory.greenman@intel.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intel/iwlwifi/dvm/calib.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/calib.c b/drivers/net/wireless/intel/iwlwifi/dvm/calib.c
index ae1f0cf560e2..7480c19d7af0 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/calib.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/calib.c
@@ -18,8 +18,11 @@
 /* Opaque calibration results */
 struct iwl_calib_result {
 	struct list_head list;
-	size_t cmd_len;
-	struct iwl_calib_cmd cmd;
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, cmd_len);
+	union {
+		struct iwl_calib_cmd cmd;
+		DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
+	};
 	/* data follows */
 };
 
@@ -59,14 +62,10 @@ int iwl_send_calib_results(struct iwl_priv *priv)
 int iwl_calib_set(struct iwl_priv *priv,
 		  const struct iwl_calib_cmd *cmd, int len)
 {
-	struct iwl_calib_result *res, *tmp;
+	struct iwl_calib_result *res = NULL, *tmp;
 
-	res = kmalloc(sizeof(*res) + len - sizeof(struct iwl_calib_hdr),
-		      GFP_ATOMIC);
-	if (!res)
+	if (len < sizeof(*cmd) || mem_to_flex_dup(&res, cmd, len, GFP_ATOMIC))
 		return -ENOMEM;
-	memcpy(&res->hdr, cmd, len);
-	res->cmd_len = len;
 
 	list_for_each_entry(tmp, &priv->calib_results, list) {
 		if (tmp->cmd.hdr.op_code == res->cmd.hdr.op_code) {
-- 
2.32.0


