Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74236290692
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8109.21590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTQ5l-0000YE-Ru; Fri, 16 Oct 2020 13:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8109.21590; Fri, 16 Oct 2020 13:48:21 +0000
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
	id 1kTQ5l-0000Xp-Oj; Fri, 16 Oct 2020 13:48:21 +0000
Received: by outflank-mailman (input) for mailman id 8109;
 Fri, 16 Oct 2020 13:48:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4tE9=DX=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kTQ5k-0000Xk-87
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:48:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27a63c06-51d1-4f0e-aaa2-7f1d7959f739;
 Fri, 16 Oct 2020 13:48:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4tE9=DX=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kTQ5k-0000Xk-87
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:48:20 +0000
X-Inumbo-ID: 27a63c06-51d1-4f0e-aaa2-7f1d7959f739
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27a63c06-51d1-4f0e-aaa2-7f1d7959f739;
	Fri, 16 Oct 2020 13:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602856100;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=/uTGAOHVM6OgzZGlniKnsA3XGb4PTOM3COnWEP9stio=;
  b=FXWt+3i4q9IyTy/TtDkLV52dpq1B1tjPpOSHJXIDPCL4Rk6CXNOy81ST
   7k5HTmZxz+dV+NfL9ErJ/0SOFTFkY2ee0JS9BUM89Co5zrTpu5k46kq9m
   1BASVVOsDYKZ8Gz8LVTlJe4qwJ4F8Bodu2DB+tHhPysSFfIXTUS9fctZy
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hk46Jgw93JoOWCt+ao15E/e/zU5NGbgvGR1UuRZIAakSINGhe5BltflNeD+ZbcWBeABmpn7qlB
 cFTY2vvNumndtYjgJtjp2R7XPtxDJ4EltqVmoDcxynJ5lfC3zC39nri5q8wjcEh6OFs7oD/VBy
 UrFAjxDcB5bjCUo446jXLSMxe4Qk9YqwbPWN1orutKkICP19ED9POs7+Uk6ShytMsvzP1CCvmR
 rwyE3UQhJbw3J/RiDMQxaD/+KiKJplVRCfrB9tmwRFGk8UhrLdT6fZmFzWrgQj6lelGR4uKXkZ
 XZ0=
X-SBRS: 2.5
X-MesageID: 29175189
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,383,1596513600"; 
   d="scan'208";a="29175189"
Subject: Re: [PATCH v2] hvmloader: flip "ACPI data" to "ACPI NVS" type for
 ACPI table region
To: Sander Eikelenboom <linux@eikelenboom.it>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1602808763-22396-1-git-send-email-igor.druzhinin@citrix.com>
 <ca9ba430-f5d8-f520-e7db-3e8d41cd7d9b@suse.com>
 <53939fbe-6370-fdf7-9727-398a474b219e@eikelenboom.it>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <fec9f2f9-0980-c28d-b4b4-c7c2fc9928b7@citrix.com>
Date: Fri, 16 Oct 2020 14:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <53939fbe-6370-fdf7-9727-398a474b219e@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16/10/2020 14:34, Sander Eikelenboom wrote:
> On 16/10/2020 08:34, Jan Beulich wrote:
>> On 16.10.2020 02:39, Igor Druzhinin wrote:
>>> ACPI specification contains statements describing memory marked with regular
>>> "ACPI data" type as reclaimable by the guest. Although the guest shouldn't
>>> really do it if it wants kexec or similar functionality to work, there
>>> could still be ambiguities in treating these regions as potentially regular
>>> RAM.
>>>
>>> One such example is SeaBIOS which currently reports "ACPI data" regions as
>>> RAM to the guest in its e801 call. Which it might have the right to do as any
>>> user of this is expected to be ACPI unaware. But a QEMU bootloader later seems
>>> to ignore that fact and is instead using e801 to find a place for initrd which
>>> causes the tables to be erased. While arguably QEMU bootloader or SeaBIOS need
>>> to be fixed / improved here, that is just one example of the potential problems
>>> from using a reclaimable memory type.
>>>
>>> Flip the type to "ACPI NVS" which doesn't have this ambiguity in it and is
>>> described by the spec as non-reclaimable (so cannot ever be treated like RAM).
>>>
>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>>
> 
> I don't see any stable and or fixes tags, but I assume this will go to
> the stable trees (which have (a backport of)
> 8efa46516c5f4cf185c8df179812c185d3c27eb6 in their staging branches) ?

Yes, this should go to the stable branches as well. I don't usually see Fixes:
tag being used on xen-devel (not sure if it's intentional or simply not
customary). It's also questionable whether it's a fix or a workaround for an
issue with compatibility.

Igor

