Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2302F1631
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64857.114676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxaI-0002Mg-E1; Mon, 11 Jan 2021 13:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64857.114676; Mon, 11 Jan 2021 13:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxaI-0002MH-AY; Mon, 11 Jan 2021 13:50:14 +0000
Received: by outflank-mailman (input) for mailman id 64857;
 Mon, 11 Jan 2021 13:50:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kyxaG-0002MA-5d
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:50:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b5ea5f4-e5f5-49d1-9d12-3984a03f4462;
 Mon, 11 Jan 2021 13:50:10 +0000 (UTC)
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
X-Inumbo-ID: 7b5ea5f4-e5f5-49d1-9d12-3984a03f4462
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610373010;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mUeOjPN5xzUmW+1WYpmcBjCI5XOVdIMVii8hzvxAeIc=;
  b=CH6PZXKrYCCfK4JqI52QYtKDa0Iqa1FhAkerCXi3XypFO3EQp+LWjBKW
   Gof7dJrnT0Lgn1aPeAwS4m3Z2PoAAUljvKrWJvWCV+qFwfxAuedS2l7Sb
   hgj8N7/mR+IV/dP58poyAoyFb18tBGB82Nva52v6GMzeeAWA1Dipak98G
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: X9blBRZBU8yzkz6RqdEUyvhuNuVb0o6ZoAR7tdMaN7v+XBVBn0rK3ZlChsHF5nbA/ThIfgLMan
 mLt4dhzRByBv13bzk1+4WWxgYp/z86G2FqmENnK5Sjn5TgWf8xtA5tQXnHYZfhuZbkjh3f1rDW
 oCT1uXQDylcpcNO0E2WRCsboFnTcN4gz9tLclK2EHAJaWw8ZOwgQUJww+VYjL0YXno4clmd/tt
 hqWXHFf6hb2afJx/n62nGPOFPow8I96i/p+z1JQoAgfNFaF6pTD95El9bPUU3RolJK74vtTB04
 9o4=
X-SBRS: 5.2
X-MesageID: 34866207
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34866207"
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
CC: <wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
 <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
 <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org>
 <33322763-6810-3bfc-9573-1e326b38293e@suse.com>
 <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
 <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
 <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
 <560f9255-3b38-62f6-2b0b-db87dffd36e3@citrix.com>
 <cb26b3e9-3a76-98a6-5a03-4abed060134e@suse.com>
 <00b701d6e820$5f5d35f0$1e17a1d0$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3e2904a6-e10b-2276-d615-dc32def8df67@citrix.com>
Date: Mon, 11 Jan 2021 13:50:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <00b701d6e820$5f5d35f0$1e17a1d0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/01/2021 13:47, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 11 January 2021 13:38
>> To: Igor Druzhinin <igor.druzhinin@citrix.com>; paul@xen.org
>> Cc: wl@xen.org; iwj@xenproject.org; anthony.perard@citrix.com; andrew.cooper3@citrix.com;
>> george.dunlap@citrix.com; julien@xen.org; sstabellini@kernel.org; roger.pau@citrix.com; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per partition
>>
>> On 11.01.2021 14:34, Igor Druzhinin wrote:
>>> On 11/01/2021 09:16, Jan Beulich wrote:
>>>> On 11.01.2021 10:12, Paul Durrant wrote:
>>>>>> From: Paul Durrant <xadimgnik@gmail.com>
>>>>>> Sent: 11 January 2021 09:10
>>>>>>
>>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>>> Sent: 11 January 2021 09:00
>>>>>>>
>>>>>>> On 11.01.2021 09:45, Paul Durrant wrote:
>>>>>>>> You can add my R-b to the patch.
>>>>>>>
>>>>>>> That's the unchanged patch then, including the libxl change that
>>>>>>> I had asked about and that I have to admit I don't fully follow
>>>>>>> Igor's responses? I'm hesitant to give an ack for that aspect of
>>>>>>> the change, yet I suppose the libxl maintainers will defer to
>>>>>>> x86 ones there. Alternatively Andrew or Roger could of course
>>>>>>> ack this ...
>>>>>>>
>>>>>>
>>>>>> I don't think we really need specific control in xl.cfg as this is a fix for some poorly
>> documented
>>>>>> semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I
>> think
>>>>>> that's enough.
>>>>>
>>>>> ... although adding an option in xl/libxl isn't that much work, I suppose.
>>>>>
>>>>> Igor, would you be ok plumbing it through?
>>>>
>>>> This back and forth leaves unclear to me what I should do. I
>>>> would have asked on irc, but you're not there as it seems.
>>>
>>> I don't see a scenario where somebody would want to opt out of unlimited
>>> VPs per domain given the leaf with -1 is supported on all Windows versions.
>>
>> So Paul - commit patch as is then?
>>
>>> I can make it configurable in the future if reports re-surface it causes
>>> troubles somewhere.
>>
>> This is the slight concern I have: Having to make it configurable
>> once someone has reported trouble would look a little late to me.
>> Otoh I agree it may end up being dead code if no problems get
>> ever encountered.
>>
> 
> I think I'm persuaded by your caution. Since it's not a massive amount of code, let's have flags for both wired through to xl and default them to on, so I withdraw my R-b for the libxl_x86.c hunk.

Ok, will re-work the patches.

Igot

