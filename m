Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2F1E22FD
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 15:36:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdZje-0002iB-8c; Tue, 26 May 2020 13:35:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdZjc-0002i6-P5
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 13:35:12 +0000
X-Inumbo-ID: b9344fdc-9f55-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9344fdc-9f55-11ea-8993-bc764e2007e4;
 Tue, 26 May 2020 13:35:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF507ADD7;
 Tue, 26 May 2020 13:35:13 +0000 (UTC)
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
Date: Tue, 26 May 2020 15:35:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.05.2020 13:17, Andrew Cooper wrote:
> On 26/05/2020 07:49, Jan Beulich wrote:
>> Respective Core Gen10 processor lines are affected, too.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>      case 0x000806e0: /* erratum KBL??? */
>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
> 
> This is marred in complexity.
> 
> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
> no longer exists/works.  This applies to IceLake systems, but possibly
> not their initial release configuration (hence, via a later microcode
> update).
> 
> HLE is also disabled in microcode on all older parts for errata reasons,
> so in practice it doesn't exist anywhere now.
> 
> I think it is safe to drop this workaround, and this does seem a more
> simple option than encoding which microcode turned HLE off (which sadly
> isn't covered by the spec updates, as even when turned off, HLE is still
> functioning according to its spec of "may speed things up, may do
> nothing"), or the interactions with the CPUID hiding capabilities of
> MSR_TSX_CTRL.

I'm afraid I don't fully follow: For one, does what you say imply HLE is
no longer enumerated in CPUID? If so, and if we assume all CPU models
listed have had suitable ucode updates issued, we could indeed drop the
workaround (as taking effect only when HLE is enumerated). But then this
erratum does not have the usual text effectively meaning that an ucode
update is or will be available to address the issue; instead it says
that BIOS or VMM can reserve the respective address range. This -
assuming the alternative you describe is indeed viable - then is surely
a much more intrusive workaround than needed. Which I wouldn't assume
they would suggest in such a case.

Jan

