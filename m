Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65E46A244
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239466.415163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSY-00085E-54; Mon, 06 Dec 2021 17:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239466.415163; Mon, 06 Dec 2021 17:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSX-00081M-Vl; Mon, 06 Dec 2021 17:07:25 +0000
Received: by outflank-mailman (input) for mailman id 239466;
 Mon, 06 Dec 2021 17:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPf-0005ti-O7
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91512ef9-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:26 +0100 (CET)
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
X-Inumbo-ID: 91512ef9-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QUW3oQGRCIsCTBwhj/I18yejXA0w2YENn2RLNn0NPtM=;
  b=JuePm0wKVw0oYpRWf4feSH/z17Y2zzA7sbfGg0JrYjQKk3XVPuYqp6qV
   lgbR+ytUlUnVBz24vtosHouW+1p2qx8y1VnTzzKa8Ck9cNKhWN1vtrRIO
   GaM2q3TsFWdbL8OP6fC5XLNn52ufifnTcTRPBIGIDzqZzpNjTDsRwrByr
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IItMqUgkway0r+Nq/loDXcAFMx6wq8tuD+pZ2gYoiVbGJm7EqQJjdH8CHBcAIbgEgwADRLXjp6
 ozRSMSShm8lK8KIo7Hu4sF7Nn+mHIXX/8rKohQjZZzY6Ko7kY4Y4WS4XhSE8HKRIa/eOGlaWIv
 zbzrfqesfBhQD8sJKNBwjCi2ChkI2sAdwaxw67hK6Qfl2bfigD3KPK0uZEPLOhK5yI/Jh41Z7e
 jmiPgqz32EiTCpnGLbGPtINNtFtTZcGY1tOs4/wMbE3AJiH9HNdlbwuGWrj3ihCiWQ4HePaPoN
 hIHCP/PAbKR72oUs8tNWR2sV
X-SBRS: 5.1
X-MesageID: 58884496
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:E4mUoq9bdH6w7H0DknP1DrUDcXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 GYbUGuPP6zfZ2P9LtB0a96//E9QucTXz4BmTgI5+Ck8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgu7
 fJxvr6sWTwyL43+qtkQUDV/TH1xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0eTaaCO
 5tHAdZpRAT7TgEQK3ocMooRxdqHhCH8LRBjinvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/WvjBQoBHMeC0jfD+XWp7sfOgiHTSI8UDKe/9PNhnBuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQqXiYvhkaSpxIHvcz8g2lxa/d4gLfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1rC05CophGuKRMOPE8wVxIJTicivIXs9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPdb9P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YyRvHNFBz3ohZPmLy8Bhkkfi+F1e5eJlfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMMhK1XWoXs0OxHAt4wIrKTKuftlU
 Xt8WZzzZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KRqmhurf1MO9JcJUKSKn9vMuuVNwsxoqws/1
 i3nBxIDlgOg3SavxMfjQikLVY4DlK1X9RoTVRHA937ys5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:EYaJNa3ZMI7xKRYqPmM61QqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884496"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 46/57] libs/store: use of -iquote instead of -I
Date: Mon, 6 Dec 2021 17:02:29 +0000
Message-ID: <20211206170241.13165-47-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/store/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 6cc9baaabe..65092d8432 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -22,7 +22,7 @@ CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
 vpath xs_lib.c $(XEN_ROOT)/tools/xenstore
-CFLAGS += -I $(XEN_ROOT)/tools/xenstore
+CFLAGS += -iquote $(XEN_ROOT)/tools/xenstore
 
 xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
-- 
Anthony PERARD


