Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C2193C8B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 11:08:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPOh-0003Gh-Ug; Thu, 26 Mar 2020 10:05:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHPOg-0003Gc-O8
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 10:05:58 +0000
X-Inumbo-ID: 60b01aa9-6f49-11ea-8798-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60b01aa9-6f49-11ea-8798-12813bfff9fa;
 Thu, 26 Mar 2020 10:05:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB8A5AF57;
 Thu, 26 Mar 2020 10:05:52 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200326094557.13822-1-jgross@suse.com>
 <574ad265-7b49-6a60-fa74-655d81593049@suse.com>
 <5ecfa9a2-32f1-cac5-da33-842a3e13a01f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0072cdc-e257-8cd7-bc43-e17baa55934c@suse.com>
Date: Thu, 26 Mar 2020 11:05:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5ecfa9a2-32f1-cac5-da33-842a3e13a01f@suse.com>
Content-Type: text/plain; charset=utf-8
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

On 26.03.2020 11:00, Jürgen Groß wrote:
> On 26.03.20 10:54, Jan Beulich wrote:
>> On 26.03.2020 10:45, Juergen Gross wrote:
>>> Today the maximum number of event channels for a guest is defaulting
>>> to 1023. For large guests with lots of vcpus this is not enough, as
>>> e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
>>> guest to about 140 vcpus.
>>
>> I don't think any particular guest OS should "dictate" the default
>> here. What if another OS (or even a future version of Linux) requires
>> more than 8? And why would the value depend on number of vCPU-s but
>> not number and kind of virtual devices?
> 
> It is a rough estimate. And with HVM guests being limited to 128 cpus
> anyway, this problem is more relevant for PV guests, limiting the
> available options for guest OS's.

How many evtchns would e.g. mini-os require? I.e. wouldn't such stubdoms
get a much larger than necessary allowance this way?

Jan

