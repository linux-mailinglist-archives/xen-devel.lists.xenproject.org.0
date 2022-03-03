Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A854CBE47
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283351.482329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPl10-0007c8-Sv; Thu, 03 Mar 2022 12:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283351.482329; Thu, 03 Mar 2022 12:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPl10-0007ZJ-Pc; Thu, 03 Mar 2022 12:57:06 +0000
Received: by outflank-mailman (input) for mailman id 283351;
 Thu, 03 Mar 2022 12:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GC2d=TO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nPl0z-0007YT-8E
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:57:05 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b3d9583-9af1-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 13:57:03 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1646312218867337.83372915155417;
 Thu, 3 Mar 2022 04:56:58 -0800 (PST)
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
X-Inumbo-ID: 6b3d9583-9af1-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; t=1646312219; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YIyRZQq18p7mhu2TBItYyIVcH/Hlr5DkY6PGQuguK7b6x1XXFHGD+FpYmZJtJMJ6loT0r17yc0K9159AhM1Z/z262OSPX1VFzCGIC0JZqJP44WNLd54yUFOxoWq6UvYN4hFRug07LqLqjwR16+7IHKAH4arrO6LZxc9R8z7+smI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1646312219; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=llcIV0L3t6cl9WjAGfF7LnkKx2UBuRvJEAwApke09nQ=; 
	b=Oim7h6myhINUxd1AvaouCPJuCryRdGZOseMTuxcysSQD5hpCKocXb421D8SZxicvNTwrPpxqLmnIo46dQ+DAci6tqEaK0ArZWSrEReXi7KtWRmTPjnZWhybhWa71Ctl09z5sPLCehdZESNkkwbnzJ+4C68XLrxCz8CPvO8NJ06w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646312219;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=llcIV0L3t6cl9WjAGfF7LnkKx2UBuRvJEAwApke09nQ=;
	b=dWdPjYa7saYxK6qyJjTJO2rInEmbGlMQZssG1ibVwY8qkxfka0+vhGP4BrxS1K7G
	Pbyg45Y5sA/+One0rkXfaJzDunETgOT0mjLUARlOYaYPXZo3zhlBcihMGYol1MZftuR
	uvFf9x4blyl7T5Cf1TA5/URd0fZhPaW50rSRD9VM=
Message-ID: <ae6f8279-c348-046d-1d3e-da851a5fcd20@apertussolutions.com>
Date: Thu, 3 Mar 2022 07:54:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/tboot: adjust Kconfig default
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>
References: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
 <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
 <9d57dc89-779b-aa91-519d-3e4cfc05ef94@suse.com>
 <b6a19025-ed0b-1698-b46f-0ff726254e96@apertussolutions.com>
 <16546d42-900b-1548-fdff-79ba21716384@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <16546d42-900b-1548-fdff-79ba21716384@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/3/22 07:24, Jan Beulich wrote:
> On 03.03.2022 13:16, Daniel P. Smith wrote:
>>
>> On 3/3/22 07:03, Jan Beulich wrote:
>>> On 03.03.2022 12:50, Daniel P. Smith wrote:
>>>> On 3/3/22 04:49, Jan Beulich wrote:
>>>>> We shouldn't include unsupported code by default, with not even a means
>>>>> for its building to be disabled. Convert the dependency from merely
>>>>> affecting the prompt's visibility to a real one.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> We could of course go further and make the default also account for
>>>>> DEBUG, as is done elsewhere.
>>>>
>>>> As in you would like to adjust the default based on whether DEBUG is on
>>>> or not? I guess my question is what motivation is there to adjust this
>>>> selection if DEBUG is enabled or disabled?
>>>
>>> This is to have functionality enabled unless overridden in debug builds.
>>
>> Maybe I am misunderstanding you. If I am wanting to debug either TXT or 
>> a configuration with TXT on and I adjust my config to turn on debug, 
>> then I would have to go turn TXT back on. Is that correct? If that is 
>> the correct understanding, honestly that concerns me because if that is 
>> being done for other config options, it would create the situation where 
>> turning on debug to track down an issue would result in a different 
>> configuration than the one I was experiencing the issue.
> 
> In the scenario that you describe (aiui), the default setting wouldn't
> make a difference: If you alter an existing .config by turning on DEBUG,
> the .config's existing TBOOT setting wouldn't change. Defaults matter
> only for items which have no values recorded yet. Plus - I'm suggesting
> to turn the option _on_ by default when DEBUG=y, not off.

Okay, I am following now. Apologies for taking so long. I think that
would be fine as TXT/tboot should be benign if enabled but tboot is not
used to start Xen.

v/r,
dps

