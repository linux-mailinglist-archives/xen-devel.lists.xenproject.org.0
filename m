Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B11C23E92A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 10:37:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3xsj-0006p6-Ip; Fri, 07 Aug 2020 08:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3xsi-0006p1-De
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 08:37:40 +0000
X-Inumbo-ID: 5e73d92b-809b-4c3c-ae8e-c00fb9aa0e80
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e73d92b-809b-4c3c-ae8e-c00fb9aa0e80;
 Fri, 07 Aug 2020 08:37:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD1C0AAC7;
 Fri,  7 Aug 2020 08:37:56 +0000 (UTC)
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4bbb7619-275a-1fe7-3e1c-53603a1a3231@suse.com>
Date: Fri, 7 Aug 2020 10:37:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 16:15, Trammell Hudson wrote:
> Updated patch:

Before I get to look at this new version, one more general remark
(just to not forget making it later): There's a scalability issue
here: Right now xen.efi requires to be loaded below the 4Gb
boundary. I've seen systems with as little as just 1Gb of memory
below that boundary, yet lots above. On such a system one ought to
be allowed to expect a huge initrd to work. If, however, the
unified Xen binary doesn't fit in what's not already used by UEFI
itself in the space below 4Gb, then you'll be in trouble.

Probably not something needing addressing right away, but once
you get to the point of submitting a non-RFC series, you will
want to mention this as a restriction.

Jan

