Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68E930DD55
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 15:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80945.148534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7JYm-0006v0-2e; Wed, 03 Feb 2021 14:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80945.148534; Wed, 03 Feb 2021 14:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7JYl-0006ub-Vl; Wed, 03 Feb 2021 14:55:11 +0000
Received: by outflank-mailman (input) for mailman id 80945;
 Wed, 03 Feb 2021 14:55:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7JYk-0006uW-N6
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 14:55:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bcce33f-7796-4242-bc5a-c16df0dc54c8;
 Wed, 03 Feb 2021 14:55:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C483AAE6D;
 Wed,  3 Feb 2021 14:55:07 +0000 (UTC)
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
X-Inumbo-ID: 0bcce33f-7796-4242-bc5a-c16df0dc54c8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612364107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SntCOdyyskzW/9ObliyAk5eMBZG7C/pk/M+C03zFZNw=;
	b=S+MGHl0ZHHfRM6cUlBYzapI6gXyj/N3tMhNbac4YIKCqIPUvmWLjEj8waLxUiXG3z6tFkm
	t8M0qzPNhj29Zw2jMZ+EgMSYs/GMEvjSgXY08kXlSAyuwuup6cJ+gE/8LTWUSDv3zjNDQX
	sYLxHA5gm0x5uNchb3SjD0W+N/2PG9I=
Subject: Re: VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
To: James Dingwall <james-xen@dingwall.me.uk>
References: <20210201152655.GA3922797@dingwall.me.uk>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d30b5ee3-1fd9-a64b-1d9a-f79b6b333169@suse.com>
Date: Wed, 3 Feb 2021 15:55:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201152655.GA3922797@dingwall.me.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.02.2021 16:26, James Dingwall wrote:
> I am building the xen 4.11 branch at 
> 310ab79875cb705cc2c7daddff412b5a4899f8c9 which includes commit 
> 3b5de119f0399cbe745502cb6ebd5e6633cc139c "86/msr: fix handling of 
> MSR_IA32_PERF_{STATUS/CTL}".  I think this should address this error 
> recorded in xen's dmesg:
> 
> (XEN) d11v0 VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0

It seems to me that you imply some information here which might
better be spelled out. As it stands I do not see the immediate
connection between the cited commit and the crash. C0000096 is
STATUS_PRIVILEGED_INSTRUCTION, which to me ought to be impossible
for code running in ring 0. Of course I may simply not know enough
about modern Windows' internals to understand the connection.

> I have removed `viridian = [..]` from the xen config nut still get this 
> reliably when launching PassMark Performance Test and it is collecting 
> CPU information.
> 
> This is recorded in the domain qemu-dm log:
> 
> 21244@1612191983.279616:xen_platform_log xen platform: XEN|BUGCHECK: ====>
> 21244@1612191983.279819:xen_platform_log xen platform: XEN|BUGCHECK: SYSTEM_SERVICE_EXCEPTION: 00000000C0000096 FFFFF800A43C72C5 FFFFD0014343D580 0000000000000000
> 21244@1612191983.279959:xen_platform_log xen platform: XEN|BUGCHECK: EXCEPTION (FFFFF800A43C72C5):
> 21244@1612191983.280075:xen_platform_log xen platform: XEN|BUGCHECK: - Code = C148320F
> 21244@1612191983.280205:xen_platform_log xen platform: XEN|BUGCHECK: - Flags = 0B4820E2
> 21244@1612191983.280346:xen_platform_log xen platform: XEN|BUGCHECK: - Address = 0000A824948D4800
> 21244@1612191983.280504:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[0] = 8B00000769850F07
> 21244@1612191983.280633:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[1] = 46B70F4024448906
> 21244@1612191983.280754:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[2] = 0F44442444896604
> 21244@1612191983.280876:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[3] = E983C88B410646B6
> 21244@1612191983.281012:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[4] = 0D7401E9831E7401
> 21244@1612191983.281172:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[5] = 54B70F217502F983
> 21244@1612191983.281304:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[6] = 54B70F15EBED4024
> 21244@1612191983.281426:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[7] = EBC0B70FED664024
> 21244@1612191983.281547:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[8] = 0FEC402454B70F09
> 21244@1612191983.281668:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[9] = 448B42244489C0B6
> 21244@1612191983.281809:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[10] = 2444B70F06894024
> 21244@1612191983.281932:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[11] = 4688440446896644
> 21244@1612191983.282052:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[12] = 0000073846C74906
> 21244@1612191983.282185:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[13] = F8830000070AE900
> 21244@1612191983.282340:xen_platform_log xen platform: XEN|BUGCHECK: - Parameter[14] = 8B000006F9850F07
> 21244@1612191983.282480:xen_platform_log xen platform: XEN|BUGCHECK: EXCEPTION (0000A824848948C2):
> 21244@1612191983.282617:xen_platform_log xen platform: XEN|BUGCHECK: CONTEXT (FFFFD0014343D580):
> 21244@1612191983.282717:xen_platform_log xen platform: XEN|BUGCHECK: - GS = 002B
> 21244@1612191983.282816:xen_platform_log xen platform: XEN|BUGCHECK: - FS = 0053
> 21244@1612191983.282914:xen_platform_log xen platform: XEN|BUGCHECK: - ES = 002B
> 21244@1612191983.283011:xen_platform_log xen platform: XEN|BUGCHECK: - DS = 002B
> 21244@1612191983.283127:xen_platform_log xen platform: XEN|BUGCHECK: - SS = 0018
> 21244@1612191983.283226:xen_platform_log xen platform: XEN|BUGCHECK: - CS = 0010
> 21244@1612191983.283332:xen_platform_log xen platform: XEN|BUGCHECK: - EFLAGS = 00000202
> 21244@1612191983.283444:xen_platform_log xen platform: XEN|BUGCHECK: - RDI = 00000000F64D5C20
> 21244@1612191983.283555:xen_platform_log xen platform: XEN|BUGCHECK: - RSI = 00000000F6367280
> 21244@1612191983.283666:xen_platform_log xen platform: XEN|BUGCHECK: - RBX = 000000008011E060
> 21244@1612191983.283810:xen_platform_log xen platform: XEN|BUGCHECK: - RDX = 00000000F64D5C20
> 21244@1612191983.283972:xen_platform_log xen platform: XEN|BUGCHECK: - RCX = 0000000000000199
> 21244@1612191983.284350:xen_platform_log xen platform: XEN|BUGCHECK: - RAX = 0000000000000004
> 21244@1612191983.284523:xen_platform_log xen platform: XEN|BUGCHECK: - RBP = 000000004343E891
> 21244@1612191983.284658:xen_platform_log xen platform: XEN|BUGCHECK: - RIP = 00000000A43C72C5
> 21244@1612191983.284842:xen_platform_log xen platform: XEN|BUGCHECK: - RSP = 000000004343DFA0
> 21244@1612191983.284959:xen_platform_log xen platform: XEN|BUGCHECK: - R8 = 0000000000000008
> 21244@1612191983.285073:xen_platform_log xen platform: XEN|BUGCHECK: - R9 = 000000000000000E
> 21244@1612191983.285188:xen_platform_log xen platform: XEN|BUGCHECK: - R10 = 0000000000000002
> 21244@1612191983.285304:xen_platform_log xen platform: XEN|BUGCHECK: - R11 = 000000004343E808
> 21244@1612191983.285420:xen_platform_log xen platform: XEN|BUGCHECK: - R12 = 0000000000000000
> 21244@1612191983.285564:xen_platform_log xen platform: XEN|BUGCHECK: - R13 = 00000000F7964E50
> 21244@1612191983.285680:xen_platform_log xen platform: XEN|BUGCHECK: - R14 = 00000000F64D5C20
> 21244@1612191983.285796:xen_platform_log xen platform: XEN|BUGCHECK: - R15 = 00000000F7964E50

I'm also confused by this - the pointer given for CONTEXT suggests this
is a 64-bit kernel, yet none of the registers - including RIP and RSP -
have non-zero upper 32 bits. Or is qemu truncating these values?

> 21244@1612191983.285888:xen_platform_log xen platform: XEN|BUGCHECK: STACK:
> 21244@1612191983.286105:xen_platform_log xen platform: XEN|BUGCHECK: 000000004343E810: (0000000000000000 000000004343E891 0000000000000002 00000000F75F08A0) ntoskrnl.exe + 0000000000485507
> 21244@1612191983.286340:xen_platform_log xen platform: XEN|BUGCHECK: 000000004343E8E0: (00000000F75F0805 000000004343EB80 00000000F6A62CC0 00000000F75F08A0) ntoskrnl.exe + 0000000000486468
> 21244@1612191983.286547:xen_platform_log xen platform: XEN|BUGCHECK: 000000004343EA20: (0000000000000000 0000000000000000 0000000000000000 0000000000000000) ntoskrnl.exe + 0000000000458CAE
> 21244@1612191983.286755:xen_platform_log xen platform: XEN|BUGCHECK: 000000004343EA90: (0000000000000000 0000000000000000 000000007DBED000 000000007DA00028) ntoskrnl.exe + 00000000001501A3
> 21244@1612191983.286976:xen_platform_log xen platform: XEN|BUGCHECK: 0000000009ABE388: (00000000587D5673 0000000058F40000 0000000006002D2B 0000000000000000) 00007FFB5B3207CA
> 21244@1612191983.287171:xen_platform_log xen platform: XEN|BUGCHECK: 0000000009ABE390: (0000000058F40000 0000000006002D2B 0000000000000000 00000000160C86D8) 00007FFB587D5673
> 21244@1612191983.287390:xen_platform_log xen platform: XEN|BUGCHECK: 0000000009ABE398: (0000000006002D2B 0000000000000000 00000000160C86D8 0000000009ABE3E0) 00007FFB58F40000
> 21244@1612191983.287584:xen_platform_log xen platform: XEN|BUGCHECK: 0000000009ABE3A0: (0000000000000000 00000000160C86D8 0000000009ABE3E0 000000008011E060) 00007FFB06002D2B
> 21244@1612191983.287777:xen_platform_log xen platform: XEN|BUGCHECK: 0000000009ABE3A8: (00000000160C86D8 0000000009ABE3E0 000000008011E060 0000000009ABE4A0) 0000000000000000
> 21244@1612191983.287898:xen_platform_log xen platform: XEN|BUGCHECK: <====
> 
> The Windows guest is running winpv drivers 8.2.1.
> 
> I'm not quite sure what else to examine or change at this point so any 
> guidance would be welcome.

The hypervisor log (at maximum log levels) accompanying this might
help some. And of course, if possible, trying on a newer Xen (ideally
current master).

Jan

