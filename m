Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA0942B88
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 12:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768432.1179215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ6Bn-0003vJ-W7; Wed, 31 Jul 2024 10:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768432.1179215; Wed, 31 Jul 2024 10:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ6Bn-0003sc-T8; Wed, 31 Jul 2024 10:04:11 +0000
Received: by outflank-mailman (input) for mailman id 768432;
 Wed, 31 Jul 2024 10:04:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1P6D=O7=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sZ6Bn-0003sW-4p
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 10:04:11 +0000
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 399dd98a-4f24-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 12:04:09 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46VA47X5108472
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:04:07 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46VA47Kh129332
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:04:07 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 31
 Jul 2024 05:04:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 31 Jul 2024 05:04:07 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.68.118])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46VA46mK024241
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:04:06 -0500
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
X-Inumbo-ID: 399dd98a-4f24-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722420247;
	bh=AKGEMl/NUIeH61GG+rVpI1xAlBultmbj4AGBqYgGqkc=;
	h=From:To:Subject:Date;
	b=biDHhhmqCBa9ccAaVOrsHm4eKV3A21LIzbjxXoSjB2kLm+RIfzxR/59OMT7QHw46+
	 VQgWWvOcoWIbxRzgyEc9+HubqZP/MQgmZian3/SetmWCLGyjUu07oLax/5Hy5kqmhL
	 8lboCSZRPrw07rQS0Iml3xsVS4q20PM0pEOppM+I=
From: Amneesh Singh <a-singh21@ti.com>
To: <xen-devel@lists.xenproject.org>
Subject: init-dom0less: Weird use of cpupool in xl dominfo
Date: Wed, 31 Jul 2024 15:33:59 +0530
Message-ID: <20240731100359.529751-1-a-singh21@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hello, I was going through the source code for init-dom0less as I was
facing some issue after applying this patchset. Feel free to ignore it
however, as it seems unrelated to the issue I am encountering.

https://lists.xenproject.org/archives/html/xen-devel/2024-05/msg01825.html

One peculiar thing I noticed was that the "cpupool" field is being used
as a bitfield to check individual vCPUs. However afaik, "cpupool" is
supposed to be the cpupool *ID*. That matches the fact that the cpupool
value for all my VMs is 0, as I only have a single cpupool (id = 0). Am
I overlooking something, or am I correct? Here is the relevant code:

https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/helpers/init-dom0less.c;h=fee93459c4b9da59446a2f8dfcf5cbfc4d95aeab;hb=HEAD#l176

Regards
Amneesh

