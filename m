Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA626A4DE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 14:17:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI9sE-00028e-4N; Tue, 15 Sep 2020 12:15:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kI9sC-00027v-Gz
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 12:15:48 +0000
X-Inumbo-ID: 97970983-c100-4ae4-84ef-d7ba798be472
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97970983-c100-4ae4-84ef-d7ba798be472;
 Tue, 15 Sep 2020 12:15:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36E7AAF8D;
 Tue, 15 Sep 2020 12:16:02 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86/shim: adjust Kconfig defaults
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
 <7eb74774-f8dc-ef97-c66d-0c4ac50ed9e0@suse.com>
 <20200915104939.GJ753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <affb0372-38ba-4a83-b736-5d9436195f32@suse.com>
Date: Tue, 15 Sep 2020 14:15:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915104939.GJ753@Air-de-Roger>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.09.2020 12:49, Roger Pau Monné wrote:
> On Mon, Sep 14, 2020 at 02:39:08PM +0200, Jan Beulich wrote:
>> Just like HVM, defaulting SHADOW_PAGING and TBOOT to Yes in shim-
>> exclusive mode makes no sense, as the respective code is dead there.
>>
>> Also adjust the shim default config file: It needs to specifiy values
>> only for settings where a non-default value is wanted.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -116,9 +116,9 @@ config XEN_SHSTK
>>  	  compatiblity can be provided via the PV Shim mechanism.
>>  
>>  config SHADOW_PAGING
>> -        bool "Shadow Paging"
>> -        default y
>> -        ---help---
>> +	bool "Shadow Paging"
>> +	default y if !PV_SHIM_EXCLUSIVE
> 
> I think you could also do: default !PV_SHIM_EXCLUSIVE?

Oh, yes, in this case I can indeed. I've mechanically used the form
wanted when the prompt isn't unconditionally visible. Will switch.

Jan

