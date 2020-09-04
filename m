Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A900425DC1F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 16:41:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kECt5-0003uC-7h; Fri, 04 Sep 2020 14:40:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kECt4-0003u7-Mo
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 14:40:22 +0000
X-Inumbo-ID: db606860-1031-4883-b78d-95eca22f6d0b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db606860-1031-4883-b78d-95eca22f6d0b;
 Fri, 04 Sep 2020 14:40:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97FFAB5F0;
 Fri,  4 Sep 2020 14:40:21 +0000 (UTC)
Subject: Re: [PATCH v2.1] hvmloader: indicate dynamically allocated memory as
 ACPI NVS in e820
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, wl@xen.org, iwj@xenproject.org
References: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
 <b7880132-5e6a-090d-ed9a-b46171803be3@suse.com>
 <17fb8575-8a05-9c31-b777-292b66b0e7e1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07811cc2-2780-b807-7669-80ae20fd9263@suse.com>
Date: Fri, 4 Sep 2020 16:40:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <17fb8575-8a05-9c31-b777-292b66b0e7e1@citrix.com>
Content-Type: text/plain; charset=utf-8
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

On 04.09.2020 13:49, Igor Druzhinin wrote:
> On 04/09/2020 09:33, Jan Beulich wrote:
>> On 01.09.2020 04:50, Igor Druzhinin wrote:
>>> Guest kernel does need to know in some cases where the tables are located
>>> to treat these regions properly. One example is kexec process where
>>> the first kernel needs to pass firmware region locations to the second
>>> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
>>> table and count immovable memory regions").
>>
>> I'm still struggling with the connection here: Reserved regions
>> surely are "immovable" too, aren't they? 
> 
> "Immovable" regions here are RAM that doesn't go away by hot-unplug. That change
> was necessary in Linux to avoid image randomized placement to these regions.
> 
>> Where's the connection to
>> the E820 map in the first place - the change cited above is entirely
>> about SRAT? And I can't imagine kexec getting away with passing on
>> ACPI NVS regions, but not reserved ones.
>>
> 
> They got away with it for as long as kexec exists I think. The point was that
> those reserved regions were not accessed during early boot as long as kexec kernel stays
> at transition tables. Now ACPI portion of it is accessed which highlighted our
> imprecise reporting of memory layout to the guest - which I think should be fixed
> either way.

Is this to mean they map ACPI regions into the transition page tables,
but not reserved regions? If so, perhaps that's what the description
wants to say (and then possibly with a reference to the commit
introducing this into Linux, instead of the seemingly unrelated SRAT
one)?

Jan

> I'm not going to argue if reserved regions should be mapped to transition tables or
> not - I don't think it's important in context related to this patch. There were
> already several kernel releases without that mappings and those also should be able
> to invoke kdump.
> 
> Igor
> 


