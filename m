Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4064A5196CD
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320037.540713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7NE-0008Um-I5; Wed, 04 May 2022 05:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320037.540713; Wed, 04 May 2022 05:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7ND-00082k-OU; Wed, 04 May 2022 05:16:27 +0000
Received: by outflank-mailman (input) for mailman id 320037;
 Wed, 04 May 2022 01:47:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm47G-0007U1-7x
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:46 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3139a411-cb4c-11ec-a406-831a346695d4;
 Wed, 04 May 2022 03:47:45 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id d22so151481plr.9
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 136-20020a63078e000000b003c511f54e55sm516441pgh.28.2022.05.03.18.47.39
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
X-Inumbo-ID: 3139a411-cb4c-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dMAADGqtkadGyWtiMmUAPEm8bORo1cOmSuHFnzFIe9g=;
        b=HdhwV0WkvXZw3hjS8p1tFCKs9cZKJFJ7k5obLNyUKACusCcW1RzcVwG/3AkN25wPjr
         MN1c4fbIR9x0erwQN9MET5VRJYx8dh+R8g2fLDUMIFlB05v/yh9SmtiE3TYb5zg7tp+O
         AetyTzERcbfGEy31+di4TAAiEqxWduNa5FUWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dMAADGqtkadGyWtiMmUAPEm8bORo1cOmSuHFnzFIe9g=;
        b=qAYs1T2DIoUvska3+EhXXNPXaFbXKkiA4o8VBkVr3hR5tYr2w+eeCxwTQcoPZbOrec
         KObhCAOoDPuDNnr4a5122NV6s0LMgVYxfx9xhJLbla11vM6xxDxoFQq2EUmlcDz9Wyk5
         mOX6KhJWbahuQLLhgS1rtQMkQYTB263BQLU5mHiprnCdBBZHhEEJAtxzwe5O+DG6fuRf
         +gNeZq9r6WJC4mDr20wCE995MD9fxRumRZbiywWRfR9AoKdESPSGvG+uu8RgglG0ib4l
         0DYFBDM5QNZRz86tzQnbAzDEhwQzVhhE93M8d++KRyVXpHl1lLCWYTzAmn29L8St2Fbf
         JF+g==
X-Gm-Message-State: AOAM531hIdFlF4g1HoFBlHWen2H9yWn3DZPLuKPGnI+kO87v1WpR1SPN
	bFUH2+EIqBjY7aij+Tawe1XZpw==
X-Google-Smtp-Source: ABdhPJydJlkF2g/C05t9xL+CcCRfyDPyeeapmmNS1jyl5QDmxOwU4sKgjA6yob870vT6k0dKeYtEdg==
X-Received: by 2002:a17:90b:1c88:b0:1b8:a77e:c9cb with SMTP id oo8-20020a17090b1c8800b001b8a77ec9cbmr7789362pjb.205.1651628863999;
        Tue, 03 May 2022 18:47:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	Alexei Starovoitov <ast@kernel.org>,
	Cong Wang <cong.wang@bytedance.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	netdev@vger.kernel.org,
	alsa-devel@alsa-project.org,
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
	Kalle Valo <kvalo@kernel.org>,
	Keith Packard <keithp@keithp.com>,
	keyrings@vger.kernel.org,
	kunit-dev@googlegroups.com,
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
Subject: [PATCH 14/32] af_unix: Use mem_to_flex_dup() with struct unix_address
Date: Tue,  3 May 2022 18:44:23 -0700
Message-Id: <20220504014440.3697851-15-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2272; h=from:subject; bh=8b5W7mEG2Sah1C3FkS/UxctivFJh7iOzV6P8ujUbZM8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqDcR3znMx51jViMoq05/q58V2/1rXjoJjYBmJ4 CKXc5kiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHagwAKCRCJcvTf3G3AJp8ZEA CTZiOebtApgRIMQFGfvlsj7s1U7ENKry+y1qCoH7clKk+kIHUFtKQuToAucuA7HnBVAIDqbBHa+dtu b1A4bqv4cHK21pPyhZmiE0VCyP00EYC8X6VbBCMRrhOvgKIRCQKYCDRRU3x3+zdTamMi+Cw4QRLFbr KeEVo3vWRxKFNYlUY6py6WsFnpaTCP45A1Rt2Mk1ONM+4tvkRlgJQKibXiiVxMmNJiq7diRyS43UyZ xdZzOY9N/SsdVs+DBAetVCVJfwnmWSxup+qwrjzAenumL1egb53niPav19Uu0KPGAkzqPtS4NDain6 T5G8UOgj2W4S/ZIxVzp3AEI0v7Q07cg9AUILFEUOEn2Ga7m2xtn/dn5Hqt0Gq5ryDybbgCBb0FW6nE apZrvb6JoF5ZEkWIMx0CD3b/SEJCPUMr1n+n/nlozI3/5uYk+uJuq11ezAU6BWwGeaiQi5MNENuLtJ f2iVuD520n1Ne+0aDX0g+6Bxq6CjD/3mk3NtQkdQZ1W7jF6hmMJWqPx/GWYvlmDlmSQNEQ659WICV6 styiy2WjRaD2LhpwT9sZHwcdpjjTGhsJ3rXcC+FrO5v7LrNOaE49f+5vGV2+PdIn7TzyijsyYCwjfC sD4MdxKc4Kc8wvaGgok8h676GkR5iOBRUeFIUjcwGTrf9mDGBR6ew5hwb4cQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@amazon.co.jp>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Cong Wang <cong.wang@bytedance.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/net/af_unix.h | 14 ++++++++++++--
 net/unix/af_unix.c    |  7 ++-----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/net/af_unix.h b/include/net/af_unix.h
index a7ef624ed726..422535b71295 100644
--- a/include/net/af_unix.h
+++ b/include/net/af_unix.h
@@ -25,8 +25,18 @@ extern struct hlist_head unix_socket_table[2 * UNIX_HASH_SIZE];
 
 struct unix_address {
 	refcount_t	refcnt;
-	int		len;
-	struct sockaddr_un name[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(int, len);
+	union {
+		DECLARE_FLEX_ARRAY(struct sockaddr_un, name);
+		/*
+		 * While a struct is used to access the flexible
+		 * array, it may only be partially populated, and
+		 * "len" above is actually tracking bytes, not a
+		 * count of struct sockaddr_un elements, so also
+		 * include a byte-size flexible array.
+		 */
+		DECLARE_FLEX_ARRAY_ELEMENTS(u8, bytes);
+	};
 };
 
 struct unix_skb_parms {
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index e1dd9e9c8452..8410cbc82ded 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -244,15 +244,12 @@ EXPORT_SYMBOL_GPL(unix_peer_get);
 static struct unix_address *unix_create_addr(struct sockaddr_un *sunaddr,
 					     int addr_len)
 {
-	struct unix_address *addr;
+	struct unix_address *addr = NULL;
 
-	addr = kmalloc(sizeof(*addr) + addr_len, GFP_KERNEL);
-	if (!addr)
+	if (mem_to_flex_dup(&addr, sunaddr, addr_len, GFP_KERNEL))
 		return NULL;
 
 	refcount_set(&addr->refcnt, 1);
-	addr->len = addr_len;
-	memcpy(addr->name, sunaddr, addr_len);
 
 	return addr;
 }
-- 
2.32.0


