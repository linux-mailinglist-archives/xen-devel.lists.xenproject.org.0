Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA5C575B9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161154.1489160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWGy-0007YG-IM; Thu, 13 Nov 2025 12:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161154.1489160; Thu, 13 Nov 2025 12:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWGy-0007W0-Fn; Thu, 13 Nov 2025 12:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1161154;
 Thu, 13 Nov 2025 12:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3SV=5V=bounce.vates.tech=bounce-md_30504962.6915cc6e.v1-c69976a56ee8495baada4dfad6e54171@srs-se1.protection.inumbo.net>)
 id 1vJWGx-0007Vr-7V
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:17:55 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6ae1d0d-c08a-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:17:52 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d6fRf42P0zPm0fhf
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 12:17:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c69976a56ee8495baada4dfad6e54171; Thu, 13 Nov 2025 12:17:50 +0000
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
X-Inumbo-ID: c6ae1d0d-c08a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763036270; x=1763306270;
	bh=TaopVpkhSPFnx7zk1qFNE7lnuV6CYGsQCMohNV3HC6k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZJK5Q0psmKEFyXD+ejP4yiuqM+fSCh0ur66Jmlrg3qHB73tMPwY5iUCXQFUFijezq
	 knOl8hIEKEVvmSBpUow01lFBXdyKJSewStI/66rG9qr1psx5TQpvl+KbUgmIQUBZmD
	 9sRzvv4yYWk2fEe760hYOBiQd/fAtZ3Y3QnVawIMXNYrQhaawx7cCtgYeOZEgqUDtI
	 H5XQHbEhr8KNihlDfWHaGZ8c7gewvmq1uY0nXTYsnKzJ3VN67gVQC/jGXYZg/pxHTa
	 wbT76j8DvlhRtz3Pi2GXVxhE5xVY2w9vnh0QWEvPq4LKkaa8BB4CEiGpcVmolhjASN
	 XgwwKFa9SOgkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763036270; x=1763296770; i=ngoc-tu.dinh@vates.tech;
	bh=TaopVpkhSPFnx7zk1qFNE7lnuV6CYGsQCMohNV3HC6k=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lo1Kizl6BuJiEHc/W3ErO8CyZ2z8m+mGGz/nWyzdqnDz6cpqSVDblgU48uVhv4QXh
	 iIqalO1bI48CXlrlk0SfDVQ7smmjdV08NkBq7IZW/pmnAyK1VOQu4Uc6nNORQ88J4/
	 C/75U3F15iRxSO2+LgfemBvn2NNPn8Am3GMWq6FyJaynQ0t7ksn3b8Ix2vk8RC984K
	 4iUa3+u0orh6Jeds7oVpP0/BU4PrKVAnwGgGN9k26BDHD/FgxM7Z6a0TeB0iS6/Xux
	 r9ahWtps3ocLAaha4VPGBYAiygkDnJhBWwZuOHZTdUWcv1NHDq96lzlJdtslBh9R0L
	 iFBXVEas2Ds2Q==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen:=20Expose=20time=5Foffset=20in=20struct=20arch=5Fshared=5Finfo?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763036268962
Message-Id: <1d4dd308-74c3-4557-8e0b-522b53b4286d@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <20251112070815.545-1-ngoc-tu.dinh@vates.tech> <75e6e27c-1d47-4689-a52d-e596de84db26@suse.com>
In-Reply-To: <75e6e27c-1d47-4689-a52d-e596de84db26@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c69976a56ee8495baada4dfad6e54171?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251113:md
Date: Thu, 13 Nov 2025 12:17:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 13/11/2025 13:09, Jan Beulich wrote:
> On 12.11.2025 08:08, Tu Dinh wrote:
>> time_offset is currently always added to wc_sec. This means that without
>> the actual value of time_offset, guests have no way of knowing what's
>> the actual host clock. Once the guest clock drifts beyond 1 second,
>> updates to the guest RTC would themselves change time_offset and make it
>> impossible to resync guest time to host time.
> 
> I guess I don't understand what the problem is, or why it would need a
> change in the hypervisor (interface). If the guest updates the vRTC, it is
> (implicitly) asking for a change of time offset, isn't it? And whatever
> adjustments it makes, it could track and accumulate them?

vRTC drift can happen for other reasons. For example, Windows can write 
to the RTC at any time; if a guest clock drift has already happened 
(e.g. after a migration), an unfortunately-timed RTC write will make it 
permanent. Windows time providers don't have the ability to control when 
Windows writes to RTC either. Thus the "real" host clock time is needed 
to help the VM adjust to the correct time.

IOW, it's the distinction between "keeping track of already correct 
time" versus "correcting wrong time by adjusting the offset"; the latter 
is what I'm looking for.

> 
>> Since there's no way to add more fields to struct shared_info, the
>> addition has to be done through struct arch_shared_info instead. Add two
>> fields in arch_shared_info representing time_offset's low and high
>> 32-bit halves.
> 
> Any why in two halves? Without that, ...
> 
>> --- a/xen/common/time.c
>> +++ b/xen/common/time.c
>> @@ -118,6 +118,11 @@ void update_domain_wallclock_time(struct domain *d)
>>       shared_info(d, wc_sec_hi) = sec >> 32;
>>   #endif
>>   
>> +    shared_info(d, arch.time_offset) =
>> +        (uint32_t)(uint64_t)d->time_offset.seconds;
>> +    shared_info(d, arch.time_offset_hi) =
>> +        (uint32_t)((uint64_t)d->time_offset.seconds >> 32);
> 
> ... no casting at all would be needed here. (Even when there are two halves,
> some of the casting can be dropped.)
> 
> Another question is - why unsigned? struct domain's time_offset.seconds is
> signed for a reason, aiui.

Both are just for easy consumption of the time offset on 32-bit guests. 
Unsigned is particularly because these are only parts of an int64_t (and 
therefore have no signedness themselves) and I prefer to let the 
conversion happen after reading the two fields.

> 
> Jan



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


