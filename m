Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92A6838AE
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487850.755615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC8-0001br-JQ; Tue, 31 Jan 2023 21:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487850.755615; Tue, 31 Jan 2023 21:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC8-0001VA-Dz; Tue, 31 Jan 2023 21:29:36 +0000
Received: by outflank-mailman (input) for mailman id 487850;
 Tue, 31 Jan 2023 21:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC5-0000Nb-Kl
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 599ac36b-a1ae-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 22:29:32 +0100 (CET)
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
X-Inumbo-ID: 599ac36b-a1ae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YZc3Qe4tQu/04xfxAwG/P7vQhM7bvhY61z2fO5lZ86M=;
  b=FotiXju3+4liJe4vHjhgOMTCs9TVfB+zVgxBhtX9ltBoKjhWldW57DsF
   jgDX8ZTyCF3y2Py+klAHfyo7CvrW1UwBAUlmPKhiKZ/dBWo/swI09+eW7
   gXS/5P7YIe+u3+XgvypS2cJw+GZJt1RIcTD3loiooBiPJ42kKPMbIxbeE
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95499183
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rHDd5a7tMly7k5beTkGK4QxRtDnHchMFZxGqfqrLsTDasY5as4F+v
 mEcD23TOqzfMWenftsnPozjpEkP6MLXztRrQQNs+CEzHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakQ5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 OQ9cAJKTA66nuu7zJbgFsBetNUaBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zxvE9
 zOfrz+R7hcyF/yP8zuL8niWr/b+kwL/ZL80T52V36s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9ZZDeAS8gyGzavQpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPxomybdByjFGLYVuF0++m6hGsADEcIGMmPnMtfzkU2vC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWG2TaD/LF7rVxBHkJPmqgOiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+Som8B6iMNocUOMcZmOq7EMZGPB744owQuBJ0zfFX1
 WmzLq5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI503P7FZqX1bMEe1tGALXPogEAFas/F29H
 yB3a5HblH2ykYTWPkHqzGLkBQtTcSZgWs2q8Zw/myzqClMOJVzNwsT5mdsJE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:hVYwJq3ICPaAWKoFIX7QPwqjBatxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4expOMG7IU80hqQFmrX5XI3SFTUO11HYSL2KgbGN/9SkIVyGygc/79
 YpT0EdMqyWMbESt6+TjGaF+pQbsb+6GcuT9ITjJgJWPGRXgtZbnmVE42igc3FedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0oTvXOvNrCkbPheFojCwQ84AeDoDu04PqieiLolCs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv+/olbg9zoz/pEHYiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/GwA/7ygsj7Hfk1BuxnWbjidaRfkN3N+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnzUQ1wnEbcmwtsrQdTtQ0QbWItUs4QkWUtxjIXLH7GJlO51GkTKp
 guMCgb3ocSTbrVVQGcgoAl+q3XYp16JGb6fqFFgL3Z79EepgEE82IIgMMYhXsO75Q7Vt1N4P
 nFKL1hkPVUQtYRdr8VPpZ0fSKbMB2+ffv3ChPmHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTZTm5uw8zjndBGGmGTj9wMBX4JZ0/rX6WbrwKCWGDFQjidGprfkTCtDSH/
 yzJJVVCfn+KnaGI/c/4yTuH51JbXUOWswcvdg2H1qIv8LQM4Xv8vfWdf7CTYCdYgrMmlmPck
 frcAKDVfmotHrbJUMQqCKhJU/QRg==
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95499183"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH 5/7] tools/ocaml/xc: Fix binding for xc_domain_assign_device()
Date: Tue, 31 Jan 2023 21:29:11 +0000
Message-ID: <20230131212913.6199-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230131212913.6199-1-andrew.cooper3@citrix.com>
References: <20230131212913.6199-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

The patch adding this binding was plain broken, and unreviewed.  It modified
the C stub to add a 4th parameter without an equivalent adjustment in the
Ocaml side of the bindings.

In 64bit builds, this causes us to dereference whatever dead value is in %rcx
when trying to interpret the rflags parameter.

This has gone unnoticed because Xapi doesn't use this binding (it has its
own), but unbreak the binding by passing RDM_RELAXED unconditionally for
now (matching the libxl default behaviour).

Fixes: 9b34056cb4 ("tools: extend xc_assign_device() to support rdm reservation policy")
Signed-off-by: Edwin Török <edwin.torok@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index fd1f306f0202..291663bb278a 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1245,17 +1245,12 @@ CAMLprim value stub_xc_domain_test_assign_device(value xch, value domid, value d
 	CAMLreturn(Val_bool(ret == 0));
 }
 
-static int domain_assign_device_rdm_flag_table[] = {
-    XEN_DOMCTL_DEV_RDM_RELAXED,
-};
-
-CAMLprim value stub_xc_domain_assign_device(value xch, value domid, value desc,
-                                            value rflag)
+CAMLprim value stub_xc_domain_assign_device(value xch, value domid, value desc)
 {
-	CAMLparam4(xch, domid, desc, rflag);
+	CAMLparam3(xch, domid, desc);
 	int ret;
 	int domain, bus, dev, func;
-	uint32_t sbdf, flag;
+	uint32_t sbdf;
 
 	domain = Int_val(Field(desc, 0));
 	bus = Int_val(Field(desc, 1));
@@ -1263,10 +1258,8 @@ CAMLprim value stub_xc_domain_assign_device(value xch, value domid, value desc,
 	func = Int_val(Field(desc, 3));
 	sbdf = encode_sbdf(domain, bus, dev, func);
 
-	ret = Int_val(Field(rflag, 0));
-	flag = domain_assign_device_rdm_flag_table[ret];
-
-	ret = xc_assign_device(_H(xch), _D(domid), sbdf, flag);
+	ret = xc_assign_device(_H(xch), _D(domid), sbdf,
+			       XEN_DOMCTL_DEV_RDM_RELAXED);
 
 	if (ret < 0)
 		failwith_xc(_H(xch));
-- 
2.11.0


