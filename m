Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80021948D29
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 12:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772806.1183247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHl1-0004zh-48; Tue, 06 Aug 2024 10:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772806.1183247; Tue, 06 Aug 2024 10:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbHl1-0004ww-0m; Tue, 06 Aug 2024 10:49:35 +0000
Received: by outflank-mailman (input) for mailman id 772806;
 Tue, 06 Aug 2024 10:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ctxO=PF=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sbHl0-0004wq-D3
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 10:49:34 +0000
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f173aa3-53e1-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 12:49:32 +0200 (CEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476AnU1X087446;
 Tue, 6 Aug 2024 05:49:30 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476AnUCx008656
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Aug 2024 05:49:30 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 05:49:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 05:49:29 -0500
Received: from localhost (nightbug.dhcp.ti.com [172.24.227.225])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476AnTP1090964;
 Tue, 6 Aug 2024 05:49:29 -0500
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
X-Inumbo-ID: 8f173aa3-53e1-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722941370;
	bh=V5BXEJxHyDGMyRqXr9lunBGw1q8uMv10uHLqYG6H71o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OD27xh2jQ95+bxK1g3bssmfF/rqjUYgBzSBGuQO+FNlhWcB6apqxGLUwNiQpqaQtE
	 2mYxi8sgZ93aoZvv8E/9IIQoGtej+J5htiISdMfKsb6NsErJcnklrrY9FqwTSvWNSZ
	 Kfv2Bvo8ogT597czBP1G+lrjQdh/rp1ktSK8Ii1s=
From: Amneesh Singh <a-singh21@ti.com>
To: <a-singh21@ti.com>
CC: <xen-devel@lists.xenproject.org>, <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/helpers/init-dom0less: fix vcpu availability
Date: Tue, 6 Aug 2024 16:19:18 +0530
Message-ID: <20240806104918.706970-1-a-singh21@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802075823.116920-1-a-singh21@ti.com>
References: <20240802075823.116920-1-a-singh21@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

CCing the maintainer

