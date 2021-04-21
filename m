Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F64366C50
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 15:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114497.218213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZChv-0001Wp-6b; Wed, 21 Apr 2021 13:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114497.218213; Wed, 21 Apr 2021 13:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZChv-0001WQ-3P; Wed, 21 Apr 2021 13:15:55 +0000
Received: by outflank-mailman (input) for mailman id 114497;
 Wed, 21 Apr 2021 13:15:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZCht-0001WL-I7
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 13:15:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32dcd834-9a5a-4bef-b94d-317a15100a25;
 Wed, 21 Apr 2021 13:15:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9C81B4A7;
 Wed, 21 Apr 2021 13:15:51 +0000 (UTC)
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
X-Inumbo-ID: 32dcd834-9a5a-4bef-b94d-317a15100a25
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619010952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSbujstBrsDXB9I9QXW9yNl1x7BU7KwrwpMefgybHmU=;
	b=m5Xv/dsWLYlRQLeYMBj5gW0yMZTtfQYpta1tmlMHeMQPeU0m7FPUl3QbkrEdY7d0rhlB83
	TW7R1IY9nhsY4k3B/Cfov4x2IPUwl+ns22Y8oW1G6Gq+brukfAKW8DIjB/fDwjEUCYBReA
	Wff376Ycn+jqk7E5SxWmFzbG6I8czSY=
Subject: Re: [PATCH 8/8] x86/EFI: don't have an overly large image size
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <26ec4a83-cda9-5193-d797-357c05b26ab7@suse.com>
 <YIAKIx0JuYDzEKqK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b9af9cc-fdd6-aa16-f902-0c5836bb2cbc@suse.com>
Date: Wed, 21 Apr 2021 15:15:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIAKIx0JuYDzEKqK@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 13:18, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:47:35AM +0200, Jan Beulich wrote:
>> While without debug info the difference is benign (so far), since we pad
>> the image to 16Mb anyway, forcing the .reloc section to a 2Mb boundary
>> causes subsequent .debug_* sections to go farther beyond 16Mb than
>> needed. There's no reason to advance . for establishing __2M_rwdata_end,
>> as all data past _end is of no interest at runtime anymore anyway.
> 
> So you just expand the load size.

Shrink. Or maybe I'm misunderstanding you.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> This makes more explicit a possible latent problem with the ELF image:
>> It ends at _end, not __2M_rwdata_end (advancing . as was done here does
>> not have the effect of increasing the image size). Interestingly the
>> conversion xen-syms => xen rounds up the program header specified size
>> suitably, as per the comment "Do not use p_memsz: it does not include
>> BSS alignment padding" in mkelf32.c. I do think this would instead want
>> taking care of in the linker script. Commit 7a95e0a2c572 ("x86: properly
>> calculate xen ELF end of image address") clearly only hacked an existing
>> hack rather than addressing the root cause. Thoughts?
> 
> We should likely define _end after __2M_rwdata_end to account for this
> padding?

I don't think this would help - we'd need to arrange for the image size
to cover that extra padding. Like advancing . doesn't grow the image
size, I also don't think placing _end later would do.

Jan

