Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B812C0809
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34226.65105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBYv-0004v5-Ud; Mon, 23 Nov 2020 13:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34226.65105; Mon, 23 Nov 2020 13:07:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBYv-0004uf-R0; Mon, 23 Nov 2020 13:07:21 +0000
Received: by outflank-mailman (input) for mailman id 34226;
 Mon, 23 Nov 2020 13:07:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBYt-0004uW-Td
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:07:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71f9fffa-fa58-4f14-9a61-f23540af3381;
 Mon, 23 Nov 2020 13:07:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45A5DAF40;
 Mon, 23 Nov 2020 13:07:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBYt-0004uW-Td
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:07:19 +0000
X-Inumbo-ID: 71f9fffa-fa58-4f14-9a61-f23540af3381
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 71f9fffa-fa58-4f14-9a61-f23540af3381;
	Mon, 23 Nov 2020 13:07:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606136838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SG87VMAsY8N17K1dmsmWhSR2FvjwB2NZUALLHbpffng=;
	b=gq8l43NEgSqWOEbo7Ep9zAtsGsWKRh8RjNVicrs4ba0lLNc+rYiCtGY+azAA7qBCXT2FjI
	BY+9NmDYCWmxr7Iwz6BLpl0QU68EXUe8R12OLAr+SwBKJzrBMKc8XOsSKJw4JdyZz1oEMa
	UrRErnzA3JsFADlaFn/3K3M8aglnQnU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 45A5DAF40;
	Mon, 23 Nov 2020 13:07:18 +0000 (UTC)
Subject: Re: [PATCH] x86: E801 memory "map" use implies no ACPI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <18ca8671-1478-3dc8-7b91-041dbc18829f@suse.com>
 <cff9ccc4-965a-18e9-1ac3-9779e39c2e62@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <293cc4e1-af95-586c-d908-a392aa9179ef@suse.com>
Date: Mon, 23 Nov 2020 14:07:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cff9ccc4-965a-18e9-1ac3-9779e39c2e62@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 13:37, Andrew Cooper wrote:
> On 20/11/2020 12:45, Jan Beulich wrote:
>> ACPI mandates use of E820 (or newer, e.g. EFI), and in fact firmware
>> has been observed to include E820_ACPI ranges in what E801 reports as
>> available (really "configured") memory.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: Alternatively we could drop all use of E801 (and older), since
>>      there shouldn't be any 64-bit systems not supporting the more
>>      modern E820.
> 
> I'd definitely be in favour of deleting the legacy logic.  The very fact
> that firmware has been observed to include E820_ACPI in E801 maps shows
> that the change here isn't correct in practice.

Mind explaining yourself? I don't see how the change here wouldn't be
correct in practice. Inclusion of ACPI table space in E801 data simply
means either the OS is ACPI-enabled, in which case it won't use E801,
or it's not (or use of ACPI was disabled there by some means) in which
case it's fine to re-use the memory as normal RAM.

> I think we should go further and depend on the bootloader providing the
> memory/video/etc details, which also rips out a lot of 16bit handling
> code in the trampoline.

I wouldn't go this far just yet. We've not been using boot loader
provided memory map data so far, so a first step would imo be to
validate that boot loader provided data is consistent with raw E820
one. We don't want to chance getting screwed up by an old, buggy
boot loader.

> Judging by the context below, I think we should also drop various ACPI
> related options.  Given its ubiquity these days, turning various bits of
> ACPI off is only going to make problems worse.

Probably, but an orthogonal change (and iirc I did recently suggest
the same in a different context). I have to admit that I'd be weary
of regressions if we did so, and if anyone in fact used any of these
options. At the very least I think we would better verbosely deprecate
these (sub)options first, for one or even two release cycles. I still
recall us (SUSE) dropping a custom patch we had been carrying (and
which was rejected upstream) changing the default IO-APIC ack mode for
single IO-APIC systems to old-style, resulting in an instant report
that some director's or even VP's laptop broke. Hence, despite the
upstream rejection, we've now been carrying this change for perhaps
over 10 years. Any change in such areas feels like it could suffer
similar fallout.

Jan

