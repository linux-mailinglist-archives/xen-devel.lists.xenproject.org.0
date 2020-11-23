Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259332C05D0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34166.65005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB6r-0001Oj-H3; Mon, 23 Nov 2020 12:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34166.65005; Mon, 23 Nov 2020 12:38:21 +0000
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
	id 1khB6r-0001OK-DO; Mon, 23 Nov 2020 12:38:21 +0000
Received: by outflank-mailman (input) for mailman id 34166;
 Mon, 23 Nov 2020 12:38:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khB6p-0001OB-Dy
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:38:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39d23983-c48b-4001-a1e7-fae065c71bc6;
 Mon, 23 Nov 2020 12:38:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1A44ABCE;
 Mon, 23 Nov 2020 12:38:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khB6p-0001OB-Dy
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:38:19 +0000
X-Inumbo-ID: 39d23983-c48b-4001-a1e7-fae065c71bc6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 39d23983-c48b-4001-a1e7-fae065c71bc6;
	Mon, 23 Nov 2020 12:38:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606135098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NOhIeP5/zFABIK+Xst34MyxyojektpL89knqwSFWA1c=;
	b=fHQxkzShBQizuNau3BioNKKo7OWsWAsRKhP32x3ik8RHqLUsoVDzNP9bggvZDqwgWQ5b1x
	9S1VFy99A+f1kwTECtkX2CzX+xxT2rNsx9M8/dMWo91Tdwevlih+gZyltHjnVd6/VPUosz
	lgiOd+d+n+FfAeNJlWnBXal/RJIMCs8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F1A44ABCE;
	Mon, 23 Nov 2020 12:38:17 +0000 (UTC)
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86: ACPI and DMI table mapping fixes
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Date: Mon, 23 Nov 2020 13:38:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first three patches fix fallout from the re-work of
acpi_os_{,un}map_memory(): Direct uses of __acpi_map_table() are now
no longer valid once we've reached SYS_STATE_boot. This was originally
noticed by system shutdown no longer working (patch 1), but clearly
extends beyond of this (patches 2 and 3). The last patch relaxes
things such that entering S5 would still work even if there was a
problem with FACS (information collected from there is only needed for
entering S3 and, once we support it, S4 via S4BIOS_REQ).

1: x86/ACPI: fix mapping of FACS
2: x86/ACPI: fix S3 wakeup vector mapping
3: x86/DMI: fix table mapping when one lives above 1Mb
4: x86/ACPI: don't invalidate S5 data when S3 wakeup vector cannot be determined

Jan

