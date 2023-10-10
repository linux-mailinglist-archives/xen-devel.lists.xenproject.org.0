Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E407BFF33
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 16:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615066.956223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDh6-00031e-7l; Tue, 10 Oct 2023 14:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615066.956223; Tue, 10 Oct 2023 14:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDh6-0002yt-57; Tue, 10 Oct 2023 14:26:44 +0000
Received: by outflank-mailman (input) for mailman id 615066;
 Tue, 10 Oct 2023 14:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBiT=FY=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qqDh4-0002hy-UM
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 14:26:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 06f3af0b-6779-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 16:26:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9B61FB;
 Tue, 10 Oct 2023 07:27:20 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABF193F762;
 Tue, 10 Oct 2023 07:26:38 -0700 (PDT)
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
X-Inumbo-ID: 06f3af0b-6779-11ee-9b0d-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH 0/1] Add software timestamp capabilities to xen-netback device
Date: Tue, 10 Oct 2023 15:26:29 +0100
Message-Id: <20231010142630.984585-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

during some experiment using PTP (ptp4l) between a Dom0 domain and a DomU guest,
I noticed that the virtual interface brought up by the toolstack was not able
to be used as ptp4l interface on the Dom0 side, a brief investigation on the
drivers revealed that the backend driver doesn't have the SW timestamp
capabilities, so in order to provide them, I'm sending this patch.

Luca Fancellu (1):
  xen-netback: add software timestamp capabilities

 drivers/net/xen-netback/interface.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)


base-commit: cb0856346a60fe3eb837ba5e73588a41f81ac05f
-- 
2.34.1


