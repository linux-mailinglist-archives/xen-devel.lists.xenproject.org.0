Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27224FDC3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:28:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABZr-0003wG-Pu; Mon, 24 Aug 2020 12:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kABZq-0003wA-38
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:27:54 +0000
X-Inumbo-ID: cc517e72-a539-46a1-9654-931d1de19a06
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc517e72-a539-46a1-9654-931d1de19a06;
 Mon, 24 Aug 2020 12:27:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B0FBAE91;
 Mon, 24 Aug 2020 12:28:22 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/5] x86: M2P maintenance adjustments (step 1)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
Date: Mon, 24 Aug 2020 14:27:50 +0200
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As pointed out by Andrew, maintaining the compat M2P when !PV32
(or when "pv=no-32" was given) is a pointless waste of memory. Do
away with this, with a possible plan to subsequently use the
compat instance instead of the native one in shim mode with a
32-bit guest (requiring more intrusive rework, in particular to
delay setting up the M2P until the bitness of the client domain
is known).

1: convert set_gpfn_from_mfn() to a function
2: don't maintain compat M2P when !PV32
3: don't override INVALID_M2P_ENTRY with SHARED_M2P_ENTRY
4: PV: also check kernel endianness when building Dom0
5: simplify is_guest_l2_slot()

Jan

