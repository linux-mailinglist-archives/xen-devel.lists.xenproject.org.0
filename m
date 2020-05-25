Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787DD1E11A2
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 17:24:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdEx5-0005fY-5V; Mon, 25 May 2020 15:23:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdEx4-0005fT-Cn
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 15:23:42 +0000
X-Inumbo-ID: b6b4a53c-9e9b-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6b4a53c-9e9b-11ea-b07b-bc764e2007e4;
 Mon, 25 May 2020 15:23:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DF77B19E;
 Mon, 25 May 2020 15:23:43 +0000 (UTC)
Subject: Re: [PATCH] x86: avoid HPET use also on certain Coffee Lake H
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <26a90632-bb76-a24b-aef1-4c068b610c6a@suse.com>
Message-ID: <de2ca5b7-5fe1-27e5-b6e6-08e695258f1f@suse.com>
Date: Mon, 25 May 2020 17:23:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <26a90632-bb76-a24b-aef1-4c068b610c6a@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.05.2020 17:18, Jan Beulich wrote:
> Linux commit f8edbde885bbcab6a2b4a1b5ca614e6ccb807577 says
> 
> "Coffee Lake H SoC has similar behavior as Coffee Lake, skewed HPET
>  timer once the SoCs entered PC10."
> 
> Again follow this for Xen as well, noting though that even the
> pre-existing PCI ID refers to a H-processor line variant (the 6-core
> one). It is also suspicious that the datasheet names 0x3e10 for the
> 4-core variant, while the Linux commit specifies 0x3e20, which I haven't
> been able to locate in any datasheet yet. To be on the safe side, add
> both until clarification can be provided by Intel.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'd like to note that I've been sitting on this for several months,
hoping to be able to submit with less uncertainty. I shall further
note that I'm sitting on a similar Ice Lake patch, triggered by
seeing Linux'es e0748539e3d594dd26f0d27a270f14720b22a406. The
situation seems even worse there - I can't make datasheet and
Linux commit match even remotely, PCI-ID-wise. I didn't think it
makes sense to submit a patch in such a case.

Jan

