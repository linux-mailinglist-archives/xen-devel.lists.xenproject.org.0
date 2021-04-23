Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D73690C0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 13:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116189.221814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtZz-0005h8-2f; Fri, 23 Apr 2021 11:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116189.221814; Fri, 23 Apr 2021 11:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtZy-0005gm-Vl; Fri, 23 Apr 2021 11:02:34 +0000
Received: by outflank-mailman (input) for mailman id 116189;
 Fri, 23 Apr 2021 11:02:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtZy-0005gh-2g
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 11:02:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1727a476-9c6e-4b30-be54-8b94f5df77dd;
 Fri, 23 Apr 2021 11:02:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2177B0D7;
 Fri, 23 Apr 2021 11:02:32 +0000 (UTC)
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
X-Inumbo-ID: 1727a476-9c6e-4b30-be54-8b94f5df77dd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=itV2HNrG4jrnOJaz6lI+gZcYPRMPfnV3prE1QayyZS0=;
	b=e0CVAUi9S6Kx1fuwoFufDZ3sstAZCrmoXyUcAHfKQ0t8bm2ZZk425lCLauBv01QC33Y6gI
	WqVhTq8PDlB0zYQCdCuE+6yYSON+iyCkh/j/SQ5127cRoIn1XZVDuUNOIdP5pBbOSPsclj
	Aj+zdgbpPMzJ+tPbX0Y9BBO/pVcy4oA=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/3] x86/EFI: build adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
Date: Fri, 23 Apr 2021 13:02:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Since it was requested and is possible with up-to-date binutils, inclusion
of debug info in xen.efi is the remaining part here. The other changes here
are cleanup related to both the work here as well as the one to make
binutils fit for our purposes.

1: EFI: sections may not live at VA 0 in PE binaries
2: EFI: keep debug info in xen.efi
3: EFI: don't have an overly large image size

Jan

