Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A1C45DB5A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231219.400036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzb-00025A-Nh; Thu, 25 Nov 2021 13:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231219.400036; Thu, 25 Nov 2021 13:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzb-0001xZ-AR; Thu, 25 Nov 2021 13:40:51 +0000
Received: by outflank-mailman (input) for mailman id 231219;
 Thu, 25 Nov 2021 13:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzZ-00076i-4Z
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b2ead47-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:40:48 +0100 (CET)
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
X-Inumbo-ID: 4b2ead47-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OgGxNUfTQ2JG3WE+K8Owl04Bu0uYkAMbFk7jPFHWrPo=;
  b=Uw0rQ7b3ilHxr7stkyJ8O8caq9dzwBHBgW7UXFAY2kml+2h6cUAuQSuU
   HKC01iDMZpe63j9rNsAbiPk+APSkkJDfbqlCoZ2YBbWCexJ3XcuDCId+c
   CrbHjrddoof8o3K2zV3gmxxs/sGX4rSxcwpYAgiTLfBXlxirJZJUEoJRe
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KSNc1dI5ExpTV/1MPsgOULNRZw225xUwZIjvU9nt3iDvGnfdJ6cb15yX7fjJerBQ4V2SJ/dLz+
 tLTz91lKUZxscFUCtLFZ4FbOMiUx+CmyjQt63Uf7XhlRehB65bv0pQC9Qh09mj5yQUlMMbNDCf
 XLQXPuhkZhaiXgbPPJwoG3DR0wAwNFW+3sxkTmiI6IfSP8CneXIwAziM4WxuZxws0A0CHOB0pU
 N7iP86ryqudAOXpB2ngjTVj7vOKmWQidnuhsv6IpggKhnjhaIhntSlgB7eJvCnQdRVaMWJYZJI
 a9sEdyHgwV+y8/gnU03ywTbJ
X-SBRS: 5.1
X-MesageID: 58135422
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+iV6D6/LNnT5ZshksNxiDrUDfXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 2YYW2/TPa2LNmWgKoojbY+1oRgHvJXcndFmQQpq/3o8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPha8
 /Fup5PvZDt3O4DcqOI2Ykl7IXxhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0eRK2DO
 5BDAdZpRAzpSBNza3w2Mc4jxqSouGahcxtfs2vA8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3uFuqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvwEec8pdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsZjAhwMvs/6wP0BfiXuZlO5/lre+oBmSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgDZ5
 CBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWeBgB3iUsI2aBj
 KrvVeR5vsI7AZdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDLgD+ywRh8wPtha
 P93lPpA6l5AV8xaIMeeHb9BgdfHOAhirY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1afBATWMGtw+QKJ7HrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcEkgei3iOedl3RAp2hAZu2NatCQbsAFXREFT6VN7ILO+5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:pxLSV6zF6xMS5LEfwSIrKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135422"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 10/47] build: rework cloc recipe
Date: Thu, 25 Nov 2021 13:39:29 +0000
Message-ID: <20211125134006.1076646-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to make other modifications to the cloc recipe, so this
patch prepare make those modification easier.

We replace the Makefile meta programming by just a shell script which
should be easier to read and is actually faster to execute.

Instead of looking for files in "$(BASEDIR)", we use "." which is give
the same result overall. We also avoid the need for a temporary file
as cloc can read the list of files from stdin.

No change intended to the output of `cloc`.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - rework cloc patch, move it ahead of problematic changes
      this is only a convertion to shell script with a single other change.

 xen/Makefile | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 7bb3595d649f..6afae6ced37c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -477,14 +477,12 @@ _MAP:
 
 .PHONY: cloc
 cloc:
-	$(eval tmpfile := $(shell mktemp))
-	$(foreach f, $(shell find $(BASEDIR) -name *.o.d), \
-		$(eval path := $(dir $(f))) \
-		$(eval names := $(shell grep -o "[a-zA-Z0-9_/-]*\.[cS]" $(f))) \
-		$(foreach sf, $(names), \
-			$(shell if test -f $(path)/$(sf) ; then echo $(path)/$(sf) >> $(tmpfile); fi;)))
-	cloc --list-file=$(tmpfile)
-	rm $(tmpfile)
+	find . -name '*.o.d' | while read f; do \
+	    for sf in $$(grep -o "[a-zA-Z0-9_/-]*\.[cS]" $$f); do \
+		sf="$$(dirname $$f)/$$sf"; \
+		test -f "$$sf" && echo "$$sf"; \
+	    done; \
+	done | cloc --list-file=-
 
 endif #config-build
 
-- 
Anthony PERARD


