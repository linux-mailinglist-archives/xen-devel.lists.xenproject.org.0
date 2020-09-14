Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A2268B1E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 14:37:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHnjW-0001X7-Ha; Mon, 14 Sep 2020 12:37:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHnjV-0001X2-GY
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 12:37:21 +0000
X-Inumbo-ID: f704f0a4-ea70-49a1-b915-aa760b96f405
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f704f0a4-ea70-49a1-b915-aa760b96f405;
 Mon, 14 Sep 2020 12:37:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58736AF59;
 Mon, 14 Sep 2020 12:37:35 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86: shim building adjustments
Message-ID: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
Date: Mon, 14 Sep 2020 14:37:18 +0200
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

The first change is simply addressing a build issue noticed by
Andrew. The build breakage goes beyond this specific combination
though - PV_SHIM_EXCLUSIVE plus HVM is similarly an issue. This
is what the last patch tries to take care of, in a shape already
on irc noticed to be controversial. I'm submitting the change
nevertheless because for the moment there looks to be a majority
in favor of going this route. One argument not voiced there yet:
What good does it do to allow a user to enable HVM when then on
the resulting hypervisor they still can't run HVM guests (for
the hypervisor still being a dedicated PV shim one). On top of
this, the alternative approach is likely going to get ugly.

1: fix build with PV_SHIM_EXCLUSIVE and SHADOW_PAGING
2: adjust Kconfig defaults
3: don't permit HVM and PV_SHIM_EXCLUSIVE at the same time

Jan

