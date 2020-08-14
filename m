Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF95244ED5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 21:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6fNJ-00027I-Um; Fri, 14 Aug 2020 19:28:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6fNI-00027D-3O
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 19:28:24 +0000
X-Inumbo-ID: 81985a90-4fd3-4693-9a85-a974b3f23cd4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81985a90-4fd3-4693-9a85-a974b3f23cd4;
 Fri, 14 Aug 2020 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=TKbG/sfhQWwNPPoNb2cN1H+Uvzh+d/L1k93X4h5UBi0=; b=1+6Fx4icAcSVU9xo8MnW/XwXrY
 4K1Unit8G38Qg8te2wvVPBiFgt7opjZEraPEQ8wbGVMnrg1K+OPKzaFodMq8XW+0Udg43RGPKEMZ3
 UjZ6keTonZmK3CFJQ5NkcgYYyD0mZsTww8tTE4GYFFXzbrjc5eJw9nNBh2YVDYkSpU0o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fNE-0005BZ-Qo; Fri, 14 Aug 2020 19:28:20 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fNE-0002u8-Jx; Fri, 14 Aug 2020 19:28:20 +0000
Subject: Re: [PATCH 3/4] build: also check for empty .bss.* in .o -> .init.o
 conversion
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5c2e295f-7400-1143-6710-7d477dbe8d6e@xen.org>
Date: Fri, 14 Aug 2020 20:28:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 06/08/2020 10:05, Jan Beulich wrote:
> We're gaining such sections, and like .text.* and .data.* they shouldn't
> be present in objects subject to automatic to-init conversion. Oddly
> enough for quite some time we did have an instance breaking this rule,
> which gets fixed at this occasion, by breaking out the EFI boot
> allocator functions into its own translation unit.
> 
> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

