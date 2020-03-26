Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2538193C7E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 11:02:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHPJI-0002xb-RI; Thu, 26 Mar 2020 10:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHPJI-0002xW-D7
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 10:00:24 +0000
X-Inumbo-ID: 9b4d115a-6f48-11ea-8795-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b4d115a-6f48-11ea-8795-12813bfff9fa;
 Thu, 26 Mar 2020 10:00:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAC3DACFF;
 Thu, 26 Mar 2020 10:00:22 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200326094557.13822-1-jgross@suse.com>
 <574ad265-7b49-6a60-fa74-655d81593049@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5ecfa9a2-32f1-cac5-da33-842a3e13a01f@suse.com>
Date: Thu, 26 Mar 2020 11:00:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <574ad265-7b49-6a60-fa74-655d81593049@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 26.03.20 10:54, Jan Beulich wrote:
> On 26.03.2020 10:45, Juergen Gross wrote:
>> Today the maximum number of event channels for a guest is defaulting
>> to 1023. For large guests with lots of vcpus this is not enough, as
>> e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
>> guest to about 140 vcpus.
> 
> I don't think any particular guest OS should "dictate" the default
> here. What if another OS (or even a future version of Linux) requires
> more than 8? And why would the value depend on number of vCPU-s but
> not number and kind of virtual devices?

It is a rough estimate. And with HVM guests being limited to 128 cpus
anyway, this problem is more relevant for PV guests, limiting the
available options for guest OS's.

You can always specify a larger value in the guest config after all.


Juergen

