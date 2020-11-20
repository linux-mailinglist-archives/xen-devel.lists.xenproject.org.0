Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A486D2BB519
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 20:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32568.63675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgBww-0003Lx-4g; Fri, 20 Nov 2020 19:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32568.63675; Fri, 20 Nov 2020 19:20:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgBwv-0003KD-Ry; Fri, 20 Nov 2020 19:20:01 +0000
Received: by outflank-mailman (input) for mailman id 32568;
 Fri, 20 Nov 2020 18:40:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M2Yq=E2=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
 id 1kgBL0-0007od-TK
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:40:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cff039bd-886c-4309-9217-822aa8e61cd8;
 Fri, 20 Nov 2020 18:40:50 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C64FD2467D;
 Fri, 20 Nov 2020 18:40:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=M2Yq=E2=kernel.org=gustavoars@srs-us1.protection.inumbo.net>)
	id 1kgBL0-0007od-TK
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:40:50 +0000
X-Inumbo-ID: cff039bd-886c-4309-9217-822aa8e61cd8
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cff039bd-886c-4309-9217-822aa8e61cd8;
	Fri, 20 Nov 2020 18:40:50 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C64FD2467D;
	Fri, 20 Nov 2020 18:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605897649;
	bh=b9FdqbhetGxlSrLNwiAqLkeUTdEkk4mAKgqcmtTsp+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hrmt+c+r6d/bWt+4ljBbSgqtFgarptX12kO+U2fLRv5VtqpaFFiUvoqLobkrL44vb
	 YzASrHzjRkeEDxzxAjUDereBGScx1uBnMz/YCJDvmwUPgBPkS2EvsTCQpisizSL5Lh
	 KeRWZ32/JPMy2/BEohFcbSIzB6HdVvQS5AJDIFaw=
Date: Fri, 20 Nov 2020 12:40:55 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 138/141] xen/manage: Fix fall-through warnings for Clang
Message-ID: <5cfc00b1d8ed68eb2c2b6317806a0aa7e57d27f1.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/xen/manage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index cd046684e0d1..374d36de7f5a 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -179,6 +179,7 @@ static int poweroff_nb(struct notifier_block *cb, unsigned long code, void *unus
 	case SYS_HALT:
 	case SYS_POWER_OFF:
 		shutting_down = SHUTDOWN_POWEROFF;
+		break;
 	default:
 		break;
 	}
-- 
2.27.0


