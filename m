Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0592D0E18
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46159.81892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDrS-0007TN-VX; Mon, 07 Dec 2020 10:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46159.81892; Mon, 07 Dec 2020 10:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDrS-0007Sy-Rb; Mon, 07 Dec 2020 10:35:18 +0000
Received: by outflank-mailman (input) for mailman id 46159;
 Mon, 07 Dec 2020 10:35:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDrR-0007Sp-U4
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:35:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c67d606-679e-49ff-b879-b791ee6f9f7d;
 Mon, 07 Dec 2020 10:35:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74024ADE1;
 Mon,  7 Dec 2020 10:35:16 +0000 (UTC)
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
X-Inumbo-ID: 4c67d606-679e-49ff-b879-b791ee6f9f7d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607337316; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yXgzTx6AQT9GvEzuqCmUll4WyIQxBs96NAkOT8AKjf4=;
	b=r9pG1YNYaIH/+UsSQIkylG1hOutVdgW2BE5pMpZWoXouVilfrVoWQnKNHgMS6rJNdEU1v/
	praBKosFN1vZT3L88rAr2TDl1aMqR0GaqQqeDWsMECCEDjbDk2vISIfC7DrWWY4hcqjJ7U
	z6PDGAzFDOyCwJhFWuaoZatyb4Kx6rk=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86/vPCI: MSI/MSI-X related adjustments
Message-ID: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Date: Mon, 7 Dec 2020 11:35:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: tolerate (un)masking a disabled MSI-X entry
2: check address in vpci_msi_update()
3: vPCI/MSI-X: fold clearing of entry->updated
4: vPCI/MSI-X: make use of xzalloc_flex_struct()
5: vPCI/MSI-X: tidy init_msix()

Jan

