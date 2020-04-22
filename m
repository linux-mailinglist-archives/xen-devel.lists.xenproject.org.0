Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA361B3B49
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:28:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBfo-0005mj-0m; Wed, 22 Apr 2020 09:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRBfm-0005me-Qi
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:28:02 +0000
X-Inumbo-ID: 8f8e1324-847b-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f8e1324-847b-11ea-9e09-bc764e2007e4;
 Wed, 22 Apr 2020 09:28:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A645CAEB8;
 Wed, 22 Apr 2020 09:27:59 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
 <20200422082610.GA28601@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7df284f-ba06-b7ce-b843-690c81521a75@suse.com>
Date: Wed, 22 Apr 2020 11:27:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422082610.GA28601@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.04.2020 10:26, Roger Pau Monné wrote:
> On Tue, Apr 21, 2020 at 11:13:23AM +0200, Jan Beulich wrote:
>> --- a/xen/drivers/acpi/pmstat.c
>> +++ b/xen/drivers/acpi/pmstat.c
>> @@ -492,7 +492,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op
>>      return ret;
>>  }
>>  
>> -int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE_PARAM(uint32) pdc)
>> +int acpi_set_pdc_bits(u32 acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
> 
> Nit: switch to uint32_t while there?

Ah, yes.

> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

