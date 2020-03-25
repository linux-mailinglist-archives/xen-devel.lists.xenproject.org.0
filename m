Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565E319277E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 12:48:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH4Ui-00029m-VS; Wed, 25 Mar 2020 11:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH4Ug-00029g-Ti
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 11:46:46 +0000
X-Inumbo-ID: 4dcc1786-6e8e-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dcc1786-6e8e-11ea-bec1-bc764e2007e4;
 Wed, 25 Mar 2020 11:46:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 834F5AC5B;
 Wed, 25 Mar 2020 11:46:45 +0000 (UTC)
To: paul@xen.org
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <81e7aade-9dfb-313a-ad81-30b2703c2136@suse.com>
 <00c301d60297$471cb7f0$d55627d0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cc4b223-42c4-1c3b-98fb-d43cda1c47bf@suse.com>
Date: Wed, 25 Mar 2020 12:46:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <00c301d60297$471cb7f0$d55627d0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v5 05/10] x86emul: support MOVDIR64B insn
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <Paul.Durrant@citrix.com>,
 'Roger Pau Monne' <roger.pau@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.03.2020 12:19, Paul Durrant wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
>> Sent: 24 March 2020 12:34
>> To: xen-devel@lists.xenproject.org
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant <Paul.Durrant@citrix.com>; Wei Liu
>> <wl@xen.org>; Roger Pau Monne <roger.pau@citrix.com>
>> Subject: [Xen-devel] [PATCH v5 05/10] x86emul: support MOVDIR64B insn
>>
>> Introduce a new blk() hook, paralleling the rmw() on in certain way, but
>> being intended for larger data sizes, and hence its HVM intermediate
>> handling function doesn't fall back to splitting the operation if the
>> requested virtual address can't be mapped.
>>
>> Note that SDM revision 071 doesn't specify exception behavior for
>> ModRM.mod == 0b11; assuming #UD here.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: If we want to avoid depending on correct MTRR settings,
>>      hvmemul_map_linear_addr() may need to gain a parameter to allow
>>      controlling cachability of the produced mapping(s).
> 
> Or could we deal with this by adding an optional cache flush into the unmap?

But (non-)cachability of a range can't generally by covered by
simply flushing the cache.

>> Of course the
>>      function will also need to be made capable of mapping at least
>>      p2m_mmio_direct pages for this and the two ENQCMD insns to be
>>      actually useful.
> 
> 
> I/O emulation parts LGTM so...
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks much.

Jan

