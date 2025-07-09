Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F514AFE7F8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 13:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038065.1410589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZTBk-0001Or-Cn; Wed, 09 Jul 2025 11:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038065.1410589; Wed, 09 Jul 2025 11:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZTBk-0001N2-9z; Wed, 09 Jul 2025 11:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1038065;
 Wed, 09 Jul 2025 11:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8N5c=ZW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uZTBi-0000uA-5Y
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 11:42:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be9e16e4-5cb9-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 13:42:08 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 64F984EE9BC6;
 Wed,  9 Jul 2025 13:42:08 +0200 (CEST)
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
X-Inumbo-ID: be9e16e4-5cb9-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1752061328;
	b=vI6OAbfaETfHVcXNlErysCb+LptYOq1urkVqX7uXF+X+aSg0B2l7RW2J8Ph6t6/yf1wU
	 sbYRxezZiGqGPhs0z5EaZOK9Cj5LkTjoqtU1XUGgeFA2Db5I3b+9F4mXZunyBMliP8jXH
	 2IZCiO7OhRFNFA67P+ewQpaRT2m7FZFphtaFJhtHc5rwssrZO9khuM4EoGcSXInQdO4Ij
	 7KEV24Id8QQlR6uI1aKGP7pEeB+4JY6V1bqvwKZVAOgZO3QmAsPYTUD5sToBC5DZpzLIN
	 8GGqJ75m3vW42vVzr+txC38R7poQIcDs4seMU3l+v++wJ7PVocJpWf52RcZn2EB7tB9ke
	 7o3Bk4/CWOO2Ed8S49x7l1chW/HSMCi5SJ1kwQYagnH8dgc2VPzwBhr6gGXb3ZBlwr9do
	 7azswjobN7EFvA+e8Ep4CABddY/Y4d+vw3LBLCkycXfh0BmW7ya7oT4tc1sHv/uvtxlV2
	 tlUzjsFMl8PZpv+9x+5min7gZKOMLMfsdo5mbQsghj89F1UnfcHoJfkgGqSl/sfrG6+Vy
	 qgmKUhJemCpu/rls6W/w/bG0LL07IgPnkVsG0fZ5G5Tmkm3J17uXj4lHsHGXsJBWaSd4n
	 65qZCv1PGJtKsEJdfNumh6S4ARXhpx1xMmdO9kwAIVoO4Dty3oIYRGxLsm9X5l0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1752061328;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=/a/MRMO2SeqBX/KI6Ggj8n93MtAuYSXovKYnqhDsEy4=;
	b=GJT/cr1Q8mUFA4DVxADZY+0nz3MbLu6MaQFcGh8QH4oGP6QDsxcspAOU0UAFAXbFBrOG
	 4kbMrg+h/YKic2KzjPyEJ49zgPi2ww+DdwoFPoZeBRfXjM6sSSmz8krNiLu5ViOu58xwW
	 zGIBeJWB90k4EV15G+XRPsrcyMFL7v+kJ2znCC/t5bxpDAsxdlVhFWmrDD0xMDglL1JNA
	 XERvxGzpdXQwkVVorrCSPBQDKk4N4Fm/tft1/jBwB7zabnslGsNCWLnxhU+4BCsTO+0s1
	 b3onIbghYqNUv8ACmgruMDEsVuSUqozaMBGQOF8X8qsDkkoHEQA6IRqXLAXWChD+q3Y7P
	 /luxek5o2nyFv80vGtPeIx2KlftgQuCk1DTPIukij/2EUII9P9l5ngBuivSh4AhxXiyre
	 8Icg8LjSADnWZBMRapj3M+gn4IIzZ9Qainl4rW912cw/fjbsfRXWI7jc/hSBiXRL/Bohv
	 TjCrYLfg8D/uhxyJ+OXs9NzB5D79YnVEmLIyVEUzSJ1Es1cVxpgnciKOtjZ+AWnDQZPqa
	 sMMl+TCNSuc3GN5dgPcreZf77mwjntlPl1GFLWVKlVoFrtdOJaAzfoHFjfSwUphfOPUBG
	 BBK7wY2JfUfPq9MOFq4lnQSy9WKp0A1BUWXg9NH4jA9X3IjpbC+gTi3P5cwScrA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1752061328; bh=5qo8ZyaZNd2iXcwiDsZkz+C3Ea64uuGeJl2kRqY3wWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SQo8aBWPX+dsvrS/mDT1SLRZ2ZgPs0b6BLZOh2ZcHlFCQc9sZx4Kb43nJPY0G/OAT
	 5rAlibkCgrIeXTIPPKNvjm5HPBsWaSaiTcutAxQzBGH/pxZydaoyMrwB5kiSrxdCMg
	 U4m7EDlLuN7lkCM9ROmlwVIYDegVElYDhdccQaMpbHSAe1EXlNvYPBDtG4ZM15Yc/X
	 hHeNr09KorTuuLn8Z2S9vgXFuKs/b7jw0YaOZuEZeUj/Rlexvvim1NdKYtBS0KCsOO
	 pdwirrOIXSYS+e7Lv+tMLdpoig63aIxSm+BK+yAO5mb84rSVLaEHVV9R6cET70cvsL
	 YMXW7pdRN8fxw==
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 13:42:08 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] acpi/pm-op: make do_pm_op() decl available in pm-op.c
In-Reply-To: <6a6f8dd1d0cc5ccb907032911607f345@bugseng.com>
References: <be5994d5-5e8b-4d9a-b08d-2a7f11a78e3a@suse.com>
 <6a6f8dd1d0cc5ccb907032911607f345@bugseng.com>
Message-ID: <7b16d01fb997fe54376e8de40f4293a7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-09 13:41, Nicola Vetrini wrote:
> On 2025-07-09 12:10, Jan Beulich wrote:
>> This addresses a Misra rule 8.4 ("A compatible declaration shall be
>> visible when an object or function with external linkage is defined")
>> violation.
>> 
>> Fixes: a16f2b3e0669 ("xen/pmstat: introduce CONFIG_PM_OP")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> 
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> 
> Perhaps a comment with the offending function would have been helpful 
> (do_pm_op).
> 

Oh, nevermind, I misread the patch title.

>> --- a/xen/drivers/acpi/pm-op.c
>> +++ b/xen/drivers/acpi/pm-op.c
>> @@ -5,6 +5,7 @@
>>  #include <xen/errno.h>
>>  #include <xen/guest_access.h>
>>  #include <xen/lib.h>
>> +#include <xen/pmstat.h>
>>  #include <xen/sched.h>
>> 
>>  #include <acpi/cpufreq/cpufreq.h>

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

