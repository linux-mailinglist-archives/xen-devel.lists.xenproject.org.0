Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCDF23D9F2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 13:30:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3e5W-0005S4-TL; Thu, 06 Aug 2020 11:29:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3e5U-0005Rz-JP
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 11:29:32 +0000
X-Inumbo-ID: a1f2031a-9104-4c36-9eac-0dd4c7461e03
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1f2031a-9104-4c36-9eac-0dd4c7461e03;
 Thu, 06 Aug 2020 11:29:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8A23ABE9;
 Thu,  6 Aug 2020 11:29:47 +0000 (UTC)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
 <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
 <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbc2d5a5-d8e7-0627-73cb-aca2b8addb8b@suse.com>
Date: Thu, 6 Aug 2020 13:29:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Oleksandr <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 13:08, Julien Grall wrote:
> On 05/08/2020 20:30, Oleksandr wrote:
>> I was thinking how to split handle_hvm_io_completion() 
>> gracefully but I failed find a good solution for that, so decided to add 
>> two stubs (msix_write_completion and handle_realmode_completion) on Arm. 
>> I could add a comment describing why they are here if appropriate. But 
>> if you think they shouldn't be called from the common code in any way, I 
>> will try to split it.
> 
> I am not entirely sure what msix_write_completion is meant to do on x86. 
> Is it dealing with virtual MSIx? Maybe Jan, Roger or Paul could help?

Due to the split brain model of handling PCI pass-through (between
Xen and qemu), a guest writing to an MSI-X entry needs this write
handed to qemu, and upon completion of the write there Xen also
needs to take some extra action.

Jan

