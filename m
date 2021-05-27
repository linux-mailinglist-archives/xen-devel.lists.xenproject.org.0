Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2AC392B24
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 11:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132964.247945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCfF-0006CD-0L; Thu, 27 May 2021 09:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132964.247945; Thu, 27 May 2021 09:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCfE-0006AM-TH; Thu, 27 May 2021 09:50:52 +0000
Received: by outflank-mailman (input) for mailman id 132964;
 Thu, 27 May 2021 09:50:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmCfE-0006AG-8J
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 09:50:52 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bfd6ba1-dd7d-4596-9894-92cbd6323e99;
 Thu, 27 May 2021 09:50:51 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 474742190F;
 Thu, 27 May 2021 09:50:50 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 110CB11A98;
 Thu, 27 May 2021 09:50:50 +0000 (UTC)
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
X-Inumbo-ID: 0bfd6ba1-dd7d-4596-9894-92cbd6323e99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622109050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzzDsjsEgjnFSsWpRC2O8ErBfZLfcCVGraGfck+zcSQ=;
	b=Ie7NPLuTgvg1f5yI3dNxBet8vkw2Hebqk60i8v6KoG0kCYzQppfwSWVbhANpeBmKSKIg+h
	4om0t6TsUyNLbtZQ5R0io390KMVlBrLomnE+ETZnQeoRcLKfRV5fNJ4h6ULxOZfy5yHjU4
	OkHrT2+ejl3s0ntkYgoSxjh44w0/Asg=
Subject: Re: [PATCH] x86: make hypervisor build with gcc11
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <ca7a78e5-2ee9-4109-7905-3b9186475f3d@suse.com>
 <YK9c0DaIEo7uZ5Gk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c72414eb-dece-92e5-2f7d-0c80bb9a9982@suse.com>
Date: Thu, 27 May 2021 11:50:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK9c0DaIEo7uZ5Gk@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.05.2021 10:48, Roger Pau Monné wrote:
> On Wed, May 19, 2021 at 05:39:50PM +0200, Jan Beulich wrote:
>> Gcc 11 looks to make incorrect assumptions about valid ranges that
>> pointers may be used for addressing when they are derived from e.g. a
>> plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100680.
>>
>> Utilize RELOC_HIDE() to work around the issue, which for x86 manifests
>> in at least
>> - mpparse.c:efi_check_config(),
>> - tboot.c:tboot_probe(),
>> - tboot.c:tboot_gen_frametable_integrity(),
>> - x86_emulate.c:x86_emulate() (at -O2 only).
>> The last case is particularly odd not just because it only triggers at
>> higher optimization levels, but also because it only affects one of at
>> least three similar constructs. Various "note" diagnostics claim the
>> valid index range to be [0, 2⁶³-1].
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> This is all quite ugly, but I don't have any recommendation short of
> getting gcc fixed (or being able to disable those heuristics).

Indeed.

>> --- a/tools/tests/x86_emulator/x86-emulate.c
>> +++ b/tools/tests/x86_emulator/x86-emulate.c
>> @@ -8,6 +8,13 @@
>>  
>>  #define ERR_PTR(val) NULL
>>  
>> +/* See gcc bug 100680, but here don't bother making this version dependent. */
> 
> Might be worth also referencing 99578 which seems to be the parent
> bug? (as 100680 has been closed as a duplicate)

Anyone going there will immediately find the xref to that supposed
parent bug. Personally I'm not convinced of it truly being a
duplicate.

Jan

