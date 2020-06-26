Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CF120B42E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:09:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jopyK-00040f-QF; Fri, 26 Jun 2020 15:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3dG=AH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jopyJ-00040Y-Qt
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:08:55 +0000
X-Inumbo-ID: f3a1576a-b7be-11ea-82cf-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3a1576a-b7be-11ea-82cf-12813bfff9fa;
 Fri, 26 Jun 2020 15:08:55 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KMAP5/iI7KGQCDicV0q8qkboU0msafPKyb4nfgXGC33TfWdFltZwZOxT6YmjI/3ACs5e8CKQbQ
 gHlzfm/rAS65StxHRdwjXCWxyuKrxWOAB1tfJdyLbJEWjO4O9Py05rzm5q9TNzdBKOohwoI/q8
 wfmrKqUMhenhumtwbGZlzm6jl+CA2hL8i5iR0OFYDa14Gfty+0CZEbq0T5aLciZg6ghMDH9OjR
 riIh4OmolRQslEAvEsBQtlYTusfSGLFUMd1q4aiZ2PEAnFNWXrlZ2N0qNP12H98dwCMR0bcG+P
 rZk=
X-SBRS: 2.7
X-MesageID: 21043473
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21043473"
Subject: Re: [PATCH v2 for-4.14] x86/livepatch: Make livepatching compatible
 with CET Shadow Stacks
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20200626122408.19151-1-andrew.cooper3@citrix.com>
 <4bd8ab3e-37d0-fde9-10a3-b6b2f9ca4da6@citrix.com>
 <29ae3614-a73e-de01-f10f-8f3a32c3372a@suse.com>
 <5756a404-2d0a-3146-0682-dc89ad4a3c61@citrix.com>
 <2e0f93a1-29da-9457-a548-41e2c51ce75b@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c3f65904-30cb-b390-3f67-be6f706e26b6@citrix.com>
Date: Fri, 26 Jun 2020 16:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2e0f93a1-29da-9457-a548-41e2c51ce75b@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/06/2020 16:07, Ross Lagerwall wrote:
> On 2020-06-26 15:46, Andrew Cooper wrote:
>> On 26/06/2020 15:26, Jan Beulich wrote:
>>> On 26.06.2020 15:59, Ross Lagerwall wrote:
>>>> On 2020-06-26 13:24, Andrew Cooper wrote:
>>>>> @@ -56,18 +57,48 @@ int arch_livepatch_safety_check(void)
>>>>>      return -EBUSY;
>>>>>  }
>>>>>  
>>>>> -int arch_livepatch_quiesce(void)
>>>>> +int noinline arch_livepatch_quiesce(void)
>>>>>  {
>>>>> +    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
>>>>> +    if ( cpu_has_xen_shstk )
>>>> Should this be:
>>>>     if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
>>>>
>>>> to match arch_livepatch_revive?
>>> While it may look a little asymmetric, I think it's preferable
>>> to is IS_ENABLED() only where really needed, i.e. here it
>>> guarding code that otherwise may not build.
>> The reason for the asymmetry is because of the asm() block, which needs
>> compiling out when we detect that we don't have a compatible assembler.
>>
> In that case,
>
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks.  I've decided to clean this up in the (growing) series of 4.15
changes.

~Andrew

