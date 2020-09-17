Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C026DF2A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvY3-0000PK-Bg; Thu, 17 Sep 2020 15:10:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIvY1-0000Oo-8X
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:10:09 +0000
X-Inumbo-ID: 19987bdb-5d2c-474c-a2f9-91b505ac35f5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19987bdb-5d2c-474c-a2f9-91b505ac35f5;
 Thu, 17 Sep 2020 15:10:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600355407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuyvRRq3qoAtHg8ElWFInTYo9ZirXk+znsFHemENgDs=;
 b=OLdtoHCcWaqyXxXYmoL6zI0p/0kgMZ/HKP0dbBW1py0XL1/xnASQHjVO5oNyJ9TXWx0BuR
 qWr0e5t2xMnIBheCPmGZXNxqVd2cPn7sN7JWARTfsKPKe0lm+9mRL9Z1fHcDv0SRcDLbgJ
 aauetHW0WytTuDyNtC484Ol101+JB4gfsTHtY54AItJ1bWOwh7lZcqyB58b3X++zAL8DYW
 A1O/8+Fn1LlY07lCNOo0CJAOWB+SRbeW74YsulvXjKDj8j4YgMs5SJ2Skb5WJWb9JpXQaI
 Y5zzDGarpAzaRsYa6snUV44/xaUaIutPqUfkojNkPkHI0C+NwoogVyA+8RYwng==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64243AB5C;
 Thu, 17 Sep 2020 15:10:41 +0000 (UTC)
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net>
 <bce3b96d-8e40-0f46-81a8-1cffb464dbd6@suse.com>
 <f77dk3H4FvbqMm9PBWKLDGxWMhJA8Hb9ClafHpPOzZZ5kYgUBVHaa4nUi_m2FY74cS8pV9m6tBy50oWG5TD2u0R-nVIh6S7lqDqjX21ZeEc=@trmm.net>
 <6Vz2rQJvGRtW6Uinda3l_V45Sor337x8uIkVphhgLRUkZSQz33lOJn-qkqwyUhtO-8ZWS28kdVrgIduNAq5Fkv0JPGbJf6_MTvlGAGRYm_s=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <08f957a4-3290-8ab8-1076-174f275b6f9c@suse.com>
Date: Thu, 17 Sep 2020 17:10:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6Vz2rQJvGRtW6Uinda3l_V45Sor337x8uIkVphhgLRUkZSQz33lOJn-qkqwyUhtO-8ZWS28kdVrgIduNAq5Fkv0JPGbJf6_MTvlGAGRYm_s=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.2020 15:33, Trammell Hudson wrote:
> On Thursday, September 17, 2020 9:04 AM, Trammell Hudson <hudson@trmm.net> wrote:
>> On Thursday, September 17, 2020 8:33 AM, Jan Beulich jbeulich@suse.com wrote:
>>> [...]
>>>> -   if ( read_section(image, ".ucode", &ucode, NULL) )
>>>> -            return;
>>>>
>>>> -   name.s = get_value(&cfg, section, "ucode");
>>>
>>> With the Arm change already in mind and with further similar
>>> changes further down, may I suggest to consider passing
>>> 'section' into read_section(), thus guaranteeing consistent
>>> naming between image section and config file items, not only now
>>> but also going forward? read_section() would then check for the
>>> leading dot followed by the specified name.
>>
>> That could work, I think. Let me test it out for v5.
> 
> Or maybe not. section is the "section-name" of the config file
> that is being booted:
> 
> [global]
> default=section-name
> 
> Meanwhile, read_section() wants the PE section name, like ".ucode", which might appear as a line item in that section.

Oh, yes - looking at just the code fragment left in context I
realize my comment was just rubbish. Sorry.

Jan

