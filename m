Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227F32CD52A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43385.77987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknOP-00024B-0q; Thu, 03 Dec 2020 12:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43385.77987; Thu, 03 Dec 2020 12:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kknOO-00023m-Tv; Thu, 03 Dec 2020 12:07:24 +0000
Received: by outflank-mailman (input) for mailman id 43385;
 Thu, 03 Dec 2020 12:07:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KUIR=FH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kknON-00023h-9Y
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:07:23 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 900ccd7f-0efa-4205-9892-8e945cb6446b;
 Thu, 03 Dec 2020 12:07:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 900ccd7f-0efa-4205-9892-8e945cb6446b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606997242;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=KJdP6Uqywn/Nn94UJYUt611kPhXl937zqVBQr07U+Xk=;
  b=cJ+d5ZhIauFdElNZUSBMbJCNtlEw+GSGghlYepmt0As7nuHSBQySxsPV
   g1y+fn2SmVnrVgFLZzpvdt4p2nVEVOvZw0fG8e8p+Aiew5fjFNiWRIZrR
   ewf27CGuTv4CfQ6Eftq86LcVXUVExhqwjj4POSOQm+DHBUnOIQxcmcH5m
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: s/PaW1TzAHm3E5gWvDTJORBbFIy+EP/8HLXhbKXWr+daLN4LSJmeum5AMpDQO+lcXxtLbi9Wso
 aHqjBFnc1gT9+JMcPYVu2jjHH7NPmWu+fV5j1QmUOnbpxVL6FOWa8RQNRJCebNcPHAIzxztr8I
 xfaXveW8mrhsKdv9o4Vlrk1a2ZvTbDy4i1yvbuVOnjXz1xAQqF87/p+feYKMCMjJWe6n7MwfOv
 /EtjKO5kfCFQrNOrt2FG6yvdlB0r4UToGBpb7lBfb6iEcl9YUsQDmB7Uv5/t5ki8YCxmNMr218
 Hiw=
X-SBRS: None
X-MesageID: 32451431
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,389,1599537600"; 
   d="scan'208";a="32451431"
Subject: Re: [PATCH 1/2] include: don't use asm/page.h from common headers
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Hongyan Xia <hx242@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <75484377-160c-a529-1cfc-96de86cfc550@suse.com>
 <04276039-a5d0-fefd-260e-ffaa8272fd6a@suse.com>
 <a35fb176-e729-a542-4416-7040d6c80964@xen.org>
 <bdf294d9-e021-36d3-7e04-1c148e34701f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6080ab1-b303-d93c-88ba-7b98333e7237@citrix.com>
Date: Thu, 3 Dec 2020 12:07:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bdf294d9-e021-36d3-7e04-1c148e34701f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 03/12/2020 09:27, Jan Beulich wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-arm/page-shift.h
>> The name of the file looks a bit odd given that *_BITS are also defined 
>> in it. So how about renaming to page-size.h?
> I was initially meaning to use that name, but these headers
> specifically don't define any sizes - *_BITS are still shift
> values, at least in a way. If the current name isn't liked, my
> next best suggestion would then be page-bits.h.

Pick a generic name, or it will bitrot quickly, and it really wants to
be the same across architectures.

The real issue is that page.h contains far too much stuff now, in both
architectures.  Longterm, we want to split apart the architectural
pagetable definitions, from the Xen APIs to manipulate them, which will
simplify the asm include hierarchy as well.

I'd go with page-bits.h, or just a plain pagetable.h.

~Andrew

