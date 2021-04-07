Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54D356EEB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 16:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106719.204062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9Ji-0000UT-IH; Wed, 07 Apr 2021 14:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106719.204062; Wed, 07 Apr 2021 14:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9Ji-0000U6-EU; Wed, 07 Apr 2021 14:38:02 +0000
Received: by outflank-mailman (input) for mailman id 106719;
 Wed, 07 Apr 2021 14:38:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU9Jg-0000Tu-Mn
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 14:38:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a519e47d-968b-4c76-a1d6-05e8e9e4c19e;
 Wed, 07 Apr 2021 14:37:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11C8FAC79;
 Wed,  7 Apr 2021 14:37:59 +0000 (UTC)
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
X-Inumbo-ID: a519e47d-968b-4c76-a1d6-05e8e9e4c19e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617806279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1EjVwkyGSZf0Nk1jVX5DjRxmB+T2lYtGn0JD3AChaEs=;
	b=eWXbEVkRVTII+IpZ4PqLt/lsGdso13cCXLuPPtQoDDbG0itha8XZFSQrXc9HcODss9Cumi
	8kcSzH8G5p8ZBfpbv05pgquqADjPkp4oKj+QyXHP1nFFs8O85QzSO6hwppxutroC6ziU1s
	ru3/srlxu16r5gFPrD2sH1/H6L2v044=
Subject: [PATCH 3/3] xen-pciback: simplify vpci's find hook
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Wilk <konrad.wilk@oracle.com>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
Message-ID: <158273a2-d1b9-3545-b25d-affca867376c@suse.com>
Date: Wed, 7 Apr 2021 16:37:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no point in comparing SBDF - we can simply compare the struct
pci_dev pointers. If they weren't the same for a given device, we'd have
bigger problems from having stored a stale pointer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/xen-pciback/vpci.c
+++ b/drivers/xen/xen-pciback/vpci.c
@@ -235,7 +235,6 @@ static int __xen_pcibk_get_pcifront_dev(
 					unsigned int *devfn)
 {
 	struct pci_dev_entry *entry;
-	struct pci_dev *dev = NULL;
 	struct vpci_dev_data *vpci_dev = pdev->pci_dev_data;
 	int found = 0, slot;
 
@@ -244,11 +243,7 @@ static int __xen_pcibk_get_pcifront_dev(
 		list_for_each_entry(entry,
 			    &vpci_dev->dev_list[slot],
 			    list) {
-			dev = entry->dev;
-			if (dev && dev->bus->number == pcidev->bus->number
-				&& pci_domain_nr(dev->bus) ==
-					pci_domain_nr(pcidev->bus)
-				&& dev->devfn == pcidev->devfn) {
+			if (entry->dev == pcidev) {
 				found = 1;
 				*domain = 0;
 				*bus = 0;


