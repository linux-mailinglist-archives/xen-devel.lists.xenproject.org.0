Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9B296ADE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10753.28656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVs26-0002Xz-4P; Fri, 23 Oct 2020 08:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10753.28656; Fri, 23 Oct 2020 08:02:42 +0000
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
	id 1kVs26-0002Xa-0x; Fri, 23 Oct 2020 08:02:42 +0000
Received: by outflank-mailman (input) for mailman id 10753;
 Fri, 23 Oct 2020 08:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVs25-0002XV-Cj
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:02:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8668d801-06ee-4a06-999d-cd941e1340f2;
 Fri, 23 Oct 2020 08:02:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73A80AC83;
 Fri, 23 Oct 2020 08:02:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVs25-0002XV-Cj
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:02:41 +0000
X-Inumbo-ID: 8668d801-06ee-4a06-999d-cd941e1340f2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8668d801-06ee-4a06-999d-cd941e1340f2;
	Fri, 23 Oct 2020 08:02:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603440158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wWIMTLf4j3BA6CNc85qVTx7LGobZs+V9mQFsSd1mJyg=;
	b=XyI2w/gLt44KYYIk3/hehBDbA5w1VsrrOhm2oDSi47n1w++adySVjFVaW9S+f9/XAxgQWp
	G9yINnXVbZIIY2YJhXxhL3YiVvBsWojD4l+60JtpyaRKZHdqnAn0lu9JZ83dVF0oG24gI0
	YEYkBQCiWBmIHBR09O99n55GaWtJLo0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 73A80AC83;
	Fri, 23 Oct 2020 08:02:38 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] PCI: drop dead pci_lock_*pdev() declarations
Message-ID: <cb644565-92c9-8dbe-8c36-54e8b6b722ad@suse.com>
Date: Fri, 23 Oct 2020 10:02:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

They have no definitions, and hence users, anywhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -155,9 +155,6 @@ bool_t pci_device_detect(u16 seg, u8 bus
 int scan_pci_devices(void);
 enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
 int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
-struct pci_dev *pci_lock_pdev(int seg, int bus, int devfn);
-struct pci_dev *pci_lock_domain_pdev(
-    struct domain *, int seg, int bus, int devfn);
 
 void setup_hwdom_pci_devices(struct domain *,
                             int (*)(u8 devfn, struct pci_dev *));

