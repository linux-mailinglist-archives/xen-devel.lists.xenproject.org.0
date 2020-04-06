Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899F019FB94
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:29:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVYt-0000TC-SY; Mon, 06 Apr 2020 17:29:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLVYt-0000T7-1m
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 17:29:27 +0000
X-Inumbo-ID: 297409f0-782c-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 297409f0-782c-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 17:29:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A7533B1EA4;
 Mon,  6 Apr 2020 17:29:23 +0000 (UTC)
Subject: Re: [PATCH 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
To: paul@xen.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-3-paul@xen.org>
 <fc193a54-5d25-ffff-2234-9c0079c605d8@xen.org>
 <002501d60bf2$dda86480$98f92d80$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a555b215-b758-300b-5188-402e839f2bcd@suse.com>
Date: Mon, 6 Apr 2020 14:46:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <002501d60bf2$dda86480$98f92d80$@xen.org>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.2020 11:07, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 01 April 2020 14:42
>>
>> On 27/03/2020 18:50, Paul Durrant wrote:
>> Also, in the case of XEN_DOMCTL_setdomaincontext, the buffer is not
>> meant to be modified by the hypervisor. So I would rather introduce two
>> separate structure so we can enforce the const.
> 
> Can handles be meaningfully const?

Yes, see e.g. Julien's recent patch to force honoring const-ness
in some cases where it wasn't enforced so far. Luckily there
look to not have crept in any violators.

Jan

