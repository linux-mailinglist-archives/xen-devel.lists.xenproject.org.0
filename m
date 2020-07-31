Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6D2340B7
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 10:00:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Pxe-0002On-GD; Fri, 31 Jul 2020 08:00:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1Pxd-0002Oi-5Z
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 08:00:13 +0000
X-Inumbo-ID: dc29b6da-d303-11ea-ab8c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc29b6da-d303-11ea-ab8c-12813bfff9fa;
 Fri, 31 Jul 2020 08:00:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1090AE17;
 Fri, 31 Jul 2020 08:00:24 +0000 (UTC)
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <ea6eeb6d-7af2-97cb-4c11-6e0a81755961@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ead7983-f652-41d9-62e2-33104af3bba5@suse.com>
Date: Fri, 31 Jul 2020 10:00:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea6eeb6d-7af2-97cb-4c11-6e0a81755961@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 15:55, Andrew Cooper wrote:
> On 15/07/2020 11:48, Jan Beulich wrote:
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -20,6 +20,7 @@ $(call as-option-add,CFLAGS,CC,"rdrand %
>>  $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
>>  $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
>>  $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
>> +$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
> 
> Kconfig please, rather than extending this legacy section.
> 
> That said, surely stac/clac support is old enough for us to start using
> unconditionally?

It's available in binutils 2.24 and newer.

Jan

