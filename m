Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5C1CA4FD
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 09:20:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWxIR-0007r6-Td; Fri, 08 May 2020 07:19:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWxIQ-0007qy-8V
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 07:19:46 +0000
X-Inumbo-ID: 4b07971a-90fc-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b07971a-90fc-11ea-b9cf-bc764e2007e4;
 Fri, 08 May 2020 07:19:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E6C2AFDB;
 Fri,  8 May 2020 07:19:47 +0000 (UTC)
Subject: Re: [PATCH v8 02/12] x86emul: support MOVDIR{I,64B} insns
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <04e52d0a-fcce-eba4-0341-3b8838c0faae@suse.com>
 <37726d04-6fb8-5747-82ae-d206737905cf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46538792-1dc8-d990-65c7-ccff88721e22@suse.com>
Date: Fri, 8 May 2020 09:19:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <37726d04-6fb8-5747-82ae-d206737905cf@citrix.com>
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

On 07.05.2020 20:30, Andrew Cooper wrote:
> On 05/05/2020 09:13, Jan Beulich wrote:
>> Introduce a new blk() hook, paralleling the rmw() one in a certain way,
>> but being intended for larger data sizes, and hence its HVM intermediate
>> handling function doesn't fall back to splitting the operation if the
>> requested virtual address can't be mapped.
>>
>> Note that SDM revision 071 doesn't specify exception behavior for
>> ModRM.mod == 0b11; assuming #UD here.
> 
> Still stale?  It does #UD on current hardware, and will cease to #UD in
> the future when the encoding space gets used for something else.

What do you mean by "still stale"? Other insns allowing for only
memory operands have the #UD spelled out in the doc. Are you
implying by the 2nd sentence that it should rather be
"goto unrecognized_insn"? I'm afraid we're not very consistent
yet with what we do in such cases; I could certainly work
towards improving this, but the question is whether it is really
sensible in all cases to assume such partially unused encodings
may get used in the future.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but as per my reply to your patch 6 comment the patch
here will need to be revised, so I'll not apply this just yet
unless you indicate up front that you're fine with me keeping it.

Jan

