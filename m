Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94EE1993E3
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:50:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEQT-0002tr-WA; Tue, 31 Mar 2020 10:47:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEQS-0002tI-9L
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:47:20 +0000
X-Inumbo-ID: fd9b1d8a-733c-11ea-b4f4-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd9b1d8a-733c-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585651638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WEganlCLf9iH3li5o79RD1d6TA/dpojCk7fL8gRP9n0=;
 b=fTlyCkFS4Ywt1BqVlkF9CeHrRiWvgH1lcDSanwrZ4XiqU1YC1wJIZP6n
 xVO3YgOrnu8jsojLt4ES3LgEqri0G54cM8XPGjvzCn5CpmO1VV7tVEMGK
 gPqCTm4YQxTtvCbc/doQsxS3Ywi6YBsfH5IW7VV8VdY83AIi4tV6jQKg3 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0KDMJMtNxrN6s0LlHcU/7e1xwJ6DcJdKAx+045ZEeYVQVmJkmVRdd2fe2uf3B6DLSSpNzY+AKq
 cEFIBneGnWhS+NNkGmpc8MRMKw+X6yMqTIGR0jVJ2NGHm6gEqE2tWfK3/Cc31a7ros55XicrIJ
 PapZAZQ/U4ZQm7L/nM4xT4GMrLyWuhlnifT9ZxZVT3FswYguJri3B+TBYgL/8c7bX1Lg4TFZY0
 g9i1wa292pSezYjvx3L9KLRM1d5hbvz/jwdAhy70AkGYZ4q2rp4XSNIUK7Xpp0ekgYLU+Z/OQ/
 9ws=
X-SBRS: 2.7
X-MesageID: 14904501
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14904501"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 14/18] xen,symbols: rework file symbols selection
Date: Tue, 31 Mar 2020 11:30:58 +0100
Message-ID: <20200331103102.1105674-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We want to use the same rune to build mm/*/guest_*.o as the one use to
build every other *.o object. The consequence it that file symbols that
the program ./symbols prefer changes with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y.

(1) Currently we have those two file symbols:
    guest_walk.c
    guest_walk_2.o
(2) with CONFIG_ENFORCE_UNIQUE_SYMBOLS used on guest_walk.c, we will have:
    arch/x86/mm/guest_walk.c
    guest_walk_2.o

The order in which those symbols are present may be different.

Currently, in case (1) ./symbols chooses the *.o symbol (object file
name). But in case (2), may choose the *.c symbol (source file name with
path component) if it is first

We want to have ./symbols choose the object file name symbol in both
cases. So this patch changes that ./symbols prefer the "object file
name" symbol over the "source file name with path component" symbols.

The new intended order of preference is:
    - first object file name symbol
    - first source file name with path components symbol
    - last source file name without any path component symbol

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - rescope enum symbol_type
    - remove setting values to enums, as it's not needed.
    - rename the enumeration symbols
    
    commmit rewriting:
    
    We want to use the same rune to build mm/*/guest_*.o as the one use to
    build every other *.o object. The consequence it that file symbols that
    the program ./symbols prefere changes with CONFIG_ENFORCE_UNIQUE_SYMBOLS=y.
    
    (1) Currently we have those two file symboles:
        guest_walk.c
        guest_walk_2.o
    (2) with CONFIG_ENFORCE_UNIQUE_SYMBOLS used on guest_walk.c, we will have:
        arch/x86/mm/guest_walk.c
        guest_walk_2.o
    
    The order in which those symbols are present may be different.
    
    Currently, in case (1) ./symbols chooses the *.o symbol (object file
    name). But in case (2), may choose the *.c symbol (source file name with
    path component) if it is first.
    
    This patch changes that ./symbols prefere the "object file name" symbol over
    the "source file name with path component" symbols.

 xen/tools/symbols.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/tools/symbols.c b/xen/tools/symbols.c
index 9f9e2c990061..b3a9465b32d3 100644
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -84,7 +84,12 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 {
 	char str[500], type[20] = "";
 	char *sym, stype;
-	static enum { symbol, single_source, multi_source } last;
+	static enum symbol_type {
+		symbol,
+		file_source,
+		path_source,
+		obj_file,
+	} last;
 	static char *filename;
 	int rc = -1;
 
@@ -125,13 +130,20 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 		 * prefer the first one if that names an object file or has a
 		 * directory component (to cover multiply compiled files).
 		 */
-		bool multi = strchr(str, '/') || (sym && sym[1] == 'o');
+		enum symbol_type current;
 
-		if (multi || last != multi_source) {
+		if (sym && sym[1] == 'o')
+		    current = obj_file;
+		else if (strchr(str, '/'))
+		    current = path_source;
+		else
+		    current = file_source;
+
+		if (current > last || last == file_source) {
 			free(filename);
 			filename = *str ? strdup(str) : NULL;
+			last = current;
 		}
-		last = multi ? multi_source : single_source;
 		goto skip_tail;
 	}
 
-- 
Anthony PERARD


