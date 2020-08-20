Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A824C340
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 18:19:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8nGD-00033t-ED; Thu, 20 Aug 2020 16:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJFq=B6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k8nGB-00033o-TQ
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 16:17:51 +0000
X-Inumbo-ID: b3ffa067-937c-4dd7-93f5-70739e3f421e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3ffa067-937c-4dd7-93f5-70739e3f421e;
 Thu, 20 Aug 2020 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597940270;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ruOMRqUQggfMWA9f3X++82GSUBfh1Y8fAtOadnlEl3k=;
 b=HMhzDDPuP93BzqXcaENBg5pKrXSZnyVes5RCJwzMgHOy1eP9Qp+3fh/J
 ObWZmacpHAHYEmNuvHDnHXDaHVwFuGdFe3LOyX4UHmnrYNYVLg9LMXHiS
 uVGMSD57fKvjvTCjzIuwjkwbbPkOJdvW1E8ID1EroMc1GixweU/upAw/d M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9SBZd/f12DNi2X1pe5Qgw6j3PTaY/MP8npqmxdrQ/LmPTwIVeAKkcrNV9tObBI4w6Ba0xTM+jf
 xRDCOTlaHsRsHJ+WEFEEoi3ZNaPdd4yM74gFCslkuwgaqVT9rGtYyeWaEoOGpBsIRfvw+OUfeG
 JCVeen7JwdNZcgT3eNXqxEOOprxGKiJ1i1W75K2pUPhCAJmPyAaWLu+ZK9KmjX34Z0eplh04Ii
 pxoZsw/d29E79kXZ4OmeF/ZeN8VThglfPiHhFmICmn1ddV2Szm3C1TnFvqi5waQHjnlhWG7zDD
 xfo=
X-SBRS: 2.7
X-MesageID: 25299457
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25299457"
Subject: Re: [PATCH 1/2] x86/vpic: rename irq to pin in vpic_ioport_write
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1f56e268-315f-ca22-17cb-45396f5d74e7@citrix.com>
Date: Thu, 20 Aug 2020 17:17:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820153442.28305-2-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/08/2020 16:34, Roger Pau Monne wrote:
> The irq variable is wrongly named, as it's used to store the pin on
> the 8259 chip, but not the global irq value. While renaming reduce
> it's scope and make it unsigned.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

