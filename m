Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB3246C67
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 18:15:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7hmu-0001g7-Qw; Mon, 17 Aug 2020 16:15:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7hmt-0001g2-HX
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 16:15:07 +0000
X-Inumbo-ID: 91e54d72-e009-4780-9d12-90d54b0d0060
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91e54d72-e009-4780-9d12-90d54b0d0060;
 Mon, 17 Aug 2020 16:15:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 439D3B7A5;
 Mon, 17 Aug 2020 16:15:30 +0000 (UTC)
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
 <1489916a-24cc-3e2c-98a0-1f35186e4b06@suse.com>
 <R7aUb5x20WJaKNC0-ug_5CtqyrJQlSd8J1jy1urYoEiU10J2yTd9PmNX72ZNDP01-HrVBi0r18HlkUGXGGOI2oVgWJU4Yrjel1y_W8GtYo4=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41a6145f-d76f-f9dd-bb67-5c57f896a2ce@suse.com>
Date: Mon, 17 Aug 2020 18:15:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <R7aUb5x20WJaKNC0-ug_5CtqyrJQlSd8J1jy1urYoEiU10J2yTd9PmNX72ZNDP01-HrVBi0r18HlkUGXGGOI2oVgWJU4Yrjel1y_W8GtYo4=@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.08.2020 16:47, Trammell Hudson wrote:
> On Friday, August 7, 2020 2:23 PM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.08.2020 16:15, Trammell Hudson wrote:
>>> --- /dev/null
>>> +++ b/xen/scripts/unify-xen
>>> @@ -0,0 +1,89 @@
>>> +#!/bin/bash
>>> +# Build a "unified Xen" image.
>>> +# Usage
>>> +# unify xen.efi xen.cfg bzimage initrd [xsm [ucode]]
>>> [...]
>>
>> With all these hard coded size restrictions I take it this still is
>> just an example, not something that is to eventually get committed.
> 
> I'm wondering if for the initial merge if it is better to include just
> the objcopy command line to show how to do it in the documentation, similar
> to how systemd-boot documents it, rather than providing a tool.  At a later
> time a more correct unify script could be merged.

Sounds like a reasonable approach.

> Updated patch follows:

Going forward, may I ask that you please send new versions of the patch(es)
instead of inlining them in your replies?

Jan

