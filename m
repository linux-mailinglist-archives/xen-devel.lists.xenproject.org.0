Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244A263DC1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 08:55:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGGTO-0003Ch-Oy; Thu, 10 Sep 2020 06:54:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGGTN-0003Cc-Mo
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 06:54:21 +0000
X-Inumbo-ID: 56a3d0ae-ea8d-4f00-abb2-8f1e9dc32dae
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56a3d0ae-ea8d-4f00-abb2-8f1e9dc32dae;
 Thu, 10 Sep 2020 06:54:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0F9FAA35;
 Thu, 10 Sep 2020 06:54:35 +0000 (UTC)
Subject: Re: libxl - b_info.{acpi,apic} behaves differently than
 b_info.u.hvm.{acpi,apic}
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200910035723.GY1626@mail-itl>
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <307ef028-c83e-6cd5-f8f9-7ad7d9e4192b@suse.com>
Date: Thu, 10 Sep 2020 08:54:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910035723.GY1626@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10.09.2020 05:57, Marek Marczykowski-Górecki wrote:
> After updating from Xen 4.13 to Xen 4.14 I have troubles starting any
> HVM: just after hvmloader saying "Invoking SeaBIOS" I get "(XEN) MMIO
> emulation failed (1): d29v0 32bit @ 0008:fffeedf d -> "
> 
> I come to a situation where seemingly the same domU started via xl
> works, while when started via libvirt it crashes. This seems to be
> related to xl setting b_info.{acpi,apic}, while libvirt setting
> b_info.u.hvm.{acpi,apic}. Modifying libvirt to use the former fixes the
> issue.
> 
> So, handling the old option got broken sometime between 4.13 and 4.14.

The respective changes in libxl date back to 2016/2017, and the involved
code looks identical between 4.13 and 4.14. Perhaps there's some 4.13-
only logic in libvirt, which really means to be >= 4.13? In any event
libxl_types.idl clearly says the two u.hvm fields are deprecated;
nevertheless there are some uses left for u.hvm.acpi (the most
suspicious one in xl_sxp.c) and exactly one in a comment for u.hvm.apic.
Sadly this marking of being deprecated doesn't get reflected in the
_libxl_types.h which gets installed for public consumption.

Jan

