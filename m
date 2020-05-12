Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378B81CFA38
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 18:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXVT-0003R4-91; Tue, 12 May 2020 16:11:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYXVS-0003Qz-Bf
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 16:11:46 +0000
X-Inumbo-ID: 45cefa8d-946b-11ea-a2d0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45cefa8d-946b-11ea-a2d0-12813bfff9fa;
 Tue, 12 May 2020 16:11:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F2862AC53;
 Tue, 12 May 2020 16:11:46 +0000 (UTC)
Subject: Re: [PATCH 2/2] x86/boot: Drop .note.gnu.properties in build32.lds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200512033948.3507-1-jandryuk@gmail.com>
 <20200512033948.3507-3-jandryuk@gmail.com>
 <69dd92f0-5b23-7a3d-3568-feab20874f97@suse.com>
 <372f83e4-6016-cc10-a8e6-970d644eb561@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e976f0f-3a9b-6159-f4bf-b9f8b6c578d2@suse.com>
Date: Tue, 12 May 2020 18:11:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <372f83e4-6016-cc10-a8e6-970d644eb561@citrix.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefan Bader <stefan.bader@canonical.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.05.2020 17:58, Andrew Cooper wrote:
> On 12/05/2020 16:32, Jan Beulich wrote:
>> On 12.05.2020 05:39, Jason Andryuk wrote:
>>> Discard the .note.gnu.property section when linking to avoid the extra
>>> bytes.
>> If we go this route (and if, as per above, I'm misremembering,
>> meaning we didn't reject such a change earlier on), why would we
>> not strip .note and .note.* in one go?
>>
>>> Stefan Bader also noticed that build32.mk requires -fcf-protection=none
>>> or else the hypervisor will not boot.
>>> https://bugs.launchpad.net/ubuntu/+source/gcc-9/+bug/1863260
>> How's this related to the change here?
> 
> I think there is a bit of confusion as to exactly what is going on.
> 
> Ubuntu defaults -fcf-protection to enabled, which has a side effect of
> turning on CET, which inserts ENDBR{32,64} instructions and generates
> .note.gnu.properties indicating that the binary is CET-IBT compatible.

I.e. in principle this 2nd patch wouldn't be necessary at all if
we forced -fcf-protection=none unilaterally, and provided build32.mk
properly inherits CFLAGS. Discarding note sections may still be
a desirable thing to do though ...

Jan

