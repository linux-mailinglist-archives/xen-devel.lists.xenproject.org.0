Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E3830DE6F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 16:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80958.148593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7KIj-0003op-Se; Wed, 03 Feb 2021 15:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80958.148593; Wed, 03 Feb 2021 15:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7KIj-0003oT-PJ; Wed, 03 Feb 2021 15:42:41 +0000
Received: by outflank-mailman (input) for mailman id 80958;
 Wed, 03 Feb 2021 15:42:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7KIh-0003oO-Dm
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 15:42:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e2c4872-5cbd-4127-a618-a56aa0dbb9fb;
 Wed, 03 Feb 2021 15:42:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61C9EACB0;
 Wed,  3 Feb 2021 15:42:37 +0000 (UTC)
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
X-Inumbo-ID: 2e2c4872-5cbd-4127-a618-a56aa0dbb9fb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612366957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dn2+aABa7j7AiXXY9eZJoZmiQPmfDFh4agY5laGov4o=;
	b=f80s3UDVBOEf5FvFEw8FTSjV5E122YKp1Dm/fJ7lZrBFo0hF1Mt1v4CSWVLVg7AoA9dBgl
	rcijtE6ZbHnpMFj6sa6w7GlxSdbf63ynA1czW06mk4bfLz68y+vvi52NBQZY5KlFe/Quqv
	/ZaojyRprhOpjF8svXac0V9evt/C+hI=
Subject: Re: VIRIDIAN CRASH: 3b c0000096 75b12c5 9e7f1580 0
To: paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'James Dingwall' <james-xen@dingwall.me.uk>
References: <20210201152655.GA3922797@dingwall.me.uk>
 <d30b5ee3-1fd9-a64b-1d9a-f79b6b333169@suse.com>
 <03d501d6fa3d$e5227cc0$af677640$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94d4af04-9f3c-8c40-8acd-705259ec91fa@suse.com>
Date: Wed, 3 Feb 2021 16:42:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <03d501d6fa3d$e5227cc0$af677640$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.02.2021 16:04, Paul Durrant wrote:
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 03 February 2021 14:55
>>
>> On 01.02.2021 16:26, James Dingwall wrote:
>>> 21244@1612191983.282480:xen_platform_log xen platform: XEN|BUGCHECK: EXCEPTION (0000A824848948C2):
>>> 21244@1612191983.282617:xen_platform_log xen platform: XEN|BUGCHECK: CONTEXT (FFFFD0014343D580):
>>> 21244@1612191983.282717:xen_platform_log xen platform: XEN|BUGCHECK: - GS = 002B
>>> 21244@1612191983.282816:xen_platform_log xen platform: XEN|BUGCHECK: - FS = 0053
>>> 21244@1612191983.282914:xen_platform_log xen platform: XEN|BUGCHECK: - ES = 002B
>>> 21244@1612191983.283011:xen_platform_log xen platform: XEN|BUGCHECK: - DS = 002B
>>> 21244@1612191983.283127:xen_platform_log xen platform: XEN|BUGCHECK: - SS = 0018
>>> 21244@1612191983.283226:xen_platform_log xen platform: XEN|BUGCHECK: - CS = 0010
>>> 21244@1612191983.283332:xen_platform_log xen platform: XEN|BUGCHECK: - EFLAGS = 00000202
>>> 21244@1612191983.283444:xen_platform_log xen platform: XEN|BUGCHECK: - RDI = 00000000F64D5C20
>>> 21244@1612191983.283555:xen_platform_log xen platform: XEN|BUGCHECK: - RSI = 00000000F6367280
>>> 21244@1612191983.283666:xen_platform_log xen platform: XEN|BUGCHECK: - RBX = 000000008011E060
>>> 21244@1612191983.283810:xen_platform_log xen platform: XEN|BUGCHECK: - RDX = 00000000F64D5C20
>>> 21244@1612191983.283972:xen_platform_log xen platform: XEN|BUGCHECK: - RCX = 0000000000000199
>>> 21244@1612191983.284350:xen_platform_log xen platform: XEN|BUGCHECK: - RAX = 0000000000000004
>>> 21244@1612191983.284523:xen_platform_log xen platform: XEN|BUGCHECK: - RBP = 000000004343E891
>>> 21244@1612191983.284658:xen_platform_log xen platform: XEN|BUGCHECK: - RIP = 00000000A43C72C5
>>> 21244@1612191983.284842:xen_platform_log xen platform: XEN|BUGCHECK: - RSP = 000000004343DFA0
>>> 21244@1612191983.284959:xen_platform_log xen platform: XEN|BUGCHECK: - R8 = 0000000000000008
>>> 21244@1612191983.285073:xen_platform_log xen platform: XEN|BUGCHECK: - R9 = 000000000000000E
>>> 21244@1612191983.285188:xen_platform_log xen platform: XEN|BUGCHECK: - R10 = 0000000000000002
>>> 21244@1612191983.285304:xen_platform_log xen platform: XEN|BUGCHECK: - R11 = 000000004343E808
>>> 21244@1612191983.285420:xen_platform_log xen platform: XEN|BUGCHECK: - R12 = 0000000000000000
>>> 21244@1612191983.285564:xen_platform_log xen platform: XEN|BUGCHECK: - R13 = 00000000F7964E50
>>> 21244@1612191983.285680:xen_platform_log xen platform: XEN|BUGCHECK: - R14 = 00000000F64D5C20
>>> 21244@1612191983.285796:xen_platform_log xen platform: XEN|BUGCHECK: - R15 = 00000000F7964E50
>>
>> I'm also confused by this - the pointer given for CONTEXT suggests this
>> is a 64-bit kernel, yet none of the registers - including RIP and RSP -
>> have non-zero upper 32 bits. Or is qemu truncating these values?
> 
> The logging is coming from the PV drivers (in https://xenbits.xen.org/gitweb/?p=pvdrivers/win/xenbus.git;a=blob;f=src/xen/bug_check.c). The truncated values may just be due to a 32-bit user process I guess.

Since you pointed me at the code and truncation inside a string
not likely being due to some user process, I went and looked:
The driver uses %016X, instead of e.g. converting to (PVOID)
and using %p like code elsewhere in the file does (presumably
because there's no really convenient way to print 64-bit values
in Windows, short of using their custom "%016I64X" format
specifier, and the absence of a uniform specifier allowing to
format pointer-sized integers independent of architecture).

Jan

