Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E305C25DC30
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 16:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kED0X-0004JD-6L; Fri, 04 Sep 2020 14:48:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OsmH=CN=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kED0W-0004J8-8b
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 14:48:04 +0000
X-Inumbo-ID: 1b0216d1-454d-432f-a8fc-1ba46df1447e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b0216d1-454d-432f-a8fc-1ba46df1447e;
 Fri, 04 Sep 2020 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599230882;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AwcEV+DDvvLma7jgty4ew2IxjyVepuebmQCqxcSDExg=;
 b=QA7mDrSicMo4/CxRBzpbxfZMfksnzjb4hEjZAyrjpPbL84lf1dYLMybQ
 Iynk8O30xdCDgdHN9UYeU9EW4hFYP4PcawL4jLmEAd9q/GTjmhjg1qVbM
 D4FWpLjYmaQVfrM+gmr+iBKPPxfScyzK2CLN8haYJNxmeY6pfSgN+xp90 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YtxB0foHMHngAsjCL92imcDcZA4Yr6PXbNuYf1DNBFW9X5Mpo1+JWWUSi21oTx7cIENtr9UXbh
 Sj4J2QU6D0l9qwdscpUWm7XNy5Xp1j+fOkpZNrc5z0qRXecCiRvnCrNC+rv80Vi0V/CBZMkyDJ
 cCbgg7+yLg7vu2EJezHrcpWyqMzfGnGV6R0W4+2RQqZ2LYmoa4UvVGRPYDDYJhMHdSMmWX2/P3
 8J3PyRZp0x1bU/H67m8kzbvYOxQ4BebP1CwTSSZyyGrGk1U0ze5FvhmwRk/jM995EmgM6tgRDB
 YQc=
X-SBRS: 2.7
X-MesageID: 26142618
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26142618"
Subject: Re: [PATCH v2.1] hvmloader: indicate dynamically allocated memory as
 ACPI NVS in e820
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
 <roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
 <b7880132-5e6a-090d-ed9a-b46171803be3@suse.com>
 <17fb8575-8a05-9c31-b777-292b66b0e7e1@citrix.com>
 <07811cc2-2780-b807-7669-80ae20fd9263@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <885f0f9b-14d1-3246-1d5b-a60356fb42f2@citrix.com>
Date: Fri, 4 Sep 2020 15:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <07811cc2-2780-b807-7669-80ae20fd9263@suse.com>
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

On 04/09/2020 15:40, Jan Beulich wrote:
> On 04.09.2020 13:49, Igor Druzhinin wrote:
>> On 04/09/2020 09:33, Jan Beulich wrote:
>>> On 01.09.2020 04:50, Igor Druzhinin wrote:
>>>> Guest kernel does need to know in some cases where the tables are located
>>>> to treat these regions properly. One example is kexec process where
>>>> the first kernel needs to pass firmware region locations to the second
>>>> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
>>>> table and count immovable memory regions").
>>>
>>> I'm still struggling with the connection here: Reserved regions
>>> surely are "immovable" too, aren't they? 
>>
>> "Immovable" regions here are RAM that doesn't go away by hot-unplug. That change
>> was necessary in Linux to avoid image randomized placement to these regions.
>>
>>> Where's the connection to
>>> the E820 map in the first place - the change cited above is entirely
>>> about SRAT? And I can't imagine kexec getting away with passing on
>>> ACPI NVS regions, but not reserved ones.
>>>
>>
>> They got away with it for as long as kexec exists I think. The point was that
>> those reserved regions were not accessed during early boot as long as kexec kernel stays
>> at transition tables. Now ACPI portion of it is accessed which highlighted our
>> imprecise reporting of memory layout to the guest - which I think should be fixed
>> either way.
> 
> Is this to mean they map ACPI regions into the transition page tables,
> but not reserved regions?

Yes.

> If so, perhaps that's what the description
> wants to say (and then possibly with a reference to the commit
> introducing this into Linux, instead of the seemingly unrelated SRAT
> one)?

The referenced commit is not unrelated - it's the commit introducing the access
causing kexec transition to fail. But I can add another one pointing to the mapping
of ACPI tables that was supposed to fix the failure caused by the first one.

Igor
 

