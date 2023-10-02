Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655DE7B4DF2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:53:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611257.950834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgF-0007Kr-Aj; Mon, 02 Oct 2023 08:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611257.950834; Mon, 02 Oct 2023 08:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEgE-00078w-H7; Mon, 02 Oct 2023 08:53:30 +0000
Received: by outflank-mailman (input) for mailman id 611257;
 Mon, 02 Oct 2023 08:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3Nz=FQ=kernel.org=devnull+j.granados.samsung.com@srs-se1.protection.inumbo.net>)
 id 1qnEg9-0004XI-6z
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:53:25 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22410a7c-6101-11ee-878e-cb3800f73035;
 Mon, 02 Oct 2023 10:53:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48118CE0EDE;
 Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E83FC4E67B;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 87B1FE7849A;
 Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
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
X-Inumbo-ID: 22410a7c-6101-11ee-878e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236795;
	bh=vDlxMU2ggFFcgL4XVv7yaCla84NzDst78pAlmrI/LAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pR95+O9r6nUzq07c9kPGKb7Ab0VcY5+68ndSSzB+hZmwZYikEf3FKE5QZgbbuqjOX
	 gQkhguZwdsurCaU0axfIZ2F0cJCq86v09nWDCYqoJnOhNSunu1At9WlawEgkBrEmJ6
	 y18G/0sKMdEFBxdOakpL3K6ARrEuVanraUCM76n/OBLvRpO3S0uhlUJVkFeuWm+fyr
	 dbr8FI1IRqLxTOLySLXMasu08oJ1w1pZXHhh4+kaXfndJ8OZR17RetwZax4Z6ehYkJ
	 mIoVTZonmVbDcGCi8ny+uoSKjBM1DIy75fzJacAsTb3IqeKffbenQJRDWZ7+Dfqjc4
	 7r/qhjuBtwo0A==
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:26 +0200
Subject: [PATCH v2 09/15] char-misc: Remove the now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:
 <20231002-jag-sysctl_remove_empty_elem_drivers-v2-9-02dd0d46f71e@samsung.com>
References:
 <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
In-Reply-To:
 <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Phillip Potter <phil@philpotter.co.uk>, 
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Doug Gilbert <dgilbert@interlog.com>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, 
 Russ Weight <russell.h.weight@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Joel Granados <j.granados@samsung.com>, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, linux-serial@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-rdma@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 netdev@vger.kernel.org, linux-raid@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=Kv0ap7oOhCIEujO7K32kNHT+ZxUGAQsjjs8+/enag5M=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV+isCI8TDO6pwR+wgikdJs6dLv5S5QCOB04
 iOxWZrSGSiJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfgAKCRC6l81St5ZB
 T6oTC/9qOUC9BOwrcAbb8+8X5NEMfhYEKBwZOjn0qP7z2HP9F0B0s13QbRcV+nD/AboNml1SyV1
 2bME5eSPBRhDk/FgUi2dHVoWST0piu5f+xZVAdCGk0dlm6zx066OrZgELiJpoohNDrDPt3Hw74l
 vDFg1cmFZeVWLG+9hQVfG+0ip5WPINFZL6HG5Qaf5vQovahB6Axer95+p066sCI/hydwE7wEmQW
 AaBpPNfAYpiEL3HtJ935jxFkTOmK8sqEwQTXsN1aJcHVhbXpAwOog7xO+DfU6DOBHTdb4MVBOxq
 BDdLiqegmjac+IlK2slz/WfvUKW0V+2LZN7aJ0/GqoMforwaGZwvUhwn34nmenlx7NcpDwgIKDx
 orVBtck2IN7tetdBhNLpoy3r7xDl7WRjm3f3xIxDXcUNqlOY9x1VyHKww5KiFk49KJ9UPmc8tKT
 3ACEiDi7UvwEFAfJwF4Zc34OpSkdkpY3PQGUWRU0h2+aTGNKyDRzq42XfqrCcpxTHv5xA=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:
 by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
Reply-To: <j.granados@samsung.com>

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from impi_table and random_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/char/ipmi/ipmi_poweroff.c | 1 -
 drivers/char/random.c             | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
index 870659d91db2..941d2dcc8c9d 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -656,7 +656,6 @@ static struct ctl_table ipmi_table[] = {
 	  .maxlen	= sizeof(poweroff_powercycle),
 	  .mode		= 0644,
 	  .proc_handler	= proc_dointvec },
-	{ }
 };
 
 static struct ctl_table_header *ipmi_table_header;
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 3cb37760dfec..4a9c79391dee 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1683,7 +1683,6 @@ static struct ctl_table random_table[] = {
 		.mode		= 0444,
 		.proc_handler	= proc_do_uuid,
 	},
-	{ }
 };
 
 /*

-- 
2.30.2


