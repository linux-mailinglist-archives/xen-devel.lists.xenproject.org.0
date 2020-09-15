Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B99269DC1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 07:19:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI3M4-0004fb-IQ; Tue, 15 Sep 2020 05:18:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pJ4M=CY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kI3M3-0004fW-2d
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 05:18:11 +0000
X-Inumbo-ID: 1355edfa-c875-4b23-bb49-3907445b6956
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1355edfa-c875-4b23-bb49-3907445b6956;
 Tue, 15 Sep 2020 05:18:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7389BAC85;
 Tue, 15 Sep 2020 05:18:24 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: libxenguest and xenguest.h
Message-ID: <7995d80f-336a-90a3-f431-b18748fbcff5@suse.com>
Date: Tue, 15 Sep 2020 07:18:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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

Andy has reported a libxenguest related build failure of qemu when
building qemu outside the Xen build environment. Problem is xenguest.h
now including xenctrl_dom.h, which is including xen/libelf/libelf.h.

The underlying problem is that libxenguest is basically offering some
"official" functions via xenguest.h, while some other functions are
only Xen internally usable and are defined in xenctrl_dom.h.

This is a rather weird construction and I'm seeing the following
solutions:

1. Make xen/include/xen/libelf.h a public header (or split the parts
    needed by xenguest.h into a public header)

2. Reflect the two parts of libxenguest by carving out the xenctrl_dom.h
    defined parts into a new library not made public

3. Make the xenctrl_dom.h interfaces internal again by not adding it to
    the installed headers

While variant 3 seems to be the easiest one I'd prefer variant 1.
Variant 2 seems to add complexity without any real gain IMO.

Thoughts?


Juergen

