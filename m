Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0055196CA
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320030.540682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NA-0007TQ-Ai; Wed, 04 May 2022 05:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320030.540682; Wed, 04 May 2022 05:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N9-0007CI-NF; Wed, 04 May 2022 05:16:23 +0000
Received: by outflank-mailman (input) for mailman id 320030;
 Wed, 04 May 2022 01:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47D-0007U4-DV
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:43 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f320c5b-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:42 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id bo5so13454pfb.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa782c1000000b0051008603b66sm534694pfn.219.2022.05.03.18.47.37
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
X-Inumbo-ID: 2f320c5b-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9UACyPlKQMpsfBiUxRNSWJwLKyqQ0BVbIzFlqTVpEg=;
        b=VrQ6dmSQ7VwQQlIfvwbiI2ql0BVm4J4y9LnkKFZwetWH13cFjtZDcQhXtoigM+PS1n
         cWMsbR1tWdnyAFxVTIwv3Ub+HJcEvYJUmHiHKdd7Tvd9COj+RhcM0WyuPg5dj9PivY8a
         z6yX6sb9Wvgoc2VwmZES4MbGCx8+oyfzVBgW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9UACyPlKQMpsfBiUxRNSWJwLKyqQ0BVbIzFlqTVpEg=;
        b=IQc73+5+jKk96efUyDTD3gTkunWq2894dqstlAop9DyrjkJ4koVNYprOBNR0o6iWuu
         ttyyGE0DA7eMak94UfLE4RWoH2EInMETvnEm9CQiP8mITOj7tSOTokPouFsTm0dJ5aic
         uVgd/mhCWncK6BGx6qHjZk85LWS2tAzBZB2t+hqidE6XwftyJctB9Cg3aNZZAA+BcrRU
         S61l1ROJsbDsEkbKMJFqxO3Jk1XRKSnhJOV0h00+NrASp5dHo3XrTrx6Lx7YSpLiTBMR
         MsJ/H/mxTfbjF74p4tY5y6gptI55UXogvT/pJh9I85Q5MPEH021JziWFfaF3IuMigrQ0
         miog==
X-Gm-Message-State: AOAM530KAJJYmW2vg+nEl2TmdKlMAvsMmqus0TtRuspcZhCxZvLRwnS5
	wpLbBNbzBGmm0Wql+v6uIVszTQ==
X-Google-Smtp-Source: ABdhPJwEApgoIF80IVfCqZ7Wc14eeSv0NeFMafCSFu13taEwh77M4/lfD99nmAtgnvxZOmH48ydyyA==
X-Received: by 2002:a65:524b:0:b0:383:1b87:2d21 with SMTP id q11-20020a65524b000000b003831b872d21mr15967593pgp.482.1651628860634;
        Tue, 03 May 2022 18:47:40 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
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
Subject: [PATCH 09/32] p54: Use mem_to_flex_dup() with struct p54_cal_database
Date: Tue,  3 May 2022 18:44:18 -0700
Message-Id: <20220504014440.3697851-10-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2429; h=from:subject; bh=nMnYI58OZL/NYqqBGThX6X9At9N55AKclw2PdmxLkv8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqCpEYc7sUWDpluF0bUB90CkVbrB3/z8O0fymGg eduju0uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHaggAKCRCJcvTf3G3AJkJoEA CB3d+CRBr1VkScrlHfbIs1LkNyymQ0HwJgl7p4QyueseREG9Mt5326Iwc7RqKF+Rn+YzyWk8dFShzv z6gbI8PNrGAqBPz5BIqLg3dYYHVK5dPPYcYrISNYxFwyXlYH5CnwM8gllN72k9RJxbWzAxh0A+60N/ jviJWlHykiM1Zhxd/qazs6ZevTYO060Zif3DN8WCX/LuwNHp30u5sclQ55oDW3betiobkSC6Ov1eP6 Hi7uDPuaVPlM2ZtdStVUbJUtmb0ddMSgxtTLjFPmzu+/igOg0pwYTovc41hbeEbBnxlRHIoUJWYLEF 9HwXpVeVj29IIka07Wj1DhYds+eo/zSM1UgogveTLy1YqauYGa0HDWQq9oUmlyE1DVBtfNlwDKfQFw abW5WTkLqlaK1bDWZEM/2f5rXJ6Qb2wLF8985KU4MwKaSdM+Jib4Npl3mdvg3RTIqLUDL5C0EsnPZd jx7VWu4NuZxHBeVOpG042kcl9h6NgrzPV4i2lneNTdK9Mf4aIUBuhXuEi0RjjZPRX5KWBWDETa+SHA xIpk2sXTFarSyRcDwvPPRN7FWxxM5y5OPAGRGPRQhj9zCDB+Eh+NAEZe1GFUTZYOWu4PHtyiVVuH0q lf+bEbHqDfX8rt+XVzeUsKcH3bW7KZvEkMLgB/C70MIwPtiUdXvWDMDbvCRw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Christian Lamparter <chunkeey@googlemail.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intersil/p54/eeprom.c | 8 ++------
 drivers/net/wireless/intersil/p54/p54.h    | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
index 5bd35c147e19..bd9b3ea327b9 100644
--- a/drivers/net/wireless/intersil/p54/eeprom.c
+++ b/drivers/net/wireless/intersil/p54/eeprom.c
@@ -702,7 +702,7 @@ static int p54_convert_output_limits(struct ieee80211_hw *dev,
 static struct p54_cal_database *p54_convert_db(struct pda_custom_wrapper *src,
 					       size_t total_len)
 {
-	struct p54_cal_database *dst;
+	struct p54_cal_database *dst = NULL;
 	size_t payload_len, entries, entry_size, offset;
 
 	payload_len = le16_to_cpu(src->len);
@@ -713,16 +713,12 @@ static struct p54_cal_database *p54_convert_db(struct pda_custom_wrapper *src,
 	     (payload_len + sizeof(*src) != total_len))
 		return NULL;
 
-	dst = kmalloc(sizeof(*dst) + payload_len, GFP_KERNEL);
-	if (!dst)
+	if (mem_to_flex_dup(&dst, src->data, payload_len, GFP_KERNEL))
 		return NULL;
 
 	dst->entries = entries;
 	dst->entry_size = entry_size;
 	dst->offset = offset;
-	dst->len = payload_len;
-
-	memcpy(dst->data, src->data, payload_len);
 	return dst;
 }
 
diff --git a/drivers/net/wireless/intersil/p54/p54.h b/drivers/net/wireless/intersil/p54/p54.h
index 3356ea708d81..22bbb6d28245 100644
--- a/drivers/net/wireless/intersil/p54/p54.h
+++ b/drivers/net/wireless/intersil/p54/p54.h
@@ -125,8 +125,8 @@ struct p54_cal_database {
 	size_t entries;
 	size_t entry_size;
 	size_t offset;
-	size_t len;
-	u8 data[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, len);
+	DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
 };
 
 #define EEPROM_READBACK_LEN 0x3fc
-- 
2.32.0


