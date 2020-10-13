Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1B28D18F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6306.16818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMct-0002GT-7f; Tue, 13 Oct 2020 15:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6306.16818; Tue, 13 Oct 2020 15:54:11 +0000
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
	id 1kSMct-0002G4-4R; Tue, 13 Oct 2020 15:54:11 +0000
Received: by outflank-mailman (input) for mailman id 6306;
 Tue, 13 Oct 2020 15:54:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSMcs-0002Fz-CD
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:54:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0b96e96-0afc-49fb-9ba4-ff18ca0c4ddc;
 Tue, 13 Oct 2020 15:54:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD8B9AEC4;
 Tue, 13 Oct 2020 15:54:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSMcs-0002Fz-CD
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:54:10 +0000
X-Inumbo-ID: d0b96e96-0afc-49fb-9ba4-ff18ca0c4ddc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d0b96e96-0afc-49fb-9ba4-ff18ca0c4ddc;
	Tue, 13 Oct 2020 15:54:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602604448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASAJNSyPvPqEFLxRCkze7om4ldPd7D5tSkcPDTNicv4=;
	b=Vv8WlQ7fADAjay2FsEAF4FUrGgyhEKAm9Xp6W5/Vsh9tFig+TII39O2ppSw7o/AznPkS5N
	yYBMW+rmqaFs2T83hoysYfZq79TgKrMXmBkYWsHvzP2WzjS+blrrlBfNjIa9t2vOeyo4fc
	fgPWas4bSZq4Eq6DwczyDIdIIIZhN08=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AD8B9AEC4;
	Tue, 13 Oct 2020 15:54:08 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: flip "ACPI data" to ACPI NVS type for ACPI
 table region
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
 <56bea9a9-2509-cc39-a6fd-fb7db3e54d71@suse.com>
 <83f567a1-35f3-a227-830b-a59b53217f3b@citrix.com>
 <ad54c16b-c3b0-cff2-921f-b84a735d3149@suse.com>
 <cc0f409e-60c0-41ae-f932-f6c2d7f82baa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d7bf2ce-1acb-05ff-a57b-d698e15c4dd1@suse.com>
Date: Tue, 13 Oct 2020 17:54:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cc0f409e-60c0-41ae-f932-f6c2d7f82baa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.10.2020 17:47, Igor Druzhinin wrote:
> On 13/10/2020 16:35, Jan Beulich wrote:
>> On 13.10.2020 14:59, Igor Druzhinin wrote:
>>> On 13/10/2020 13:51, Jan Beulich wrote:
>>>> As a consequence I think we will also want to adjust Xen itself to
>>>> automatically disable ACPI when it ends up consuming E801 data. Or
>>>> alternatively we should consider dropping all E801-related code (as
>>>> being inapplicable to 64-bit systems).
>>>
>>> I'm not following here. What Xen has to do with E801? It's a SeaBIOS implemented
>>> call that happened to be used by QEMU option ROM. We cannot drop it from there
>>> as it's part of BIOS spec.
>>
>> Any ACPI aware OS has to use E820 (and nothing else). Hence our
>> own use of E801 should either be dropped, or lead to the
>> disabling of ACPI. Otherwise real firmware using logic similar
>> to SeaBIOS'es (but hopefully properly accounting for holes)
>> could make us use ACPI table space as normal RAM.
> 
> It's not us using it - it's a boot loader from QEMU in a form of option ROM
> that works in 16bit pre-OS environment which is not OS and relies on e801 BIOS call.
> I'm sure any ACPI aware OS does indeed use E820 but the problem here is not an OS.
> 
> The option ROM is loaded using fw_cfg from QEMU so it's not our code. Technically
> it's one foreign code (QEMU boot loader) talking to another foreign code (SeaBIOS)
> which provides information based on E820 that we gave them.
> 
> So I'm afraid decision to dynamically disable ACPI (whatever you mean by this)
> cannot be made by sole usage of this call by a pre-OS boot loader.

I guess this is simply a misunderstanding. I'm not talking about
your change or hvmloader or the boot loader at all. I was merely
noticing a consequence of your findings on the behavior of Xen
itself: Use of ACPI and use of E801 are exclusive of one another.

Jan

