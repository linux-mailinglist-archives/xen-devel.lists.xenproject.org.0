Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D271EDF1A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 10:11:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgkxp-0003mu-LL; Thu, 04 Jun 2020 08:11:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pUjb=7R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jgkxo-0003mo-PZ
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 08:11:00 +0000
X-Inumbo-ID: eca15b9e-a63a-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eca15b9e-a63a-11ea-9dbe-bc764e2007e4;
 Thu, 04 Jun 2020 08:11:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C15F7AD93;
 Thu,  4 Jun 2020 08:11:02 +0000 (UTC)
Subject: Re: Xenstore quota and driver domains
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <35df958d-eff8-9ca7-fd72-05694f07248d@suse.com>
 <006701d63a47$408511c0$c18f3540$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f7fe86f0-f8b0-ebb2-4d01-d3b59bc38d41@suse.com>
Date: Thu, 4 Jun 2020 10:10:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <006701d63a47$408511c0$c18f3540$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 04.06.20 10:07, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jürgen Groß
>> Sent: 04 June 2020 06:03
>> To: xen-devel@lists.xenproject.org
>> Subject: Xenstore quota and driver domains
>>
>> A recent report on xen-users surfaced a problem we have with driver
>> domains in medium sized or large configuration: the driver domain can
>> easily hit the default Xenstore quota (in the report it was a driver
>> domain for disks which hit the quota when 15 domUs were active at the
>> same time).
> 
> Which quota is hit? Node or watch?

Node.

> 
>>
>> Setting the quota to a higher limit will work, of course, but this
>> enables "normal" domUs to use this quota, too, thus hogging lots of
>> Xenstore resources.
>>
>> I believe the most sensible way to solve that would be to have a way
>> to set per-domain quota in Xenstore. As the original reporter already
>> raised concerns regarding rebooting the server for applying new global
>> quota, I believe new quota settings should be possible at runtime.
>>
>> The question is how this interface should look like. Right now I could
>> think of two variants:
>>
>> 1. A new XS_SET_QUOTA and XS_GET_QUOTA wire command pair which can set
>>      and get the quota (both, default values for new domains and for any
>>      existing domain)
>>
>> 2. A new XS_CONTROL command for setting/getting quota (same scope as 1.)
>>
>> Both variants have advantages and disadvantages:
>>
>> 1. Pros: - clear interface, easily usable
>>      Cons: - requires more code churn in tools (libxenstore, xl, libxl)
>>              for support in domain-config
>>            - any extension will again require similar churn
>>
>> 2. Pros: - easy extensible domain-config possible (via a single item,
>>              e.g. "xenstore-quota='watches=10 entries=2000'")
>>      Cons: - text parsing in Xenstore instead of xl/libxl
>>            - XS_CONTROL sub-options for quota will be ABI
>>
>> Any thoughts?
> 
> Even though 1 requires more code churn, I still think it is the better way to go.

Noted.


Juergen

