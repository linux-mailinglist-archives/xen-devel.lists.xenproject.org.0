Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CC61E24DC
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 17:01:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdb4v-00031t-TX; Tue, 26 May 2020 15:01:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vgeY=7I=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdb4u-00031o-2b
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 15:01:16 +0000
X-Inumbo-ID: be8c096e-9f61-11ea-a65c-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be8c096e-9f61-11ea-a65c-12813bfff9fa;
 Tue, 26 May 2020 15:01:15 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:51506
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdb4p-000WRX-KF (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 26 May 2020 16:01:11 +0100
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
To: Jan Beulich <jbeulich@suse.com>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
 <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2c0ff1f3-ee0c-6d14-a51c-d82b65338005@citrix.com>
Date: Tue, 26 May 2020 16:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

On 26/05/2020 14:35, Jan Beulich wrote:
> On 26.05.2020 13:17, Andrew Cooper wrote:
>> On 26/05/2020 07:49, Jan Beulich wrote:
>>> Respective Core Gen10 processor lines are affected, too.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>>      case 0x000806e0: /* erratum KBL??? */
>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
>> This is marred in complexity.
>>
>> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
>> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
>> no longer exists/works.  This applies to IceLake systems, but possibly
>> not their initial release configuration (hence, via a later microcode
>> update).
>>
>> HLE is also disabled in microcode on all older parts for errata reasons,
>> so in practice it doesn't exist anywhere now.
>>
>> I think it is safe to drop this workaround, and this does seem a more
>> simple option than encoding which microcode turned HLE off (which sadly
>> isn't covered by the spec updates, as even when turned off, HLE is still
>> functioning according to its spec of "may speed things up, may do
>> nothing"), or the interactions with the CPUID hiding capabilities of
>> MSR_TSX_CTRL.
> I'm afraid I don't fully follow: For one, does what you say imply HLE is
> no longer enumerated in CPUID?

No - sadly not.  For reasons of "not repeating the Haswell/Broadwell
microcode fiasco", the HLE bit will continue to exist and be set. 
(Although on CascadeLake and later, you can turn it off with MSR_TSX_CTRL.)

It was always a weird CPUID bit.  You were supposed to put
XACQUIRE/XRELEASE prefixes on your legacy locking, and it would be a nop
on old hardware and go faster on newer hardware.

There is nothing runtime code needs to look at the HLE bit for, except
perhaps for UI reporting purposes.

> But then this
> erratum does not have the usual text effectively meaning that an ucode
> update is or will be available to address the issue; instead it says
> that BIOS or VMM can reserve the respective address range.

This is not surprising at all.  Turning off HLE was an unrelated
activity, and I bet the link went unnoticed.

> This - assuming the alternative you describe is indeed viable - then is surely
> a much more intrusive workaround than needed. Which I wouldn't assume
> they would suggest in such a case.

My suggestion was to drop the workaround, not to complicated it with a
microcode revision matrix.

~Andrew

