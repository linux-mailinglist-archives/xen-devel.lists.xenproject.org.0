Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEE1ED79A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 22:47:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgaHH-0002pM-CS; Wed, 03 Jun 2020 20:46:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnF2=7Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgaHF-0002pH-Px
 for xen-devel@lists.xen.org; Wed, 03 Jun 2020 20:46:21 +0000
X-Inumbo-ID: 47119d10-a5db-11ea-adaf-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47119d10-a5db-11ea-adaf-12813bfff9fa;
 Wed, 03 Jun 2020 20:46:20 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZEa2eF+s/eaIrs3thAnFPIjtP2GgNPrHpZ2geRiHgP3i9ORY3LjT0Z1DZdhMB0Bs0xLKnfEAyA
 DurC/XM+xhBC+/tT7TNx1/o24bs/hu+kMh1VEor0x9YW30LQJ4kHvRGA8bof/xkcsdZb18Bjxo
 SH06ymt2caW+StrAiNPbNJH/3zZ4ftdh9tk152jO6F/IJWi03fQUNNZ2+Fm/L/yhk0y3+C3E99
 qP7oB33MvEE8kLeNxsd/bmawkZG1Ml+vARc4YBIpElE4XG6H5NidHlt7Tvo36K+RkLyKoqM6f5
 NTo=
X-SBRS: 2.7
X-MesageID: 19185429
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,469,1583211600"; d="scan'208";a="19185429"
Subject: Re: [XTF] xenbus: fix xenbus_write() ring overflow
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20200603082141.42683-1-wipawel@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <75f655aa-6bea-cfe9-84de-bd4ef0195ab3@citrix.com>
Date: Wed, 3 Jun 2020 21:46:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603082141.42683-1-wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: julien@xen.org, wipawel@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/06/2020 09:21, Pawel Wieczorkiewicz wrote:
> Currently the xenbus_write() does not handle ring wrapping around
> correctly. When ring buffer is almost full and there is not enough
> space for next packet (e.g. there is 12 bytes of space left, but the
> packet header needs to transmit 16 bytes) the memcpy() goes out of the
> ring buffer boundry.
> Instead, the part variable should be limited to the space available in
> the ring buffer, so the memcpy() can fill up the buffer, update len
> variable (to indicate that there is still some data to be copied) and
> thereby the xenbus_write() loop can iterate again to finish copying
> the remainder of data to the beginning of the ring buffer.
>
> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>

Oops.  Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and pushed.

