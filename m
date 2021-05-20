Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA338A14A
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130831.244853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeyr-0008QE-Mu; Thu, 20 May 2021 09:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130831.244853; Thu, 20 May 2021 09:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeyr-0008OK-Jf; Thu, 20 May 2021 09:28:37 +0000
Received: by outflank-mailman (input) for mailman id 130831;
 Thu, 20 May 2021 09:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljeyq-0008O7-Ay
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:28:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 855f4462-1201-4487-b0b2-553312c34c64;
 Thu, 20 May 2021 09:28:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 391FBB264;
 Thu, 20 May 2021 09:28:34 +0000 (UTC)
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
X-Inumbo-ID: 855f4462-1201-4487-b0b2-553312c34c64
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621502914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Id3ljkLkZzG/SvPiXMFE+JlFX7yGWGR/3nBdO8XGeCk=;
	b=U2vhyOkZdBadeQr7Xeu7RaOLfkvYXqCjZo4mJf/3qhQ1yZe/TtEDkeTdBdCiVwggpMchhI
	74oInRisxdqsEjn2PtqF8nBcCgpt8KZzH8MlwNXRWVONaQ+rJnFFAbl82WXa1sIjJC4+8Y
	3POAxoXFZ10fLD/8D63XNI7P+cRLDsY=
Subject: Re: [PATCH v2] libelf: improve PVH elfnote parsing
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210518144741.44395-1-roger.pau@citrix.com>
 <c645b764-00fe-2b90-3b31-7f2bb6f07c02@suse.com>
 <YKYreLP8N16vcIVB@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <162f76e1-9da5-c750-2591-ea011b4b2842@suse.com>
Date: Thu, 20 May 2021 11:28:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YKYreLP8N16vcIVB@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.05.2021 11:27, Roger Pau Monné wrote:
> On Wed, May 19, 2021 at 12:34:19PM +0200, Jan Beulich wrote:
>> On 18.05.2021 16:47, Roger Pau Monne wrote:
>>> @@ -425,8 +425,11 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
>>>          return -1;
>>>      }
>>>  
>>> -    /* Initial guess for virt_base is 0 if it is not explicitly defined. */
>>> -    if ( parms->virt_base == UNSET_ADDR )
>>> +    /*
>>> +     * Initial guess for virt_base is 0 if it is not explicitly defined in the
>>> +     * PV case. For PVH virt_base is forced to 0 because paging is disabled.
>>> +     */
>>> +    if ( parms->virt_base == UNSET_ADDR || hvm )
>>>      {
>>>          parms->virt_base = 0;
>>>          elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
>>
>> This message is wrong now if hvm is true but parms->virt_base != UNSET_ADDR.
>> Best perhaps is to avoid emitting the message altogether when hvm is true.
>> (Since you'll be touching it anyway, perhaps a good opportunity to do away
>> with passing parms->virt_base to elf_msg(), and instead simply use a literal
>> zero.)
>>
>>> @@ -441,8 +444,10 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
>>>       *
>>>       * If we are using the modern ELF notes interface then the default
>>>       * is 0.
>>> +     *
>>> +     * For PVH this is forced to 0, as it's already a legacy option for PV.
>>>       */
>>> -    if ( parms->elf_paddr_offset == UNSET_ADDR )
>>> +    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
>>>      {
>>>          if ( parms->elf_note_start )
>>
>> Don't you want "|| hvm" here as well, or alternatively suppress the
>> fallback to the __xen_guest section in the PVH case (near the end of
>> elf_xen_parse())?
> 
> The legacy __xen_guest section doesn't support PHYS32_ENTRY, so yes,
> that part could be completely skipped when called from an HVM
> container.
> 
> I think I will fix that in another patch though if you are OK, as
> it's not strictly related to the calculation fixes done here.

That's fine; it wants to be a prereq to the one here then, though,
I think.

Jan

