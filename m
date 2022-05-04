Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042F5196D3
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320050.540779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NS-0002nG-0A; Wed, 04 May 2022 05:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320050.540779; Wed, 04 May 2022 05:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NQ-0002Eg-23; Wed, 04 May 2022 05:16:40 +0000
Received: by outflank-mailman (input) for mailman id 320050;
 Wed, 04 May 2022 01:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4C6-0008Vf-JM
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:52:46 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4237b71-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:52:45 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso27631pjj.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:52:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a635449000000b003c14af505edsm10931771pgm.5.2022.05.03.18.52.43
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
X-Inumbo-ID: e4237b71-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkQJNMDRPVcNM81JGzyx6JZrZP+sXh6Sgsv2ZLlrcME=;
        b=TYzsMmP+/eI9TqO4+QAx6yxqi3QYWePclkTlbFjhG/HlibMiAybufg/zrz+rLu5OQM
         GYSNJAX6L87NNLI9qdgxro62vFxqE/fqrqJQw8CwHhp/9rH1kcR4jgxtvHzWUzWEYP1/
         vfXC+WsSf1WXNAAHPYjXFPor5Evr5tOPUQrMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkQJNMDRPVcNM81JGzyx6JZrZP+sXh6Sgsv2ZLlrcME=;
        b=teeWBQQ84Kzul5EJ8q+ofmCOguqBbxMQw/wixtVs6zyXgj5pd6zbxuJ+T9uWOGAoAR
         GkbxYQ3K3J+eigjwbmReGhc0GvBB2r5+ie8jCbzK5BABk7w+e6AVf9hUpd6M8XWTOKCo
         qXlvJxYLDgecA+2zBeS44XwdxWZp3vNB7+wY26owi0ewMQ1n0Hb6VKEmrLIiqH/eUJQ4
         JBGEDSfZgjW2U6iCmVQsRkIn4ae2lOkPE99HXnej2TZtsQSHy1OCuZ3mz8HwygMwDwvI
         hFglt9rJ84qE3ztn+zHlB19pjZscfZTQKVQVAqzmRs9b/8jpo5yIdr6jcQqzgvBSdz0D
         pCqg==
X-Gm-Message-State: AOAM5306iljyPk2qZjiCxGynuwxZdTizXYv5Hy2JYeX5wZuLt0iFerdn
	l7w7kN/VmCkPxbdPHx3PURA6qA==
X-Google-Smtp-Source: ABdhPJw9Mfs8NfMfd0J0YXQIXkiEsTIKgP7m3XPDxYdlVEgqirj/YA+wclSgtM17YB9KKuMWrujLhg==
X-Received: by 2002:a17:90a:f405:b0:1da:2640:f171 with SMTP id ch5-20020a17090af40500b001da2640f171mr7788351pjb.245.1651629164213;
        Tue, 03 May 2022 18:52:44 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	Alexei Starovoitov <ast@kernel.org>,
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
	Lee Jones <lee.jones@linaro.org>,
	Leon Romanovsky <leon@kernel.org>,
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
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
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
	Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 20/32] ASoC: sigmadsp: Use mem_to_flex_dup() with struct sigmadsp_data
Date: Tue,  3 May 2022 18:44:29 -0700
Message-Id: <20220504014440.3697851-21-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019; h=from:subject; bh=6F6KuGFShxf4JxPYrPXKFZeMoWxJdOn30za8QMiNMmc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqFlVM0+m4mgxXYHmim1KeQeXuOmDGRSbqn4CM/ nO+6V12JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahQAKCRCJcvTf3G3AJlsGD/ wObp4TF0rjxUnDl2XU/AX62Kx0wgUSNaGDsaAeFZLHsspTJNlI1xRmKN2zRi+snj0mrEhw1q9Yh76Z 6xSGswQmdh9uemezB9oVUp2GxxN8WyMWOAR+OlnbPY//H6lChfwlnFARSS1Rkb2ZmcX//rZQZhHCXc svCtT3KSBt+VremyDJs9eQY7zKQWSEjl94vDal0JxS0GbWRYV672gtwgzYHATTiXJfZNK9Hnh5x9cI gP5/UtCpxOgh6ebk6PFJurz7rwB5cHVPIkhz8fgbd1cA/0ybs2wrCYj6JpgihAXuZtV18lAdnt8ND/ zB2f7mC3x32cU4603jCCh3lhtKY74eDhUyxc2qxDVBIyLoOufW0rNL12ZmPb/ZqzHlvwvJRNsgVIeo SLXEWPzSRWl4K2DFX2+37Xle5LxGv8rC5oIP/GCWXKXR98j60QjzBdcMWXTL+hc6sVS7VKBDtIDKQO bT+6D7J9MgSyuvsB8QDDWA1XfDXpj4PrZoT1fpgmZGGO+E9p7LhEd5TGmvmWF4EiqePthKxEq+ytkN iIM2UomARrjFWKhMiO7lt831EjVuWu1bB4+YBjMve73RZhWrYBTG1Fi4daezhQ+AyJvye8gqJgbfNu RIcWAmcfFgGhsp4VDM+sRhA/KybFzkFbvrxBwlwAx/rdq4RJkgf/AFGMfR9g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/soc/codecs/sigmadsp.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index b992216aee55..648bdc73c5d9 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -42,8 +42,8 @@ struct sigmadsp_data {
 	struct list_head head;
 	uint32_t samplerates;
 	unsigned int addr;
-	unsigned int length;
-	uint8_t data[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(unsigned int, length);
+	DECLARE_FLEX_ARRAY_ELEMENTS(uint8_t, data);
 };
 
 struct sigma_fw_chunk {
@@ -263,7 +263,7 @@ static int sigma_fw_load_data(struct sigmadsp *sigmadsp,
 	const struct sigma_fw_chunk *chunk, unsigned int length)
 {
 	const struct sigma_fw_chunk_data *data_chunk;
-	struct sigmadsp_data *data;
+	struct sigmadsp_data *data = NULL;
 
 	if (length <= sizeof(*data_chunk))
 		return -EINVAL;
@@ -272,14 +272,11 @@ static int sigma_fw_load_data(struct sigmadsp *sigmadsp,
 
 	length -= sizeof(*data_chunk);
 
-	data = kzalloc(sizeof(*data) + length, GFP_KERNEL);
-	if (!data)
+	if (mem_to_flex_dup(&data, data_chunk->data, length, GFP_KERNEL))
 		return -ENOMEM;
 
 	data->addr = le16_to_cpu(data_chunk->addr);
-	data->length = length;
 	data->samplerates = le32_to_cpu(chunk->samplerates);
-	memcpy(data->data, data_chunk->data, length);
 	list_add_tail(&data->head, &sigmadsp->data_list);
 
 	return 0;
-- 
2.32.0


