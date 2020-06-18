Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F41FF369
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 15:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jluon-0005L9-SS; Thu, 18 Jun 2020 13:43:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jluon-0005L3-5f
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 13:43:01 +0000
X-Inumbo-ID: 9fe57968-b169-11ea-ba94-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fe57968-b169-11ea-ba94-12813bfff9fa;
 Thu, 18 Jun 2020 13:43:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6AD6ACA7;
 Thu, 18 Jun 2020 13:42:58 +0000 (UTC)
Subject: Re: [PATCH for-4.14 2/8] x86/hvm: don't force vCPU 0 for IRQ 0 when
 using fixed destination mode
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac179f79-3b40-9ff3-9437-16a30e019813@suse.com>
Date: Thu, 18 Jun 2020 15:43:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612155640.4101-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 17:56, Roger Pau Monne wrote:
> When the IO APIC pin mapped to the ISA IRQ 0 has been configured to
> use fixed delivery mode do not forcefully route interrupts to vCPU 0,
> as the OS might have setup those interrupts to be injected to a
> different vCPU, and injecting to vCPU 0 can cause the OS to miss such
> interrupts or errors to happen due to unexpected vectors being
> injected on vCPU 0.
> 
> In order to fix remove such handling altogether for fixed destination
> mode pins and just inject them according to the data setup in the
> IO-APIC entry.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Technically
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder though why this was done in the first place - it very much
feels like a workaround for certain guest behavior, and hence
getting rid of it may mean a certain risk of regressions. Not a
very good point in time to make risky changes ...

Jan

