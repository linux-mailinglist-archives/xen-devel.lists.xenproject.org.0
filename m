Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7C19E471
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 12:27:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKg10-00007V-GF; Sat, 04 Apr 2020 10:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKg0z-00007Q-2O
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 10:27:01 +0000
X-Inumbo-ID: d19e12da-765e-11ea-be07-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d19e12da-765e-11ea-be07-12813bfff9fa;
 Sat, 04 Apr 2020 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TkOcH+NhGB6tD0EoyOqmB42AFmfEEhuMkkI9bucOE8E=; b=2wa69OUTE0q4FttFYy6y/+08kj
 lyDJ+KM0xEoCBaV9yhXVSZTZBGDwMkhBuOWOi6VQloZLMcWRpUX/LEAU7Uc96LS0kMF49c1PyiSex
 rDcsbR7Qj/E1Cu+/JwGHw9N9pdp3Pv+4W9113qTgsAysTX/MztjZTA+i/Zq2Si34htUo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg0x-00059y-Fl; Sat, 04 Apr 2020 10:26:59 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKg0x-0005h7-5Y; Sat, 04 Apr 2020 10:26:59 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/3] xen/x86: Simplify init_ioapic()
Date: Sat,  4 Apr 2020 11:26:53 +0100
Message-Id: <20200404102656.29730-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

The main goal of this small series is to simplify init_ioapic().

Cheers,

Julien Grall (3):
  xen/x86: ioapic: Use true/false in bad_ioapic_register()
  xen/x86: ioapic: Rename init_ioapic_mappings() to ioapic_init()
  xen/x86: ioapic: Simplify ioapic_init()

 xen/arch/x86/apic.c           |  2 +-
 xen/arch/x86/io_apic.c        | 65 ++++++++++++++++-------------------
 xen/include/asm-x86/io_apic.h |  2 +-
 3 files changed, 32 insertions(+), 37 deletions(-)

-- 
2.17.1


