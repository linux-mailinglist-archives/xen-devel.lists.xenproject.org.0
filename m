Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA85196DD
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320067.540875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nl-0007mb-QX; Wed, 04 May 2022 05:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320067.540875; Wed, 04 May 2022 05:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nk-0007K0-DH; Wed, 04 May 2022 05:17:00 +0000
Received: by outflank-mailman (input) for mailman id 320067;
 Wed, 04 May 2022 01:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4Gy-0000DU-Id
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:57:48 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98157bd0-cb4d-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:57:47 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id d15so185970plh.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:57:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 c136-20020a63358e000000b003c14af5063bsm13937195pga.83.2022.05.03.18.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:57:45 -0700 (PDT)
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
X-Inumbo-ID: 98157bd0-cb4d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmxrp/UxOFb8piH92Vxf3rNJk8bX2cfzoG0Wa8qHsPs=;
        b=M/yQls1bpyaiOjU76efK5Yp3KeWPaKFU4zmgVp0hnDPVEvcbG0Yr2VZsk9GtUI6EW2
         P3x8PrWJUASQzTlrmV7uEWLEbManT0y+Zg+pt3XuYEBjyOBd/MkDra9+mVvndIuuMdNV
         ADaMqJRFecvzQ2p2BbgcShyTVJWmeZm5rse6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmxrp/UxOFb8piH92Vxf3rNJk8bX2cfzoG0Wa8qHsPs=;
        b=ERZBBA4T2e+lSiNt3oxi11fhKzxhUgQPUS2jxCKUlfMe/u+bWQ6YIM4pGsT8/gZ9B2
         W9kqLAdkZ4V6oCMXpzrhzgnNbaY5+Hokvep1bo3jcrCNtTUFcFss/ichGWA6cbg4/jNt
         ufZikIfgtJ0N3zghfrJdIGCuwbzWqAoTbUsnzOCAUwcnU4QNE1PuNWbP5ZceEEJetlHG
         g48rT0logPfN4iRsiFx8xk1LUErM8d9+d06OvbOMPw2m1gBfHj19OPKg0kYKw6sL7jIz
         bEvK/TtadS9ROyW+apylnQCDxko/NQgssjjS240Pz+btlOkQJkeFMn3fOo6KIISQ+x/h
         3T0g==
X-Gm-Message-State: AOAM532UbviZdt7vWZsvRKeeCy8hvv7d0WErfSP7TquIcwUa4ptJ+xFH
	JP4JhhtjcuIlqS80TtN0PQOw/w==
X-Google-Smtp-Source: ABdhPJzsaAMZFIEH9aJDz9g66+jgdQsHq+yoVh8YzAJHoTu87D8ChQb63hX2VO7VJEySpHJexGyYWQ==
X-Received: by 2002:a17:903:2350:b0:15e:93de:763a with SMTP id c16-20020a170903235000b0015e93de763amr16789834plh.117.1651629466084;
        Tue, 03 May 2022 18:57:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Bradley Grove <linuxdrivers@attotech.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
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
Subject: [PATCH 32/32] esas2r: Use __mem_to_flex() with struct atto_ioctl
Date: Tue,  3 May 2022 18:44:41 -0700
Message-Id: <20220504014440.3697851-33-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; h=from:subject; bh=wclXkCNzL8tWkFiLRsyBirHZGs1pS2ud8xMfF2Bbgys=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqIM8CXiBVoq1vvnq9rbFmtFRUsN4irOoYa4gS1 0IJEQ2KJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHaiAAKCRCJcvTf3G3AJgOdD/ sEBkA9QLnBKc64IqIq4YxEg4VNWAmPZGOznytqC/Owjod/71puJ/xtUz+R2WjO80ATXotNqfvtWe/d 9/yCjwl54Xp//OjYlRlQVLKBx2Q11FBqi4MBsooAiVirzGDDTHxmU1iuq6Wz2ZIdZlghDO60VBIerY f7y/tG7dD7LIfF4hLq69yeIQaG4gx8rz9gY1ntSTDKIZg+3A+cCuG7GHCLE4hzM9XcCNdcjNHkLLzM U6m0NaS7W7NFnR0mxnwloGXZVChfb884A/O/wC2lhgRNoxndIkrhF+x2NIhSvpQQmje9R235snuAfX mTZgHUaiYXSuSt8YrUbWAYgqP95oux1CHcGbFo6OSfvzri3R22Sizw6iJPckU4HcHFbxLD7v2eEMVp 3ECGtyv2+WAG63yJy/2YJm4mTGZKQM9ZC/lL6nR/U6EYIjrevoE7kTnSKMDTU+PS27rxgE+Rh1Hg9K ipwZmZh4bV/Xed50s1aJAocNChxua0lDl5jjP3QaZBpQGTlt8ls0YY8i1DswPFLAiSj88j/CGJOPOK +82q4/Et8Wn6QjhXmaRuef6bFcOHFRRdfpp1PZEOD91CPvnpq0Q9e/WXiAbsnkg/diZHdL5A9LVD0O L6xVqhkIsupraaLBcdxfoyPChtyfc0T1x/f55UeM/J7IkMaJAzAUEKGWn+Gg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying. This requires adding the
flexible array explicitly.

Cc: Bradley Grove <linuxdrivers@attotech.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/scsi/esas2r/atioctl.h      |  1 +
 drivers/scsi/esas2r/esas2r_ioctl.c | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/esas2r/atioctl.h b/drivers/scsi/esas2r/atioctl.h
index ff2ad9b38575..dd3437412ffc 100644
--- a/drivers/scsi/esas2r/atioctl.h
+++ b/drivers/scsi/esas2r/atioctl.h
@@ -831,6 +831,7 @@ struct __packed atto_hba_trace {
 	u32 total_length;
 	u32 trace_mask;
 	u8 reserved2[48];
+	u8 contents[];
 };
 
 #define ATTO_FUNC_SCSI_PASS_THRU     0x04
diff --git a/drivers/scsi/esas2r/esas2r_ioctl.c b/drivers/scsi/esas2r/esas2r_ioctl.c
index 08f4e43c7d9e..9310b54b1575 100644
--- a/drivers/scsi/esas2r/esas2r_ioctl.c
+++ b/drivers/scsi/esas2r/esas2r_ioctl.c
@@ -947,11 +947,14 @@ static int hba_ioctl_callback(struct esas2r_adapter *a,
 					break;
 				}
 
-				memcpy(trc + 1,
-				       a->fw_coredump_buff + offset,
-				       len);
+				if (__mem_to_flex(hi, data.trace.contents,
+						  data_length,
+						  a->fw_coredump_buff + offset,
+						  len)) {
+					hi->status = ATTO_STS_INV_FUNC;
+					break;
+				}
 
-				hi->data_length = len;
 			} else if (trc->trace_func == ATTO_TRC_TF_RESET) {
 				memset(a->fw_coredump_buff, 0,
 				       ESAS2R_FWCOREDUMP_SZ);
-- 
2.32.0


