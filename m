Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C221563E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 13:21:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsPAp-00018l-V6; Mon, 06 Jul 2020 11:20:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jsPAo-00018g-7T
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 11:20:34 +0000
X-Inumbo-ID: b49844e8-bf7a-11ea-8c67-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b49844e8-bf7a-11ea-8c67-12813bfff9fa;
 Mon, 06 Jul 2020 11:20:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72878AF3D;
 Mon,  6 Jul 2020 11:20:32 +0000 (UTC)
Subject: Re: [PATCH v5 09/11] x86/domctl: add XEN_DOMCTL_vmtrace_op
To: Julien Grall <julien@xen.org>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <f3ec05eb4908f774683e96553ec32d68fac0d0ac.1593974333.git.michal.leszczynski@cert.pl>
 <6763525a-dca6-dfe5-b417-96e69a22d927@xen.org>
 <1fe71a95-1757-ca18-1d36-c3712e7b6fdf@suse.com>
 <7e6e4cd1-7244-243a-6af6-5c24ce24c10f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff59d2b7-55a9-53dc-444c-7b4741945c05@suse.com>
Date: Mon, 6 Jul 2020 13:20:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7e6e4cd1-7244-243a-6af6-5c24ce24c10f@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.07.2020 12:38, Julien Grall wrote:
> On 06/07/2020 11:37, Jan Beulich wrote:
>> On 06.07.2020 12:31, Julien Grall wrote:
>>> On 05/07/2020 19:55, Michał Leszczyński wrote:
>>>> +/* XEN_DOMCTL_vmtrace_op: Perform VM tracing related operation */
>>>> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>> +
>>>> +struct xen_domctl_vmtrace_op {
>>>> +    /* IN variable */
>>>> +    uint32_t cmd;
>>>> +/* Enable/disable external vmtrace for given domain */
>>>> +#define XEN_DOMCTL_vmtrace_pt_enable      1
>>>> +#define XEN_DOMCTL_vmtrace_pt_disable     2
>>>> +#define XEN_DOMCTL_vmtrace_pt_get_offset  3
>>>> +    domid_t domain;
>>>
>>> AFAICT, there is a 16-bit implicit padding here and ...
>>>
>>>
>>>> +    uint32_t vcpu;
>>>
>>> ... a 32-bit implicit padding here. I would suggest to make
>>> the two explicit.
>>>
>>> We possibly want to check they are also always zero.
>>
>> Not just possibly imo - we should.
> 
> I wasn't sure given that DOMCTL is not a stable interface.

True; checking padding fields allows assigning meaning to them
without bumping the domctl interface version.

Jan

