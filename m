Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AA31E7F78
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:00:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefYS-0004e4-Su; Fri, 29 May 2020 14:00:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jefYQ-0004dz-R7
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:00:10 +0000
X-Inumbo-ID: b5292898-a1b4-11ea-a8c2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5292898-a1b4-11ea-a8c2-12813bfff9fa;
 Fri, 29 May 2020 14:00:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A75E4AC24;
 Fri, 29 May 2020 14:00:08 +0000 (UTC)
Subject: Re: [PATCH v10 5/9] x86emul: support MOVDIR{I,64B} insns
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <ae7ff12a-edf9-45b5-b7c9-6c5b5d0739c0@suse.com>
 <15b5f062-1911-9561-58b8-78c8027f3a68@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de4bc55c-64d5-d0b8-893d-6b397ea66042@suse.com>
Date: Fri, 29 May 2020 16:00:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <15b5f062-1911-9561-58b8-78c8027f3a68@citrix.com>
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

On 29.05.2020 15:55, Andrew Cooper wrote:
> On 25/05/2020 15:28, Jan Beulich wrote:
>> Introduce a new blk() hook, paralleling the rmw() one in a certain way,
>> but being intended for larger data sizes, and hence its HVM intermediate
>> handling function doesn't fall back to splitting the operation if the
>> requested virtual address can't be mapped.
>>
>> Note that SDM revision 071 doesn't specify exception behavior for
>> ModRM.mod == 0b11; assuming #UD here.
> 
> Once again - I don't think this wants calling out.  That encoding space
> will be used for a new Grp at some point in the future, and be a
> different instruction.

Possible; without it spelled out one may also think (at least
for MOVDIRI) that the register-only encoding could be a
re-encoding of plain MOV. I'd prefer to keep it.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> Acked-by: Andrew Cooper <andrew.cooper@citrix.com>, although with one
> recommendation...

Thanks and ...

>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -241,6 +241,8 @@ XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14
>>  XEN_CPUFEATURE(TSXLDTRK,      6*32+16) /*a  TSX load tracking suspend/resume insns */
>>  XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
>>  XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
>> +XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*A  MOVDIRI instruction */
>> +XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*A  MOVDIR64B instruction */
> 
> I'd be tempted to leave these as 'a' for now, seeing as we have the ability.
> 
> These instructions aren't actually of any use for domains without PCI
> devices, and a "default" will be more migrateable as a consequence.

... okay, done.

Jan

