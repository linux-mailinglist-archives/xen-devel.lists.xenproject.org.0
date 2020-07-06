Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C9D21540B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 10:33:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsMYw-0002eF-DN; Mon, 06 Jul 2020 08:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jsMYv-0002e9-JH
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 08:33:17 +0000
X-Inumbo-ID: 56bcf1fa-bf63-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56bcf1fa-bf63-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 08:33:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9FD84AD5D;
 Mon,  6 Jul 2020 08:33:16 +0000 (UTC)
Subject: Re: [PATCH v5 11/11] tools/proctrace: add proctrace tool
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <cover.1593974333.git.michal.leszczynski@cert.pl>
 <e0ac5422825ce307470256aab1652336d5179a9a.1593974333.git.michal.leszczynski@cert.pl>
 <983829150.19744505.1593975521301.JavaMail.zimbra@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78e96f30-acf3-ad44-1488-62bf974bd83a@suse.com>
Date: Mon, 6 Jul 2020 10:33:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <983829150.19744505.1593975521301.JavaMail.zimbra@cert.pl>
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
Cc: tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, luwei kang <luwei.kang@intel.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.07.2020 20:58, Michał Leszczyński wrote:
> ----- 5 lip 2020 o 20:55, Michał Leszczyński michal.leszczynski@cert.pl napisał(a):
>> --- /dev/null
>> +++ b/tools/proctrace/proctrace.c
>> +#include <stdlib.h>
>> +#include <stdio.h>
>> +#include <sys/mman.h>
>> +#include <signal.h>
>> +
>> +#include <xenctrl.h>
>> +#include <xen/xen.h>
>> +#include <xenforeignmemory.h>
>> +
>> +#define BUF_SIZE (16384 * XC_PAGE_SIZE)
> 
> I would like to discuss here, how we should retrieve the trace buffer size
> in runtime? Should there be a hypercall for it, or some extension to
> acquire_resource logic?

Personally I'd prefer the latter, but the question is whether one can
be made in a backwards compatible way.

Jan

