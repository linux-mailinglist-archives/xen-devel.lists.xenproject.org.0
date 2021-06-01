Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90345396D1D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 08:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134667.250496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnxUa-0002pq-Vd; Tue, 01 Jun 2021 06:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134667.250496; Tue, 01 Jun 2021 06:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnxUa-0002le-Rp; Tue, 01 Jun 2021 06:03:08 +0000
Received: by outflank-mailman (input) for mailman id 134667;
 Tue, 01 Jun 2021 06:03:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lnxUZ-0002ix-AD
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 06:03:07 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1692972c-a222-4f89-a4f6-a3a376e90a6a;
 Tue, 01 Jun 2021 06:03:06 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76A3A1FD2D;
 Tue,  1 Jun 2021 06:03:05 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2D066118DD;
 Tue,  1 Jun 2021 06:03:05 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 8L6pCZnNtWBPeAAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Tue, 01 Jun 2021 06:03:05 +0000
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
X-Inumbo-ID: 1692972c-a222-4f89-a4f6-a3a376e90a6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622527385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMU2JPgK0qmrP32rl8NH4eVDq1jiSBJi8A+N3bYsJck=;
	b=ELdXrf8UX1LeQoLnrsYffBU7wi3GWrbd82YxwCFGdDMVWw6mLp3Ql5fOr+CEEzyw4QxZWl
	UOlEwDoNL9zfNgIo974Rsfn1kOd0b218WBLKR9t+Fw/g9AWzJwJULAtQC26BmuqN4Zv1Ts
	4yunzzirAiDtHnn6olNGsFtuRYMdcms=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622527385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMU2JPgK0qmrP32rl8NH4eVDq1jiSBJi8A+N3bYsJck=;
	b=ELdXrf8UX1LeQoLnrsYffBU7wi3GWrbd82YxwCFGdDMVWw6mLp3Ql5fOr+CEEzyw4QxZWl
	UOlEwDoNL9zfNgIo974Rsfn1kOd0b218WBLKR9t+Fw/g9AWzJwJULAtQC26BmuqN4Zv1Ts
	4yunzzirAiDtHnn6olNGsFtuRYMdcms=
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
 <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com>
 <39a8a78c-3662-528f-fde4-d47427e64b15@gmail.com>
 <b0699bc4-5e79-7ce0-c885-b4d8dfa8b74f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0eab888a-4c48-497d-6c43-b749389e52dd@suse.com>
Date: Tue, 1 Jun 2021 08:03:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <b0699bc4-5e79-7ce0-c885-b4d8dfa8b74f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.00
X-Spamd-Result: default: False [-1.00 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[];
	 FREEMAIL_CC(0.00)[gmail.com,citrix.com,xenproject.org,xen.org,kernel.org,lists.xenproject.org]
X-Spam-Flag: NO

On 01.06.2021 04:26, Connor Davis wrote:
> 
> 
> On 5/25/21 12:13 PM, Bob Eshleman wrote:
>> On 5/25/21 1:48 AM, Jan Beulich wrote:
>>> On 24.05.2021 16:34, Connor Davis wrote:
>>>> Add arch-specific makefiles and configs needed to build for
>>>> riscv. Also add a minimal head.S that is a simple infinite loop.
>>>> head.o can be built with
>>>>
>>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
>>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
>>>>
>>>> No other TARGET is supported at the moment.
>>>>
>>>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>>>> ---
>>>>   config/riscv.mk                         |  4 +++
>>>>   xen/Makefile                            |  8 +++--
>>>>   xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>>>>   xen/arch/riscv/Kconfig.debug            |  0
>>>>   xen/arch/riscv/Makefile                 |  0
>>>>   xen/arch/riscv/Rules.mk                 |  0
>>>>   xen/arch/riscv/arch.mk                  | 14 ++++++++
>>>>   xen/arch/riscv/asm-offsets.c            |  0
>>>>   xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>>>>   xen/arch/riscv/head.S                   |  6 ++++
>>>>   xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>>>>   11 files changed, 137 insertions(+), 2 deletions(-)
>>>>   create mode 100644 config/riscv.mk
>>>>   create mode 100644 xen/arch/riscv/Kconfig
>>>>   create mode 100644 xen/arch/riscv/Kconfig.debug
>>>>   create mode 100644 xen/arch/riscv/Makefile
>>>>   create mode 100644 xen/arch/riscv/Rules.mk
>>>>   create mode 100644 xen/arch/riscv/arch.mk
>>>>   create mode 100644 xen/arch/riscv/asm-offsets.c
>>>>   create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>>>>   create mode 100644 xen/arch/riscv/head.S
>>>>   create mode 100644 xen/include/asm-riscv/config.h
>>> I think this wants to be accompanied by an addition to ./MAINTAINERS
>>> right away, such that future RISC-V patches can be acked by the
>>> respective designated maintainers, rather than falling under "THE REST".
>>> Question is whether you / we have settled yet who's to become arch
>>> maintainer there.
>>>
>>> Jan
>>>
>> I'd like to volunteer myself for this, as I'm slated to continue
>> with the port indefinitely and would at least like to review
>> patches.  If Connor has the time, I think it makes sense for him
>> to be listed there too.
>>
>> Until we have others (it's just us two right now), it'll be a
>> lot of us reviewing each other's arch-specific work (in addition to
>> reviewers elsewhere in the Xen project, of course).
>>
>> -Bobby
>>
> Jan: can you list Bobby as the maintainer on commit? You can list me as 
> well,
> but I can't guarantee a time commitment unlike Bobby.

Well, actually I did expect a v5 submission with whatever entry you
both deem suitable. Otoh I now realize that patch 1 had my extra
request addressed (by myself) and hence with this one needing just
that entry, I could indeed add that addition myself while committing.
Let me move the mails back to the to-be-committed folder...

Jan

