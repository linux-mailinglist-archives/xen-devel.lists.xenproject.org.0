Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78304372C10
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 16:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122495.231045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldw5K-0002L6-BP; Tue, 04 May 2021 14:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122495.231045; Tue, 04 May 2021 14:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldw5K-0002Kh-7s; Tue, 04 May 2021 14:31:38 +0000
Received: by outflank-mailman (input) for mailman id 122495;
 Tue, 04 May 2021 14:31:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c6am=J7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ldw5I-0002Kc-Io
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 14:31:36 +0000
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:400:200::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b18d0a1f-964e-4a84-9ed0-25c3bdd4e64a;
 Tue, 04 May 2021 14:31:35 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id J02652x44EVU18F
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 16:31:30 +0200 (CEST)
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
X-Inumbo-ID: b18d0a1f-964e-4a84-9ed0-25c3bdd4e64a
ARC-Seal: i=1; a=rsa-sha256; t=1620138691; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kSmVLoVjuW7ipSwAwohtZoqtJDhnwRhD1u14OrAk3cGarmM5BqjhAtlZdpKIt0jZio
    OzFSx0LIrnUxindCy9E1klF9ACPDwme5zOavzjOzHWpc3NWLadVXuzWc84zSSm/16HFW
    mt8lstMAafQpu8PvfI+UA9egk6i3Z96zYw8If5/QB33FzxvqmAW4QvSLKkZ2ej7fMg+6
    iGJKfRt4MfQE1Z+X6wdAec5TqRitZg4xV83e1Vb+UW0zh6X5z0tNXHkHqlIT0AXT4BSV
    dOeHFHxFMSJiCZZPxaTl8668nTGrLz5AJThL1ihOznnEB3PfKsUc7XEK3F1p1DiepXx1
    TfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620138691;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=PMt+6Y2zd1tLCLAyzAtE9v1z1cHR2MrHavRovAkAb3k=;
    b=T+7riswwGJG6XnBywZ6Q9KbJMFtolNqdJskFgVFWLp0ypM6OYGpTcXlJiTe+VXh8WI
    5wNGsUJEIKEFKLJyW6j5pBrDa+Yf9SxJ4eDgD/ntblkJSB6a1Swr3MO5wct9f5Lle9sl
    IUo0JoIA4NcHz95Tj66dV5j3mB6ZvhR8OUG4YjmyHI4Y6mS73CmKjq5R4XvVjM4xckcH
    8W0sWF294F4DYedIHqZY3UbZMTLRvoViA/cYtPlp6HUEW10yK2CcKkY0YkXLWqlz24xW
    hDKPfSlusPf54stm6P05crB+OF/pEJLS8aXTNKi/j/5LX145y8RgI19QoRB8RWlbp4/B
    dT9g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620138691;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=PMt+6Y2zd1tLCLAyzAtE9v1z1cHR2MrHavRovAkAb3k=;
    b=e39bkJMH6P+puU/IcojW2Y2rzZSA0HAHZxbu/Qlm7iWzs2F3PZKKfzrPmI/OpFLnTG
    Ps8TSRnswKaGw+JJou7I75MONufqWo9aCrq135OXU49WYUxUMUUQsBIdmUi8yeDmieey
    YSlfiB8y7DSAvPD5QD1GLJUEOqPC+Q76gFWxcmCsx6Pkim+w7yyROjW+mvPq64quIQKW
    nE2iSWsM7J4be65uId4wJ94XBVhY6VuQCkxaQUuW44E6UvDED4D+nyQl5cDrWVPAS1i3
    775inPhxUuB4LQGR3URcUjcIsZwlZVo6MY1h+1WEaLne0dTICYXIdIxsq6yaudQ41YJ8
    As+A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgtl+1b1FMstFZvCqIQN5N7TvWFg4vzhFVdoKAuQ"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools: handle missing xencommons in xen-init-dom0.service
Date: Tue,  4 May 2021 16:31:28 +0200
Message-Id: <20210504143128.16456-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysconfig files are not mandatory.
Adjust xen-init-dom0.service to handle a missing sysconfig file by
prepending a dash to the to-be-sourced filename.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/hotplug/Linux/systemd/xen-init-dom0.service.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/systemd/xen-init-dom0.service.in b/tools/hotplug/Linux/systemd/xen-init-dom0.service.in
index beed3126c6..98779b8507 100644
--- a/tools/hotplug/Linux/systemd/xen-init-dom0.service.in
+++ b/tools/hotplug/Linux/systemd/xen-init-dom0.service.in
@@ -7,7 +7,7 @@ ConditionPathExists=/proc/xen/capabilities
 [Service]
 Type=oneshot
 RemainAfterExit=true
-EnvironmentFile=@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
+EnvironmentFile=-@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
 ExecStartPre=/bin/grep -q control_d /proc/xen/capabilities
 ExecStart=@LIBEXEC_BIN@/xen-init-dom0 $XEN_DOM0_UUID
 

