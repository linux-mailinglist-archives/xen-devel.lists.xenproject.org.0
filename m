Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8C372B82
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122456.230985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvZn-0006o5-Kn; Tue, 04 May 2021 13:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122456.230985; Tue, 04 May 2021 13:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvZn-0006nd-FH; Tue, 04 May 2021 13:59:03 +0000
Received: by outflank-mailman (input) for mailman id 122456;
 Tue, 04 May 2021 13:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c6am=J7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ldvZm-0006nU-OI
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:59:02 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9b4bee1-97c0-41d4-8398-32571905c029;
 Tue, 04 May 2021 13:59:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id J02652x44Dwu0xu
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 15:58:56 +0200 (CEST)
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
X-Inumbo-ID: a9b4bee1-97c0-41d4-8398-32571905c029
ARC-Seal: i=1; a=rsa-sha256; t=1620136736; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gl8n6LEUf177IKD+nxWuzBd3rcbyssXGgAUhGGr1d5Rd9FFzP2ZDqKr3QIPf79G/P3
    HYXpQ1FAH4/gOuRblkORui+7SxNkoeMsEgkZl9i133B2gcUvLGENNIajUMYZc+Scoy/4
    h5GEbiuZ7OQIswKwBgVLGvaDXkXxwzmmev2abTuuyp+Q1k/daez7diEdoKRr98VvKBt2
    KV3wJcdqAPVpuX0lBRGavOJ+oGf0cZPHXJuB/ncYGWpDBJRJjqEY9PcYUWOgoop5G+SM
    01Q0ZIJlLAyr4brqg+uMjaV69zCOROa8bBW2g6FKGW8ck/35d6NPY7vJjoZyNpRGHGwu
    6VQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136736;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aoG9+qL2ivaPMEoU1EGRyiASZMMlBWNhdK9xa+nEY4A=;
    b=LoVBmF6ooWY1hxCAZuOXiOKteM11Ww3a3sv4c7Spjl7TNBBhBLV97vZH/3fmgAJymv
    v8cBe9WvJNT8zEJTD0q67bILopKV015Q/c3paTpzSb0kBWQMOIhaXEXjxHk4A8MgjY29
    EofCIf773fri8J9ehTNRI9FpUartpQGcGSMj2/3VxomQg7FpoyvDy4tG2/PZYhkZFLAc
    mBqNHwpRaGdVdLGgtz0C58Y7I8KrbEdQ9JJCUoygq23HyxHbYJxE9MdpiafHwEYxWx+U
    vKXD5qAPBvVXe40MaoDHC4d/qZ24aOLdpL8MVJ6PjPNOSs07VDdH7rGDaGe+GU8yopXD
    dBUQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620136736;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=aoG9+qL2ivaPMEoU1EGRyiASZMMlBWNhdK9xa+nEY4A=;
    b=XoouJV1kjuF5ZNcfSJjrAnpwUJju3FgFcx5tMdsiLv9M4pfAkA6IpfvqM5R09zg4Rb
    slxU7/ePlO/XYwtrR0jtCAUe/J4f4nkppI7jQkvKf7k1DzWI985RnM3MsAWtEv2O0tN8
    xRnXFfVDQmUT5bSGv1SJq6OagQfSPQa6eSkQxVrSVF6FTe0vhASrujm6zeKev4EB4c4E
    EzV5po0vCOPDAUy4yuZu8aGotfReijbTdg/a+OdXQz8NIT1HaOhqd19YuIbLJid3gz5a
    FtVZ+zpCvtNh3Fa8O518fkyNOKBNp2bH7Zngbz8FLFPRxf8fEmKZXV/i9xEM8ybpMj12
    3J0Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: handle missing xencommons in xenconsoled.service
Date: Tue,  4 May 2021 15:58:54 +0200
Message-Id: <20210504135854.10355-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysconfig files are not mandatory.
Adjust xenconsoled.service to handle a missing sysconfig file by
prepending a dash to the to-be-sourced filename.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/hotplug/Linux/systemd/xenconsoled.service.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/systemd/xenconsoled.service.in b/tools/hotplug/Linux/systemd/xenconsoled.service.in
index 8e333b114e..1f03de9041 100644
--- a/tools/hotplug/Linux/systemd/xenconsoled.service.in
+++ b/tools/hotplug/Linux/systemd/xenconsoled.service.in
@@ -9,7 +9,7 @@ Type=simple
 Environment=XENCONSOLED_ARGS=
 Environment=XENCONSOLED_TRACE=none
 Environment=XENCONSOLED_LOG_DIR=@XEN_LOG_DIR@/console
-EnvironmentFile=@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
+EnvironmentFile=-@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
 ExecStartPre=/bin/grep -q control_d /proc/xen/capabilities
 ExecStartPre=/bin/mkdir -p ${XENCONSOLED_LOG_DIR}
 ExecStart=@sbindir@/xenconsoled -i --log=${XENCONSOLED_TRACE} --log-dir=${XENCONSOLED_LOG_DIR} $XENCONSOLED_ARGS

