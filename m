Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28765196E1
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320074.540907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Ns-0000zZ-92; Wed, 04 May 2022 05:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320074.540907; Wed, 04 May 2022 05:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nq-0000Ts-VS; Wed, 04 May 2022 05:17:06 +0000
Received: by outflank-mailman (input) for mailman id 320074;
 Wed, 04 May 2022 01:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm4H0-0000DU-6r
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:57:50 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99334a0e-cb4d-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:57:49 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so56873pjf.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:57:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a62e319000000b0050dc7628168sm6962145pfh.66.2022.05.03.18.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:57:47 -0700 (PDT)
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
X-Inumbo-ID: 99334a0e-cb4d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/QgTacQ+A83oLfMgc7AcEsbfIOOMUUn/07ShQ/z1lc0=;
        b=OEKPNTKscDvuMfuoT9d4JeIvnRRtddZvUR90FLHTaY6dqJ3WoEedmmXxG6udDH4ll2
         hQ3xVWzIJux8F2/IVGnkOvoKvzigrtb6PN+WIk/nKNi6EuEO6/f9y41IdVZKJ50O2w0U
         wl96xKQAPtHy1YFDiqJxnzLe5ZISnsn0F+m/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/QgTacQ+A83oLfMgc7AcEsbfIOOMUUn/07ShQ/z1lc0=;
        b=DK9MKrt0Ly6WQG82i/hZNLbbnLobEDszZI01OOtxu7bFkCeN8iymCcFPrpAOSWk9Ly
         QQQBj819LOh+YFOCDULdOp3p2e3T/ee5iL4Rrk3Mb0uHvDGT7qN5zz0UmzH5Niyjduyn
         MoD/OYG7AcPhQyG+NBtbq+ES36oLKcHKyfQ/1dEEJ0FFyji6LfNYz83dyFp3Xen7iMiD
         OFGAL+Hq5nCKSMmyYaHOKEDuSA8y4NhkpSzpwDJ7e4daFYZHJ82W4wdYzZNcoq1ksw4U
         vJoCQTBmTPZwPlwlEFzD5lHUDoNoe0xwJQacvc9gS642+qv0K6w0S/ZmFf7QipnLOntr
         2nLg==
X-Gm-Message-State: AOAM532yjYRnKnxPImTJ5D1mZRDN06FG5hVe38Mw9JJUKymmGZ1oOS7n
	3lsiJ6w9sj89ZdSH4esxcjMk8A==
X-Google-Smtp-Source: ABdhPJz0Wz7uiw5Q84ZpgLomJ2sUNDZBw1NN/qBgJSmrLfPlt8IAi/IZc7UEAL8HYcl01ZzZ3TTw8Q==
X-Received: by 2002:a17:902:e851:b0:15e:93ac:41db with SMTP id t17-20020a170902e85100b0015e93ac41dbmr17049558plg.26.1651629467986;
        Tue, 03 May 2022 18:57:47 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Felipe Balbi <balbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	John Keeping <john@metanate.com>,
	Jens Axboe <axboe@kernel.dk>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	linux-usb@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
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
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
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
	Johan Hedberg <johan.hedberg@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
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
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tom Rix <trix@redhat.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 30/32] usb: gadget: f_fs: Use mem_to_flex_dup() with struct ffs_buffer
Date: Tue,  3 May 2022 18:44:39 -0700
Message-Id: <20220504014440.3697851-31-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095; h=from:subject; bh=LoG608ySlb2xL5QEVpZpmYP+iWI9TrvgD0EbU83Sc1E=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqHiYfLCw3gedIJSUEv2AjZro9JsQDzVs6+PWv3 Jf25uuWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahwAKCRCJcvTf3G3AJtOuD/ 44mR9b5DwvccUUG6HIlhBLAsn/BfAVzBmuRK+yPZ9MioNDOL4TpD4dZaBBpGG0hJon5radolumfj0P VNZW46qoLbHEBiSScw3XJnUUVFGSv9GbDDKBVRxmIWevrrYcSx9Ey7v8r/vqablkY0Kzx4Q+fL+nnh 4X55duw+qKqgzFtzT5kMl5IKcf/sFUgv1r2jts0fmdh4Bu2jfLlkfdmjQhJ4Af2db1+OF6UjtoOy5R 6BRYL6DkOEkVM3vSV8rlDM6yldlZogrtVEpiQUvbkDi2LerWROmCrkpPzwbukN6gYwmAh2v78g4BDT Asjg/ynqVVAPardAHgI8QUQbZeI1y2iXC5u4FfFaeEUSCVddHgdjugXVWOiP7s+phDof4Ke2yI+sBV QfV5yaD/w1jelv5AZidP9asc2fTSb8ASrFF+lKcuVilfbgIn9krQvLJqB8gjrr8OyJ8falxCUPu3i9 l/P190yQNXc+sUM1kJVb0JaQYSk6mxyyCv3suqH72zxRXkDKeNa7lGgBW+tH8Of1c6RUkdJZYUe0pH L7tc/j/ocIEHXPRHlkHrndofVZCRhIQ2XiFWxCEfSW4N1fXtuDO+O77rmlbdYwwwgsTLusPjWPXhon 642xzSjREIl8aWgxlvRZ5ty8QQFJP8TbxfkMEUHUpitb1yMsa0xo6z3WBFcA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: John Keeping <john@metanate.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/gadget/function/f_fs.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 4585ee3a444a..bb0ff41dabd2 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -202,9 +202,9 @@ struct ffs_epfile {
 };
 
 struct ffs_buffer {
-	size_t length;
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, length);
 	char *data;
-	char storage[];
+	DECLARE_FLEX_ARRAY_ELEMENTS(char, storage);
 };
 
 /*  ffs_io_data structure ***************************************************/
@@ -905,7 +905,7 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 				      void *data, int data_len,
 				      struct iov_iter *iter)
 {
-	struct ffs_buffer *buf;
+	struct ffs_buffer *buf = NULL;
 
 	ssize_t ret = copy_to_iter(data, data_len, iter);
 	if (data_len == ret)
@@ -919,12 +919,9 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 		data_len, ret);
 
 	data_len -= ret;
-	buf = kmalloc(struct_size(buf, storage, data_len), GFP_KERNEL);
-	if (!buf)
+	if (mem_to_flex_dup(&buf, data + ret, data_len, GFP_KERNEL))
 		return -ENOMEM;
-	buf->length = data_len;
 	buf->data = buf->storage;
-	memcpy(buf->storage, data + ret, flex_array_size(buf, storage, data_len));
 
 	/*
 	 * At this point read_buffer is NULL or READ_BUFFER_DROP (if
-- 
2.32.0


