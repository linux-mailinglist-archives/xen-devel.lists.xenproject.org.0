Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1530C2DB141
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54442.94572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD7o-0003AS-LX; Tue, 15 Dec 2020 16:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54442.94572; Tue, 15 Dec 2020 16:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD7o-00039v-HW; Tue, 15 Dec 2020 16:24:32 +0000
Received: by outflank-mailman (input) for mailman id 54442;
 Tue, 15 Dec 2020 16:24:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpD7m-00039g-F7
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:24:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c382944c-bec9-4204-bdde-59123e1c277b;
 Tue, 15 Dec 2020 16:24:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 985FFAF73;
 Tue, 15 Dec 2020 16:24:28 +0000 (UTC)
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
X-Inumbo-ID: c382944c-bec9-4204-bdde-59123e1c277b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gVCt0CoeLEWyBtqA7+1996CM9kjAXGCRYWC5E2fe0g0=;
	b=Th903HUBkmzuJEqNShcickwqkobSTqlH6ddfMUkgExf9FyY4X7r6CgQaQVp+3+/uMDs5rN
	K9JscCJmWA7eQGOFjr3ETvzEB2p8ddmwvNswon+Q5tJz1fKXU3dZvNbRBDgbEHlRV90hb4
	HHVuYbrizBO6e91fYGgi/QHYdxq/gB4=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] x86/p2m: restrict more code to build just for HVM
Message-ID: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Date: Tue, 15 Dec 2020 17:24:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: p2m: tidy p2m_add_foreign() a little
2: mm: p2m_add_foreign() is HVM-only
3: p2m: set_{foreign,mmio}_p2m_entry() are HVM-only
4: p2m: {,un}map_mmio_regions() are HVM-only
5: mm: the gva_to_gfn() hook is HVM-only
6: p2m: set_shared_p2m_entry() is MEM_SHARING-only

Jan

