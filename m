Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F7366965
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 12:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114399.218015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZALB-0002vR-9W; Wed, 21 Apr 2021 10:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114399.218015; Wed, 21 Apr 2021 10:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZALB-0002v2-6C; Wed, 21 Apr 2021 10:44:17 +0000
Received: by outflank-mailman (input) for mailman id 114399;
 Wed, 21 Apr 2021 10:44:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZAL9-0002ux-Hv
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:44:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 145dd596-5c32-4f13-91ee-9bcb6abc665a;
 Wed, 21 Apr 2021 10:44:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFF6AAE06;
 Wed, 21 Apr 2021 10:44:13 +0000 (UTC)
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
X-Inumbo-ID: 145dd596-5c32-4f13-91ee-9bcb6abc665a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619001854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqsgRc4oxAXgb57FSbSwGKWGSaMB1ANQTgYrCAKXqRM=;
	b=VzNZVmEgyBOjssT0TLz935Pm5hWLmWDopPN0I0UAkERw1yml6uLqlZ0k9ohTFVMTrm2LXG
	aYeikBW0ZhuoXnfOeCNZDsmI0ck7kfQ77CMAhr39CNlvbbGkj+twcbpVPh7C7b5Yi7C2A6
	k7dZg+Ixa2ePB5NmsiRlfH7rGWfRh0M=
Subject: Re: [PATCH 4/8] x86/EFI: redo .reloc section bounds determination
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <b886eb2c-cabc-f195-4996-aae1fc3c61d9@suse.com>
 <YH/0dzlPxwWF1PA2@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfcc9535-e9c0-97f1-4970-9a78af039c28@suse.com>
Date: Wed, 21 Apr 2021 12:44:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH/0dzlPxwWF1PA2@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 11:46, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:45:38AM +0200, Jan Beulich wrote:
>> There's no need to link relocs-dummy.o into the ELF binary. The two
>> symbols needed can as well be provided by the linker script. Then our
>> mkreloc tool also doesn't need to put them in the generated assembler
>> source.
> 
> Maybe I'm just dense today, but I think the message needs to be
> expanded a bit to mention that while the __base_relocs_{start,end} are
> not used when loaded as an EFI application, they are used by the EFI
> code in Xen when booted using the multiboot2 protocol for example, as
> they are used by efi_arch_relocate_image.
> 
> I think relocation is not needed when natively loaded as an EFI
> application, as then the load address matches the one expected by
> Xen?

It's quite the other way around: The EFI loader applies relocations
to put the binary at its loaded _physical_ address (the image gets
linked for the final virtual address). Hence we need to apply the
same relocations a 2nd time (undoing what the EFI loader did)
before we can branch from the physical (identity mapped) address
range where xen.efi was loaded to the intended virtual address
range where we mean to run Xen from.

For the ELF binary the symbols are needed solely to make ld happy.

> I also wonder, at some point there where plans for providing a single
> binary that would work as multiboot{1,2} and also be capable of being
> loaded as an EFI application (ie: have a PE/COFF header also I assume
> together with the ELF one), won't the changes here make it more
> difficult to reach that goal or require reverting later on, as I feel
> they are adding more differences between the PE binary and the ELF
> one.

There were such plans, yes, but from the last round of that series
I seem to recall that there was at least one issue breaking this
idea. So no, at this point I'm not intending to take precautions to
make that work easier (or not further complicate it). This said, I
don't think the change here complicates anything there.

> The code LGTM, but I think at least I would like the commit message to
> be expanded.

Well, once I know what exactly you're missing there, I can certainly
try to expand it.

Jan

