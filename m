Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED206673D66
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 16:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481198.745937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWkw-0000F2-LU; Thu, 19 Jan 2023 15:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481198.745937; Thu, 19 Jan 2023 15:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWkw-0000CA-IV; Thu, 19 Jan 2023 15:23:10 +0000
Received: by outflank-mailman (input) for mailman id 481198;
 Thu, 19 Jan 2023 15:23:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBPQ=5Q=citrix.com=prvs=3763d7854=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIWkv-0000C1-9W
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 15:23:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28e0564d-980d-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 16:23:02 +0100 (CET)
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
X-Inumbo-ID: 28e0564d-980d-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674141786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GSkTDl1mMIYyDF4Fu8QPO73Ju/CNKuXMuVUvJ5T5Aoo=;
  b=cem6om21JFj1vD9uLPxSjwhY7Z9V2uRhAC1GJpy+X47zotaduYe9KaBJ
   tJjiTbgiKOKHMQEbqpzFEdcsq8TDPyE1nK/WXxriGSN/jwCiZlmCxYAmD
   1q3Wnsb66NFqWwm27EEnHsQJErVHy0AiJdjx1pU0XRN07H3DIt8yv7Aa3
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92268585
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:gt1jHq6tRSA5agqOGQ/BlAxRtBbHchMFZxGqfqrLsTDasY5as4F+v
 mAdX2uPO6qMZ2P1c911Poi19EkOuJTWndY3TANs/39nHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakS7QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mr
 8MRFCtSQBa4mOeInKyLTM893JQsM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zxzC+
 DKbrzmR7hcyJY28yCiuzHeVoKzQlnOnBK4RKLmZ6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8FLD+Qw5QWJy6zVywWUHG4JSnhGctNOnM0rQT0n0
 HeZktWvAiZg2JWXQ3+A8rafrRupJDMYa2QFYEcsUg8t89Tl5oYpgXryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV//+E9Gzc3ByqnYfMcFIr1gPxDzj14RwsMeZJeLeUBUjnAedoddjGFQjb5
 iBby6By/8hVU8jTyXXlrPElWejwuq3baGC0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5ycCl/KI+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5nwVShEV/82nWrmLwv47VPN7npmrY80bcmrpylLLJLEPCLFIVv7GAXmgh8FAFOs/1yOr
 oc32zqiwBRDSuzuChQ7AqZKRW3m2UMTXMisw+QOL77rH+aTMD15YxMn6e97KtMNcmU8vrugw
 0xRrWcFmQSh2yafc1jih7IKQOqHYKuTZEkTZUQEVWtEEVB6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:EGQu4q9a+KFuxk89SHZuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.97,229,1669093200"; 
   d="scan'208";a="92268585"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH v4 0/3] xen: rework compat headers generation
Date: Thu, 19 Jan 2023 15:22:53 +0000
Message-ID: <20230119152256.15832-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-include-rework-v4

v4:
- new patch removing get_typedefs() from the existing script
  (and thus also removing it from the new script)
- Adding some optimisation, mainly pre-compile regex
  It's slightly faster.

v3:
- Rewrite script into python instead of perl.
  (last patch of the series)

v2:
- new patch [1/4] to fix issue with command line that can be way too long
- other small changes, and reorder patches

Hi,

This patch series is about 2 improvement. First one is to use $(if_changed, )
in "include/Makefile" to make the generation of the compat headers less verbose
and to have the command line part of the decision to rebuild the headers.
Second one is to replace one slow script by a much faster one, and save time
when generating the headers.

Thanks.

Anthony PERARD (3):
  build: include/compat, remove typedefs handling
  build: replace get-fields.sh by a python script
  build: compat-xlat-header.py: optimisation to search for just '{'
    instead of [{}]

 xen/include/Makefile            |   6 +-
 xen/tools/compat-xlat-header.py | 432 ++++++++++++++++++++++++++
 xen/tools/get-fields.sh         | 528 --------------------------------
 3 files changed, 434 insertions(+), 532 deletions(-)
 create mode 100644 xen/tools/compat-xlat-header.py
 delete mode 100644 xen/tools/get-fields.sh

-- 
Anthony PERARD


