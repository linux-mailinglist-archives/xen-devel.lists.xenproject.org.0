Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A4C20CD47
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 10:28:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpp9W-00059f-KE; Mon, 29 Jun 2020 08:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jpp9V-00059Z-2q
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 08:28:33 +0000
X-Inumbo-ID: 8379dac2-b9e2-11ea-853f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8379dac2-b9e2-11ea-853f-12813bfff9fa;
 Mon, 29 Jun 2020 08:28:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55437AC9F;
 Mon, 29 Jun 2020 08:28:30 +0000 (UTC)
Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
To: Julien Grall <julien@xen.org>
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9fc81bbe-6c30-e848-ceae-1356ec30a8f8@suse.com>
Date: Mon, 29 Jun 2020 10:28:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200627095533.14145-3-julien@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.06.2020 11:55, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The specification of pvcalls suggests there is padding for 32-bit x86
> at the end of most the structure. However, they are not described in
> in the public header.
> 
> Because of that all the structures would be 32-bit aligned and not
> 64-bit aligned for 32-bit x86.

The added padding doesn't change the alignment. It's sizeof() which
gets corrected this way.

> For all the other architectures supported (Arm and 64-bit x86), the
> structure are aligned to 64-bit because they contain uint64_t field.
> Therefore all the structures contain implicit padding.
> 
> Given the specification is authoriitative, the padding will the same for

Nit: ... will be the same ...

> the all architectures. The potential breakage of compatibility is ought

Nit: Drop "is".

> to be fine as pvcalls is still a tech preview.
> 
> As an aside, the padding sadly cannot be mandated to be 0 as they are
> already present. So it is not going to be possible to use the padding
> for extending a command in the future.

Why is the other adjustment fine to make due to still being tech
preview, but this one wouldn't be for the same reason?

Jan

