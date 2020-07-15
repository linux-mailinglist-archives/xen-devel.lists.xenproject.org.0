Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD9220A01
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:30:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvef9-0008UM-ET; Wed, 15 Jul 2020 10:29:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvef8-0008UH-7t
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:29:18 +0000
X-Inumbo-ID: 092c57ee-c686-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 092c57ee-c686-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 10:29:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7728B57B;
 Wed, 15 Jul 2020 10:29:19 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] x86: build adjustments
Message-ID: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Date: Wed, 15 Jul 2020 12:29:17 +0200
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is in part a just loosely connected set of changes in particular
aiming at further shim binary reduction.

Patch 3 depends functionally (but not contextually in any way) on the
previously submitted "x86/shadow: dirty VRAM tracking is needed for
HVM only". But I could imagine anyway that this ends up being the most
controversial part of the series.

1: x86/EFI: sanitize build logic
2: x86: don't build with EFI support in shim-exclusive mode
3: x86: shrink struct arch_{vcpu,domain} when !HVM
4: Arm: prune #include-s needed by domain.h
5: bitmap: move to/from xenctl_bitmap conversion helpers
6: x86: move domain_cpu_policy_changed()
7: x86: move cpu_{up,down}_helper()
8: x86: don't include domctl and alike in shim-exclusive builds

Jan

