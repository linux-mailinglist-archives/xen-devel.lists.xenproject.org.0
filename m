Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3628C85A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 07:47:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6093.16027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSD92-0008JD-5x; Tue, 13 Oct 2020 05:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6093.16027; Tue, 13 Oct 2020 05:46:44 +0000
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
	id 1kSD92-0008Il-0F; Tue, 13 Oct 2020 05:46:44 +0000
Received: by outflank-mailman (input) for mailman id 6093;
 Tue, 13 Oct 2020 05:46:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PgYC=DU=antarean.org=joost@srs-us1.protection.inumbo.net>)
 id 1kSD90-0008IF-29
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 05:46:42 +0000
Received: from gw1.antarean.org (unknown [194.145.200.214])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6b330e1f-1e76-49b7-b1ec-537b1dde1082;
 Tue, 13 Oct 2020 05:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by gw1.antarean.org (Postfix) with ESMTP id 4C9P446Fdnzyv7
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:19:32 +0200 (CEST)
Received: from gw1.antarean.org ([127.0.0.1])
 by localhost (gw1.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGWLlVgXkscv for <xen-devel@lists.xenproject.org>;
 Tue, 13 Oct 2020 07:19:32 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw1.antarean.org (Postfix) with ESMTP id 4C9P444M5MzyTX
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:19:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4C9PDR2ThKz15
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:26:47 +0200 (CEST)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id NwmJN0lDlLq9 for <xen-devel@lists.xenproject.org>;
 Tue, 13 Oct 2020 07:26:47 +0200 (CEST)
Received: from eve.localnet (eve.adm.antarean.org [10.55.16.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4C9PDR1HKBz13
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:26:47 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PgYC=DU=antarean.org=joost@srs-us1.protection.inumbo.net>)
	id 1kSD90-0008IF-29
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 05:46:42 +0000
X-Inumbo-ID: 6b330e1f-1e76-49b7-b1ec-537b1dde1082
Received: from gw1.antarean.org (unknown [194.145.200.214])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 6b330e1f-1e76-49b7-b1ec-537b1dde1082;
	Tue, 13 Oct 2020 05:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by gw1.antarean.org (Postfix) with ESMTP id 4C9P446Fdnzyv7
	for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:19:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at antarean.org
Received: from gw1.antarean.org ([127.0.0.1])
	by localhost (gw1.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGWLlVgXkscv for <xen-devel@lists.xenproject.org>;
	Tue, 13 Oct 2020 07:19:32 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
	by gw1.antarean.org (Postfix) with ESMTP id 4C9P444M5MzyTX
	for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:19:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4C9PDR2ThKz15
	for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:26:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at antarean.org
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
	by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwmJN0lDlLq9 for <xen-devel@lists.xenproject.org>;
	Tue, 13 Oct 2020 07:26:47 +0200 (CEST)
Received: from eve.localnet (eve.adm.antarean.org [10.55.16.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4C9PDR1HKBz13
	for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 07:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1602566807;
	bh=zXisIOxsws3XIiTJG1L9WpX9cIVAU88saaQvoxTpqGw=;
	h=From:To:Subject:Date;
	b=TykF2jHlUhColVnVO/BltR8w9LsOq/Ih/M/HmTyPuJ+5nqkiXjRIGzBBvq5LRVMIg
	 S4X/sWO6/QOthW5KTxLvk4aZ79S2b7jz3gWGMxHEWxfJLrtYZOI7KvXqrZMBNFj3T3
	 X3TSTJXGZkqhyqxe7Km2Y+nlmus92mDadLQD2ovE=
From: "J. Roeleveld" <joost@antarean.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: xen-blkback: Scheduled work from previous purge is still busy, cannot purge list
Date: Tue, 13 Oct 2020 07:26:47 +0200
Message-ID: <15146361.Z0tdQxPx3m@eve>
Organization: Antarean
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi All,

I am seeing the following message in the "dmesg" output of a driver domain.

[Thu Oct  8 20:57:04 2020] xen-blkback: Scheduled work from previous purge is 
still busy, cannot purge list
[Thu Oct  8 20:57:11 2020] xen-blkback: Scheduled work from previous purge is 
still busy, cannot purge list
[Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous purge is 
still busy, cannot purge list
[Thu Oct  8 20:57:44 2020] xen-blkback: Scheduled work from previous purge is 
still busy, cannot purge list


Is this something to worry about? Or can I safely ignore this?

--
Joost



