Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C085D2613B9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfoe-0004U0-Ez; Tue, 08 Sep 2020 15:45:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Jy8=CR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kFfoc-0004Tu-QX
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:45:50 +0000
X-Inumbo-ID: 4baa2a31-a593-4f2e-a76e-6c06149970c6
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4baa2a31-a593-4f2e-a76e-6c06149970c6;
 Tue, 08 Sep 2020 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599579949;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fTscJUmbozw5vDn0jen5jF8+aYJ2j5DcTbX7RvXHl1Q=;
 b=P94xU1IJP/Po3SfEXKp8phxmw0BJ0tCBq+jPof42iaOnqlPL1x7W1g3S
 90kkp0TjS4EUEcOkE2wxN/UMSVz2IZwdjgNVPgHrPJp6XYFWsqPKPEFgr
 L5WDzv0mif8xPX3aWRAMJ3nd08hoijNJGVyuz/TYo+Txg7H11M31hYqJ3 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: s/G0bzPD39pvjozBwgb4BDpcEeMA5urxzjmG4xdEB8lC5k7lWnpA+EOJI4l8kvW091kN3TINrk
 imZ9yH7FBqnG8PAfX7qmCzQZ7AKFNljJUdjr+MgRtJSRujcZrT/XOhKlnaCtNAYX+lHUKdUiGZ
 aniU74wbDsd7vapQx6c6Gh3DDspiTj96/PjWEV/9S3+wnNYVT+udxpFI1U7d/o3ks4iQQrmkNJ
 M4MNXB54/VZXSAV2RBCkkTW60Gbz6CbzOhlxjG2P1AnXBdwXBrjk+fb1EPPNPIwYN+7yO2XWOH
 H3E=
X-SBRS: 2.7
X-MesageID: 26506787
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,406,1592884800"; d="scan'208";a="26506787"
Subject: Re: [PATCH v2] x86/pv: Fix assertions in svm_load_segs()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200908150849.5699-1-andrew.cooper3@citrix.com>
 <f5b5d072-f493-c83a-359b-9ac4875ca8a0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <00f0c830-1c64-73df-2194-0c7cff76e9cd@citrix.com>
Date: Tue, 8 Sep 2020 16:45:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f5b5d072-f493-c83a-359b-9ac4875ca8a0@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 08/09/2020 16:36, Jan Beulich wrote:
> On 08.09.2020 17:08, Andrew Cooper wrote:
>> OSSTest has shown an assertion failure:
>> http://logs.test-lab.xenproject.org/osstest/logs/153906/test-xtf-amd64-amd64-1/serial-rimava1.log
>>
>> This is because we pass a non-NUL selector into svm_load_segs(), which is
>> something we must not do, as this path does not load the attributes/limit from
>> the GDT/LDT.
>>
>> Drop the {gs,gs}_sel parameters from svm_load_segs() and use 0 instead.  This
> Nit: {fs,gs}

Yeah - I noticed and fixed immediately after sending.  Also a plural
issue in the previous paragraph.

>
>> is fine even for non-zero NUL segments, as it is how the IRET instruction
>> behaves in all CPUs.
> To be honest, I'd not call it "fine", but "acceptable".

Ok.

> (And I don't consider IRET's behavior "fine" either.)

Nor me, but I'll happily use it to simplify our logic.

>> Only use the svm_load_segs() path when FS and GS are NUL, which is the common
>> case when scheduling a 64bit vcpu with 64bit userspace in context.
>>
>> Fixes: ad0fd291c5 ("x86/pv: Rewrite segment context switching from scratch")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

