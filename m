Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C43B22B2DA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:46:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydPS-0005so-IY; Thu, 23 Jul 2020 15:45:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jydPQ-0005si-Q7
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:45:24 +0000
X-Inumbo-ID: 8581ad32-ccfb-11ea-873e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8581ad32-ccfb-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:45:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 717ADAC82;
 Thu, 23 Jul 2020 15:45:31 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/8] x86: compat header generation and checking adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Date: Thu, 23 Jul 2020 17:45:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
struct xen_mem_acquire_resource"), we're not currently handling structs
correctly that have uint64_aligned_t fields. Patch 2 demonstrates that
there was also an issue with XEN_GUEST_HANDLE_64().

1: x86: fix compat header generation
2: x86/mce: add compat struct checking for XEN_MC_inject_v2
3: x86/mce: bring hypercall subop compat checking in sync again
4: x86/dmop: add compat struct checking for XEN_DMOP_map_mem_type_to_ioreq_server
5: evtchn: add compat struct checking for newer sub-ops
6: x86: generalize padding field handling
7: flask: drop dead compat translation code
8: x86: only generate compat headers actually needed

v3: Build fix for old gcc in patch 1. New patch 5.

Jan

