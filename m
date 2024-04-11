Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6C8A1934
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704058.1100173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwpZ-0004Qv-25; Thu, 11 Apr 2024 15:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704058.1100173; Thu, 11 Apr 2024 15:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwpY-0004Ov-Ui; Thu, 11 Apr 2024 15:59:16 +0000
Received: by outflank-mailman (input) for mailman id 704058;
 Thu, 11 Apr 2024 15:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAdS=LQ=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1ruwpX-0004Op-EZ
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:59:16 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 710e1d95-f81c-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:59:13 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id 0DF6B80069;
 Thu, 11 Apr 2024 16:59:13 +0100 (BST)
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
X-Inumbo-ID: 710e1d95-f81c-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1712851153;
	bh=No9lKz09vbqU86I7NL6L8ctqyWnNh2GJNxd3fhnfEiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=27wvxXImElR8NWLblKR2+PVwAeprbciQTutyRYD1C1+IzXt2twW1QK0ASVFsHS/lQ
	 gPXox3ulcmsk2L3H/ACCaA+bqmxWySnpqQVve2/5qw9YIQ90jxONjTbQmOnq5z52rM
	 drUVdwdzuQ6cDQXi1Z3hYX5+Wa5Rp+gAWBx0jOsc=
MIME-Version: 1.0
Date: Thu, 11 Apr 2024 16:59:13 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, anthony.perard@citrix.com,
 slack@rabbit.lu
Subject: Re: [PATCH v2 2/6] tools/misc: rework xenwatchdogd signal handling
In-Reply-To: <66ef2d24-0c4f-4d35-89c3-04ffd870cc91@citrix.com>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-3-leigh@solinno.co.uk>
 <66ef2d24-0c4f-4d35-89c3-04ffd870cc91@citrix.com>
Message-ID: <33fe9429ac89099686025185a964ce83@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 2024-04-11 13:12, Andrew Cooper wrote:
> On 29/03/2024 11:10 am, leigh@solinno.co.uk wrote:
>> diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
>> index 2f7c822d61..35a0df655a 100644
>> --- a/tools/misc/xenwatchdogd.c
>> +++ b/tools/misc/xenwatchdogd.c
>> @@ -9,9 +9,11 @@
>>  #include <unistd.h>
>>  #include <signal.h>
>>  #include <stdio.h>
>> +#include <stdbool.h>
>> 
>>  xc_interface *h;
>> -int id = 0;
>> +static bool safeexit = false;
>> +static bool done = false;
> 
> It's a common bug, but these need to be volatile.  Right now, ...

I'm an idiot (I'm sure I've mentioned this a couple of times :-) )

>> @@ -90,10 +90,14 @@ int main(int argc, char **argv)
>>      if (id <= 0)
>>          err(EXIT_FAILURE, "xc_watchdog setup");
>> 
>> -    for (;;) {
>> +    while (!done) {
>>          sleep(s);
> 
> ... the only reason this isn't an infinite loop is because the compiler
> can't prove that sleep() doesn't modify the variable.  This goes wrong
> in subtle and fun ways when using LTO.
> 
> I'll fix on commit.
> 
> For the record, I've taken 1-3 which are ready.  You'll need to rework 
> 4
> and later per Anthony's feedback.
> 
> ~Andrew

Thanks, I will get those done this evening, hopefully.

Regards,

Leigh.

