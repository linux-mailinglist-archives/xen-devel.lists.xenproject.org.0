Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A576A0C5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 21:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573430.898105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYAn-0006nr-Qk; Mon, 31 Jul 2023 19:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573430.898105; Mon, 31 Jul 2023 19:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYAn-0006mC-O5; Mon, 31 Jul 2023 19:03:17 +0000
Received: by outflank-mailman (input) for mailman id 573430;
 Mon, 31 Jul 2023 19:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vA1f=DR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQYAl-0006m6-Cw
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 19:03:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e466c3c3-2fd4-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 21:03:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 156E38285674;
 Mon, 31 Jul 2023 14:03:10 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WwOdXd17X-2G; Mon, 31 Jul 2023 14:03:09 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3B551828586F;
 Mon, 31 Jul 2023 14:03:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zvVTwQCAZmCe; Mon, 31 Jul 2023 14:03:09 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 90E898285674;
 Mon, 31 Jul 2023 14:03:08 -0500 (CDT)
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
X-Inumbo-ID: e466c3c3-2fd4-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3B551828586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690830189; bh=/CQVmrD4JE6izqQUxsfc/Mxv8uX2MMxHIxKzBlZwqcw=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Q6RFPis9BqzRakKTwMbfHr5zRdOS5E1lsSS+NLtceI4rxM8jr/mwW1j3VraEcLxdT
	 rT1Ys3Bh4iqEEWQqAJMSO5U5l7wVvGpbCgeZQnR52gLFVFL8uEUuHjXmCY4nlg/BTH
	 6QV+2niS1qJo6jllDe2vVFEchSbCLyLrT/mBQrvc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <0127f163-a96b-447b-5a1d-da048f293ea2@raptorengineering.com>
Date: Mon, 31 Jul 2023 14:03:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/5] xen/lib: Move simple_strtoul from common/vsprintf.c
 to lib
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <294e48747a0f9aee0be4fd178fcab029fa317528.1690579561.git.sanastasio@raptorengineering.com>
 <d280f52a-0d88-77f7-12d7-b952bd1a102f@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <d280f52a-0d88-77f7-12d7-b952bd1a102f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/23 10:52 AM, Jan Beulich wrote:
> On 28.07.2023 23:35, Shawn Anastasio wrote:
>> Move the simple_strtoul routine which is used throughout the codebase
>> from vsprintf.c to its own file in xen/lib.
>>
>> This allows libfdt to be built on ppc64 even though xen/common doesn't
>> build yet.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  xen/common/vsprintf.c    | 37 -------------------------------------
>>  xen/lib/Makefile         |  1 +
>>  xen/lib/simple_strtoul.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 41 insertions(+), 37 deletions(-)
>>  create mode 100644 xen/lib/simple_strtoul.c
> 
> What about its siblings? It'll be irritating to find one here and the
> other there.

I was debating whether to do this or not and ultimately decided to only
make the minimum changes that were required right now. I can go ahead
and make the change for its siblings as well.

> Also please no underscores in (new) filenames unless there's a reason
> for this. In the case here, though, I question the need for "simple"
> in the file name in the first place.

From a look at the other files in xen/lib there seemed to be a
convention of naming files after the exact function they implement.
Would you rather I rename it to just strtoul.c? Or simple-strotoul.c?

>> --- /dev/null
>> +++ b/xen/lib/simple_strtoul.c
>> @@ -0,0 +1,40 @@
>> +/*
>> + *  Copyright (C) 1991, 1992  Linus Torvalds
>> + */
>> +
>> +#include <xen/ctype.h>
>> +
>> +/**
>> + * simple_strtoul - convert a string to an unsigned long
>> + * @cp: The start of the string
>> + * @endp: A pointer to the end of the parsed string will be placed here
>> + * @base: The number base to use
>> + */
>> +unsigned long simple_strtoul(
>> +    const char *cp, const char **endp, unsigned int base)
>> +{
>> +    unsigned long result = 0,value;
>> +
>> +    if (!base) {
>> +        base = 10;
>> +        if (*cp == '0') {
>> +            base = 8;
>> +            cp++;
>> +            if ((toupper(*cp) == 'X') && isxdigit(cp[1])) {
>> +                cp++;
>> +                base = 16;
>> +            }
>> +        }
>> +    } else if (base == 16) {
>> +        if (cp[0] == '0' && toupper(cp[1]) == 'X')
>> +            cp += 2;
>> +    }
>> +    while (isxdigit(*cp) &&
>> +           (value = isdigit(*cp) ? *cp-'0' : toupper(*cp)-'A'+10) < base) {
>> +        result = result*base + value;
>> +        cp++;
>> +    }
>> +    if (endp)
>> +        *endp = cp;
>> +    return result;
>> +}
> 
> While moving, I think it would be nice if this stopped using neither
> Xen nor Linux style. I'm not going to insist, but doing such style
> adjustments right here would be quite nice.

Especially if I'm going to be moving its siblings, I'd rather just copy
the functions verbatim for this patch, if that's acceptable.

> Jan

Thanks,
Shawn

