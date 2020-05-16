Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F7D1D628E
	for <lists+xen-devel@lfdr.de>; Sat, 16 May 2020 18:20:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZzWW-0006jr-SJ; Sat, 16 May 2020 16:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H74w=66=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZzWV-0006jm-5W
 for xen-devel@lists.xenproject.org; Sat, 16 May 2020 16:18:51 +0000
X-Inumbo-ID: ed292e88-9790-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed292e88-9790-11ea-9887-bc764e2007e4;
 Sat, 16 May 2020 16:18:50 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: j41tsxKUU1prgfgu90Dch55mEWG+4gXxGu3+eN8ZjGrlYLLlNJVhY+L9f3YuXp1OK61ylP2Nno
 hOeXbSNBPyysUoArbyZZGGKIXQIZMe0m0fClvFlmUczWiaLi/aI6Th6Y4JVSM14aaRwselZMJo
 sEp5HSJPhqblEj4BmLAdKyWqaq0phzrhfBvcctV7cp4O2T7khJ8hWawnKDF+oJsNfNCpG4gQ5a
 FYrCB2s1iM1ZuFo66GfKrj571l+ZTDu6tVN3MwuU25+MOtpvw7dZw8AF2JeAU93RRg2VXUx6xM
 Rhs=
X-SBRS: None
X-MesageID: 17967882
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,398,1583211600"; d="scan'208";a="17967882"
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
To: Manuel Bouyer <bouyer@antioche.eu.org>
References: <20200515202912.GA11714@antioche.eu.org>
 <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
 <20200515215335.GA9991@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
Date: Sat, 16 May 2020 17:18:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515215335.GA9991@antioche.eu.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/05/2020 22:53, Manuel Bouyer wrote:
> On Fri, May 15, 2020 at 10:38:13PM +0100, Andrew Cooper wrote:
>>> [...]
>>> Does it help ?
>> Yes and no.  This is collateral damage of earlier bug.
>>
>> What failed was xen_init_fv()'s
>>
>>     shared_page = xc_map_foreign_range(xc_handle, domid, XC_PAGE_SIZE,
>>                                        PROT_READ|PROT_WRITE, ioreq_pfn);
>>     if (shared_page == NULL) {
>>         fprintf(logfile, "map shared IO page returned error %d\n", errno);
>>         exit(-1);
>>     }
>>
>> because we've ended up with a non-NULL pointer with no mapping behind
>> it, hence the SIGSEGV for the first time we try to use the pointer.
>>
>> Whatever logic is behind xc_map_foreign_range() should have returned
>> NULL or a real mapping.
> What's strange is that the mapping is validated, by mapping it in
> the dom0 kernel space. But when we try to remap in in the process's
> space, it fails.

Hmm - this sounds like a kernel bug I'm afraid.

>> ioreq_pfn ought to be something just below the 4G boundary, and the
>> toolstack ought to put memory there in the first place.  Can you
>> identify what value ioreq_pfn has,
> You mean, something like:
> (gdb) print/x ioreq_pfn
> $2 = 0xfeff0
>
>> and whether it matches up with the
>> magic gfn range as reported by `xl create -vvv` for the guest?
> I guess you mean
> xl -vvv create
> the output is attached
>
> The kernel says it tries to map 0xfeff0000 to virtual address 0x79656f951000.

The value looks right, and the logs look normal.

~Andrew

