Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282225D7D6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 13:50:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEADT-0001n5-3K; Fri, 04 Sep 2020 11:49:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OsmH=CN=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kEADS-0001n0-9c
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 11:49:14 +0000
X-Inumbo-ID: 9ed03eb3-805b-42e6-b7fe-e966087d33d1
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ed03eb3-805b-42e6-b7fe-e966087d33d1;
 Fri, 04 Sep 2020 11:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599220152;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4R5zIg/3MzyjR2OkAka+osy6n2T0o2xGwduHqT2979M=;
 b=A/fdHqAa7DOnBVfyskaq4iuDODrcEmYzb8W083FnMY3Qkqvf0VL0orNS
 zjb7UtsPxyCD1uBl2waQaXjYVvWQW//xkpV5BWg6TgbmfKJythhqb804w
 IP0CAmcvUT4j8D9zNCqokCwEjN5WuL3QUoIuiTmCeX+0SIYEaaHMvOB21 g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 23QSXyPBW+PDd2+Ntza60esVbL7czRC2ZZOFKkPM7KLx20ivB6BDKtmczad+W2UyAEmYt8Zf5K
 dIPELTp1e2hx4JWvBrM59EwBU6025bKIJZZwM7quXilePOr4PJqHDvzAMhqAaDRBcTk4VZUk0M
 9UkCpGo/G+BMJDN4ehrxSNAPjzPnRYC3t03OPxH5RSif2jNmlaO1RDUlM3JxnS91ZpUvWdWZI+
 0qyRjpLNg87DUO7P3O22jtOK2fDA2NM/6p5uB2t+Hu/Ayl6cNSFNRswCWyo/iObt17swtGoxMO
 w8k=
X-SBRS: 2.7
X-MesageID: 26129060
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26129060"
Subject: Re: [PATCH v2.1] hvmloader: indicate dynamically allocated memory as
 ACPI NVS in e820
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
 <roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
 <b7880132-5e6a-090d-ed9a-b46171803be3@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <17fb8575-8a05-9c31-b777-292b66b0e7e1@citrix.com>
Date: Fri, 4 Sep 2020 12:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b7880132-5e6a-090d-ed9a-b46171803be3@suse.com>
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

On 04/09/2020 09:33, Jan Beulich wrote:
> On 01.09.2020 04:50, Igor Druzhinin wrote:
>> Guest kernel does need to know in some cases where the tables are located
>> to treat these regions properly. One example is kexec process where
>> the first kernel needs to pass firmware region locations to the second
>> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
>> table and count immovable memory regions").
> 
> I'm still struggling with the connection here: Reserved regions
> surely are "immovable" too, aren't they? 

"Immovable" regions here are RAM that doesn't go away by hot-unplug. That change
was necessary in Linux to avoid image randomized placement to these regions.

> Where's the connection to
> the E820 map in the first place - the change cited above is entirely
> about SRAT? And I can't imagine kexec getting away with passing on
> ACPI NVS regions, but not reserved ones.
> 

They got away with it for as long as kexec exists I think. The point was that
those reserved regions were not accessed during early boot as long as kexec kernel stays
at transition tables. Now ACPI portion of it is accessed which highlighted our
imprecise reporting of memory layout to the guest - which I think should be fixed
either way.

I'm not going to argue if reserved regions should be mapped to transition tables or
not - I don't think it's important in context related to this patch. There were
already several kernel releases without that mappings and those also should be able
to invoke kdump.

Igor

