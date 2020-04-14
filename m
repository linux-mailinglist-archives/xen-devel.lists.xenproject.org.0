Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100A1A79BB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:39:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJuj-0003uW-Vn; Tue, 14 Apr 2020 11:39:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOJui-0003uR-TA
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:39:36 +0000
X-Inumbo-ID: 9dcb16c2-7e44-11ea-8927-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dcb16c2-7e44-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 11:39:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 720C5AC4A;
 Tue, 14 Apr 2020 11:39:34 +0000 (UTC)
Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
To: paul@xen.org
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
 <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
 <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
 <a102ec836a00714678fb3aa46787f597c9044f29.camel@amazon.com>
 <cfe18a03-854d-8b91-b333-ae2cefe3e1c8@suse.com>
 <000001d6124c$0aced570$206c8050$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90fd6e75-32b6-a140-1d20-083947bf1681@suse.com>
Date: Tue, 14 Apr 2020 13:39:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <000001d6124c$0aced570$206c8050$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: wl@xen.org, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com,
 "'Shamsundara Havanur, Harsha'" <havanur@amazon.com>,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.04.2020 13:01, Paul Durrant wrote:
>> -----Original Message-----
>>>
>>> Previous commit enabled MASTER for all functions. I am bit confused
>>> here on the consensus on enabling/disabling/retaining BME.
>>> Should we even care about MASTER?
>>
>> With the commit introducing its universal setting, I'm afraid to
>> avoid regressions we can't sensibly alter the behavior unless it
>> can be explained clearly why the original change must have been
>> outright wrong.
>>
> 
> Well the original code IIRC had no justification for setting BME
> and doing it unconditionally does seem dangerous.

I'm not viewing this as dangerous, merely as (typically) pointless.
A well behaved device won't start issuing DMA requests merely
because it had its bus mastering capability enabled. (And in the
context of some IOMMU work of yours you actually stated there are
devices where clearing of this bit won't stop them from doing so.)

> Could we at least make it configurable?
Well, the main question then would be - configurable by which
mechanism?

Jan

