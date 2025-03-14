Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21EA613BC
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 15:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914734.1320402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt683-0008VC-G9; Fri, 14 Mar 2025 14:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914734.1320402; Fri, 14 Mar 2025 14:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt683-0008Tc-CM; Fri, 14 Mar 2025 14:35:15 +0000
Received: by outflank-mailman (input) for mailman id 914734;
 Fri, 14 Mar 2025 14:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iXy+=WB=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1tt681-0008TQ-T2
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 14:35:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 888aebc0-00e1-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 15:35:12 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-ZX-hc9rrOPurN8WmEXRzfw-1; Fri,
 14 Mar 2025 10:35:06 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 60F521800267; Fri, 14 Mar 2025 14:35:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.22.74.4])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D866318001F6; Fri, 14 Mar 2025 14:35:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1FE3521E675F; Fri, 14 Mar 2025 15:35:00 +0100 (CET)
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
X-Inumbo-ID: 888aebc0-00e1-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741962910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5JZ21SMl1GeBJ0cIQwsQQgUDcr1yWmvE50eUD2Kyya8=;
	b=HvLY9/9HrZl8hXxas/OofOiBlLMjsc6HBPQxCF09M1OICJx+FTgjgXZMQhLVnAxfSt5oLX
	GVPtASkdjoK8AzV9nfVmaDsBDqlJcOPiz5aD5QZHBxq4woXfTjH3uXciJEETQCDGINaJ7y
	n5Xzy+oINKpbnI5Wert4ZPpmFpu1Q2U=
X-MC-Unique: ZX-hc9rrOPurN8WmEXRzfw-1
X-Mimecast-MFC-AGG-ID: ZX-hc9rrOPurN8WmEXRzfw_1741962905
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	edgar.iglesias@gmail.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/2] xen: An error handling fix
Date: Fri, 14 Mar 2025 15:34:58 +0100
Message-ID: <20250314143500.2449658-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Question to reviewers: should PATCH 2 downgrade to warning, to info,
or delete the report entirely?

Markus Armbruster (2):
  hw/xen: Fix xen_bus_realize() error handling
  hw/xen: Downgrade a xen_bus_realize() non-error to warning

 hw/xen/xen-bus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.48.1


