Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45219D932
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 16:34:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNOm-0005SD-Ft; Fri, 03 Apr 2020 14:34:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKNOl-0005S6-7k
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:34:19 +0000
X-Inumbo-ID: 332ba17c-75b8-11ea-bd27-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 332ba17c-75b8-11ea-bd27-12813bfff9fa;
 Fri, 03 Apr 2020 14:34:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69423AC1D;
 Fri,  3 Apr 2020 14:34:17 +0000 (UTC)
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
 <bf83ee24-8516-f18c-fabb-0ff2718bf8f5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66e112f8-eab5-6aa7-c94b-81ddbeca3c2e@suse.com>
Date: Fri, 3 Apr 2020 16:34:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bf83ee24-8516-f18c-fabb-0ff2718bf8f5@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 ian.jackson@eu.citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 16:26, Igor Druzhinin wrote:
> On 03/04/2020 14:53, Jan Beulich wrote:
>> On 02.04.2020 18:18, Igor Druzhinin wrote:
>>> The area just below 4G where OVMF image is originally relocated is not
>>> necessarily a hole - it might contain pages preallocated by device model
>>> or the toolstack. By unconditionally populating on top of this memory
>>> the original pages are getting lost while still potentially foreign mapped
>>> in Dom0.
>>
>> When there are pre-allocated pages - have they been orphaned? If
>> so, shouldn't whoever populated them unpopulate rather than
>> orphaning them? Or if not - how is the re-use you do safe?
> 
> There is no signal to the device model when that happens - it has no idea when the
> memory it populated and hold a mapping to becomes suddenly unmapped in the guest.
> Re-use is safe as the memory prepopulated before OVMF starts has not been put
> in use yet until after it's finished initializing.

I guess I'm lacking some details here to fully understand what
you're saying: What is it that may pre-populate this range, and
for what purpose?

Jan

