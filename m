Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362791DEA4
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 14:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751519.1159500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOFiZ-0002pc-P4; Mon, 01 Jul 2024 12:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751519.1159500; Mon, 01 Jul 2024 12:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOFiZ-0002mh-Lq; Mon, 01 Jul 2024 12:01:11 +0000
Received: by outflank-mailman (input) for mailman id 751519;
 Mon, 01 Jul 2024 12:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OIh=OB=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sOFiY-0002jY-6s
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 12:01:10 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98e2c7df-37a1-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 14:01:07 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id CFECC3793D;
 Mon,  1 Jul 2024 08:01:05 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id ADC1D3793C;
 Mon,  1 Jul 2024 08:01:05 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [46.211.3.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 06E773793B;
 Mon,  1 Jul 2024 08:01:04 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 98e2c7df-37a1-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=sLFUZ1LCg0ZS7rmyYNp2DcwZHpYfA6VaUqJFXaKesDw=; b=Yd8/
	qVTFhKXSSC+74FOtBR01ynqjUVJpiIn0fhY6ZIcSg3NnyJdV0vSYIXmylO+4GJ2v
	1HNgH7o6gzye+V3Y0LXCYpZZGdsAepKLTQ/uRB4ba7zZaXsKsUmqHzr7NVx/tH4D
	Melb8kfjPXVy5rAaUNqnOCc94hY/OTJ+Bnn2+DI=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 0/2] x86: separate powernow/hwp/acpi cpufreq code
Date: Mon,  1 Jul 2024 15:01:00 +0300
Message-Id: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 975D1400-37A1-11EF-A70C-5B6DE52EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

This short series aims to make platform-specific parts of cpufreq optiona=
l
and dependant on INTEL & AMD config options. This is to allow for tuning
the build for either AMD or Intel platform exclusively and hence to drop
the code that would be left unused.

The initial v1 patch has been extended to not only cover HWP & Powernow
drivers, but additionally ACPI driver is moved outside of cpufreq generic=
 code
and as Intel-dependant piece is put under CONFIG_INTEL option.

Patch v1 & related discussion are here:
https://lore.kernel.org/xen-devel/20240604093406.2448552-1-Sergiy_Kibrik@=
epam.com/

Sergiy Kibrik (2):
  x86/cpufreq: move ACPI cpufreq driver into separate file
  x86/cpufreq: separate powernow/hwp/acpi cpufreq code

 xen/arch/x86/acpi/cpufreq/Makefile  |   5 +-
 xen/arch/x86/acpi/cpufreq/acpi.c    | 622 ++++++++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 598 +-------------------------
 xen/drivers/acpi/pmstat.c           |   2 +-
 xen/drivers/cpufreq/cpufreq.c       |   3 +-
 xen/drivers/cpufreq/utility.c       |   2 +-
 xen/include/acpi/cpufreq/cpufreq.h  |  10 +
 7 files changed, 644 insertions(+), 598 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/acpi.c

--=20
2.25.1


