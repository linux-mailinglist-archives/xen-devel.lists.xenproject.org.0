Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651E26317D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 18:16:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG2l9-00056V-81; Wed, 09 Sep 2020 16:15:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w7cX=CS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kG2l7-00056Q-Dj
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 16:15:45 +0000
X-Inumbo-ID: 62215e11-6262-4380-9ad5-43d592c46d3c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62215e11-6262-4380-9ad5-43d592c46d3c;
 Wed, 09 Sep 2020 16:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599668144;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ePB5hIMW9C+okN7Bs3EG4vv4BOt6atsGP5PDSD6lQ1E=;
 b=WIHdbENSol9jCGhDUzTTHdT+C/egErMe4tgBBI9OT6I/MS7XXWZBtm1d
 RrkJfkjaVa1CqloivTPbdMNM3KrFTjqARyGaGo/PDMduj/ne8/IewL031
 b7zNx96A5stggd1bSskKZVAVc4QYoI0i7p/eNKiOQkoMj5lQW2imDDq6K g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VgmMhjN8SOPKi8YaqPeGuoXmdVlYP7rXJxgKOXY87fxZ+vln5zYK2ZTP9qf8C0SNQQkUvVO+eG
 nt8wti8PSIyY1UmjPfU29CWd74L55tQ6baJGAYPwzkIkqOF/jgjoNQ6BQYR6A60oS0ied7odg2
 7OFXME7nnOBp2O9YRqgT7Yolc66c+c3C9lQGyw0eR3yHvsOTCo4Op0q8/IbB54SX887LMH4its
 8V0182xvGQoPXkpL94UudEzpLyG7hrOglOIwRmM16tUb9/Zy/H+X5BrxN+k8sYuBrGTOkzOB+j
 JaM=
X-SBRS: 2.7
X-MesageID: 27286215
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,409,1592884800"; d="scan'208";a="27286215"
Subject: Re: [PATCH v4] hvmloader: indicate ACPI tables with "ACPI data" type
 in e820
To: Jan Beulich <jbeulich@suse.com>, <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <roger.pau@citrix.com>, <wl@xen.org>,
 <iwj@xenproject.org>
References: <1599579679-23983-1-git-send-email-igor.druzhinin@citrix.com>
 <a0587271-db3a-638e-201c-03bcb46426ed@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <4eccb099-8034-bc14-802c-a13f3590af5f@citrix.com>
Date: Wed, 9 Sep 2020 17:15:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a0587271-db3a-638e-201c-03bcb46426ed@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09/09/2020 17:00, Jan Beulich wrote:
> On 08.09.2020 17:41, Igor Druzhinin wrote:
>> Guest kernel does need to know in some cases where the tables are located
>> to treat these regions properly. One example is kexec process where
>> the first kernel needs to pass ACPI region locations to the second
>> kernel which is now a requirement in Linux after 02a3e3cdb7f12 ("x86/boot:
>> Parse SRAT table and count immovable memory regions") in order for kexec
>> transition to actually work.
>>
>> That commit introduced accesses to XSDT and SRAT while the second kernel
>> is still using kexec transition tables. The transition tables do not have
>> e820 "reserved" regions mapped where those tables are located currently
>> in a Xen guest. Instead "ACPI data" regions are mapped with the transition
>> tables that was introduced by the following commit 6bbeb276b7 ("x86/kexec:
>> Add the EFI system tables and ACPI tables to the ident map").
>>
>> Reserve 1MB (out of 16MB currently available) right after ACPI info page for
>> ACPI tables exclusively but populate this region on demand and only indicate
>> populated memory as "ACPI data" since according to ACPI spec that memory is
>> reclaimable by the guest if necessary. That is close to how we treat
>> the same ACPI data in PVH guests. 1MB should be enough for now but could be
>> later extended if required.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> After committing this I'm now somewhat uncertain whether to queue this
> for the stable trees. Does either of you (or anyone else) have any clear
> opinion either way?

That depends on what the upstream support statement was for kexec/kdump for stable
releases.Note that newer guests (e.g. Ubuntu 20.04) won't able to enter kdump
kernel without that.

In Citrix we'd be glad if it reaches at least stable-4.13 as we're backporting this
functionality to our 4.13 based LTSR.

Igor

