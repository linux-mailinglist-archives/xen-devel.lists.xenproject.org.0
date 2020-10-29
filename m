Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33329F5BF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14648.36206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYE6u-0005P1-Mo; Thu, 29 Oct 2020 20:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14648.36206; Thu, 29 Oct 2020 20:01:24 +0000
Resent-From: Olaf Hering <olaf@aepfle.de>
Resent-Date: Thu, 29 Oct 2020 21:01:16 +0100
Resent-Message-ID: <20201029200116.GA7461@aepfle.de>
Resent-To: xen-devel@lists.xenproject.org
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
	id 1kYE6u-0005OY-Io; Thu, 29 Oct 2020 20:01:24 +0000
Received: by outflank-mailman (input) for mailman id 14648;
 Thu, 29 Oct 2020 20:01:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYE6t-0005OK-Jc
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:01:23 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 986f202c-5778-4c9a-bb07-c7c601215df6;
 Thu, 29 Oct 2020 20:01:22 +0000 (UTC)
Received: from aepfle.de by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9TK1K4Sw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 29 Oct 2020 21:01:20 +0100 (CET)
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216])
 by smtpin.rzone.de (RZmta 47.3.0 OK) with ESMTPS id R05ba5w9THK78YQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client CN "*.smtp.rzone.de",
 Issuer "TeleSec ServerPass Class 2 CA" (verified OK (+EmiG)))
 (Client hostname verified OK) for <olaf@aepfle.de>;
 Thu, 29 Oct 2020 18:20:07 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THK73f5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate) for <olaf@aepfle.de>;
 Thu, 29 Oct 2020 18:20:07 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYE6t-0005OK-Jc
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:01:23 +0000
X-Inumbo-ID: 986f202c-5778-4c9a-bb07-c7c601215df6
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 986f202c-5778-4c9a-bb07-c7c601215df6;
	Thu, 29 Oct 2020 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604001681;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:
	Received-SPF:X-RZG-CLASS-ID:Authentication-Results:
	Authentication-Results:Authentication-Results:Authentication-Results:
	Authentication-Results:X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=fdmy2g4paPxwsmM3EZC6IDQ9fD2XxCAjar+up2NIJfk=;
	b=D6TEPCM5xWICo57a8YcogUGug/dtxj1SgAifJjKPWmPJvcbQaEvJMFy/ypi3Ly7pdz
	WO+zx+GOT/c20sO0qE/psls+ccYlWoEvhWJAOd0JxI5LwlS9NuCxaWCLN5vowfjO5OQV
	C2rsnIsEt0JEVaBYssdkGLjgusjIe86idMLtdWsXKta8QYMqjGJ0NPnashNaWop6f59r
	JRNGG6qm6mNdZbJ6Dr5wCMNi6P4FZSZjc1JOLbm7AVc7dAgwj8Vy0YKESgkcUGoDcJyu
	FL2ihthfcf5pHDPBq0AEYAmPGkTbS7xTVKqrUMzRlbtvE9PkilKhbk2A+oN96y8f0RlE
	SxDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9TK1K4Sw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
	for <xen-devel@lists.xenproject.org>;
	Thu, 29 Oct 2020 21:01:20 +0100 (CET)
X-Envelope-From: <olaf@aepfle.de>
X-Envelope-To: <olaf@aepfle.de>
X-Delivery-Time: 1603992008
X-UID: 548113
Authentication-Results: strato.com; dmarc=none header.from=aepfle.de
Authentication-Results: strato.com; arc=none
Authentication-Results: strato.com; dkim=pass header.d=aepfle.de
Authentication-Results: strato.com; dkim-adsp=pass header.from="olaf@aepfle.de"
Authentication-Results: strato.com; spf=none smtp.mailfrom="olaf@aepfle.de"
X-RZG-Expurgate: clean/normal
X-RZG-Expurgate-ID: 149500::1603992008-0000A3A5-B584449D/0/0
X-RZG-CLASS-ID: mi00
Received-SPF: none
	client-ip=81.169.146.216;
	helo="mo4-p00-ob.smtp.rzone.de";
	envelope-from="olaf@aepfle.de";
	receiver=smtpin.rzone.de;
	identity=mailfrom;
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216])
	by smtpin.rzone.de (RZmta 47.3.0 OK)
	with ESMTPS id R05ba5w9THK78YQ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client CN "*.smtp.rzone.de", Issuer "TeleSec ServerPass Class 2 CA" (verified OK (+EmiG)))
	(Client hostname verified OK)
	for <olaf@aepfle.de>;
	Thu, 29 Oct 2020 18:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992007;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=fdmy2g4paPxwsmM3EZC6IDQ9fD2XxCAjar+up2NIJfk=;
	b=KGuOzy9UMIOA9+8H40XwG5ehFikbu+GO0fsfj7e7HRXYN2yLuQulkdpIcfL8GMQFDY
	s3ZpCmw+dkV2+laHIncV3rCJ3OSdsBT3W2UPz4Da16HpXlVHFXlwMuc1oN3TflooIkUg
	kB20FO1gCYR3cw9sXOSLwHWnL0dIZxi8AwFpXEnT05+jGWuPb9zWWfevmY0Y8Z3uxTGJ
	gXs3254RGdQR/XvxRZdYb71ihP/ChS7lTU3/YVmXsVlGfY6WnTbSxZZ3yJ0/5y9rFLH9
	v8nZV8+4ZI2latwmgKsBBXn9BofLuL3Li8JGWEO7RdafdzK7+u4j8dz9xTiWh1E+7vOr
	gLyA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THK73f5
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate)
	for <olaf@aepfle.de>;
	Thu, 29 Oct 2020 18:20:07 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1 00/23] reduce overhead during live migration
Date: Thu, 29 Oct 2020 18:19:40 +0100
Message-Id: <20201029172004.17219-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current live migration code can easily saturate an 1Gb link.
There is still room for improvement with faster network connections.
Even with this series reviewed and applied.
See description of patch #6.

Olaf

Olaf Hering (23):
  tools: add readv_exact to libxenctrl
  tools: add xc_is_known_page_type to libxenctrl
  tools: use xc_is_known_page_type
  tools: unify type checking for data pfns in migration stream
  tools: show migration transfer rate in send_dirty_pages
  tools/guest: prepare to allocate arrays once
  tools/guest: save: move batch_pfns
  tools/guest: save: move mfns array
  tools/guest: save: move types array
  tools/guest: save: move errors array
  tools/guest: save: move iov array
  tools/guest: save: move rec_pfns array
  tools/guest: save: move guest_data array
  tools/guest: save: move local_pages array
  tools/guest: restore: move pfns array
  tools/guest: restore: move types array
  tools/guest: restore: move mfns array
  tools/guest: restore: move map_errs array
  tools/guest: restore: move mfns array in populate_pfns
  tools/guest: restore: move pfns array in populate_pfns
  tools/guest: restore: split record processing
  tools/guest: restore: split handle_page_data
  tools/guest: restore: write data directly into guest

 tools/libs/ctrl/xc_private.c          |  54 ++-
 tools/libs/ctrl/xc_private.h          |  34 ++
 tools/libs/guest/xg_sr_common.c       |  33 +-
 tools/libs/guest/xg_sr_common.h       |  86 +++-
 tools/libs/guest/xg_sr_restore.c      | 562 +++++++++++++++++---------
 tools/libs/guest/xg_sr_save.c         | 158 ++++----
 tools/libs/guest/xg_sr_save_x86_hvm.c |   5 +-
 tools/libs/guest/xg_sr_save_x86_pv.c  |  31 +-
 8 files changed, 666 insertions(+), 297 deletions(-)


