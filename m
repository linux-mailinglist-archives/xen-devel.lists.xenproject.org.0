Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9131AC5DF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 16:30:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP5XH-0008CA-Lv; Thu, 16 Apr 2020 14:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP5XG-0008C5-3i
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 14:30:34 +0000
X-Inumbo-ID: d464c54c-7fee-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d464c54c-7fee-11ea-9e09-bc764e2007e4;
 Thu, 16 Apr 2020 14:30:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2BCB2AC37;
 Thu, 16 Apr 2020 14:30:32 +0000 (UTC)
Subject: Re: [XEN PATCH v4 16/18] build,xsm: Fix multiple call
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-17-anthony.perard@citrix.com>
 <809cba94-cebf-29c6-39d5-31ec41bdbdc4@suse.com>
 <20200416130250.GI4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c6caf8e-43cd-9635-1ff3-db8bdb0e2851@suse.com>
Date: Thu, 16 Apr 2020 16:30:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416130250.GI4088@perard.uk.xensource.com>
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
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.04.2020 15:02, Anthony PERARD wrote:
> On Wed, Apr 08, 2020 at 03:28:06PM +0200, Jan Beulich wrote:
>> On 31.03.2020 12:31, Anthony PERARD wrote:
>>> Both script mkflask.sh and mkaccess_vector.sh generates multiple
>>> files. Exploits the 'multi-target pattern rule' trick to call each
>>> scripts only once.
>>
>> Isn't this a general fix, which may even want backporting? If so,
>> this would better be at or near the beginning of the series.
> 
> It is mostly a performance improvement, avoiding doing the same thing
> several time. I don't think anything bad happens from concurrent calls,
> or we would already have bug report I think. But I can try to move the
> patch up.

Up to three processes in parallel writing to the same file(s) is
almost certainly a recipe for eventual / random breakage.

Jan

