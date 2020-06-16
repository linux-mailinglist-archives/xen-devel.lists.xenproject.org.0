Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257151FB0C6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 14:32:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlAkZ-0002eU-Px; Tue, 16 Jun 2020 12:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlAkY-0002eP-Ig
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 12:31:34 +0000
X-Inumbo-ID: 4f68b114-afcd-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f68b114-afcd-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 12:31:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 752CBAD35;
 Tue, 16 Jun 2020 12:31:35 +0000 (UTC)
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <440b1c62-e3bd-6a91-f75f-e85d8772f4e0@suse.com>
Date: Tue, 16 Jun 2020 14:31:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616103204.GN735@Air-de-Roger>
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
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.06.2020 12:32, Roger Pau Monné wrote:
> On Tue, Jun 16, 2020 at 10:07:05AM +0200, Jan Beulich wrote:
>> On 14.06.2020 16:36, Grzegorz Uriasz wrote:
>>> --- a/xen/arch/x86/acpi/boot.c
>>> +++ b/xen/arch/x86/acpi/boot.c
>>> @@ -480,7 +480,10 @@ static int __init acpi_parse_fadt(struct acpi_table_header *table)
>>>  		if (fadt->xpm_timer_block.space_id ==
>>>  		    ACPI_ADR_SPACE_SYSTEM_IO) {
>>>  			pmtmr_ioport = fadt->xpm_timer_block.address;
>>> -			pmtmr_width = fadt->xpm_timer_block.bit_width;
>>> +			if (fadt->flags & ACPI_FADT_32BIT_TIMER)
>>> +				pmtmr_width = 32;
>>> +			else
>>> +				pmtmr_width = 24;
>>
>> I think disagreement of the two wants logging, and you want to
>> default to using the smaller of the two (or even to ignoring the
>> timer altogether). Then there wants to be a way to override
>> (unless we already have one) our defaulting, in case it's wrong.
> 
> TBH, I presume timer_block will always return 32bits, because that's
> the size of the register. Then the timer can implement less bits than
> the full size of the register, and that's what gets signaled using the
> ACPI flags. What we care about here is the number of bits used by the
> timer, not the size of the register.

The first random system I checked this on reports 24 bits as bit_width
(and the flag clear, i.e. both are consistent). The flag, aiui, is
really important only in the ACPI v1 case, where the size of the
register was a byte-granular value. The spec isn't helpful in
clarifying applicability of the flag though, i.e. one can interpret it
either way imo.

Jan

> I think we should only ignore the timer if pm_timer_block.bit_width <
> pmtmr_width.
> 
> Printing a (debug) message when those values disagree is fine, but I
> bet it's going to trigger always when the implemented timer is only
> using 24bits.
> 
> Roger.
> 


