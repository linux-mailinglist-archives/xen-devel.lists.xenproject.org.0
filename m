Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6926479C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:01:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGN8D-0001Wg-Ez; Thu, 10 Sep 2020 14:00:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ajRG=CT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGN8B-0001Wb-GI
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:00:55 +0000
X-Inumbo-ID: a3a12069-d74b-4be8-a4b5-e0cb638515dc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3a12069-d74b-4be8-a4b5-e0cb638515dc;
 Thu, 10 Sep 2020 14:00:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B1FEB165;
 Thu, 10 Sep 2020 14:01:09 +0000 (UTC)
Subject: Re: [PATCH 0/6] tools/include: adjustments to the population of xen/
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <2d5579e4-74cf-fd35-da7d-a8f4de2c2c86@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0d17b362-3206-1fc3-8714-815f8f053065@suse.com>
Date: Thu, 10 Sep 2020 16:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2d5579e4-74cf-fd35-da7d-a8f4de2c2c86@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 10.09.20 15:51, Andrew Cooper wrote:
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

This is true only if all headers in a directory are to be shared.
Otherwise you might end up with including a file with a name collision
which happens to be in a directory you now specify via -I

I'm not opposed to your proposal, but this should be accompanied by a
clean header directory structure (all or no headers in a directory meant
to be shared).


Juergen



