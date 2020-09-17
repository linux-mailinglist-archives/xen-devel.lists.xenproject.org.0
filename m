Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15326DDD2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIuiy-0003Ik-HB; Thu, 17 Sep 2020 14:17:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZJEn=C2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kIuiw-0003IW-9y
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:17:22 +0000
X-Inumbo-ID: ff1ef809-f0b1-44cb-bc9e-5a9ac15c07cc
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff1ef809-f0b1-44cb-bc9e-5a9ac15c07cc;
 Thu, 17 Sep 2020 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600352240;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eccEG4GSBKZ3TqVITlWzNh4WhXxCXWatiTVJNmtfDxI=;
 b=BEqkMG+QltSO+hYxb6Jo2+heYub5zITfriGTxNUb1E+Zet8rsOihBT+L
 W17almdNR1vqRHD3xuYPpHgJvXr8RXsiir8+5UmzeMdPcox/LWeT+Ef87
 xbfLH/DimsY2DHGEyAXh2vmHqQLgC1m1MUwNZyqOo/oYZwgQ6+4dYurnv I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lcKlGefeQNzaH1RSAECcMzBD6GrC09zABLusbZTQerqt+TXtJ3xeWMy5pvVfvWavTkfzIy4Agx
 kphgb3pUmjdfnxqsliFAU9rjYWuiB9lfotOZ+wFXbRsSvzTqDwh3SP/53Fx6mLrdeNSdieWN+W
 16GKu/GVdGf1bjbaIAKDR+5N97K5bofwtpa7TeL9WdwBIVRtnRFwrxKwNwfBcD8AItpx+HkIes
 Ux32HHLJQ2vAFUZH/pO67oNSD2fVLgfiq+701E78FR7X3oamPUcc+OHnd8IFGGj3E7T7N6wshT
 B/4=
X-SBRS: 2.7
X-MesageID: 27049226
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,437,1592884800"; d="scan'208";a="27049226"
Subject: Re: [PATCH 4/5] sched/arinc653: Reorganize function definition order
To: Jan Beulich <jbeulich@suse.com>, Jeff Kubascik
 <jeff.kubascik@dornerworks.com>
CC: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>, "Josh
 Whitehead" <josh.whitehead@dornerworks.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-5-jeff.kubascik@dornerworks.com>
 <67010159-2bde-cb52-434c-d75c27f8ce7a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0a07faee-998e-e412-2223-7bbeaaa94bd4@citrix.com>
Date: Thu, 17 Sep 2020 15:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67010159-2bde-cb52-434c-d75c27f8ce7a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 17/09/2020 09:12, Jan Beulich wrote:
> On 16.09.2020 20:18, Jeff Kubascik wrote:
>> @@ -517,27 +516,35 @@ static const struct scheduler sched_arinc653_def = {
>>      .sched_id       = XEN_SCHEDULER_ARINC653,
>>      .sched_data     = NULL,
>>  
>> +    .global_init    = NULL,
>>      .init           = a653sched_init,
>>      .deinit         = a653sched_deinit,
>>  
>> -    .free_udata     = a653sched_free_udata,
>> -    .alloc_udata    = a653sched_alloc_udata,
>> +    .alloc_pdata    = NULL,
>> +    .switch_sched   = a653sched_switch_sched,
>> +    .deinit_pdata   = NULL,
>> +    .free_pdata     = NULL,
>>  
>> +    .alloc_domdata  = NULL,
>> +    .free_domdata   = NULL,
>> +
>> +    .alloc_udata    = a653sched_alloc_udata,
>>      .insert_unit    = NULL,
>>      .remove_unit    = NULL,
>> +    .free_udata     = a653sched_free_udata,
>>  
>>      .sleep          = a653sched_unit_sleep,
>>      .wake           = a653sched_unit_wake,
>>      .yield          = NULL,
>>      .context_saved  = NULL,
>>  
>> -    .do_schedule    = a653sched_do_schedule,
>> -
>>      .pick_resource  = a653sched_pick_resource,
>> +    .migrate        = NULL,
>>  
>> -    .switch_sched   = a653sched_switch_sched,
>> +    .do_schedule    = a653sched_do_schedule,
>>  
>>      .adjust         = NULL,
>> +    .adjust_affinity= NULL,
> Adding all these not really needed NULL initializers looks to rather move
> this scheduler away from all the others. (Oddly enough all of them
> explicitly set .sched_data to NULL - for whatever reason.)

The "= NULL" is totally redundant, because the compiler will do that for
you.

The last user of .sched_data was dropped by 9c95227160.  Conceptually,
it is a layering violation (it prevents different cpupools being
properly independent), so I'd recommend just dropping the field entirely.

~Andrew

