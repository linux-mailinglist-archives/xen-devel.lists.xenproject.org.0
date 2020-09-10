Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DC2647B8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNDj-0001r1-Q2; Thu, 10 Sep 2020 14:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGNDi-0001qv-Ij
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:06:38 +0000
X-Inumbo-ID: 314f0516-8d4a-4b01-8632-6cb8e1691f6e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 314f0516-8d4a-4b01-8632-6cb8e1691f6e;
 Thu, 10 Sep 2020 14:06:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3758B153;
 Thu, 10 Sep 2020 14:06:52 +0000 (UTC)
Subject: Re: [PATCH 0/6] tools/include: adjustments to the population of xen/
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <2d5579e4-74cf-fd35-da7d-a8f4de2c2c86@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <473e6e88-439f-def3-b561-6db66dee4258@suse.com>
Date: Thu, 10 Sep 2020 16:06:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2d5579e4-74cf-fd35-da7d-a8f4de2c2c86@citrix.com>
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

On 10.09.2020 15:51, Andrew Cooper wrote:
> On 10/09/2020 13:09, Jan Beulich wrote:
>> While looking at what it would take to move around libelf/
>> in the hypervisor subtree, I've run into this rule, which I
>> think can do with a few improvements and some simplification.
> 
> I realise this might be a controversial move, but can we *please*
> address this by removing our use of symlinking, rather than kicking the
> problem down the road.
> 
> For header files in particular, there is no need to symlink at all. 
> Some properly formed -I runes for the compiler will do the right thing,
> and avoid all intermediate regeneration issues.

With some further work to separate headers in e.g. Xen's acpi/
into ones to be exposed and ones not to be exposed, this
would likely be an option. It's not clear to me though how you
mean to deal with libelf.h and elfstructs.h. Nor is it clear
how we'd deal with x86's cpuid-autogen.h, which needs to have
distinct instances in the two subtrees.

And of course the present full exposure of asm-x86 rather wants
limiting than setting in stone by using -I to point into the
hypervisor tree.

Installing of the headers into dist/ will also need re-working
then.

Taking things together - no, I don't think I'm up to doing this,
yet I think the series presented is an improvement.

Jan

