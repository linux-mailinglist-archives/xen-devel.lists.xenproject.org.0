Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9E19AE52
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 16:53:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJehc-0007jW-C2; Wed, 01 Apr 2020 14:50:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJeha-0007jR-KH
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 14:50:46 +0000
X-Inumbo-ID: 2a6448f0-7428-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a6448f0-7428-11ea-b4f4-bc764e2007e4;
 Wed, 01 Apr 2020 14:50:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0AFE7ABD7;
 Wed,  1 Apr 2020 14:50:44 +0000 (UTC)
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9b21d59-3a4a-1498-e5f4-45d1420ddbc4@suse.com>
Date: Wed, 1 Apr 2020 16:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327185012.1795-2-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.03.2020 19:50, Paul Durrant wrote:
> Domain context is state held in the hypervisor that does not come under
> the category of 'HVM state' but is instead 'PV state' that is common
> between PV guests and enlightened HVM guests (i.e. those that have PV
> drivers) such as event channel state, grant entry state, etc.

Without looking at the patch details yet, I'm having some difficulty
understanding how this is going to work in a safe/correct manner. I
suppose for LU the system is in a frozen enough state that
snapshotting and copying state like this is okay, but ...

> To allow enlightened HVM guests to be migrated without their co-operation
> it will be necessary to transfer such state along with the domain's
> memory image, architectural state, etc. This framework is introduced for
> that purpose.
> 
> This patch adds the new public header and the low level implementation,
> entered via the domain_save() or domain_load() functions. Subsequent
> patches will introduce other parts of the framwork, and code that will
> make use of it within the current version of the libxc migration stream.

... here you suggest (and patch 5 appears to match this) that this
is going to be used even in "normal" migration streams. All of the
items named are communication vehicles, and hence there are always
two sides that can influence the state. For event channels, the
other side (which isn't paused) or the hardware (for passed through
devices) might signal them, or it (just the former obviously) could
close their end, resulting in a state change also for the domain
being migrated. If this happens after the snapshot was taken, the
state change is lost.

Otoh I'm sure the case was considered, so perhaps I'm simply missing
some crucial aspect (which then could do with spelling out in the
description of the cover letter).

Jan

