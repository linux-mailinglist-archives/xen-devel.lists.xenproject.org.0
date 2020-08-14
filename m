Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B6244DAD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dU3-0005Ts-LN; Fri, 14 Aug 2020 17:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRS-00024Q-Ir
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:34 +0000
X-Inumbo-ID: c3ed870a-8ef5-4ee6-99e9-a71070530036
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3ed870a-8ef5-4ee6-99e9-a71070530036;
 Fri, 14 Aug 2020 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hLH4IlqR4STUHHN+FXp+4qPB6iWG6dzD5c0xFXzYa+s=;
 b=EgNsuOHeaTlLA3e3m4gjYnk0xcDfD2BB+K6PQ4lpDcVaGeSDZGNqKRz9
 0YSOn+sW+kFqnYiXfSz5TfqykYV/+WpQIfFXewMGZtvXDqkmxuPF7/voK
 mn0CQobm+GcPX/JpgZuvDgSrXI4CUh21zCqhZUhj8RlKSnWwWhQ5wJYVo w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rN03X/xWpyNFlP8uKUjQzg7ydkvMigvB9XdODXnIvKmKwA+hYOqXlh3X80p/3EImZMqIx1rHD/
 e7+eRc6ok8PCrC84/cgnuGAJWdTZexmGezUF70pcd2lmKfZZtTK3KeKlwve85oylAA2tO9/TPd
 ykc181jArbFGsi0H/LVHyBzq42BEvZt3YrynPe8RyxeyO0uusxGjE07Mw3WSbwlSmSPtE/QZar
 Vbzwd4n4D8Wugy/WrK4QFxZbBHJwDM+jN/rp7q3j7qYNpjUUQxpk/EZuLZKoD38m+YYPTd7heV
 QhM=
X-SBRS: 2.7
X-MesageID: 24576916
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576916"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 18/60] history reporting (nfc): Remove now-obsolete
 stats variables
Date: Fri, 14 Aug 2020 18:21:23 +0100
Message-ID: <20200814172205.9624-19-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 9c70b560..1b4566aa 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -94,17 +94,12 @@ sub cache_row_key ($) {
     return join $; , map { $jr->{$_} } @cache_row_key_cols;
 }
 
-our $jqcachemisses = 0;
-our $jqtotal = 0;
-
 sub cacheable_fn ($$$) {
     my ($jr, $cachekey, $fn) = @_;
-    $jqtotal++;
     $cachekey = '%'.$cachekey;
     my $cached = $jr->{$cachekey};
     $q_count{$cachekey}++;
     if (!$cached) {
-	$jqcachemisses++;
 	$q_misses{$cachekey}++;
 	$cached = $fn->();
 	$jr->{$cachekey} = $cached;
-- 
2.11.0


