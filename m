Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ADD27259A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 15:32:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLvj-0002fj-Rl; Mon, 21 Sep 2020 13:32:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKLvi-0002fW-JN
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:32:30 +0000
X-Inumbo-ID: ba802ffb-966a-46e6-b75a-03539790172b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba802ffb-966a-46e6-b75a-03539790172b;
 Mon, 21 Sep 2020 13:32:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600695149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hhv9joWJW28rLTwzkmoGcQyrwoC1D5IauKdwPGdrUM=;
 b=M3nkT+0lFTekgnNeN5+jhvDsxn/s18OnJiABi+gRmpXGQ/Z5kYsgQVG9cHClBghskK5QhI
 WdkpXv6lJeEMBaWvZe/G96kXqHHrUOA/SW0xLVbjjipdu/jonTPQ/+q1ixXBn4FzVFTuIs
 t2XDU9/qTvz8FzcEUiXdhBuXkIKt8sk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3BF8DAD1E;
 Mon, 21 Sep 2020 13:33:05 +0000 (UTC)
Subject: Re: Memory ordering question in the shutdown deferral code
To: Julien Grall <julien@xen.org>
Cc: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan"
 <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
 <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80e221e0-a1d5-4cc1-b083-1e8f537f016c@suse.com>
Date: Mon, 21 Sep 2020 15:32:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
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

On 21.09.2020 15:27, Julien Grall wrote:
> I think this part is racy at least on non-x86 platform as x86 seems to 
> implement smp_mb() with a strong memory barrier (mfence).

The "strength" of the memory barrier doesn't matter here imo. It's
the fully coherent memory model (for WB type memory) which makes
this be fine on x86. The barrier still only guarantees ordering,
not visibility.

Jan

