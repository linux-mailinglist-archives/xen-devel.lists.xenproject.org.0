Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18B5196CB
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320035.540704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7ND-000838-5T; Wed, 04 May 2022 05:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320035.540704; Wed, 04 May 2022 05:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NC-0007nh-3J; Wed, 04 May 2022 05:16:26 +0000
Received: by outflank-mailman (input) for mailman id 320035;
 Wed, 04 May 2022 01:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47F-0007U4-CE
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:45 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30645da1-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:44 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id i62so13977pgd.6
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a7-20020aa780c7000000b0050dc76281b6sm7143766pfn.144.2022.05.03.18.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:47:41 -0700 (PDT)
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
X-Inumbo-ID: 30645da1-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c1Rtb5BPD8+4OzMMFAYya8AfbyIngu3+nEeMZt3y0UI=;
        b=PPT74quvAq5PeXKx/MiU6TPQu9k3CNU13XJUuKL0EyoDADIEUu/0flA/RnFvgA1c7X
         mBDEtN+hqIFmsdnm+Z9MnOUhAzMjdHFmhT3p34uRueOVQQXniPBqP+mbSA7EtL7aqOIy
         RKCLgSNE4LzNp+Ti/YBiXR973K5zL+mViu9iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c1Rtb5BPD8+4OzMMFAYya8AfbyIngu3+nEeMZt3y0UI=;
        b=CBO3FRDCo5FT6GIKWHYp9yxSblV7fccPJ2I9MDCAx1PEQdt8JvhDr1UTA6s13LL1Iz
         0pkzl7zuACVxgs+p/0CYYzRh10dkrScKKbGZTdQlMc0sYcd72UQXzJnPLTJlm0gsB5e5
         EY9d8B5JhQzRvQeLzYAyyBZ2KKgBG0ziboIJxJqV0lWN/FpS6O1j3miuwVpMGQFZji4/
         XwY+ogzgIuRehZwQHM1j5JnDC7pH/c7TozhpfIsmODNKgyGaB8AU2ugjNaqpNs5uwoUn
         XMlNKWyZ4iKcCeTPuiDEYfScytsQ112Gbolf42UKI7OhZF43tYnxmq8NYw1s3SQ+dyWb
         mZlQ==
X-Gm-Message-State: AOAM530H68nr/Q9u8iJJC9ynwMBV/6VY2Y21w8CSTk0uZX1+jP8l+hbJ
	21vYkYEX4l0HN/3ICgKl3a2t3w==
X-Google-Smtp-Source: ABdhPJxnr15nFI48HkUIGCzg3Ti+ux7Hnf2+eF3BCNGMnuO30iNkq86oUQW51ItlsFi5999/esgbAg==
X-Received: by 2002:a62:33c2:0:b0:50d:a588:daab with SMTP id z185-20020a6233c2000000b0050da588daabmr18437024pfz.31.1651628862604;
        Tue, 03 May 2022 18:47:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	linux1394-devel@lists.sourceforge.net,
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
	Stefano Stabellini <sstabellini@kernel.org>,
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
Subject: [PATCH 18/32] firewire: Use __mem_to_flex_dup() with struct iso_interrupt_event
Date: Tue,  3 May 2022 18:44:27 -0700
Message-Id: <20220504014440.3697851-19-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; h=from:subject; bh=En62c6cYeUTmU8jbvcTu7IkYSFHpDUIXfTMNPx9PLGc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqEY3t8cFKELeYkm2NJIduUgR+ZPwYvLuYXHKSq h9RlNwCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahAAKCRCJcvTf3G3AJmzQD/ 40OwL2hRSWj9CwaOb0EjwNMYNrEpXdJJUx4PtLsO50tNm7kViyp0rIIENwt0Refm3UMfgJOd4uhpAP UnN8m9LoCHDWTn2Ip+vIMDS3s7F5W2nAcbk5hF/C+qyUcxpZ01AbHR+GyZjxwzVt9qEG+TAXzPRQnp dfwWrtSjiyM2jKV9PjBNt6qRhM7Jxt/+wokWBFK4eM8IKP5wMTPXf0n1BGa/3mFi6dkoZD+yXtl4IT q4PePWOvlJ8zihIyMKu6xe3P2Cd5gPfwiDcsKwkrzufOJPHAEhY8riHbDxYytvqLGG7bw341elDFvM fFg+b/yC+gowOuz1miET0BDC+cA6vVe4BMDspdtGoFbNEJfsp72+AkNfwxKDENX6TekjFRU3iHzOci lPoBqEyf2AILOQko5Kh9u3twT5Z6Azf7bj/NRatR/QKpZXBkjRcvBCR8SN8nlgdnYckPdhxRBU5YUS IHSagdIFo3kzcAF1P/Aq785Nakdj4SMvQp66HlJm0gKK57rvSGhQtlRXIDROMfObo/Dar+MBASK/fr qWo15PcDT/tqMlbzcrYAAB4BcvmIgHfXG5riesv5IcmZv6ehMHVZTaM4Sf1wIA6V0OWztJpmHeUVBs 1l35/YNa44KeLfFackz/5o7jU6Cqxn/jknqaXV6GkQkL2jafxDjZYhz781sQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: linux1394-devel@lists.sourceforge.net
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/firewire/core-cdev.c       | 7 ++-----
 include/uapi/linux/firewire-cdev.h | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index c9fe5903725a..7e884c61e12e 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -913,17 +913,14 @@ static void iso_callback(struct fw_iso_context *context, u32 cycle,
 			 size_t header_length, void *header, void *data)
 {
 	struct client *client = data;
-	struct iso_interrupt_event *e;
+	struct iso_interrupt_event *e = NULL;
 
-	e = kmalloc(sizeof(*e) + header_length, GFP_ATOMIC);
-	if (e == NULL)
+	if (__mem_to_flex_dup(&e, .interrupt, header, header_length, GFP_ATOMIC))
 		return;
 
 	e->interrupt.type      = FW_CDEV_EVENT_ISO_INTERRUPT;
 	e->interrupt.closure   = client->iso_closure;
 	e->interrupt.cycle     = cycle;
-	e->interrupt.header_length = header_length;
-	memcpy(e->interrupt.header, header, header_length);
 	queue_event(client, &e->event, &e->interrupt,
 		    sizeof(e->interrupt) + header_length, NULL, 0);
 }
diff --git a/include/uapi/linux/firewire-cdev.h b/include/uapi/linux/firewire-cdev.h
index 5effa9832802..22c5f59e9dfa 100644
--- a/include/uapi/linux/firewire-cdev.h
+++ b/include/uapi/linux/firewire-cdev.h
@@ -264,8 +264,8 @@ struct fw_cdev_event_iso_interrupt {
 	__u64 closure;
 	__u32 type;
 	__u32 cycle;
-	__u32 header_length;
-	__u32 header[0];
+	__DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(__u32, header_length);
+	__DECLARE_FLEX_ARRAY_ELEMENTS(__u32, header);
 };
 
 /**
-- 
2.32.0


