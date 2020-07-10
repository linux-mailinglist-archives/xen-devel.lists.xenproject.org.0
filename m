Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A502821B395
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 13:01:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtqmR-0004kK-4q; Fri, 10 Jul 2020 11:01:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V7us=AV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jtqmP-0004kF-Lz
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 11:01:21 +0000
X-Inumbo-ID: af77e5ca-c29c-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af77e5ca-c29c-11ea-bb8b-bc764e2007e4;
 Fri, 10 Jul 2020 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594378880;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=puAbi62BkQpGBEAhGE13aYdWcLmORt6l59tmR5VIyyE=;
 b=XBNNoGBHiZaX1+pM7a/UCmUVhzz1GCFa2sYh88REbtIlnGBMchWqCGDD
 o6NGf8Bu+EiC84QQZi8KKC+XLI40FEPL+zPNDAekkWuGaUHi6ewt6CUTc
 6ny73241klvRAGtXPatQD6KI7vtzjkoia7QS6To3HASn+BJVz7HB8yhY8 Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: X5MtrZIjo/eiVV36SsriNXzfVv2nd5uvgr5eWfCiv93k/TR2/wGgs4btYZcRJLFVV2QXVmNgcR
 Fpgw88ROkfNvjRnh0xVLFfr+VtM2I0CjU/E9nkXAu0TYWhCth9EuV98Zu0MbhxlobixSBqy/aF
 E83VOhguMkd2FLdfEHcFd+2MHBk9A1fxOqEs1/K9FiHOfFtEOdHeBW0/kFZgESEj7NCwlfJEjv
 Cv6GbmKxfS3hsJqvyCQNhOkU71Rq0c3beyUQJbkGKRYjAzDgyYSwOyxmS7igmHF/KKrPuyov42
 /tU=
X-SBRS: 2.7
X-MesageID: 22255738
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,335,1589256000"; d="scan'208";a="22255738"
Subject: Re: [XTF] xenbus: Don't wait if the response ring is full
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>, Julien Grall <julien@xen.org>
References: <20200709184647.5159-1-julien@xen.org>
 <02F94EA5-3555-4D3B-97DF-98914410424B@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1e465ce8-c86a-60de-b95b-145982a70552@citrix.com>
Date: Fri, 10 Jul 2020 12:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <02F94EA5-3555-4D3B-97DF-98914410424B@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Grall,
 Julien" <jgrall@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10/07/2020 08:53, Wieczorkiewicz, Pawel wrote:
>> On 9. Jul 2020, at 20:46, Julien Grall <julien@xen.org> wrote:
>>
>> XenStore response can be bigger than the response ring. In this case,
>> it is possible to have the ring full (e.g cons = 19 and prod = 1043).
>>
>> However, XTF will consider that there is no data and therefore wait for
>> more input. This will result to block indefinitely as the ring is full.
>>
>> This can be solved by avoiding to mask the difference between prod and
>> cons.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Pawel Wieczorkiewicz <wipawel@amazon.de>

Applied, thanks.

~Andrew

