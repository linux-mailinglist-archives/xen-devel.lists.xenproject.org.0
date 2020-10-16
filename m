Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F3C290808
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 17:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8154.21682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTRQ0-0000W5-PZ; Fri, 16 Oct 2020 15:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8154.21682; Fri, 16 Oct 2020 15:13:20 +0000
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
	id 1kTRQ0-0000Vg-MV; Fri, 16 Oct 2020 15:13:20 +0000
Received: by outflank-mailman (input) for mailman id 8154;
 Fri, 16 Oct 2020 15:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTRPy-0000VF-Ql
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:13:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 456f4deb-aac8-4ad1-8bea-3215f2602c34;
 Fri, 16 Oct 2020 15:13:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 946A6AF9A;
 Fri, 16 Oct 2020 15:13:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTRPy-0000VF-Ql
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:13:18 +0000
X-Inumbo-ID: 456f4deb-aac8-4ad1-8bea-3215f2602c34
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 456f4deb-aac8-4ad1-8bea-3215f2602c34;
	Fri, 16 Oct 2020 15:13:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602861196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOgNhQtd3aRqAUNIbNLdv1bMju80JaCznmCPD38hmJg=;
	b=H7yC3e2hjheX73srcLgf0TABeesGUpSljmZg7sze4/yUg1oI5TthkGe9W04ocrEpW9BnuU
	1Cxn3FWwJHtGki2PPbb/Vv0+QuOkkLg4YjMlImsXeciIyalbXJnZ7kwmMVSGgLjqUvPlzS
	ear85P+PB5ncbY/RZJB0dS2OxPvXa94=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 946A6AF9A;
	Fri, 16 Oct 2020 15:13:16 +0000 (UTC)
Subject: Re: [PATCH v2] hvmloader: flip "ACPI data" to "ACPI NVS" type for
 ACPI table region
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1602808763-22396-1-git-send-email-igor.druzhinin@citrix.com>
 <ca9ba430-f5d8-f520-e7db-3e8d41cd7d9b@suse.com>
 <53939fbe-6370-fdf7-9727-398a474b219e@eikelenboom.it>
 <fec9f2f9-0980-c28d-b4b4-c7c2fc9928b7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73de9a13-0f93-6152-f256-37aa3510d6fd@suse.com>
Date: Fri, 16 Oct 2020 17:13:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <fec9f2f9-0980-c28d-b4b4-c7c2fc9928b7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 15:48, Igor Druzhinin wrote:
> On 16/10/2020 14:34, Sander Eikelenboom wrote:
>> On 16/10/2020 08:34, Jan Beulich wrote:
>>> On 16.10.2020 02:39, Igor Druzhinin wrote:
>>>> ACPI specification contains statements describing memory marked with regular
>>>> "ACPI data" type as reclaimable by the guest. Although the guest shouldn't
>>>> really do it if it wants kexec or similar functionality to work, there
>>>> could still be ambiguities in treating these regions as potentially regular
>>>> RAM.
>>>>
>>>> One such example is SeaBIOS which currently reports "ACPI data" regions as
>>>> RAM to the guest in its e801 call. Which it might have the right to do as any
>>>> user of this is expected to be ACPI unaware. But a QEMU bootloader later seems
>>>> to ignore that fact and is instead using e801 to find a place for initrd which
>>>> causes the tables to be erased. While arguably QEMU bootloader or SeaBIOS need
>>>> to be fixed / improved here, that is just one example of the potential problems
>>>> from using a reclaimable memory type.
>>>>
>>>> Flip the type to "ACPI NVS" which doesn't have this ambiguity in it and is
>>>> described by the spec as non-reclaimable (so cannot ever be treated like RAM).
>>>>
>>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>
>>>
>>
>> I don't see any stable and or fixes tags, but I assume this will go to
>> the stable trees (which have (a backport of)
>> 8efa46516c5f4cf185c8df179812c185d3c27eb6 in their staging branches) ?

Yes, I intend to queue this up, as I did the backport of the
earlier one.

> Yes, this should go to the stable branches as well. I don't usually see Fixes:
> tag being used on xen-devel (not sure if it's intentional or simply not
> customary).

Go look again - there's an increasing amount of use of it.

> It's also questionable whether it's a fix or a workaround for an
> issue with compatibility.

Indeed - it is for this reason that I didn't ask for such a
tag to be added here.

Jan

