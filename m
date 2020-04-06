Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8019FC69
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 20:04:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLW6Z-0004Hf-I2; Mon, 06 Apr 2020 18:04:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8YOW=5W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLW6Y-0004Ha-F2
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 18:04:14 +0000
X-Inumbo-ID: 05817e4c-7831-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05817e4c-7831-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 18:04:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 12565B254;
 Mon,  6 Apr 2020 18:04:11 +0000 (UTC)
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <002201d609d0$55a76690$00f633b0$@xen.org>
 <acd5fee0-2bf6-4573-8467-38d24827ca1f@xen.org>
 <001701d60bed$25606f80$70214e80$@xen.org>
 <e2e25069-36e5-b965-8f66-59a460369e88@xen.org>
 <002701d60bf4$4b640460$e22c0d20$@xen.org>
 <ac273b12-36f4-ca5c-c18b-7a59d2b84e2e@xen.org>
 <002801d60bfe$fab5de70$f0219b50$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d53ddbd-461d-99a8-5534-5d84da7524b7@suse.com>
Date: Mon, 6 Apr 2020 14:43:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <002801d60bfe$fab5de70$f0219b50$@xen.org>
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
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.2020 12:34, Paul Durrant wrote:
>>> Do you think this should also appear in a comment? Do we really care? Nothing fundamentally prevents
>> the mechanism being used for HVM state, but that may introduce an ordering dependency.
>>
>> I don't particularly like the idea to let the contributor decide where
>> "HVM context" or as part of the "Domain context".
>>
>> This is  going to result to unwanted dependency and possibly
>> bikeshedding on where they should be saved.
>>
>> My preference would be to mark the existing framework as deprecated and
>> force all the new states to be saved as part of the new "Domain Context".
> 
> I'm ok with that. Any others have any opinion to the contrary?

Well, not in principle, but I won't have a firm opinion until I've
actually looked at (relevant parts of) the patches.

Jan

