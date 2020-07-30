Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FCF2337AC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 19:29:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1CMH-0005YS-NA; Thu, 30 Jul 2020 17:28:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZLI=BJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1CMF-0005YN-QK
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 17:28:43 +0000
X-Inumbo-ID: 1c8f9d18-d28a-11ea-aaf9-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c8f9d18-d28a-11ea-aaf9-12813bfff9fa;
 Thu, 30 Jul 2020 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596130123;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=CPM+2EsHyf7nhKrWoMxtddKAcdCxQL8Z163DjoBydnk=;
 b=fzdw6GZL79lq8CmmlC64jTyMAm36ehDh5J2z1cQeGs0ZK8GC/nnN7Uhs
 pF6DZv+JhdyovCm9ZnQRynWKGhmyPPkFV1z4gcxCVcp8sUMYky82701A+
 mUI2nXRqecLOiZf7mMrSGljk2EPGpjVWX377SBJicjQKOR8L+KaiDMiat U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1Z3hs6TXhhE+zlFVPqAjSot/mgyMQ018XFVxrCwlK315CFAzdwSIA5Ag4a/tKYdlwXlJHeBiMF
 5RNERWa2QEhpYuXw4FlmLkLDRPn4Kr33N6Nv/GXHbKgVyl1rpQo1GY66qRQ0ZyoMYrehGr9hNy
 IwhZcGSrH1kWBfU9bvmkkRWjWW4lZMB3g0MXLBRSn9pP4MG9ee8Sl4VsQLXdjKoeXl+8W37eC7
 l8pyDZPADa8u3KsQOd1apj3BidPKSkS+LqWjAjFHufU7A1ygm2saIpDMfwJwNfluu93I0lDlJK
 cOA=
X-SBRS: 2.7
X-MesageID: 23898713
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,415,1589256000"; d="scan'208";a="23898713"
Subject: Re: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-2-andrew.cooper3@citrix.com>
 <9b8397fc-f50e-ef2b-cbaa-2298294af2e3@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0b02d7dd-ebf1-9210-a52f-8debbddddbaa@citrix.com>
Date: Thu, 30 Jul 2020 18:28:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b8397fc-f50e-ef2b-cbaa-2298294af2e3@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30/07/2020 10:50, Julien Grall wrote:
> Hi Andrew,
>
> On 28/07/2020 12:37, Andrew Cooper wrote:
>> New architectures shouldn't be forced to implement no-op stubs for
>> unused
>> functionality.
>>
>> Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, and
>> provide
>> compatibility logic in xen/mm.h
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> With one question below:
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks,

>
>
>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>> index 1061765bcd..1b2c1f6b32 100644
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -685,4 +685,13 @@ static inline void put_page_alloc_ref(struct
>> page_info *page)
>>       }
>>   }
>>   +#ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
>> +static inline int arch_acquire_resource(
>> +    struct domain *d, unsigned int type, unsigned int id, unsigned
>> long frame,
>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>
> Any reason to change the way we indent the arguments?

So its not all squashed on the right hand side.

~Andrew

