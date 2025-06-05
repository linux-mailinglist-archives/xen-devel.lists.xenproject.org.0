Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD69ACEF24
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006774.1386012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9g5-0001ru-VH; Thu, 05 Jun 2025 12:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006774.1386012; Thu, 05 Jun 2025 12:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9g5-0001qS-Sd; Thu, 05 Jun 2025 12:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1006774;
 Thu, 05 Jun 2025 12:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrB3=YU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uN9g4-0001qM-30
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:26:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 515876db-4208-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:26:34 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 545594EE7C3E;
 Thu,  5 Jun 2025 14:26:33 +0200 (CEST)
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
X-Inumbo-ID: 515876db-4208-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1749126393;
	b=FrhzzpKN32qEut3nuWE7oxDBe8gLbAeKtAq85VTDAZKA5Qk9FeuYUh5av/j0SkIT8c3p
	 zshRYP3Wr81z0LcUtwj5QuFkLk4OLfviGPUAglNg8bWzNMLl7vZfaWWz9e7XqlxZgJTld
	 5dnwiSTOldxZbewyroakzTjs/H+NPyYTUcg4OY0JRdwsIiBi9X6RW53L8X38zTZtRh8Bb
	 n0siBqYfrL2vNqVtfWHWYVUapktSzbi6Buw7z425yCdqatD+V23e9U9+oI7RJ/l4HeWXf
	 D+xPFL9KT6fKQQAJ5pckIZFbygRXiSD4QPET0Ea+tPBezCsfjo+3921o1+NU6ilVLJ5Tx
	 zksR+ot4AkWY1UgFgAGNJ0RFUJm3JAxMpWecna6D/qLJ83+FVufdBGaHsBMX6GRdoY3RG
	 9atdHEUpYLQrCTagCCrvVUTfSHNKCQtJxOMQ/cd03sE/Iw0LXW9m/3K2Ljh2+i9Bzx5GH
	 F0ewYJ6EWuN9D32J1OTUhf7YtXsVJ9vZd07QyJWZpKx4KORwota11cbbgTHuqXlcpZQHj
	 ImKGCwOhmieRDxrio77a7xBOAUHorfJfznG7lcmPQyu2C7LCMgA87AYti/XN3Gy6Ag85K
	 hhabuqteNIWBPbuVICIg/Ofy0zRDEhkbGBQRdUHXvvVIq8Ynrxc0AsRbwDJmFFc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1749126393;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=w/F7qlGB2xLSbeYS44ytj6NIbBauJeItuiKWuUtsa20=;
	b=I9lJhWJpeBEXjOjeX1QJltfQgf1gde3AkUMjAnyxjdTVH5kCZftkYfXQ4BCFMk8LGik2
	 PlAVCtcGdPqicAJAAiJ5+ZKjHxv/4hSBwytsyOHMS//fudj3k3U59qdt6fYeVDkI6G0VY
	 y/OLNVx410sYsB0IbK8+f5g707DyGmPNx6wN7nTzpbMJXUVYVs7iytUvuDjAeEa6YUZzi
	 x1NevW6Q4WsuSlEwPq5EZlAry9ao6Q57fOcVTW6WJ4a7nMT8aMs1Hd2Ncb2QlfeBOAaFp
	 ywIc+dl0cj5bEvd5qOW7wIrmYIC5XBr/qb8Et37QbSYSmy01hiMsHwoV8a7aRMQO9boO+
	 2xBWxduayDFop9DmPGCToJsJK2jCUah2u+XFrK9Z4c9o8hGA0kAtQfUwo9ZFlEZjARzIl
	 W/AobolllF2gfuREAPOdToHXPhKXBJY3C3FPFA4Wr96xl19NfNzhjRYxTG546BqkglIHT
	 YNcRaHP1gzAAJAzRaBmtFkBOanKGsKxvW/XqLNc7OQSWR8CeJ9HS1IdU4FUTJs6nT/S+r
	 0DLPZfQr33HP4rS/W5N1BmBJSRAXGMOVU3cfem2tS/3soB22Mx+zouMYTxeuVbQ+GjJPE
	 YfPhhgF/z42ZLyuf1Iw+SYnh/yS/Qx6Iesg8/Z8MmcQ/wdsdN46fZX5FpRTQCY8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1749126393; bh=4sWXTE8WUaRIv2oOiRoRZzruEp4Ivc/sm0LmysmmMaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bOHL3V3BAY++9+B0bLtu0cpUGHuGjXw+cCPJbywgPkTgv88BRNN7segXZaNsDlmLm
	 6XMxKDeT+WO0nhpBMvowBd2n2w4shQPkp0QccqYOLhp5zHlJ0NOrKA7+IXWBW0WO1Q
	 GBK5N2HOkG4z1Bp51Qrcpkp5OHI2M8iiRyRH8qguK9hRj4l+V/+mN+kwbvc3v0BoZo
	 CKEPS82N3KDizYbxq594jQ3+tB8hlJZCbCNeC3zpx62rB1guVUeVmnLGCFC3HeKS6+
	 mBoXuhM+lrUvtcpFw2T2XTiP/ELxF0HjtegaNFHcianYd5SzDQXuMVl02DVvNLV+UH
	 F/kTxEz3onqYA==
MIME-Version: 1.0
Date: Thu, 05 Jun 2025 14:26:33 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: victorm.lira@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] xen/keyhandler: add missing noreturn attribute
In-Reply-To: <b258936e289290321e9a8b2d23723fc2@bugseng.com>
References: <20250604235034.1595881-1-victorm.lira@amd.com>
 <9e3a7b1b-7fbe-428b-888a-c18c95d8ee37@suse.com>
 <b258936e289290321e9a8b2d23723fc2@bugseng.com>
Message-ID: <3b24b1df1a0ce4a62b53067b09fe9a02@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-05 14:22, Nicola Vetrini wrote:
> On 2025-06-05 09:17, Jan Beulich wrote:
>> On 05.06.2025 01:49, victorm.lira@amd.com wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> 
>>> Function `reboot_machine' does not return, but lacks the `noreturn' 
>>> attribute,
>>> therefore causing a violation of MISRA C Rule 2.1: "A project shall 
>>> not contain
>>> unreachable code".
>> 
>> Is this (uniformly) true? Looking at ...
>> 
>>> --- a/xen/common/keyhandler.c
>>> +++ b/xen/common/keyhandler.c
>>> @@ -251,7 +251,7 @@ static void cf_check 
>>> dump_hwdom_registers(unsigned char key)
>>>      }
>>>  }
>>> 
>>> -static void cf_check reboot_machine(unsigned char key, bool unused)
>>> +static void noreturn cf_check reboot_machine(unsigned char key, bool 
>>> unused)
>>>  {
>>>      printk("'%c' pressed -> rebooting machine\n", key);
>>>      machine_restart(0);
>> 
>> ... generated code here, I can see that the compiler is perfectly able 
>> to
>> leverage the noreturn that machine_restart() has, resulting in no
>> unreachable code to be generated. That is - neither in source nor in
>> binary there is any unreachable code. Therefore I'm having a hard time
>> seeing what the violation is here.
>> 
>> That said, I certainly don't mind the addition of the (seemingly) 
>> missing
>> attribute. Otoh I wonder whether an attribute the removal of which has 
>> no
>> effect wouldn't count as "dead code" or alike, violating some other 
>> rule.
>> 
> 
> Inlining does not play a role in this case. Here reboot_machine() is 
> marked as a violation because machine_restart() is noreturn and there 
> is no other path upon which reboot_machine() may return, hence any 
> function calling reboot_machine() could have portions that are 
> inadvertently unreachable (as in never executed due to divergence) by 
> not having the annotation. That said, in such trivial cases compilers 
> are typically able to derive the property automatically, but they are 
> not obliged to and, more importantly, the behavior may even differ with 
> the same compiler using different optimization levels.

Just a note: in later revisions of MISRA C this has become a rule of its 
own [1], which helps reduce confusion, but up to MISRA C:2012 Amendment 
2 (currently used by Xen), this is part of Rule 2.1.

[1] Rule 17.11: "A function that never returns should be declared with a 
_Noreturn function specifier"

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

