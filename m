Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255541F54D5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:30:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jizrW-0002ih-Nh; Wed, 10 Jun 2020 12:29:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5j5l=7X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jizrV-0002ic-JY
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:29:45 +0000
X-Inumbo-ID: 10915074-ab16-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10915074-ab16-11ea-bb8b-bc764e2007e4;
 Wed, 10 Jun 2020 12:29:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zNvT3uzA0kVAVLBEeY34utxRwCnHLzNGmo4G0li/n0u+d7uCwIo7F2Q638txAkGXMpRDYaRs9+
 3rQiHFLzvSr1YkkKnxCSriPiyTkTZ4G/Al9+pbtIeLo/YWrURnavp9pNHnQv8zjYKb5Ewhm6Kl
 grJUW8HuGDTtu6Vv57VajCapwgO5e/G/rOZlq9i9LjTnpxL+A13eXSvvw7/Z5CEp58Tr/ULcBK
 X/Z1FqeJO1mWX1XNxP+ssRU/ZCtkDDsccuZ5eqUhDKS5Fa95tcq+LCzu6HXvemMxnc+gPLcGqH
 TLk=
X-SBRS: 2.7
X-MesageID: 19918615
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="19918615"
Subject: Re: [PATCH for-4.14 1/2] x86/passthrough: do not assert edge
 triggered GSIs for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200610115103.7592-1-roger.pau@citrix.com>
 <20200610115103.7592-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d8c8f0a7-3e89-869d-6351-028c65be5954@citrix.com>
Date: Wed, 10 Jun 2020 13:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610115103.7592-2-roger.pau@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10/06/2020 12:51, Roger Pau Monne wrote:
> Edge triggered interrupts do not assert the line, so the handling done
> in Xen should also avoid asserting it. Asserting the line prevents
> further edge triggered interrupts on the same vIO-APIC pin from being
> delivered, since the line is not de-asserted.
>
> One case of such kind of interrupt is the RTC timer, which is edge
> triggered and available to a PVH dom0. Note this should not affect
> domUs, as it only modifies the behavior of IDENTITY_GSI kind of passed
> through interrupts.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

