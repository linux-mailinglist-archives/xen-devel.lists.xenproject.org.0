Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CD620B5B5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 18:14:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joqym-0002Zh-Ad; Fri, 26 Jun 2020 16:13:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1joqyk-0002Zc-7D
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 16:13:26 +0000
X-Inumbo-ID: f665bed8-b7c7-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f665bed8-b7c7-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 16:13:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F800AF09;
 Fri, 26 Jun 2020 16:13:24 +0000 (UTC)
Subject: Re: [PATCH] build: tweak variable exporting for make 3.82
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <0677fe2a-9ea1-7b3c-e212-4a2478537459@suse.com>
 <7736F1FB-A564-419A-9F49-8860502C5A2A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <297d1631-1379-1650-2363-8ea838384794@suse.com>
Date: Fri, 26 Jun 2020 18:13:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7736F1FB-A564-419A-9F49-8860502C5A2A@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 17:32, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 26 Jun 2020, at 16:02, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> While I've been running into an issue here only because of an additional
>> local change I'm carrying, to be able to override just the compiler in
>> $(XEN_ROOT)/.config (rather than the whole tool chain), in
>> config/StdGNU.mk:
>>
>> ifeq ($(filter-out default undefined,$(origin CC)),)
>>
>> I'd like to propose to nevertheless correct the underlying issue:
>> Exporting an unset variable changes its origin from "undefined" to
>> "file". This comes into effect because of our adding of -rR to
>> MAKEFLAGS, which make 3.82 wrongly applies also upon re-invoking itself
>> after having updated auto.conf{,.cmd}.
>>
>> Move the export statement past $(XEN_ROOT)/config/$(XEN_OS).mk inclusion
>> such that the variables already have their designated values at that
>> point, while retaining their initial origin up to the point they get
>> defined.
> 
> If I understand correctly you actually need this to be after 
> include $(XEN_ROOT)/Config.mk
> 
> Which actually includes the .config and the StdGNU.mk
> Maybe you could say this as $(XEN_ROOT)/config/$(XEN_OS).mk is not
> actually included directly in the Makefile itself ?

I thought it would be obvious enough, but since you ask, I've added
half a sentence.

> I tested the patch and it works on arm and x86 on my side.
> 
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks much.

Jan

