Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E4E25307E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 15:54:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAvsC-00058F-EN; Wed, 26 Aug 2020 13:53:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAvsB-000586-0K
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 13:53:55 +0000
X-Inumbo-ID: 3d7e5361-3616-45f7-bc88-15d66995c792
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d7e5361-3616-45f7-bc88-15d66995c792;
 Wed, 26 Aug 2020 13:53:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F50BAD77;
 Wed, 26 Aug 2020 13:54:24 +0000 (UTC)
Subject: Re: [PATCH v7 1/9] xen/common: introduce a new framework for
 save/restore of 'domain' context
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-2-paul@xen.org>
 <9873d112-0d87-d871-3911-3527d79a0b56@suse.com>
Message-ID: <5578c3fb-e35d-bb89-79f7-003e642492ab@suse.com>
Date: Wed, 26 Aug 2020 15:53:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9873d112-0d87-d871-3911-3527d79a0b56@suse.com>
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

On 26.08.2020 15:32, Jan Beulich wrote:
> On 18.08.2020 12:30, Paul Durrant wrote:
>> v7:
>>  - Add an option to domain_load_end() to ignore unconsumed data, which will
>>    be needed by a subsequent patch
> 
> May I suggest to name the parameter "ignore_tail" instead of
> "ignore_data", as typically you don't mean to ignore all of
> it?

Hmm, looking at patch 7 it's indeed all of the body which gets
ignored. Not sure what the longer term expectations here are.

Jan

