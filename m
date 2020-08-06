Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2320723D881
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3c6h-00027c-Vg; Thu, 06 Aug 2020 09:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3c6g-00027W-IW
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:22:38 +0000
X-Inumbo-ID: e5ffe48a-864c-4d38-83c4-ed66759bb9ec
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5ffe48a-864c-4d38-83c4-ed66759bb9ec;
 Thu, 06 Aug 2020 09:22:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 727E4B65C;
 Thu,  6 Aug 2020 09:22:54 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86: M2P maintenance adjustments (step 1)
Message-ID: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
Date: Thu, 6 Aug 2020 11:22:39 +0200
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

As pointed out by Andrew, maintaining the compat M2P when !PV32
(or when "pv=no-32" was given) is a pointless waste of memory. Do
away with this, with a possible plan to subsequently use the
compat instance instead of the native one in shim mode with a
32-bit guest (requiring more intrusive rework, in particular to
delay setting up the M2P until the bitness of the client domain
is known).

1: slightly re-arrange 32-bit handling in dom0_construct_pv()
2: don't maintain compat M2P when !PV32
3: don't override INVALID_M2P_ENTRY with SHARED_M2P_ENTRY

Jan

