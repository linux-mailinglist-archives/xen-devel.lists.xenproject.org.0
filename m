Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DF1E7EEF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:41:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefG7-0002Pa-3i; Fri, 29 May 2020 13:41:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jefG6-0002PV-16
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:41:14 +0000
X-Inumbo-ID: 0fdc211c-a1b2-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fdc211c-a1b2-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 13:41:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68494AF5A;
 Fri, 29 May 2020 13:41:12 +0000 (UTC)
Subject: Re: [PATCH v10 2/9] x86emul: rework CMP and TEST emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <5843dca9-1a1a-a32e-3cb0-95cd93533723@suse.com>
 <c215f77f-f645-eb08-3ac1-7d9f211e1abf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <629b042b-1226-6d2d-6509-569bb3c64abe@suse.com>
Date: Fri, 29 May 2020 15:41:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c215f77f-f645-eb08-3ac1-7d9f211e1abf@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 14:24, Andrew Cooper wrote:
> On 25/05/2020 15:26, Jan Beulich wrote:
>> Unlike similarly encoded insns these don't write their memory operands,
> 
> "write to their".
> 
>> and hence x86_is_mem_write() should return false for them. However,
>> rather than adding special logic there, rework how their emulation gets
>> done, by making decoding attributes properly describe the r/o nature of
>> their memory operands.
> 
> Describe how?  I see you've change the order of operands encoding, but
> then override it back?

There's no overriding back, I don't think: I change the table entries
for opcodes 0x38 and 0x39, with no other adjustments the the attributes
later on. For the other opcodes I leave the table entries as they are,
and override the attributes for the specific sub-cases (identified by
ModRM.reg).

For opcodes 0x38 and 0x39 the change of the table entries implies
changing the order of operands as passed to emulate_2op_SrcV(), hence
the splitting of the cases in the main switch().

I didn't think this was necessary to spell out in the commit message,
but of course I can re-use most of the text above and add it into
there, if you think that would help.

Jan

