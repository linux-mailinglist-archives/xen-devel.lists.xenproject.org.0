Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AE923EC85
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 13:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k40Zm-00077Q-Pc; Fri, 07 Aug 2020 11:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k40Zl-00077K-Ga
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 11:30:17 +0000
X-Inumbo-ID: 559e7006-e16d-4e6a-96fa-51d7cf011199
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 559e7006-e16d-4e6a-96fa-51d7cf011199;
 Fri, 07 Aug 2020 11:30:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E928DAD60;
 Fri,  7 Aug 2020 11:30:33 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/7] x86: build adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
Date: Fri, 7 Aug 2020 13:30:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a in part just loosely connected set of changes in particular
aiming at further shim size binary reduction.

One patch of v1 did go in. Besides the dropping of that one, there
was a small adjustment to what is now patch 4 (based on feedback) and
I did notice an omission in patch 1.

1: x86/EFI: sanitize build logic
2: x86: don't build with EFI support in shim-exclusive mode
3: x86: shrink struct arch_{vcpu,domain} when !HVM
4: bitmap: move to/from xenctl_bitmap conversion helpers
5: x86: move domain_cpu_policy_changed()
6: x86: move cpu_{up,down}_helper()
7: x86: don't include domctl and alike in shim-exclusive builds

Jan

