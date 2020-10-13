Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326828CCAC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 13:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6165.16281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIfL-0001SY-9s; Tue, 13 Oct 2020 11:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6165.16281; Tue, 13 Oct 2020 11:40:27 +0000
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
	id 1kSIfL-0001SD-6V; Tue, 13 Oct 2020 11:40:27 +0000
Received: by outflank-mailman (input) for mailman id 6165;
 Tue, 13 Oct 2020 11:40:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSIfJ-0001S8-D2
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:40:25 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7705070-58ea-4cd6-9dbd-aef777ae3196;
 Tue, 13 Oct 2020 11:40:24 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ben2=DU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSIfJ-0001S8-D2
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:40:25 +0000
X-Inumbo-ID: b7705070-58ea-4cd6-9dbd-aef777ae3196
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b7705070-58ea-4cd6-9dbd-aef777ae3196;
	Tue, 13 Oct 2020 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602589224;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=DfFjamiCwUGrGtEMDDzqdikRn14ktCx29euNiFykP6c=;
  b=CJzagFh3oslPNOSxmj7VWwbKfT0b8C0CE1A56OsQhxaIgVwNCvg9QCth
   oxcIvjStuABXMr3/+drTjy4DySSZKHTOFmVKYyZTsPIelexQHR91Blx5R
   SvL7NynEt7BDA+0MSJfKDnN+w1EPWl0jN8/2Jq8DK2y8tOG8JbMNDxroA
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7bWwEJufi0L18VOpqZtH9ELZNwbXg+PlHI7TCv7k/kUu5bdo4fTkrPPl87liPyvNQbpyQKRYk3
 kDbg5iFd99aCcPG0sz88MuuotseBunBQFTUjGtPghvYGm+zIJ8Spye0oUGsxhsGDLfv7C63MYj
 JqOV9TWAZiXEUI7TzjwoiyudUagJKAF1hPn66vpUcrrixSzm6br0jG4BSTJKQnMMdtzszVw61C
 VDFGvUFTVRXHoAU1ENDTNoegQUzGlK55vln6zR9Lc2DTPdJ4/dlS0lTnPWtslkNWUrWhiBLJr+
 fxc=
X-SBRS: 2.5
X-MesageID: 28877776
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="28877776"
Subject: Re: [PATCH v2 2/6] x86: reduce CET-SS related #ifdef-ary
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <d8561c46-a6df-3f64-78df-f84c649a99b4@suse.com>
 <4120e048-5314-afba-d921-9f4651a61eaa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3a2cfb6a-68cd-dbc7-c0c8-53b810b4eede@citrix.com>
Date: Tue, 13 Oct 2020 12:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4120e048-5314-afba-d921-9f4651a61eaa@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 28/09/2020 13:37, Jan Beulich wrote:
> On 28.09.2020 14:30, Jan Beulich wrote:
>> Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
>> to introduce a number of #ifdef-s to make the build work with older tool
>> chains. Introduce an assembler macro covering for tool chains not
>> knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
>> problem to be dropped again.
>>
>> No change to generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Now that I've done this I'm no longer sure which direction is better to
>> follow: On one hand this introduces dead code (even if just NOPs) into
>> CET-SS-disabled builds.
> A possible compromise here might be to ...
>
>> --- a/xen/include/asm-x86/asm-defns.h
>> +++ b/xen/include/asm-x86/asm-defns.h
>> @@ -7,3 +7,9 @@
>>      .byte 0x0f, 0x01, 0xcb
>>  .endm
>>  #endif
>> +
>> +#ifndef CONFIG_HAS_AS_CET_SS
>> +.macro setssbsy
>> +    .byte 0xf3, 0x0f, 0x01, 0xe8
>> +.endm
>> +#endif
> ... comment out this macro's body. If we went this route, incssp
> and wrssp could be dealt with in similar ways, to allow dropping
> further #ifdef-s.

No, because how you've got something which reads as a real instruction
which sometimes disappears into nothing.  (Interestingly, zero length
alternatives do appear to compile, and this is clearly a bug.)

The thing which matters is the clarity of code in its surrounding
context, and this isn't an improvement.

~Andrew

