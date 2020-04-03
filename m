Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F8919D18D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 09:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKHD2-0003xx-Ge; Fri, 03 Apr 2020 07:57:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKHD1-0003xs-AE
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 07:57:47 +0000
X-Inumbo-ID: cd61b9a8-7580-11ea-bcc1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd61b9a8-7580-11ea-bcc1-12813bfff9fa;
 Fri, 03 Apr 2020 07:57:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 03C40AC2C;
 Fri,  3 Apr 2020 07:57:43 +0000 (UTC)
Subject: Re: [PATCH v5 05/10] x86emul: support MOVDIR64B insn
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
 <0a02ed6b-d7a0-7152-185f-a5bbc5491c49@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18ef0337-d6c7-3b60-aa2e-a83930cc0902@suse.com>
Date: Fri, 3 Apr 2020 09:57:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0a02ed6b-d7a0-7152-185f-a5bbc5491c49@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.04.2020 01:12, Andrew Cooper wrote:
> On 24/03/2020 12:34, Jan Beulich wrote:
>> Introduce a new blk() hook, paralleling the rmw() on in certain way, but
>> being intended for larger data sizes, and hence its HVM intermediate
>> handling function doesn't fall back to splitting the operation if the
>> requested virtual address can't be mapped.
>>
>> Note that SDM revision 071 doesn't specify exception behavior for
>> ModRM.mod == 0b11; assuming #UD here.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks much, but I'm puzzled by you providing this, and hence
would like to double check: You specifically asked that I take
care of the cachability issue for MOVDIRI before you would ack
that change. How come you're not similarly concerned here?

>> ---
>> TBD: If we want to avoid depending on correct MTRR settings,
>>      hvmemul_map_linear_addr() may need to gain a parameter to allow
>>      controlling cachability of the produced mapping(s). Of course the
>>      function will also need to be made capable of mapping at least
>>      p2m_mmio_direct pages for this and the two ENQCMD insns to be
>>      actually useful.
> 
> MOVDIR64B isn't the first instruction to demonstrate this corner case,
> but we do need to organise something to solve this problem.  I'm
> confident it will cause real memory corruption issue for encrypted
> memory VMs under introspection.

Besides the named ones and MOVDIRI, which other ones are you
talking about?

Jan

