Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E62337BA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 19:34:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1CRn-0006PZ-IW; Thu, 30 Jul 2020 17:34:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZLI=BJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1CRm-0006PQ-8U
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 17:34:26 +0000
X-Inumbo-ID: e8d54436-d28a-11ea-8daf-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8d54436-d28a-11ea-8daf-bc764e2007e4;
 Thu, 30 Jul 2020 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596130465;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VTbuZSogmwTOJfRNbt0lBzRJjNPsdpDQGD6VXlfSoxU=;
 b=U9VH3cg2br43bdg/Q+klm3DDrNajNxMH4vI7FZXi4Ceiw/a/qGceRQCb
 Q4D+aEM4FZrUtVNar+so/sNc11rb3yVy+mK7r2X2upgTnWZv+UUnI94+T
 lsoODnrXUrPsnj8vBpJuz5EdrY1OoYhiEOrf6QfcpwrHMdeHum02A1bxF o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Xpr0JyzLJ3ItxrMuYNa8xQQBN+kmVldopfurADO8obZ6+x5Z5KehHHHDxJ7YFJYugJ248FQxDu
 1DGLfQ2mN6uloG+vTOJrtdUT35derC9A1wHSOpUmOI3SWNwpDt+jjE9HkqvEGh10Bdv9HmOxYe
 Os45/KR0Z5OP7HMTewI2cY9vcBzpc8JhEOl3RLFswapGsV8+QSEOcG6jFtvm/ibjZpOI5N/Nbw
 sxLOxDceDuDdCQNyjF2ZncWfhuoT5nn3Lf46yWql9ndp7pJ7DMpLs/JB2UGFq73GiT9Mh7UJHj
 tSY=
X-SBRS: 2.7
X-MesageID: 23582494
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,415,1589256000"; d="scan'208";a="23582494"
Subject: Re: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-2-andrew.cooper3@citrix.com>
 <002601d66647$ca8567e0$5f9037a0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <33a10589-6890-b653-d8c2-7eb19a5e4929@citrix.com>
Date: Thu, 30 Jul 2020 18:34:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <002601d66647$ca8567e0$5f9037a0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: 'Stefano
 Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/07/2020 09:02, Paul Durrant wrote:
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 28 July 2020 12:37
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <JBeulich@suse.com>; Wei Liu <wl@xen.org>;
>> Roger Pau Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien Grall
>> <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Paul Durrant <paul@xen.org>; Michał
>> Leszczyński <michal.leszczynski@cert.pl>; Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>> Subject: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
>>
>> New architectures shouldn't be forced to implement no-op stubs for unused
>> functionality.
>>
>> Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, and provide
>> compatibility logic in xen/mm.h
>>
>> No functional change.
> Code-wise, it looks fine, so...
>
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks,

>
> ...but ...
>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Paul Durrant <paul@xen.org>
>> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
>> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>> ---
>>  xen/arch/x86/Kconfig     | 1 +
>>  xen/common/Kconfig       | 3 +++
>>  xen/include/asm-arm/mm.h | 8 --------
>>  xen/include/xen/mm.h     | 9 +++++++++
>>  4 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index a636a4bb1e..e7644a0a9d 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -6,6 +6,7 @@ config X86
>>  	select ACPI
>>  	select ACPI_LEGACY_TABLES_LOOKUP
>>  	select ARCH_SUPPORTS_INT128
>> +	select ARCH_ACQUIRE_RESOURCE
> ... I do wonder whether 'HAS_ACQUIRE_RESOURCE' is a better and more descriptive name.

We don't have a coherent policy for how to categorise these things.  I
can change the name if you insist, but I'm not sure it makes a useful
difference.

~Andrew

