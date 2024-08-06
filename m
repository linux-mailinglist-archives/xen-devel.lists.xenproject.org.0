Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B01948C26
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772623.1183077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGSN-0006KI-G4; Tue, 06 Aug 2024 09:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772623.1183077; Tue, 06 Aug 2024 09:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGSN-0006Id-B2; Tue, 06 Aug 2024 09:26:15 +0000
Received: by outflank-mailman (input) for mailman id 772623;
 Tue, 06 Aug 2024 09:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ctxO=PF=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sbGSM-0006HS-0F
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:26:14 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead34c26-53d5-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 11:26:11 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4769Q8IT114217;
 Tue, 6 Aug 2024 04:26:08 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4769Q8aJ099740
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Aug 2024 04:26:08 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 04:26:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 04:26:08 -0500
Received: from localhost (nightbug.dhcp.ti.com [172.24.227.225])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4769Q7Ah098907;
 Tue, 6 Aug 2024 04:26:08 -0500
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
X-Inumbo-ID: ead34c26-53d5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722936368;
	bh=1+2zExbbx5eHIAIZNAv1tu60FH4abf/vPaxiPcu1zPA=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Cc+hcXW7B00d2FyaVjSeQOgHucHzcHz4cEnhSJFT6farGq80MbBRm0Ah2BDsgOvRg
	 xGmt8xB5XIk9jGf1PySaQiO7wF03HG0OAvjOzmTrm6e8rpcyQafDE5mc+CvgJk+yZO
	 CJlPpKKJCVOYJqFYgn+rpnVDIiFvB4YdakwTAkHQ=
Date: Tue, 6 Aug 2024 14:56:06 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Message-ID: <gnn2vye33vp4mp4k2ncl23rdfv5qfhatatzfkg2qhsla6232za@hjk2szchnfab>
References: <20240719113313.145587-1-a-singh21@ti.com>
 <18deaad4-0bbf-4bf2-919e-7b213a1c8235@amd.com>
 <713072f9-5c1f-4958-913c-67c4675de488@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <713072f9-5c1f-4958-913c-67c4675de488@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Was not using my usual mailing client, hence the abomination on the web
view of the mailing list. Pardon the subject too.

Apologies
Amneesh

