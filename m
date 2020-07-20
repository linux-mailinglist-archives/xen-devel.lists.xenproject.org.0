Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805C922634F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 17:29:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxXil-0003T8-VR; Mon, 20 Jul 2020 15:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxXij-0003T3-UC
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 15:28:49 +0000
X-Inumbo-ID: b502edba-ca9d-11ea-9fc5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b502edba-ca9d-11ea-9fc5-12813bfff9fa;
 Mon, 20 Jul 2020 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595258928;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dHkoChAb7fbL9I2v1zRaA2LTj9xG8/LBS67LHiUSLVU=;
 b=EuDAFR34NnElUE6ynL4NU4mlzfN3IV+ek6ZcgRjdA1aNngosI2d5EIDF
 qUwgD36JjSgyV6K2H2R+g8ynCdGGLXLsJ8FoWRWQx5vkwjAljwjeERRqX
 YDTCzvskwSmKJZtgrqvmml/bOJV3zx2yVwYbdbGBG63JSGYFx0OilSiSt s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: E/KP/Tzve8NqTkwIRxA2gIUDMfLET6xYCGtDmozU41iJ0P858ydhiU13QJiNDAel4nTItjGPAv
 KSz1dy+D2e3eX1peVF+JbYKBj1iAluMtVqWEi3wK0xXO2mna0xq70n4oIfJkMiCPmr46Hret+T
 udbdAZmDP2lq4LMEQgw8rD/WKPac5TcUH1prg0XF4wgqB1x5bpCkPWFpxK+kFNC7ObtMgeihiS
 A+jAqIZO3jOeF3uTRYMFCKB0EKJBgEg+UrqbtZi3b0Ud5y4wvNSsdYZshGSSChv7D23znxLVe0
 ZGI=
X-SBRS: 2.7
X-MesageID: 22960947
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,375,1589256000"; d="scan'208";a="22960947"
Subject: Re: [PATCH v3 1/2] x86: restore pv_rtc_handler() invocation
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <7dd4b668-06ca-807a-9cc1-77430b2376a8@suse.com>
 <20200715121347.GY7191@Air-de-Roger>
 <2b9de0fd-5973-ed66-868c-ffadca83edf3@suse.com>
 <20200715133217.GZ7191@Air-de-Roger>
 <cd08f928-2be9-314b-56e6-bb414247caff@suse.com>
 <20200715145144.GA7191@Air-de-Roger>
 <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <01509d7d-4cf3-7f3f-4aa1-eaa3b1d3b95b@citrix.com>
Date: Mon, 20 Jul 2020 16:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ff1926c7-cc21-03ad-1dff-53c703450151@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/07/2020 11:06, Jan Beulich wrote:
> ACCESS_ONCE() guarantees single access, but doesn't guarantee that
> the compiler wouldn't split this single access into multiple insns.

ACCESS_ONCE() does guarantee single accesses for any natural integer size.

There is a section about this specifically in Linux's
memory-barriers.txt, and this isn't the first time I've pointed it out...

~Andrew

