Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98E1DE895
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 16:15:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc8Rz-0002LN-NZ; Fri, 22 May 2020 14:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc8Ry-0002LI-6c
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 14:15:02 +0000
X-Inumbo-ID: 9fb9c428-9c36-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb9c428-9c36-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 14:15:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 365D1AD12;
 Fri, 22 May 2020 14:15:03 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] x86: relax GDT check in arch_set_info_guest()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cbed3c45-3685-4bce-9719-93b1e8a2599a@suse.com>
 <acbaead9-0f6c-3606-e809-57dafe9b3f01@suse.com>
 <58510f15-68d6-c773-5166-a38c72573442@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee21b6eb-cf34-74ee-ac73-33ff76fb07db@suse.com>
Date: Fri, 22 May 2020 16:14:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <58510f15-68d6-c773-5166-a38c72573442@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.05.2020 15:27, Andrew Cooper wrote:
> On 20/05/2020 08:53, Jan Beulich wrote:
>> It is wrong for us to check frames beyond the guest specified limit
>> (in the compat case another loop bound is already correct).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm still not overly convinced this is a good idea, because all it will
> allow people to do is write lazy code which breaks on older Xen.

Sounds a little like keeping bugs for the sake of keeping things
broken. The range of misbehaving versions could be shrunk by
backporting this change; I didn't intend to though, so far.

> However, if you still insist, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks!

Jan

