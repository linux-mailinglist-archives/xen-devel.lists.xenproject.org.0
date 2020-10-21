Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC245295008
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 17:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10099.26637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVG5t-0002Dm-Uv; Wed, 21 Oct 2020 15:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10099.26637; Wed, 21 Oct 2020 15:32:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVG5t-0002DN-Rp; Wed, 21 Oct 2020 15:32:05 +0000
Received: by outflank-mailman (input) for mailman id 10099;
 Wed, 21 Oct 2020 15:32:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVG5s-0002DI-Ay
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:32:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22f8f12e-e119-49f7-9847-ea6e5094a216;
 Wed, 21 Oct 2020 15:32:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVG5s-0002DI-Ay
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 15:32:04 +0000
X-Inumbo-ID: 22f8f12e-e119-49f7-9847-ea6e5094a216
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 22f8f12e-e119-49f7-9847-ea6e5094a216;
	Wed, 21 Oct 2020 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603294322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZXd/UgLZ6xf6qq2Ng9dV8Ey1NbP3sb1HXy/BnQTzX7M=;
  b=W6VE2ElxfqnfF8qf+RRfzS2s0mHdEVGcLD7DtfKzNgFW/eLqzfpbaaaH
   kVWxN8HBIhOt9QRvRXMTxeT7KC6YEuTGe1UjAmUO8rAWQ80OWv7iMzs7z
   /A2j5a0MXpSh1xjXCl/Hqlfr3DK7uW08dlx42io5+zmHJGbGerrHE8mqJ
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZLxZ4n7eINdDjoDDUkyYUGTpWa6NUq0P9PdY1JhgxuqAeYDVHvflGBfwPVn9K/ElPLEZJAZO5c
 oYAga1AI0p04oy3Yin5yehLMb6H3TiwDNxQS6NuLm+4boi7Mm+ktJTdqObD12alE3Oa4WKH3UX
 YTjeKSucVkli9y90xGIrtgbvZRhdPn1ywbPWOrkEmeJjFeic3U/tevFZGh4J8KeXYwYodfwnFv
 FWfuFe+jeAfc/kLij4r8l3pY3TZDzrI9/XLJ1F6rtrd2MZsY3CSIimX0xjAabcGySqexXy+rtj
 vTo=
X-SBRS: 2.5
X-MesageID: 29550127
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29550127"
Date: Wed, 21 Oct 2020 17:23:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/mm: avoid playing with directmap when self-snoop can
 be relied upon
Message-ID: <20201021152321.cw6sdx3biyc2pmtx@Air-de-Roger>
References: <33f7168c-b177-eed5-14e8-5e7a38dee853@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33f7168c-b177-eed5-14e8-5e7a38dee853@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Oct 20, 2020 at 03:51:18PM +0200, Jan Beulich wrote:
> The set of systems affected by XSA-345 would have been smaller is we had
> this in place already: When the processor is capable of dealing with
> mismatched cacheability, there's no extra work we need to carry out.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I guess it's not worth using the alternative framework to patch this
up at boot in order to avoid the call in the first place?

Thanks, Roger.

