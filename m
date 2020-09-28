Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D027AD57
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 13:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrlP-0002if-1Q; Mon, 28 Sep 2020 11:56:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMrlO-0002iW-3q
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:56:14 +0000
X-Inumbo-ID: 4dd9dad4-2345-4751-8275-70cbfea02a6e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dd9dad4-2345-4751-8275-70cbfea02a6e;
 Mon, 28 Sep 2020 11:56:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qU6o4rD2OPo/GwjNYFgIKuN2UA9NlmxM8se1lSasnwM=;
 b=FS+LH0sTGB5EgEi7oHKTbfGNMRXBM/5A/hMkU96Q5SPTx7zB8j5PZQQPJPpK6Ub7zLrqz8
 SPs6TcoIZuZybfNoug6tkesAOhgWJIRc2PQlsmWvPko2XL3LlDHyxgA+LCzo1hEP0r7Z/d
 jPKsK33yT1YASNdaJ1RHZfRGhQSSTT8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5BFBAC97;
 Mon, 28 Sep 2020 11:56:12 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/mm: {paging,sh}_{cmpxchg,write}_guest_entry()
 adjustments
Message-ID: <a7d93ec1-ed89-fbdb-1b52-4091870f7fab@suse.com>
Date: Mon, 28 Sep 2020 13:56:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

1: {paging,sh}_{cmpxchg,write}_guest_entry() cannot fault
2: remove some indirection from {paging,sh}_cmpxchg_guest_entry()

Jan

