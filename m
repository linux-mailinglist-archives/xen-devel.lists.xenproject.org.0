Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AB2193CC5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 11:14:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPUS-0004BD-Ok; Thu, 26 Mar 2020 10:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHPUQ-0004B8-Mn
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 10:11:54 +0000
X-Inumbo-ID: 3757b188-6f4a-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3757b188-6f4a-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 10:11:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F3CC0AF57;
 Thu, 26 Mar 2020 10:11:52 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200326094557.13822-1-jgross@suse.com>
 <574ad265-7b49-6a60-fa74-655d81593049@suse.com>
 <5ecfa9a2-32f1-cac5-da33-842a3e13a01f@suse.com>
 <e0072cdc-e257-8cd7-bc43-e17baa55934c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3760678b-62b0-cced-0a7a-61ea2f874294@suse.com>
Date: Thu, 26 Mar 2020 11:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e0072cdc-e257-8cd7-bc43-e17baa55934c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH] tools/libxl: make default of max event
 channels dependant on vcpus
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.20 11:05, Jan Beulich wrote:
> On 26.03.2020 11:00, Jürgen Groß wrote:
>> On 26.03.20 10:54, Jan Beulich wrote:
>>> On 26.03.2020 10:45, Juergen Gross wrote:
>>>> Today the maximum number of event channels for a guest is defaulting
>>>> to 1023. For large guests with lots of vcpus this is not enough, as
>>>> e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
>>>> guest to about 140 vcpus.
>>>
>>> I don't think any particular guest OS should "dictate" the default
>>> here. What if another OS (or even a future version of Linux) requires
>>> more than 8? And why would the value depend on number of vCPU-s but
>>> not number and kind of virtual devices?
>>
>> It is a rough estimate. And with HVM guests being limited to 128 cpus
>> anyway, this problem is more relevant for PV guests, limiting the
>> available options for guest OS's.
> 
> How many evtchns would e.g. mini-os require? I.e. wouldn't such stubdoms
> get a much larger than necessary allowance this way?

mini-os doesn't support SMP. So (if not configured with lots of vcpus,
which doesn't make sense) they still get 1023 event channels per
default. Which is much more as they need, but the same as today.

Xenstore stubdom is unlimited like dom0, BTW.


Juergen

