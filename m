Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4911CB0F0
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 15:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX3Ni-0000Ol-9I; Fri, 08 May 2020 13:49:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jX3Nh-0000Og-CS
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 13:49:37 +0000
X-Inumbo-ID: c13b878a-9132-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c13b878a-9132-11ea-ae69-bc764e2007e4;
 Fri, 08 May 2020 13:49:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5CF2AD9F;
 Fri,  8 May 2020 13:49:38 +0000 (UTC)
Subject: Re: [PATCH] x86/PVH: PHYSDEVOP_pci_mmcfg_reserved should not blindly
 register a region
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <2ee1a3cb-3b40-6e6d-5308-1cdf9f6c521e@suse.com>
 <c8826959-8dbe-cc39-80b0-8ba03c6a6f30@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16ed4b91-fdb3-d2c5-9a3c-4aa7ff172b98@suse.com>
Date: Fri, 8 May 2020 15:49:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c8826959-8dbe-cc39-80b0-8ba03c6a6f30@citrix.com>
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 14:54, Andrew Cooper wrote:
> On 08/05/2020 13:43, Jan Beulich wrote:
>> The op has a register/unregister flag, and hence registration shouldn't
>> happen unilaterally. Introduce unregister_vpci_mmcfg_handler() to handle
>> this case.
>>
>> Fixes: eb3dd90e4089 ("x86/physdev: enable PHYSDEVOP_pci_mmcfg_reserved for PVH Dom0")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I agree in principle that registration shouldn't be unilateral, but why
> on earth does the API behave like that to begin with?
> 
> There is no provision to move or update MMCFG regions in any spec I'm
> aware of, and hardware cannot in practice update memory routing like this.
> 
> Under what circumstances should we tolerate an unregister in the first
> place?

Hot unplug of an entire segment, for example.

Jan

