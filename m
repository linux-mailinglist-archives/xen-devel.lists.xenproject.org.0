Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0791EF374
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 10:54:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh87U-0007zt-Ug; Fri, 05 Jun 2020 08:54:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jh87S-0007ze-SW
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 08:54:30 +0000
X-Inumbo-ID: 2acbeebe-a70a-11ea-af8f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2acbeebe-a70a-11ea-af8f-12813bfff9fa;
 Fri, 05 Jun 2020 08:54:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82A39AFC6;
 Fri,  5 Jun 2020 08:54:32 +0000 (UTC)
Subject: Re: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
 <20200605080216.GI1195@Air-de-Roger>
 <32c4cdf7-0fdd-8b12-ee42-dfe8fe096935@suse.com>
 <20200605084644.GJ1195@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d24f6ebc-7b3c-d560-c073-3c039542ebf8@suse.com>
Date: Fri, 5 Jun 2020 10:54:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605084644.GJ1195@Air-de-Roger>
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 10:46, Roger Pau Monné wrote:
> On Fri, Jun 05, 2020 at 10:10:01AM +0200, Jan Beulich wrote:
>> On 05.06.2020 10:02, Roger Pau Monné wrote:
>>> On Fri, Jun 05, 2020 at 09:51:09AM +0200, Jan Beulich wrote:
>>>> Both match prior generation processors as far as LBR and C-state MSRs
>>>> go (SDM rev 072) as well as applicability of the if_pschange_mc erratum
>>>> (recent spec updates).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Such changes having been subject to backporting in the past, this
>>>> change may want considering for 4.14.
>>>> ---
>>>> I'm leaving alone spec_ctrl.c, albeit there's a scary looking erratum
>>>> for Ice Lake indicating that MDS_NO may wrongly be set. But this is
>>>> apparently addressed by ucode update, so we may not need to deal with
>>>> it in software.
>>>>
>>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>>
>>> What about mwait-idle? I guess we pick that from Linux and no patch
>>> has been added so far?
>>
>> Correct. I've looked at recent history there, and I'm uncertain they'll
>> add further models there. They look to prefer to use ACPI _CST now again
>> with, as it seems, not overly much of a difference to the ACPI driver
>> (which, if we were to follow, I'd rather see us integrate there).
> 
> Urg, OK, that's a shame as using mwait-idle was IMO better from a Xen
> PoV as we didn't rely on dom0 in order to discover C states. I wonder
> if we could continue to update mwait-idle on our own for newer models.

This would be nice indeed, but would require Intel to provide us with
the necessary data.

> FWIW, wikichip also lists 6c and 6a [0] as Ice Lake Server model versions,
> but I'm not sure if this has been confirmed in any way?

SDM vol 4 confirms this, but mentions the two model numbers exclusively
in the table matching signatures to model names ("Future Intel Xeon
processors based on Ice Lake microarchitecture"). Without there being an
actual table for these I don't think we should "speculatively" add the
numbers anywhere.

Jan

