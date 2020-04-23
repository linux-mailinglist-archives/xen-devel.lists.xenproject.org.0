Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962BC1B58F9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYxC-0007kP-I2; Thu, 23 Apr 2020 10:19:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19NY=6H=amazon.de=prvs=375504273=wipawel@srs-us1.protection.inumbo.net>)
 id 1jRYxA-0007kF-R5
 for xen-devel@lists.xen.org; Thu, 23 Apr 2020 10:19:33 +0000
X-Inumbo-ID: eae7a78c-854b-11ea-933e-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eae7a78c-854b-11ea-933e-12813bfff9fa;
 Thu, 23 Apr 2020 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587637170; x=1619173170;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=J09gZiCqrnzq7LaZQLaTXoR+4ZFbAgEOhD3e9rqYQfg=;
 b=ITGfZt4tOVgmfuiVCYtTBiiWZI1exlTOZgx8hDhcXlZqJw+X0FphRx79
 sJTJ+OcyQ3fF+B5bKJpJblb6aYZW8cjaJ/npBoRPXMGjJ/VBiD5Ttpr/i
 vh4Lf+ZYGn8GjLvBUiurIdLozVCYKyAlho0OQYsBN16G98NhJleVchHkY 0=;
IronPort-SDR: PmiDU/I6+ZHxmJHnoAyDPoAqfcHNdRFFeGEfte72Je0suZWryq6O0/lvp/1v6wLsAAYXZ+eKDR
 KVDBNoJ9aFwQ==
X-IronPort-AV: E=Sophos;i="5.73,306,1583193600"; d="scan'208";a="26939009"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 23 Apr 2020 10:19:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 27D0C1A0B38; Thu, 23 Apr 2020 10:19:28 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 23 Apr 2020 10:19:27 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 10:19:25 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Subject: [XTF 0/4] Add strncmp(), strtol() and strtoul() functions
Date: Thu, 23 Apr 2020 10:19:14 +0000
Message-ID: <20200423101918.13566-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Content-Type: text/plain
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, wipawel@xen.org, paul@xen.org, semelpaul@gmail.com,
 andrew.cooper3@citrix.com, wipawel@amazon.de, nmanthey@amazon.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add FreeBSD's implementation of strtol() and strtoul() functions from:
https://github.com/freebsd/freebsd/blob/master/lib/libc/stdlib/strtoul.c

The FreeBSD code being added as a separate file (common/libc/strtol.c)
is under the BSD 3-clause license. Modification to COPYING file might
be needed.

Also add simple implementation of the strncmp() function.

Paul Semel (1):
  string: add freebds libc implementation of strtol()

Pawel Wieczorkiewicz (3):
  libc, strtol: Add isspace(), isdigit(), isxdigit(), isascii()
  libc, strtol: Add FreeBSD libc implementation of strtoul()
  libc: add strncmp() function

 build/files.mk          |   1 +
 common/lib.c            |   8 --
 common/libc/string.c    |  11 +++
 common/libc/strtol.c    | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
 common/libc/vsnprintf.c |   8 --
 include/xtf/libc.h      |  35 +++++++++
 6 files changed, 248 insertions(+), 16 deletions(-)
 create mode 100644 common/libc/strtol.c

-- 
2.16.6




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




