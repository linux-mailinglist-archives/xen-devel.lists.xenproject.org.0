Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A41DBA40
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 18:52:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbRwk-0005Ve-1X; Wed, 20 May 2020 16:51:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbRwi-0005VY-LU
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 16:51:56 +0000
X-Inumbo-ID: 3649bdb8-9aba-11ea-aa4d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3649bdb8-9aba-11ea-aa4d-12813bfff9fa;
 Wed, 20 May 2020 16:51:55 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LijN6eRsVk4qRDzaB7Cgb3Y+TEBp7oqqgC4EbXBnSwREU68jJYVQcphcAH/9A2p5QFEwV+DolS
 pMhk+65xjIeCPZSrhiCzVFGxGz0djXnPkZCeS6l024ecfS/Y9WcDn1diiLmauts5molnya+K5q
 np+TJTKs9ILt0odvu63bXafPvYpWY+EHxOHyqHYg7bhUxePviG3OBh6kPIoPcHWgsXN4NId9Bl
 ycUkP1uuc+0UVC/4y+T32Us93nfGHvKfJZ584+sYjVpKcTOzRrMxgMgCcnw9sXI1onq0pN7mGN
 boQ=
X-SBRS: 2.7
X-MesageID: 18274377
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18274377"
Subject: Re: [PATCH] VT-x: extend LBR Broadwell errata coverage
To: Jan Beulich <jbeulich@suse.com>
References: <df6e8dad-b4c0-0821-46eb-e4aa86f8ccfa@suse.com>
 <e107f97b-4bb7-31ee-20d1-ddf8f7e00c21@citrix.com>
 <c193aaec-cebc-ca0b-88f9-aabfca6b988a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <7f5f70ff-7f30-b7db-eb51-c2f2df9ce58a@citrix.com>
Date: Wed, 20 May 2020 17:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c193aaec-cebc-ca0b-88f9-aabfca6b988a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 16:56, Jan Beulich wrote:
> On 20.05.2020 16:07, Andrew Cooper wrote:
>> On 20/05/2020 13:52, Jan Beulich wrote:
>>> @@ -2895,15 +2897,26 @@ static void __init lbr_tsx_fixup_check(v
>>>  static void __init bdf93_fixup_check(void)
>> Seeing as this is no longer just BDF93, how about ler_tsx_fixup_check() ?
> I did consider renaming, and didn't do so just because this would
> grow the patch size quite a bit.

I don't see that as a problem.

> I'm fine doing so, but with the
> name you suggest, is this one really as directly TSX related as the
> other one? I had thought of something like lbr_bdw_fixup_check().

The errata wording doesn't mention TSX, but the breakage manifests in
the same way, with bits 61 and 62 clear but hardware expecting to see a
canonicalised value on restore.

Also, it is very specifically LER-from which gets clobbered, rather than
any of the regular LBR registers.

I'm not overly fussed what the naming is, but it oughtn't to include
bdf93 any more, now the scope of the workaround has been extended.

~Andrew

