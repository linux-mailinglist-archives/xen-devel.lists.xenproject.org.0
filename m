Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B501FB5B8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:12:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDFq-00080r-OT; Tue, 16 Jun 2020 15:12:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlDFp-00080l-Rd
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:12:01 +0000
X-Inumbo-ID: ba28ffde-afe3-11ea-b8f8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba28ffde-afe3-11ea-b8f8-12813bfff9fa;
 Tue, 16 Jun 2020 15:12:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71655B134;
 Tue, 16 Jun 2020 15:12:03 +0000 (UTC)
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
 <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
 <20200616145951.GP735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfe13cc5-ce0a-a50f-fed6-8546407d2e81@suse.com>
Date: Tue, 16 Jun 2020 17:11:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616145951.GP735@Air-de-Roger>
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

On 16.06.2020 16:59, Roger Pau Monné wrote:
> On Tue, Jun 16, 2020 at 03:25:42PM +0200, Jan Beulich wrote:
>> --- unstable.orig/xen/arch/x86/acpi/boot.c
>> +++ unstable/xen/arch/x86/acpi/boot.c
>> @@ -480,7 +480,9 @@ static int __init acpi_parse_fadt(struct
>>  	if (fadt->header.revision >= FADT2_REVISION_ID) {
>>  		/* FADT rev. 2 */
>>  		if (fadt->xpm_timer_block.space_id ==
>> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
>> +		    ACPI_ADR_SPACE_SYSTEM_IO &&
>> +		    (fadt->xpm_timer_block.access_width == 0 ||
>> +		     fadt->xpm_timer_block.access_width == 3)) {
> 
> We should really have defines for those values, or else they seem to
> imply actual access sizes. What about adding
> ACPI_ADDR_ACCESS_{LEGACY,BYTE,WORD,DWORD,QWORD}?

If there were such defines, I'd have used them. Adding them is
inappropriate though, as this would modify an imported header in a
Xen-specific way. We could leverage ACPI_ACCESS_BIT_WIDTH() here,
though.

> Also the check for the access size seems kind of unrelated to the
> patch itself? (not that I'm opposed to it)

It's related, but could also live in its own patch.

Jan

